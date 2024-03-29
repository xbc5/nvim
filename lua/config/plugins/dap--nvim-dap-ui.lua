local M = {}

function M.setup(use)
  use {
    'rcarriga/nvim-dap-ui',
    disable = false,
    requires = {'mfussenegger/nvim-dap'},
    config = function()
      local dapui = require("dapui")

      dapui.setup()

      local map = vim.api.nvim_set_keymap
      local opts = { silent = true, noremap = true }

      map('n', '<leader>es',  '<Cmd>lua require("dapui").float_element("scopes", { enter = true })<CR>', opts)
      map('n', '<leader>ev', '<Cmd>lua require("dapui").float_element("breakpoints", { enter = true })<CR>', opts)
      map('n', '<leader>eS',  '<Cmd>lua require("dapui").float_element("stacks", { enter = true })<CR>', opts)
      map('n', '<leader>ew',  '<Cmd>lua require("dapui").float_element("watches", { enter = true })<CR>', opts)
      map('v', '<leader>ee',  '<Cmd>lua require("dapui").eval(nil, { enter = true })<CR>', opts)
      map('n', '<leader>ee',  '<Cmd>lua require("dapui").eval(nil, { enter = true })<CR>', opts)
    end
  }
end

return M
