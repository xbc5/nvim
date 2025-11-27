return {
  {
    "L3MON4D3/LuaSnip",
    config = function(_, opts)
      local ls = require("luasnip")
      ls.setup(opts or {})

      -- Load private snippets from external repository
      local private_snippets_path = vim.fn.expand("~/git/clones/my-private-snippets")
      if vim.fn.isdirectory(private_snippets_path) == 1 then
        require("luasnip.loaders.from_lua").lazy_load({ paths = private_snippets_path })
      end

      -- Keybindings for choice nodes
      vim.keymap.set({ "i", "s" }, "<C-e>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { desc = "LuaSnip: Next choice" })

      vim.keymap.set({ "i", "s" }, "<C-S-e>", function()
        if ls.choice_active() then
          ls.change_choice(-1)
        end
      end, { desc = "LuaSnip: Previous choice" })
    end,
  },
}
