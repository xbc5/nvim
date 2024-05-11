local map = require("lib.nvim").map

return {
  {
    "famiu/bufdelete.nvim",
    config = function()
      map("n", "<leader>bd", ":Bdelete<CR>")
      map("n", "<leader>bk", ":bd<CR>")
    end,
  },
}
