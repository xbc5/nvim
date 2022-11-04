local M = {}

function M.setup(use)
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup {
        -- generally speaking frequently polling the repo is a performance hog.
        current_line_blame = false, -- HUGE performance hog, laggy input
        update_debounce = 1000, -- does this really need to be 100ms (default)? use 1k instead

        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map('n', ']c', function()
            if vim.wo.diff then return ']c' end
            vim.schedule(function() gs.next_hunk() end)
            return '<Ignore>'
          end, { expr=true })

          map('n', '[c', function()
            if vim.wo.diff then return '[c' end
            vim.schedule(function() gs.prev_hunk() end)
            return '<Ignore>'
          end, { expr=true })

          -- Actions
          map({'n', 'v'}, '<leader>gs', gs.stage_hunk)
          map({'n', 'v'}, '<leader>gr', gs.reset_hunk)
          map('n', '<leader>gS', gs.stage_buffer)
          map('n', '<leader>gu', gs.undo_stage_hunk)
          map('n', '<leader>gR', gs.reset_buffer)
          map('n', '<leader>gp', gs.preview_hunk)
          map('n', '<leader>gb', function() gs.blame_line{full=true} end)
          map('n', '<leader>gB', gs.toggle_current_line_blame)
          map('n', '<leader>gd', gs.diffthis)
          map('n', '<leader>gD', gs.toggle_deleted)

          -- Text object
          map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        end
      }
    end
  }
end

return M
