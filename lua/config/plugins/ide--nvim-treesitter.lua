local M = {}

function M.setup(use)
  use {
    'nvim-treesitter/playground',
    requires = 'nvim-treesitter/nvim-treesitter',
    cmd = "TSPlaygroundToggle",
  }

  use {
    "mfussenegger/nvim-ts-hint-textobject",
    requires = { "nvim-treesitter/nvim-treesitter" },
    after = "nvim-treesitter",
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = { "nvim-treesitter/nvim-treesitter" },
    after = "nvim-treesitter",
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require("nvim-treesitter.configs").setup {
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        modules = {},
        highlight = {
          enable = true,
        },
        ensure_installed = {
          -- BUG: go parser breaks <M-h|j|k|l> for some reason -- causing DAP to break
          "bash", "lua", "css", "dockerfile", "html", "javascript", "json", "jsonc", "regex",
          "rust", "python", "svelte", "toml", "typescript", "yaml", "scss", "rst", "query", "vim",
          "c", "cmake", "cpp", "csv", "diff", "git_config", "git_rebase", "gitattributes", "gitcommit",
          "gitignore", "markdown", "markdown_inline", "go", "gomod", "gosum", "gowork", "gpg", "jsdoc",
          "json5", "jsonc", "luadoc", "toml", "vimdoc", "starlark", "sql", "terraform", "tsx", "toml",
          "perl", "ocaml", "nix", "make", "http", "groovy", "awk",
        },
        -- nvim-treesitter-textobjects
        textobjects = {
          select = {
            enable = true, -- WARN: all modules disabled by default
            include_surrounding_whitespace = true,
            keymaps = {
              -- capture groups defined in ~/.local/.../packer/nvim-treesitter/captures/*
              -- see :h nvim-treesitter-incremental-selection-mod
              ["aa"] = "@parameter.outer", -- a: "arg" (p is paragraph)
              -- ["ia"] = "@parameter.inner", -- doesn't work so well
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["aC"] = "@comment.outer",
              ["iC"] = "@comment.inner", -- doesn't work
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- true: add to jump list
            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]x"] = "@class.outer",
            },
            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]X"] = "@class.outer",
            },
            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[x"] = "@class.outer",
            },
            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[X"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<S-C-l>"] = "@parameter.inner",
              ["<s-C-j>"] = "@function.outer",
            },
            swap_previous = {
              ["<S-C-h>"] = "@parameter.inner",
              ["<S-C-k>"] = "@function.outer",
            },
          },
        },
      }
  end
}

end

return M
