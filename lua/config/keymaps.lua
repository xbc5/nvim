-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require("lib.nvim").map

-- generate a random tag string (for tests): e.g. #djU37w
map("i", "<A-t>", '<C-o>:lua require("lib.util").insert_tag()<CR>')

map("n", "<leader>sl", ":set list!<CR>")
map("n", "<leader>ss", ":set spell!<CR>")
map("n", "<leader>sw", ":set wrap!<CR>")

-- delete all other buffers
map("n", "<leader>bo", ":%bd\\|e#\\|bd#<CR>")

-- centre screen when jumping through search
map("n", "n", "nzzzv")
map("n", "M", "Nzzzv")

-- keep cursor in same place while joining lines: mz:mark z; J; `z: jump to z;
map("n", "J", "mzJ`z")

-- replace visual selection with paste, sending the deletion to a void register.
map("v", "<leader>p", "_dP")

map("n", "<leader>fC", ":Cheatsheet<CR>", { desc = "Cheatsheet Open" })
