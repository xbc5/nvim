return function(colorscheme, style)
  local try_require = require("lib.nvim").try_require
  local material = try_require("material")
  if not material then return end -- material won't exist on first load (initial installation)

  -- NOTE: you must set the lualine theme in the config.plugins.lualine module.


  local function set_material()
    -- styles: darker; lighter; oceanic; palenight; deep ocean;
    vim.api.nvim_set_option('termguicolors', true) -- required for 16 bit terminals
    vim.g.material_style = style or "deep ocean"

    require('material').setup({
      contrast = { -- contrast the following elements
        sidebars = true,
        floating_windows = true,
        cursor_line = true,
        non_current_windows = true,
      },
      styles = {
        comments = { italic = true },
        keywords = { underline = true },
      },
      plugins = {
        "dap", "gitsigns", "hop", "lspsaga", "nvim-cmp", "nvim-web-devicons",
        "telescope", "which-key", "trouble"
      },
    })

    vim.cmd("colorscheme material")
  end


  local function set_neon()
    -- styles: default; doom; dark; light;
    vim.g.neon_style = style or "default"

    vim.g.neon_italic_keyword = true      -- for, do, while, loops etc
    vim.g.neon_italic_function = true     -- funcs, methods
    vim.g.neon_italic_boolean = false
    vim.g.neon_italic_variable = false
    vim.g.neon_italic_comment = false
    vim.g.neon_bold = false               -- errors, warnings, lsp etc.

    vim.cmd("colorscheme neon")
  end


  local switch = {
    material = set_material,
    neon = set_neon,
  }


  local fn = assert(switch[colorscheme or "neon"], "Invalid theme name: "..colorscheme)
  fn()
end
