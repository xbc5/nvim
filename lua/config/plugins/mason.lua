local M = {}

function M.get_conf_for(name)
  local nvim = require'lib.nvim'
  local table = require'lib.table'

  local opts = { -- default opts, merged with server configs
    flags = { debounce_text_changes = 500 } -- debounce didChange notification to server (ms)
  }

  -- the server config might not exists
  local path = 'config.lsp_servers.'..name
  local conf = nvim.try_require(path)
  if conf then
    if not conf.config then
      error("mason: cannot find config() function in lsp config module: "..path)
    else
      opts = table.merge(opts, conf.config())
    end
  end

  return opts
end

function M.setup(use)
  use {
    "williamboman/mason.nvim",
    requires = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig"
    },
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

        local get_conf_for = require("config.plugins.mason").get_conf_for
        local lspconfig = try_require("lspconfig")

        if not lspconfig then
          error("lspconfig not loaded: you must load lspconfig before mason")
        end

        mason_lsp.setup_handlers {
          function (server_name) -- default handler; executes if no specific config below
            lspconfig[server_name].setup(get_conf_for(server_name))
          end,

          -- You can be specific like so:
          -- ["rust_analyzer"] = function ()
            --   require("rust-tools").setup {}
            -- end
          }
        end
      end
    }
end

return M
