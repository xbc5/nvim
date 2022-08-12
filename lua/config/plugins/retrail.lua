local M = {}

function M.setup(use)
  use {
    'zakharykaplan/nvim-retrail',
    config = function ()
      require("retrail").setup({
        filetype = {
          strict = true, -- true: enabled for included; false: disable on excluded
          include = {
            -- don't enable js, ts -- they have formatters
            "rust", "python", "html", "dockerfile", "lua", "vim", "sh"
          },
        },
        trim = { blanklines = true }
      })
    end
  }
end

return M
