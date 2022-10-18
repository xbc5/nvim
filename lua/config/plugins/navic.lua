local M = {}

function M.setup(use)
  use {
    "SmiteshP/nvim-navic",
    -- this is configured inside mason config since it needs LSP, and mason configures that
    requires = "neovim/nvim-lspconfig",
    config = function()
      require("nvim-navic").setup { highlight = true }
      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end
  }
end

return M
