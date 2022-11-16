local M = {}

function M.setup(use)
  use {
    "rcarriga/nvim-notify",
    require = "nvim-telescope/telescope.nvim",
    config = function()
      local notify = require("notify")
      notify.setup({
        stages = "slide",
        max_width = 60,
        minimum_width = 20,
        timeout = 3000,
      })
      vim.notify = notify

      require("telescope").load_extension("notify")
      local opts = { silent = true, noremap = true }
      vim.keymap.set('n', '<leader>fn', ':Telescope notify<CR>', opts)
      vim.keymap.set('n', '<leader>vn', ':Notifications<CR>', opts)
    end
  }
end

return M
