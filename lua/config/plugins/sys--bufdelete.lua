local M = {}

function M.setup(use)
  use {
    'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<leader>bd', ':Bdelete<CR>', { silent = true, noremap = true })
    end
  }
end

return M
