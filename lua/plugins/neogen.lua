return {
  {
    -- NOTE: for jumping keymaps see nvim-cmp config: <M-h> (left) and <M-r> (right).
    "danymat/neogen",
    cmd = "Neogen",
    keys = {
      { "<leader>eg", "<CMD>Neogen<CR>", desc = "Generate Docs" },
    },
    config = true,
    version = "*", -- '*' stable version only
  },
}
