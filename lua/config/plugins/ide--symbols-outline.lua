local M = {}

function M.setup(use)
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      local opts = { silent = true, noremap = true }
      vim.keymap.set('n', '<leader>bs', ':SymbolsOutline<CR>', opts)
    end
  }
end

return M
