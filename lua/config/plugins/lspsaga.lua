local M = {}

function M.setup(use)
  use {
    "glepnir/lspsaga.nvim",
    config = function()
      require('lspsaga').init_lsp_saga({})

      local map = vim.keymap.set
      local opts = { silent = true, noremap = true }

      -- refactor
      map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", opts)
      map("n", "<leader>ld",  "<cmd>Lspsaga hover_doc<cr>", opts)
      map("n", "<leader>lf", "<cmd>Lspsaga lsp_finder<cr>", opts)
      map("n", "<leader>li", "<cmd>Lspsaga implement<cr>", opts)
      map("n", "<leader>lp",  "<cmd>Lspsaga preview_definition<cr>", opts)
      map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
      map("n", "<leader>ls",  "<cmd>Lspsaga signature_help<cr>", opts)
      map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
      map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
    end
  }
end


return M
