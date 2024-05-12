return {
  "rcarriga/nvim-notify",
  enabled = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  opts = {
    stages = "static",
  },
  keys = {
    { "<leader>fn", ":Telescope notify<CR>", { desc = "Fuzzy Notifications" } },
    { "<leader>vn", ":Notifications<CR>" },
  },
  config = function()
    require("telescope").load_extension("notify")
  end,
}
