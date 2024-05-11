require("lazy")

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "vim-scripts/loremipsum", cmd = "Loremipsum" },
  { "RRethy/vim-illuminate", lazy = false },
  { "b3nj5m1n/kommentary" }, -- TODO: lazy
  { "tpope/vim-obsession", cmd = "Obsession" },
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
