return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    cmd = {
      "MasonToolsInstall",
      "MasonToolsInstallSync",
      "MasonToolsUpdate",
      "MasonToolsUpdateSync",
      "MasonToolsClean",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Web
          "emmet-ls",
          "html-lsp",
          "css-lsp",

          -- Other
          "bash-language-server",
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
