return {
  {
    "zakharykaplan/nvim-retrail",
    event = { "BufEnter" },
    config = function()
      require("retrail").setup({
        filetype = {
          strict = true, -- true: enabled for included; false: disable on excluded
          include = {
            -- don't enable js, ts -- they have formatters
            "rust",
            "python",
            "html",
            "dockerfile",
            "lua",
            "vim",
            "sh",
            "go",
          },
        },
        trim = { blanklines = true },
      })
    end,
  },
}
