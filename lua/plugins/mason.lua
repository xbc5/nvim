return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- I think ensure_installed is a LazyVim extension, due to this line in the full spec:
      -- `opts_extend = { "ensure_installed" }`
      -- However, Mason does support a similar key via it's companion package: mason-lspconfig.nvim[0].
      -- Using LazyVim's implementation for now.
      ensure_installed = {
        -- Build.
        "cmakelang",
        "cmakelint",
        "neocmakelsp",

        -- Config.
        "json-lsp",
        "kcl", -- That CNCF config language.
        "yaml-language-server",

        -- Docker.
        "docker-compose-language-service",
        "dockerfile-language-server",
        "hadolint",

        -- Go
        "delve",
        "gofumpt",
        "goimports",
        "golines",
        "gopls",

        -- Other.
        "lua-language-server",
        "rust-analyzer",
        "stylua",
        "vim-language-server",

        -- Python.
        "black",
        "debugpy",
        "pyright",
        "ruff",
        "ruff-lsp",

        -- Shell.
        "bash-language-server",
        "shfmt",

        -- Web.
        "biome", -- TypeScript, JavaScript.
        "css-lsp",
        "emmet-ls",
        "eslint-lsp",
        "html-lsp",
        "js-debug-adapter",
        "prettierd",
        "svelte-language-server",
        "tailwindcss-language-server",
        "vtsls", -- TypeScript.

        -- Writing.
        "markdown-toc",
        "markdownlint-cli2",
        "marksman", -- Markdown.
        "tinymist", -- Typst.
      },
    },
  },
}

--[[
-- References
--   [0] https://github.com/williamboman/mason.nvim/issues/103#issuecomment-1203332339
--]]
