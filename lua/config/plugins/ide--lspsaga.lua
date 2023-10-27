local M = {}

function M.setup(use)
  use {
    "nvimdev/lspsaga.nvim",
    requires = {
      {"nvim-tree/nvim-web-devicons"},
      --Please make sure you install markdown and markdown_inline parser
      {"nvim-treesitter/nvim-treesitter"}
    },

    config = function()
      require('lspsaga').setup({
        finder = { silent = true },
        outline = { layout = "float" },
      })

      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      -- refactor
      map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
      map("n", "<leader>ld", "<cmd>Lspsaga hover_doc<cr>", opts)
      map("n", "<leader>lf", "<cmd>Lspsaga finder tyd+def+ref+imp<cr>", opts)
      map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", opts)
      map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
      map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
      map("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>", opts)
      map("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>", opts)
      map("n", "<leader>lx", "<cmd>Lspsaga show_cursor_diagnostics<cr>", opts)
      map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<cr>", opts)
      map("n", "<leader>lco", "<cmd>Lspsaga outgoing_calls<cr>", opts)
      map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
      map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    end
  }
end


return M
