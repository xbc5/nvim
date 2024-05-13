local tabl = require("lib.table")

local M = {}

-- Use err, info, or warn instead of this function.
local function notify(msg, level, once)
  local fn
  if once then
    fn = vim.notify_once
  else
    fn = vim.notify
  end
  fn(msg, level)
end

-- Send an error notification
function M.err(msg, once)
  notify(msg, vim.log.levels.ERROR, once)
end

-- Send an info notification
function M.info(msg, once)
  notify(msg, vim.log.levels.INFO, once)
end

-- Send an warn notification
function M.warn(msg, once)
  notify(msg, vim.log.levels.WARN, once)
end

function M.try_require(path)
  local status, module = pcall(require, path)
  if status then
    return module
  else
    M.err("Could not load module: " .. path, true)
    return nil
  end
end

function M.is_mode(mode)
  if vim.api.nvim_get_mode().mode == mode then
    return true
  end
  return false
end

function M.pre_init()
  vim.api.nvim_set_option("termguicolors", true) -- required for 16 bit terminals
end

-- Map with default opts. Remember that which-key reads the { desc = "" }
-- opt for its descriptions.
function M.map(mode, lhs, rhs, opts)
  local o = tabl.merge({ noremap = true, silent = true }, opts or {})
  vim.api.nvim_set_keymap(mode, lhs, rhs, o)
end

-- Convert nvim log levels into an equivalent string
function M.log_level(level)
  if level == vim.log.levels.INFO then
    return "INFO"
  end
  if level == vim.log.levels.WARN then
    return "WARN"
  end
  if level == vim.log.levels.ERROR then
    return "ERROR"
  end
  if level == vim.log.levels.TRACE then
    return "TRACE"
  end
  if level == vim.log.levels.DEBUG then
    return "DEBUG"
  end
  vim.notify("Unknown log level: " .. level, vim.log.levels.ERROR)
end

function M.new_notify(notify)
  local fpath = require("lib.fs").notifications_log()
  return function(msg, level)
    local _msg = os.date("%Y-%m-%d %H:%M:%S|" .. M.log_level(level) .. "|") .. msg .. "\n"
    local file = io.open(fpath, "a")
    if not file then
      notify("Could not open notifications log file", vim.log.levels.ERROR)
      return
    end
    file:write(_msg)
    file:close()
    notify(_msg, level)
  end
end

return M
