return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    after = "mason.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "emmet-ls",
          "html-lsp",

          "css-lsp",

          "bash-language-server",
          "cmake-language-server",
          "rust-analyzer",
          "vim-language-server",
        },
        auto_update = false,
        run_on_start = false,
        -- run_on_start = true, -- default
        start_delay = 5000,
        debounce_hours = 48,
      })
    end,
  },
}
