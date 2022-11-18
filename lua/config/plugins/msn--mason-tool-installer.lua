local M = {}

function M.setup(use)


  use {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "delve",
          "gopls",
          "golangci-lint", -- several linters
          "golangci-lint-langserver", -- LSP server, relies on golangci-lint
          "gofumpt", -- a stricter gofmt

          "eslint-lsp",
          "node-debug2-adapter",
          "typescript-language-server",

          "emmet-ls",
          "html-lsp",

          "css-lsp",
          "tailwindcss-language-server",

          "json-lsp",
          "yaml-language-server",

          "bash-language-server",
          "cmake-language-server",
          "dockerfile-language-server",
          "lua-language-server",
          "pyright",
          "rust-analyzer",
          "vim-language-server",
        },
        auto_update = false,
        -- run_on_start = true, -- default
        start_delay = 5000,
      }
    end
  }
end

return M
