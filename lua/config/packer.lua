local M = {}

function M.install()
  local sys = require("lib.sys")
  if not sys.is_user() or sys.is_templatevm() then return end

  local execute = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    execute 'packadd packer.nvim'
  end
end

function M.config()
  local packer = require("packer")

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
    max_jobs = 5, -- Limit the number of simultaneous jobs. nil means no limit
    auto_reload_compiled = false,  -- prevent errors for session doing the editing

    display = {
      open_fn = function() -- An optional function to open a window for packer's display
        return require('packer.util').float({ border = "single" }) -- floating window for UI
      end,
    },
  }
end

return M
