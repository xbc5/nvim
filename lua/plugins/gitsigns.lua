return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufEnter" },
    opts = {
      current_line_blame = false, -- HUGE performance hog, laggy input
    },
  },
}
