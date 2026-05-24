return {
  "stevearc/conform.nvim",
  opts = {
    -- Format html and the template filetypes with prettier. A configured formatter stops
    -- conform's LSP fallback, so the html LSP no longer reflows the template tags.
    formatters_by_ft = {
      html = { "prettier" },
      gotmpl = { "prettier" },
      handlebars = { "prettier" },
      htmldjango = { "prettier" },
      twig = { "prettier" },
    },
  },
}
