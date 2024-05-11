require("lazy")

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "vim-scripts/loremipsum", cmd = "Loremipsum" },
  { "RRethy/vim-illuminate", lazy = false },
  { "b3nj5m1n/kommentary" }, -- TODO: lazy
  { "tpope/vim-obsession", cmd = "Obsession" },
  {
    "tmillr/sos.nvim", -- auto-save on a timer
    lazy = false,
    config = function()
      require("sos").setup() -- autostarts it
    end,
  },
  {
    "weirongxu/plantuml-previewer.vim",
    ft = { "plantuml", "puml" },
    cmd = { "PlantumlOpen", "PlantumlSave", "PlantumlStart", "PlantumlStop", "PlantumlToggle" },
    dependencies = {
      "aklt/plantuml-syntax",
      "tyru/open-browser.vim",
    },
  },
}
