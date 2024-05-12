require("lazy")

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "vim-scripts/loremipsum", cmd = "Loremipsum" },
  { "RRethy/vim-illuminate", event = "BufEnter" },
  { "b3nj5m1n/kommentary", event = "BufEnter" }, -- TODO: lazy
  { "tpope/vim-obsession", cmd = "Obsession" },
  {
    "tmillr/sos.nvim", -- auto-save on a timer
    event = "BufEnter",
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
