local M = {}

function M.my_keymaps(actions_wanted)
  local with_actions = {
    { "n", "<leader>m", "buffers" },
    -- often used
    { "n", "<leader>fhh", "help_tags" },
    { "n", "<leader>fkk", "keymaps" },
    -- git
    { "n", "<leader>fgc", "git_commits" },
    { "n", "<leader>fgs", "git_status" },
    -- buffer
    { "n", "<leader>fbd", "lsp_document_diagnostics" },
    { "n", "<leader>fbf", "current_buffer_fuzzy_find" },
    { "n", "<leader>fbr", "lsp_references" },
    { "n", "<leader>fbs", "lsp_document_symbols" },
    -- workspace
    { "n", "<leader>fwd", "lsp_workspace_diagnostics" },
    { "n", "<leader>fwg", "live_grep" },
    { "n", "<leader>fwr", "lsp_references" },
    { "n", "<leader>fws", "lsp_workspace_symbols" },
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
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
      {'nvim-telescope/telescope-project.nvim'},
      {'nvim-telescope/telescope-ui-select.nvim' },
      {'nvim-telescope/telescope-frecency.nvim'},
      {'tami5/sqlite.lua'}, -- required by frecency
      {
        -- NOTE: there is lualine widget that uses this plug-in, see my lualine config
        'rlch/github-notifications.nvim',
        config = function()
          local try_require = require("lib.nvim").try_require
          local secrets = try_require('config.secrets.github').notifications
          if not secrets then
            vim.notify("You must supply GitHub secrets to get notifications.", "warn")
            return
          end
          require('github-notifications').setup {
            username = secrets.user,
            token = secrets.token,
            debounce_duration = 300,
          }
        end
      }
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
          frecency = {
            show_scores = true,
            workspaces = {
              ["project"] = "~/projects",
              ["practice"] = "~/projects",
              ["git"] = "~/git",
            }
          },
          project = {
            base_dirs = { "~/projects" },
            hidden_files = true,
          },
        }
      }

      telescope.load_extension('fzf') -- MUST call AFTER setup
      telescope.load_extension('ui-select')
      telescope.load_extension('ghn') -- GitHub notifications
      telescope.load_extension("frecency")


      for _, m in pairs(require("config.plugins.telescope").my_keymaps(true)) do
        local mode = m[1]; local keys = m[2]; local action = m[3]
        vim.api.nvim_set_keymap(
          mode, keys, '<cmd>Telescope '..action..'<cr>', { noremap = true }
        )
      end

      telescope.load_extension('project') -- project.nvim: fuzzy finder for projects
      vim.api.nvim_set_keymap(
        'n',
        '<leader>fp',
        ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
        {noremap = true, silent = true}
      )

      vim.keymap.set('n', '<leader>n', function()
        require("telescope.builtin").find_files { hidden = true }
      end , { noremap = true })

      vim.keymap.set('n', '<leader>gn',
        require('telescope').extensions.ghn.notifications,
        { silent = true, noremap = true })

      vim.keymap.set("n", "<leader>,", ":Telescope frecency<CR>", {noremap = true, silent = true})

    end
  }
end

return M
