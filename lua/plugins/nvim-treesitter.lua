local map = require("lib.nvim").map

return {
  {
    "nvim-treesitter/playground",
    dependencies = "nvim-treesitter/nvim-treesitter",
    cmd = "TSPlaygroundToggle",
  },

  {
    "mfussenegger/nvim-treehopper",
    event = { "BufEnter" },
    dependencies = { "nvim-treesitter/nvim-treesitter", "phaazon/hop.nvim" },
    config = function()
      map("o", "m", ":lua require('tsht').nodes()<CR>", { noremap = false, desc = "Select Node with TSHT" })
      map("v", "m", ":lua require('tsht').nodes()<CR>", { desc = "Select Node with TSHT" })
    end,
  },

  {
    -- NOTE: some configurations are also merged from nvim-devdocs config.
    "nvim-treesitter/nvim-treesitter",
    opt = {
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = false,
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
        swap = {
          enable = true,
          -- swap the node under the cursor: e.g. param, function
          swap_next = {
            ["<C-J>"] = "@parameter.inner",
          },
          swap_previous = {
            ["<C-K>"] = "@parameter.inner",
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
      },
    },
  },
}
