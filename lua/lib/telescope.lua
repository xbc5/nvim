local M = {}


function M.find_nvim_config()
  local p = vim.fn.stdpath("config")
  require("telescope.builtin").find_files { search_dirs = {p} }
end

function M.find_hidden()
  require("telescope.builtin").find_files { hidden = true }
end


return M
