-- Web-template filetypes that also activate html/emmet/tailwind tooling.
-- You MUST set the appropriate modeline in the target file, e.g. {{/* vim: set filetype=gotmpl : */}}.
local template_fts = { "gotmpl", "handlebars", "htmldjango", "twig" }

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        beancount = {
          init_options = {
            -- TODO(#86): Dynamically determine the main beancount file
            journal_file = vim.fn.expand("~/ledger/beancount/main.beancount"),
          },
        },

        -- Don't attach gopls to template files, because it competes with Treesitter's
        -- syntax highlighter and the colours disappear immediately.
        gopls = {
          filetypes = { "go", "gomod", "gowork" },
        },

        html = {
          filetypes = vim.list_extend({ "html", "templ" }, vim.deepcopy(template_fts)),
        },
        emmet_ls = {
          filetypes = vim.list_extend({
            "css",
            "eruby",
            "html",
            "javascript",
            "javascriptreact",
            "less",
            "sass",
            "scss",
            "pug",
            "typescriptreact",
          }, vim.deepcopy(template_fts)),
        },
        tailwindcss = {
          filetypes_include = vim.deepcopy(template_fts),
          -- Treat each template ft as html so class completion fires. The tailwind extra
          -- overwrites `settings`, so inject here: on_new_config runs last and survives it.
          on_new_config = function(new_config)
            new_config.settings = new_config.settings or {}
            local tw = new_config.settings.tailwindCSS or {}
            tw.includeLanguages = tw.includeLanguages or {}
            for _, ft in ipairs(template_fts) do
              tw.includeLanguages[ft] = "html"
            end
            new_config.settings.tailwindCSS = tw
          end,
        },
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      -- You must install markdown and markdown_inline parser for the mini display
      { "nvim-treesitter/nvim-treesitter" },
    },
    cmd = "Lspsaga",
    config = function()
      require("lspsaga").setup({
        finder = { silent = true },
        outline = { layout = "float" },
      })
    end,
  },
}
