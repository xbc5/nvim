local M = {}

function M.setup(use)
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  }

  require("which-key").register({
    ["<leader>f"] = {
      name = "fuzzy",
      b = { name = "buffer" },
      g = { name = "git" },
      h = { name = "help" },
      w = { name = "workspace" },
      t = { name = "TODOs" },
    },
    ["<leader>b"] = {
      name = "buffer",
      k = "kill",
    },
    ["<leader>e"] = {
      name = "DAP",
      b = "toggle breakpoint",
      B = "clear breakpoints",
      c = "run to cursor",
      d = "disconnect",
      e = "disconnect",
      l = "run last",
      p = "pause",
      r = "REPL toggle",
      x = "close",
    },
    ["<leader>d"] = { name = "[dap] down" },
    ["<leader>g"] = {
      name = "git",
      g = "lazy git",
    },
    ["<leader>J"] = { name = "[dap] continue" },
    ["<leader>j"] = { name = "[dap] step over" },
    ["<leader>K"] = { name = "[dap] reverse continue" },
    ["<leader>l"] = { name = "[dap] step into" },
    ["<leader>o"] = {
      name = "Octo",
      i = "issue",
      p = "pr",
      s = "search (global issues)"
    },
    ["<leader>h"] = { name = "[dap] step out" },
    ["<leader>u"] = { name = "[dap] up" },
    ["<leader>k"] = { name = "[dap] step back" },
    ["<leader>m"] = { name = "buffers" },
    ["<leader>n"] = { name = "find files" },
    ["<leader>p"] = { name = "Packer" },
    ["<leader>s"] = { name = "set opt" },
  })
end

return M
