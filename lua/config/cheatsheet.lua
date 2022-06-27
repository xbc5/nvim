return function()
  require("cheatsheet").setup({
    -- generic cheatsheets like default, unicode, nerd-fonts, etc
    bundled_cheatsheets = true,
    -- bundled_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- },

    -- For plugin specific cheatsheets
    bundled_plugin_cheatsheets = true,
    -- bundled_plugin_cheatsheets = {
    --     enabled = {},
    --     disabled = {},
    -- }

    -- For bundled plugin cheatsheets, do not show a sheet if you
    -- don't have the plugin installed (searches runtimepath for
    -- same directory name)
    include_only_installed_plugins = true,
  })
end
