local map = require("lib.nvim").map

return {
  {
    "j-hui/fidget.nvim",
    lazy = false, -- We need this to run at startup.
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
