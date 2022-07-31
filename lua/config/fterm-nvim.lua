local M = {}

function M.config()
  local table = require("lib.table")
  local fterm = require("FTerm")

  local defaults = {
    dimensions  = {
      height = 0.95,
      width = 0.95,
    },
  }

  fterm.setup(defaults)

  local lazygit = fterm:new(table.merge(defaults, { cmd = "lazygit" }))

  local opts = { silent = true, noremap = true }
  vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end, opts)
  vim.keymap.set('n', '<A-Space>', require("FTerm").toggle, opts)
  vim.keymap.set('t', '<A-Space>', require("FTerm").toggle, opts)

end

return M
