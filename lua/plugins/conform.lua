local map = require("lib.nvim").map

return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.typescript = { "biome" }
      opts.formatters_by_ft.javascript = { "biome" }
      opts.formatters_by_ft.javascriptreact = { "biome" }
      opts.formatters_by_ft.typescriptreact = { "biome" }
      opts.formatters_by_ft.json = { "biome" }
      opts.formatters_by_ft.jsonc = { "biome" }

      return opts
    end,
  },
}
