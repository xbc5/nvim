local sys = require("lib.sys")
-- don't run any installations as root or in Qubes templates
if not sys.is_user() or sys.is_templatevm() then return end

require("config.packer").install()

return require('packer').startup({function(use)
    use "nvim-lua/plenary.nvim" -- packer opt is buggy, make this mandatory
    use 'wbthomason/packer.nvim' -- manage packer updates
    use 'vim-scripts/loremipsum'
    use 'b3nj5m1n/kommentary'
    use 'j-hui/fidget.nvim'
    use 'marko-cerovac/material.nvim'
    use 'tpope/vim-obsession'
    use {
      "weirongxu/plantuml-previewer.vim",
      requires = { "aklt/plantuml-syntax", "tyru/open-browser.vim" }
    }

    -- load all config.plugins.*
    local path = vim.fn.stdpath('config') .. '/lua/config/plugins'
    local names = require("lib.sys").ls(path)
    for _, name in ipairs(names) do
      local conf = require("config.plugins."..name:match("(.+)%.lua$")) -- strip .lua extension too
      if type(conf) ~= "table" then
        error(name..": config module must return a table with a setup() function.")
      end
      if not conf.setup then
        error(name..": setup() function not found for config module.")
      end
      conf.setup(use)
    end
  end,

  config = require("config.packer").config()
})
