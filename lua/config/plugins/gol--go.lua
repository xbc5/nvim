local M = {}

function M.setup(use)
  use {
    'ray-x/go.nvim',
    requires = {'ray-x/guihua.lua'},
    config = function()
      require('go').setup{
        test_runner = "ginkgo",
        dap_debug_keymap = false, -- use my own, defined in DAP config module
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local fmt = require('go.format')
          fmt.goimport()
          -- fmt.gofmt()
        end,
        group = format_sync_grp,
      })
    end
  }
end

return M
