return {
  "rcarriga/nvim-notify",
  enabled = false,
  require = "nvim-telescope/telescope.nvim",
  config = function()
    local notify = require("notify")
    notify.setup()
    vim.notify = notify

    require("telescope").load_extension("notify")
    local opts = { silent = true, noremap = true }
    vim.keymap.set("n", "<leader>fn", ":Telescope notify<CR>", opts)
    vim.keymap.set("n", "<leader>vn", ":Notifications<CR>", opts)
  end,
}
