-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = require("lib.nvim").map
local safe_require = require("lib.nvim").safe_require

-- MISC
-------------------------------------------------------------------------------
-- sort Python imports
safe_require("lib.code", function(M)
  map("n", "<leader>is", M.sort_imports, { desc = "sort imports" })
end)

-- UTILS
-------------------------------------------------------------------------------
-- generate a random tag string (for tests): e.g. #djU37w
map("i", "<A-t>", '<C-o>:lua require("lib.util").insert_tag()<CR>', { desc = "Hash Tag Generator" })
-- opts (O): only i and s are reserved for Octo (see below).
map("n", "<leader>Ol", ":set list!<CR>", { desc = "Invisible Chars Toggle" })
map("n", "<leader>Os", ":set spell!<CR>", { desc = "Spell Check Toggle" })
map("n", "<leader>Ow", ":set wrap!<CR>", { desc = "Line Wrap Toggle" })
-- delete all other buffers
map("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Buffer Only (delete all others)" })
-- centre screen when jumping through search
map("n", "n", "nzzzv")
map("n", "M", "Nzzzv")
-- keep cursor in same place while joining lines: mz:mark z; J; `z: jump to z;
map("n", "J", "mzJ`z")
-- replace visual selection with paste, sending the deletion to a void register.
map("v", "<leader>p", "_dP", { desc = "Paste and replace selection" })
map("n", "<leader>fC", ":Cheatsheet<CR>", { desc = "Cheatsheet Open" })

-- GIT SIGNS
-------------------------------------------------------------------------------
map("n", "<leader>gB", ":Gitsigns toggle_current_line_blame")
map("n", "<leader>gD", ":Gitsigns toggle_deleted")
map("n", "<leader>gR", ":Gitsigns reset_buffer<CR>")
map("n", "<leader>gS", ":Gitsigns stage_buffer<CR>")
map("n", "<leader>gb", ":Gitsigns blame_line<CR>")
map("n", "<leader>gd", ":Gitsigns diffthis")
map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
map("n", "<leader>gu", ":Gitsigns undo_stage_hunk<CR>")
map({ "n", "v" }, "<leader>gr", ":Gitsigns reset_hunk<CR>")
map({ "n", "v" }, "<leader>gs", ":Gitsigns stage_hunk<CR>")

-- Octo
-------------------------------------------------------------------------------
-- lazy loaded; requires perm keymaps
map("n", "<leader>oil", "<CMD>Octo issue list<CR>")
map("n", "<leader>oic", "<CMD>Octo issue create<CR>")
map("n", "<leader>ois", "<CMD>Octo issue search<CR>")
map("n", "<leader>opl", "<CMD>Octo pr list<CR>")
map("n", "<leader>opc", "<CMD>Octo pr create<CR>")
map("n", "<leader>opr", "<CMD>Octo pr checks<CR>")

-- Lazy
-------------------------------------------------------------------------------
-- remap to Sl, because I want 'l' for LSP
vim.keymap.del("n", "<leader>l")
map("n", "<leader>Sl", "<CMD>Lazy<CR>", { desc = "Lazy" }) -- system=>lazy

-- LspSaga
-------------------------------------------------------------------------------
map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>")
map("n", "<leader>ld", "<cmd>Lspsaga hover_doc<cr>")
map("n", "<leader>lf", "<cmd>Lspsaga finder tyd+def+ref+imp<cr>")
map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>")
map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>")
map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>")
map("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>")
map("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics ++float<cr>")
map("n", "<leader>lx", "<cmd>Lspsaga show_cursor_diagnostics<cr>")
map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<cr>")
map("n", "<leader>lco", "<cmd>Lspsaga outgoing_calls<cr>")
map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Lspsaga Next Diagnostic" })
map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Lspsacat Prev Diagnostic" })
