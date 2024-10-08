return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- according to mason-lspconfi: 1. mason, 2. mason-lspconfig, 3. lspconfig
      require("mason").setup()
      require("mason-lspconfig").setup()

      -- if we can load lspconfig, then configure it
      require("lib.nvim").import("lspconfig").ok(function(lspconfig)
        -- if we use vtsls
        local vtsls = lspconfig.vtsls
        if vtsls then
          vtsls.setup({
            settings = {
              vtsls = {
                experimental = {
                  completion = {
                    enableServerSideFuzzyMatch = true, -- perf: reduces invalid entries[1]
                    entriesLimit = 20, -- perf: reduce the number of suggestions[1]
                  },
                },
              },
              typescript = {
                preferences = {
                  includePackageJsonAutoImports = "off", -- perf[1]
                },
              },
            },
          })
        end
      end)
    end,
  },
}

--[[

  [1] fixes performance issues, see: https://github.com/yioneko/vtsls?tab=readme-ov-file#bad-performance-of-completion

 ]]
--
