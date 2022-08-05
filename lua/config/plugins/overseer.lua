local M = {}

function M.setup(use)
  use {
    'stevearc/overseer.nvim',
    config = function()
      local function map(key, cmd)
        local m = vim.keymap.set
        m('n', '<leader>r'..key, ':Overseer'..cmd..'<CR>', { silent = true, noremap = true })
      end

      map('t', 'Toggle')
      map('r', 'Run')
      map('b', 'Build')
      map('q', 'QuickAction')
      map('c', 'RunCmd')
      map('a', 'TaskAction')
      map('l', 'LoadBundle')
      map('d', 'DeleteBundle')
      map('s', 'SaveBundle')

      require('overseer').setup()
    end
  }
end

return M
