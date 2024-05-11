return {
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
  },

  -- TODO: lazy load
  {
    "mfussenegger/nvim-treehopper",
    dependencies = { "nvim-treesitter/nvim-treesitter", "phaazon/hop.nvim" },
    config = function()
      local map = vim.api.nvim_set_keymap
      map("o", "m", ":lua require('tsht').nodes()<CR>", { silent = true })
      map("v", "m", ":lua require('tsht').nodes()<CR>", { silent = true, noremap = true })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opt = {
      sync_install = false,
      auto_install = true,
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
    },
  },
}
