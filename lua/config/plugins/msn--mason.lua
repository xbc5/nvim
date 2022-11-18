local M = {}

function M.setup(use)
  use {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
      "RRethy/vim-illuminate", -- FIXME: move this; -- highlight other identical words in buffer on hover
    },
    after = "nvim-navic", -- sets up the winbar; uses lsp; passed to on_attach below
    config = function()
      vim.cmd('command! LspReload LspRestart | edit)') -- reload LSP then buffer

      vim.lsp.set_log_level('warn')

      local try_require = require("lib.nvim").try_require
      local mason = try_require("mason")
      local mason_lsp = try_require("mason-lspconfig")

      if mason then mason.setup() end

      if mason_lsp then
        -- run this before creating setup_handlers
        mason_lsp.setup {
          automatic_installation = true,
          ensure_installed = {
            -- web
            "tsserver",
            "cssls",
            "emmet_ls",
            "eslint",
            "tailwindcss",
            "jsonls",
            -- devops
            "dockerls",
            "terraformls",
            "salt_ls",
            "yamlls",
            -- other
            "bashls",
            "cmake",
            "gopls",
            "html",
            "pyright",
            "sumneko_lua",
            "vimls",
            "rust_analyzer",
          }
        }

        local lspconfig = try_require("lspconfig")

        if not lspconfig then
          error("lspconfig not loaded: you must load lspconfig before mason")
        end

        local function matchone(args)
          local ret = {}
          for _,k in ipairs(args) do ret[k] = true end
          return ret
        end

        local function on_attach(server_name)
          return function(client, bufnr)
            local major_ls = { -- NOT auxiliary servers; primary servers
                "tsserver", "bashls", "gopls", "html",
                "pyright", "sumneko_lua", "rust_analyzer", "cssls" }

            if matchone(major_ls)[server_name] then
              -- this can only attach to one server, so make it the primary ft server
              require("nvim-navic").attach(client, bufnr)
              require('illuminate').on_attach(client) -- no point attaching it to auxiliary servers
            end
          end
        end

        mason_lsp.setup_handlers {
          function (server_name) -- default handler; executes if no specific config below
            lspconfig[server_name].setup({
              on_attach = on_attach(server_name)
            })
          end,

          ["sumneko_lua"] = function()
            lspconfig.sumneko_lua.setup({
              on_attach = on_attach("sumneko_lua"),
              settings = {
                Lua = {
                  diagnostics = {
                    globals = {'vim'},
                  },
                },
              },
            })
          end
        }
      end
    end
    }
end

return M