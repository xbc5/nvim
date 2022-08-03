local M = {}

function M.my_keymaps(actions_wanted)
  local with_actions = {
    { "n", "<leader>m", "buffers" },
    -- often used
    { "n", "<leader>fgg", "live_grep" },
    { "n", "<leader>fcb", "current_buffer_fuzzy_find" },
    { "n", "<leader>fhh", "help_tags" },
    -- not so often used
    { "n", "<leader>fkk", "keymaps" },
    { "n", "<leader>fgs", "git_status" },
    { "n", "<leader>fgc", "git_commits" },
    { "n", "<leader>fts", "treesitter" },
    { "n", "<leader>ffb", "file_browser" },
    { "n", "<leader>fbs", "lsp_document_symbols" },
    { "n", "<leader>fbr", "lsp_references" },
    { "n", "<leader>fwd", "lsp_workspace_diagnostics" },
    { "n", "<leader>fbd", "lsp_document_diagnostics" },
    { "n", "<leader>fws", "lsp_workspace_symbols" },
    { "n", "<leader>fii", "lsp_implementations" },
    { "n", "<leader>fwr", "lsp_references" },
  }

  if actions_wanted then return with_actions end

  local without_actions = {}
  for i, item in ipairs(with_actions) do
    local mode = item[1]; local keys = item[2]
    without_actions[i] = {mode, keys}
  end
  return without_actions
end

function M.setup(use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'kyazdani42/nvim-web-devicons'},
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      {'nvim-telescope/telescope-project.nvim'},
      { 'nvim-telescope/telescope-ui-select.nvim' },
    },
    config = function()
      local telescope = require("telescope")

      telescope.setup {
        defaults = {
          layout_config = {
            horizontal = {
              mirror = false,
            },
            vertical = {
              mirror = false,
            },
          },
          set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
        },
        extensions = {
          fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",        -- smart_case|ignore_case|respect_case
          },
        }
      }

      telescope.load_extension('fzf') -- MUST call AFTER setup
      telescope.load_extension('ui-select')

      for _, m in pairs(require("config.plugins.telescope").my_keymaps(true)) do
        local mode = m[1]; local keys = m[2]; local action = m[3]
        vim.api.nvim_set_keymap(
          mode, keys, '<cmd>Telescope '..action..'<cr>', { noremap = true }
        )
      end

      telescope.load_extension('project') -- project.nvim: fuzzy finder for projects
      vim.api.nvim_set_keymap(
        'n',
        '<leader>fpp',
        ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
        {noremap = true, silent = true}
      )

      vim.keymap.set('n', '<leader>n', function()
        require("telescope.builtin").find_files { hidden = true }
      end , { noremap = true })

    end
  }
end

return M
