local map = require("lib.nvim").map

return {
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      { "nvim-treesitter/nvim-treesitter", opt = { ensure_installed = { "html" } } },
    },
    init = function()
      -- manage
      map("n", "<leader>ef", "<CMD>DevdocsFetch<CR>", { desc = "Fetch Metadata" })
      map("n", "<leader>ei", "<CMD>DevdocsInstall<CR>", { desc = "Install a Doc" })
      map("n", "<leader>eu", "<CMD>DevdocsUpdate<CR>", { desc = "Update Doc" })
      map("n", "<leader>eU", "<CMD>DevdocsUpdateAll<CR>", { desc = "Update ALL Docs" })
      map("n", "<leader>ex", "<CMD>DevdocsUninstall<CR>", { desc = "Uninstall a Doc" })

      -- view: buffer
      map("n", "<leader>eb", "<CMD>DevdocsOpenCurrent<CR>", { desc = "Open filetype in Buffer" })
      map("n", "<leader>eB", "<CMD>DevdocsOpen<CR>", { desc = "Open Any in Buffer" })
      -- view: float
      map("n", "<leader>eo", "<CMD>DevdocsOpenCurrentFloat<CR>", { desc = "Open filetype in Float" })
      map("n", "<leader>eO", "<CMD>DevdocsOpenFloat<CR>", { desc = "Open Any in Float" })

      map({ "n", "i" }, "<M-d>", "<CMD>DevdocsToggle<CR>", { desc = "Toggle Devdocs Floating Window" })
    end,
    opts = {
      -- WARN: you MUST provide at least an emtpy table,
      -- otherwise the plugin will fail to load
      float_win = { -- passed to nvim_open_win(), see :h api-floatwin
        relative = "editor",
        height = 50,
        width = 200,
      },
    },
    cmd = {
      "DevdocsFetch",
      "DevdocsInstall",
      "DevdocsUninstall",
      "DevdocsOpen",
      "DevdocsOpenFloat",
      "DevdocsOpenCurrent",
      "DevdocsOpenCurrentFloat",
      "DevdocsToggle",
      "DevdocsUpdate",
      "DevdocsUpdateAll",
    },
  },
}
