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

function M.map(mode, lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
