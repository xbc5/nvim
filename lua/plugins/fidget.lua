local map = require("lib.nvim").map

return {
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        notification = {
          override_vim_notify = true, -- enables it
        },
      })

      map("n", "<leader>vn", "<cmd>Fidget history<cr>", { desc = "Notification Viewer" })
    end,
  },
}
