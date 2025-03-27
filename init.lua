-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_augroup("PyrightOrganizeImports", {})
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "PyrightOrganizeImports",
  pattern = "*.py",
  command = "silent! PyrightOrganizeImports",
})
