local M = {}

function M.setup(use)
  use({
    "kylechui/nvim-surround",
    tag = "*", -- '*' is stable; exclude (main branch) for unstable
    config = function()
      require("nvim-surround").setup({})
    end
  })
end

return M
