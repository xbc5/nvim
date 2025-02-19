return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        preset = "enter",
        -- The mapped functions are a list, the first one to return a truthy value executes[0].
        -- "fallback" is the default behaviour[1] -- last means it runs when prior functions are falsy[0]
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-CR>"] = { "select_and_accept", "fallback" },
      },
    },
  },
}

--[[
References:
  [0]https://web.archive.org/web/20250219162908/https://cmp.saghen.dev/configuration/keymap.html#example
  [1]https://web.archive.org/web/20250129161619/https://cmp.saghen.dev/configuration/keymap#commands
]]
--
