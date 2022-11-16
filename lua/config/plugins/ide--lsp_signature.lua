local M = {}

function M.setup(use)
  use {
    "ray-x/lsp_signature.nvim",
    config = function()
      require("lsp_signature").setup {
        bind = true, -- mandatory, else border config breaks
        extra_trigger_chars = {"(", "{", ","}
      }
    end
  }
end

return M
