local M = {}

function M.setup(use)
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons'},
    config = function()
      local colorscheme = vim.g.colors_name

      local themes = {
        -- put your custom theme name mappings in here.
        material = "material-nvim",
        neon = "neon",
      }

      require('lualine').setup {
        options = {
          theme = themes[colorscheme] or colorscheme -- lualine defaults to gruvbox if none is found.
        }
      }
    end
  }
end

return M