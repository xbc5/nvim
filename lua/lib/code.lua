local M = {}

function M.sort_imports()
  if vim.bo.filetype == "python" then
    vim.cmd("PyrightOrganizeImports")
  end
end

return M
