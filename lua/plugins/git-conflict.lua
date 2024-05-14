return {
  {
    "akinsho/git-conflict.nvim",
    version = "*",
    config = function()
      require("git-conflict").setup({
        default_mappings = {
          next = "]x",
          prev = "[x",
        },
      })
    end,
    event = "BufEnter",
  },
}
