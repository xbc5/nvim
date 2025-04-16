return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- I think ensure_installed is a LazyVim extension due to this line in the full spec:
      -- `opts_extend = { "ensure_installed" }`
      -- However, Mason does support a similar key via it's companion package: mason-lspconfig.nvim[0].
      -- Using LazyVim's implementation for now.
      ensure_installed = {
        -- Writing.
        "tinymist", -- Typst.

        -- Web
        "emmet-ls",
        "html-lsp",
        "css-lsp",

        -- Other
        "bash-language-server",
        "rust-analyzer",
        "vim-language-server",
      },
    },
  },
}

--[[
-- References
--   [0] https://github.com/williamboman/mason.nvim/issues/103#issuecomment-1203332339
--]]
