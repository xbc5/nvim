local map = require("lib.nvim").map

return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- You must install markdown and markdown_inline parser for the mini display
      { "nvim-treesitter/nvim-treesitter" },
    },

    cmd = "LspSaga",

    config = function()
      require("lspsaga").setup({
        finder = { silent = true },
        outline = { layout = "float" },
      })

      -- refactor
      map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>")
      map("n", "<leader>ld", "<cmd>Lspsaga hover_doc<cr>")
      map("n", "<leader>lf", "<cmd>Lspsaga finder tyd+def+ref+imp<cr>")
      map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>")
      map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>")
      map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>")
      map("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>")
      map("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>")
      map("n", "<leader>lx", "<cmd>Lspsaga show_cursor_diagnostics<cr>")
      map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<cr>")
      map("n", "<leader>lco", "<cmd>Lspsaga outgoing_calls<cr>")
      map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Lspsaga Next Diagnostic" })
      map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Lspsacat Prev Diagnostic" })
    end,
  },
}
