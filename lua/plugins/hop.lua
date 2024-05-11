return {
  {
    "phaazon/hop.nvim",
    cmd = "HopWord",
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
      require("lib.nvim").map("n", "<leader>hw", ":HopWord<CR>", { desc = "Hop Word" })
    end,
  },
}
