local M = {}

function M.setup(use)
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {}

      local opts = { silent = true, noremap = true }
      vim.keymap.set('n', '<leader>t', ':TroubleToggle<CR>', opts)
    end
  }
end

return M
