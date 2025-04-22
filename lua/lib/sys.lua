local const = require("lib.const")

local M = {}

function M.shell_cmd(cmd, PIPE)
  local pipe = const[PIPE] or "" -- always a string
  if PIPE ~= nil then
    assert(const[PIPE], "Invalid pipe: " .. PIPE)
  end -- if provided

  local f = io.popen(cmd .. pipe)
  local s = f:read("*l")
  f:close()

  return s
end

-- The path is literal -- It's unquoted. You can use globs,
-- but you must quote or escape the path if it has spaces.
function M.ls(path)
  local i, t, popen = 0, {}, io.popen
  local pfile = popen("ls -aA " .. path)
  for filename in pfile:lines() do
    i = i + 1
    t[i] = filename
  end
  pfile:close()
  return t
end

function M.cmd_exists(cmd)
  return M.shell_cmd("which " .. cmd, "NOERR") ~= nil
end

function M.is_user()
  local s = M.shell_cmd("id -u", "NOERR")
  return tonumber(s) >= 1000
end

function M.file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

function M.is_templatevm()
  return M.file_exists("/var/run/qubes/this-is-templatevm")
end

-- Is non-root and not TemplateVM
function M.suitable_env()
  if M.is_user() and not M.is_templatevm() then
    return true
  end
end

return M
