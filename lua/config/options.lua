-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- for :set list ; see keymaps
vim.opt.listchars = {
  tab = "→\\ ",
  space = "·",
  nbsp = "␣",
  eol = "¶",
  precedes = "«",
  extends = "»",
}

if vim.g.neovide then
  vim.o.guifont = "Source Code Pro:h10"
  vim.g.neovide_confirm_quit = true
end
