local map = require("lib.nvim").map

return {
  {
    "mrjones2014/smart-splits.nvim",
    event = { "BufEnter" },
    config = function()
      require("smart-splits").setup({})

      -- resizing
      -- accepts a range: 10<keymap> resizes by 10x
      map("n", "<C-A-h>", require("smart-splits").resize_left, { desc = "Expand Buffer Left" })
      map("n", "<C-A-j>", require("smart-splits").resize_down, { desc = "Expand Buffer Down" })
      map("n", "<C-A-k>", require("smart-splits").resize_up, { desc = "Expand Buffer Up" })
      map("n", "<C-A-l>", require("smart-splits").resize_right, { desc = "Expand Buffer Right" })
      -- navigation
      map("n", "<C-h>", require("smart-splits").move_cursor_left, { desc = "Move to Buffer Left" })
      map("n", "<C-j>", require("smart-splits").move_cursor_down, { desc = "Move to Buffer Below" })
      map("n", "<C-k>", require("smart-splits").move_cursor_up, { desc = "Move to Buffer Above" })
      map("n", "<C-l>", require("smart-splits").move_cursor_right, { desc = "Move to Buffer Right" })
      -- swapping buffers between windows
      map("n", "<leader><leader>h", require("smart-splits").swap_buf_left, { desc = "Swap With Buffer Left" })
      map("n", "<leader><leader>j", require("smart-splits").swap_buf_down, { desc = "Swap With Buffer Below" })
      map("n", "<leader><leader>k", require("smart-splits").swap_buf_up, { desc = "Swap With Buffer Above" })
      map("n", "<leader><leader>l", require("smart-splits").swap_buf_right, { desc = "Swap With Buffer Right" })
    end,
  },
}
