local map = require("lib.nvim").map

return {
  {
    "famiu/bufdelete.nvim",
    event = { "BufEnter" },
    config = function()
      map("n", "<leader>bd", ":Bdelete<CR>", { desc = "Blank Buffer" })
      map("n", "<leader>bk", ":bd<CR>", { desc = "Kill Buffer" })
    end,
  },
}
