return {
  {
    "folke/todo-comments.nvim",
    event = { "BufEnter" },
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
      gui_style = {
        fg = "BOLD", -- Bold text (on the part that doesn't have a coloured background)
      },
      highlight = {
        pattern = [[.*<(KEYWORDS)\s*]], -- Lacks a :
      },
      search = {
        pattern = [[\b(KEYWORDS)]], -- Ripgrep RegExp (for finding the comments).
      },
    },
  },
}
