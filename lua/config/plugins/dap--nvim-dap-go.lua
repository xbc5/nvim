local M = {}

function M.setup(use)
  use {
    'leoluz/nvim-dap-go',
    disable = true,
    config = function()
      require('dap-go').setup()

      vim.api.nvim_create_user_command("GoDebugTest", function()
        require("dap-go").debug_test()
      end, { desc = "Debug the nearest Go test with delve" })

      vim.api.nvim_create_user_command("GoDebugLastTest", function()
        require("dap-go").debug_last_test()
      end, { desc = "Debug the last Go test with delve" })
    end
  }
end

return M
