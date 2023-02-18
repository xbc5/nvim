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
            -- "terraformls",
            "salt_ls",
            "yamlls",
            -- other
            "bashls",
            "cmake",
            "gopls",
            "html",
            "pyright",
            "lua_ls",
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
                "pyright", "lua_ls", "rust_analyzer", "cssls" }

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

          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              on_attach = on_attach("lua_ls"),
              settings = {
                Lua = {
                  runtime = {
                    -- Tell the language server which version of Lua
                    --  you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                  },
                  diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                  },
                  workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                  },
                  -- Do not send telemetry data containing a randomized but
                  --  unique identifier
                  telemetry = {
                    enable = false,
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
