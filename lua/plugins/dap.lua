-- Change the DAP keymaps via its 'keys' key, see: https://www.lazyvim.org/extras/dap/core
--
-- My old keys, for reference:
--
-- map("n", "<leader>ec", '<Cmd>lua require("dap").run_to_cursor()<CR>', opts)
-- map("n", "<leader>el", '<Cmd>lua require("dap").run_last()<CR>', opts)
-- map("n", "<leader>ed", '<Cmd>lua require("dap").disconnect()<CR>', opts)
-- map("n", "<leader>ex", '<Cmd>lua require("dap").close()<CR>', opts)
-- map("n", "<leader>ep", '<Cmd>lua require("dap").pause()<CR>', opts) -- can take thread ID
--
-- -- navigation
-- map("n", "<M-J>", '<Cmd>lua require("dap").continue()<CR>', opts) -- also starts session
-- map("n", "<M-K>", '<Cmd>lua require("dap").reverse_continue()<CR>', opts) -- back in time
-- map("n", "<M-k>", '<Cmd>lua require("dap").step_back()<CR>', opts) -- back 1 step
-- map("n", "<M-j>", '<Cmd>lua require("dap").step_over()<CR>', opts)
-- map("n", "<M-h>", '<Cmd>lua require("dap").step_out()<CR>', opts) -- out func
-- map("n", "<M-l>", '<Cmd>lua require("dap").step_into()<CR>', opts) -- in func
-- map("n", "<M-u>", '<Cmd>lua require("dap").up()<CR>', opts) -- up stack, no stepping
-- map("n", "<M-d>", '<Cmd>lua require("dap").down()<CR>', opts) -- down stack, not stepping
--
-- map("n", "<leader>eb", '<Cmd>lua require("dap").toggle_breakpoint()<CR>', opts)
-- map("n", "<leader>eB", '<Cmd>lua require("dap").clear_breakpoints()<CR>', opts)
--
-- map("n", "<leader>er", '<Cmd>lua require("dap").repl.toggle()<CR>', opts)
--

return {
  {
    -- Sets up adapters with reasonable defaults.
    -- You can modify the handlers via the handlers key:
    --   see: https://www.lazyvim.org/extras/dap/core
    "jay-babu/mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        -- Supported adapters: https://github.com/jay-babu/mason-nvim-dap.nvim/blob/main/lua/mason-nvim-dap/mappings/source.lua
        "debugpy",
        "delve",
        "node-debug2-adapter",
        "chrome-debug-adapter",
        "firefox-debug-adapter",
        "js-debug-adapter",
        "bash-debug-adapter",
      },
    },
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      vim.api.nvim_create_user_command("GoDebugTest", function()
        require("dap-go").debug_test()
      end, { desc = "Debug the nearest Go test with delve" })

      vim.api.nvim_create_user_command("GoDebugLastTest", function()
        require("dap-go").debug_last_test()
      end, { desc = "Debug the last Go test with delve" })
    end,
  },
}
