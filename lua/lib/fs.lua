local ppath = require("plenary.path")

local M = {}

-- Get the workspace root directory.
function M.root_dir()
  return vim.lsp.buf.list_workspace_folders()[1]
end

function M.is_dir(path)
  return ppath:new(path):is_dir()
end

function M.exists(path)
  return ppath:new(path):exists()
end

function M.join(path, ...)
  return ppath:new(path):joinpath(...)
end

function M.tmp_dir()
  local path = "/tmp/nvim.user"
  if vim.fn.isdirectory(path) == 0 then
    vim.fn.mkdir(path, "p", "0o700")
  end
  return path
end

function M.notifications_log()
  local path = M.tmp_dir() .. "/notifications.log"
  if vim.fn.filewritable(path) == 0 then
    vim.fn.system({ "touch", path })
  end
  return path
end

return M
