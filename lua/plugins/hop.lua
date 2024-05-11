return {
  {
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      require("lib.nvim").map("n", ":<leader>hw", ":HopWord", { desc = "Hop Word" })
    end,
  },
}
