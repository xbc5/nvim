local M = {}

function M.setup(use)
  use {
    'ray-x/go.nvim',
    requires = {'ray-x/guihua.lua'},
    config = function()
      require('go').setup{
        max_line_len = 100, -- golines
        lsp_cfg = true, -- use ray-x/go custom LSP config, includes "staticcheck" + more
        goimport = "goimports", -- supports auto-imports
        test_runner = "ginkgo",
        dap_debug_keymap = false, -- use my own, defined in DAP config module
        dap_debug_gui = false, -- crap, useless, buggy
      }

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          local fmt = require('go.format')
          fmt.goimport()
          fmt.gofmt()
          -- fmt.gofmt()
        end,
        group = format_sync_grp,
      })
    end
  }
end

return M
