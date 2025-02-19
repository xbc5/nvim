return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    event = "BufEnter",
    config = function()
      require("git-conflict").setup({
        default_mappings = {
          next = "]x",
          prev = "[x",
        },
      })
    end,
  },
}
