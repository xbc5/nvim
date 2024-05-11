return {
  {
    "folke/todo-comments.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opt = {
      highlight = {
        after = "bg", -- what to highlight
        pattern = [[.*<(KEYWORDS)\s*]], -- : excluded
      },
      search = {
        pattern = [[\b(KEYWORDS)]], -- ripgrep regex
      },
    },
  },
}
