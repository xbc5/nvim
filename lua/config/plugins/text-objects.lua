local M = {}

function M.setup(use)
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
end

return M
