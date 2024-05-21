return {
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- You must install markdown and markdown_inline parser for the mini display
      { "nvim-treesitter/nvim-treesitter" },
    },
    cmd = "Lspsaga",
    config = function()
      require("lspsaga").setup({
        finder = { silent = true },
        outline = { layout = "float" },
      })
    end,
  },
}
