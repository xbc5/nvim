return {
  {
    "mfussenegger/nvim-dap",
    -- stylua: ignore
    keys = {
      { "<leader>dd", function() require("dap").disconnect() end, desc = "Disconnect (!exit)" },
      { "<leader>dB", function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" },

      -- navigation
      { "<M-J>", function() require("dap").continue() end, desc = "Continue" }, -- also starts session
      { "<M-K>", function() require("dap").reverse_continue() end, desc = "Reverse Continue" }, -- back in time
      { "<M-k>", function() require("dap").step_back() end, desc = "Step Back" }, -- back 1 step
      { "<M-j>", function() require("dap").step_over() end, desc = "Step Over" },
      { "<M-h>", function() require("dap").step_out() end, desc = "Step Out" }, -- out func
      { "<M-l>", function() require("dap").step_into() end, desc = "Step Into" }, -- in func
      { "<M-u>", function() require("dap").up() end, desc = "Up" }, -- up stack, no stepping
      { "<M-d>", function() require("dap").down() end, desc = "Down" }, -- down stack, not stepping

      -- we remaped these above
      { "<leader>dc", false }, -- continue
      { "<leader>db", false }, -- toggle_breakpoint
      { "<leader>dO", false }, -- step_over
      { "<leader>do", false }, -- steo_out
      { "<leader>di", false }, -- step_into
      { "<leader>dk", false }, -- up
      { "<leader>dj", false }, -- down
    },
  },

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
    event = { "VeryLazy" },
    config = function()
      -- The LazyVim spec does not define a config function -- so it's safe to define this.
      vim.api.nvim_create_user_command("GoDebugTest", function()
        require("dap-go").debug_test()
      end, { desc = "Debug the nearest Go test with delve" })

      vim.api.nvim_create_user_command("GoDebugLastTest", function()
        require("dap-go").debug_last_test()
      end, { desc = "Debug the last Go test with delve" })
    end,
  },
}
