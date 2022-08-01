local M = {}

function M.config()
  local packer = require("packer")
  local util = require("packer.util")

  local snapshot_name = "packer-snapshot.json"

  local function pin_when_done()
    vim.api.nvim_exec(
      "autocmd User PackerComplete ++once lua require('packer').snapshot('"..snapshot_name.."')",
    true)
  end

  vim.api.nvim_create_user_command("PackerSyncAndPin", function()
    pin_when_done()
    packer.sync()
  end, { desc = "Run PackerSync but save pins to the configured directory." })

  vim.api.nvim_create_user_command("PackerPin", function()
    packer.snapshot(snapshot_name)
  end, { desc = "Run PackerSnapshot but save pins to the configured directory." })

  vim.api.nvim_create_user_command("PackerInstallAndPin", function()
    pin_when_done()
    packer.install()
  end, { desc = "Run PackerInstall but save pins to the configured directory." })

  return {
    snapshot_path = vim.fn.stdpath("config"), -- is my repo
    snapshot = snapshot_name,
    ensure_dependencies   = true, -- Should packer install plugin dependencies?
    package_root   = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
    compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
    plugin_package = 'packer', -- The default package for plugins
    max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
    auto_clean = true, -- During sync(), remove unused plugins
    compile_on_sync = true, -- During sync(), run packer.compile()
    disable_commands = false, -- Disable creating commands
    opt_default = false, -- Default to using opt (as opposed to start) plugins
    transitive_opt = true, -- Make dependencies of opt plugins also opt by default
    transitive_disable = true, -- Automatically disable dependencies of disabled plugins
    auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
    git = {
      cmd = 'git', -- The base command for git operations
      subcommands = { -- Format strings for git subcommands
        update         = 'pull --ff-only --progress --rebase=false',
        install        = 'clone --depth %i --no-single-branch --progress',
        fetch          = 'fetch --depth 999999 --progress',
        checkout       = 'checkout %s --',
        update_branch  = 'merge --ff-only @{u}',
        current_branch = 'branch --show-current',
        diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
        diff_fmt       = '%%h %%s (%%cr)',
        get_rev        = 'rev-parse --short HEAD',
        get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
        submodules     = 'submodule update --init --recursive --progress'
      },
      depth = 1, -- Git clone depth
      clone_timeout = 60, -- Timeout, in seconds, for git clones
      default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
    },
    display = {
      non_interactive = false, -- If true, disable display windows for all operations
      open_fn = function() -- An optional function to open a window for packer's display
        return require('packer.util').float({ border = "single" }) -- floating window for UI
      end,
      open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
      working_sym = '⟳', -- The symbol for a plugin being installed/updated
      error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
      done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
      removed_sym = '-', -- The symbol for an unused plugin which was removed
      moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
      header_sym = '━', -- The symbol for the header line in packer's display
      show_all_info = true, -- Should packer show all update details automatically?
      prompt_border = 'double', -- Border style of prompt popups.
      keybindings = { -- Keybindings for the display window
        quit = 'q',
        toggle_info = '<CR>',
        diff = 'd',
        prompt_revert = 'r',
      }
    },
    luarocks = {
      python_cmd = 'python' -- Set the python command to use for running hererocks
    },
    profile = {
      enable = false,
      threshold = 1, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
    }
  }
end

return M
