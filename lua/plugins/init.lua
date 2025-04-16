require("lazy")

--[[
The plugin that allows one to jump via s<pat>, is called flash.nvim.
  It also improves searching by adding labels etc.
--]]

return {
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-neo-tree/neo-tree.nvim" }, -- WARN: overrides DAP keymap 'e'
  { "vim-scripts/loremipsum", cmd = "Loremipsum" },
  { "folke/which-key.nvim", event = "VeryLazy" }, -- see keymaps.lua for register() keymaps
  { "RRethy/vim-illuminate", event = "BufEnter", enabled = false }, -- Some LSP bug (c. Apr. 2025)[0]; I don't use, so I don't care.
  { "b3nj5m1n/kommentary", event = "BufEnter" },
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

--[[
-- References
--   [0] https://github.com/RRethy/vim-illuminate/issues/232
--]]
