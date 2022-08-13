local M = {}

function M.setup(use)
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  }

  local ts = {
    a = "arg",
    b = "block (code)",
    c = "class",
    C = "comment",
    f = "function",
    l = "loop",
  }

  local ts_move = {
    f = "function start",
    F = "function end",
    x = "class start",
    X = "class end",
  }

  require("which-key").register({
    ["d"] = {
      a = ts,
      i = ts,
    },
    ["v"] = {
      a = ts,
      i = ts,
    },
    ["y"] = {
      a = ts,
      i = ts,
    },
    ["]"] = ts_move,
    ["["] = ts_move,
    ["<leader>f"] = {
      name = "fuzzy",
      b = { name = "buffer" },
      g = { name = "git" },
      h = { name = "help" },
      t = { name = "TODOs" },
      w = { name = "workspace" },
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
    ["<leader>g"] = {
      name = "git",
      g = "lazy git",
      n = "notifications (GitHub)",
    },
    ["<leader>l"] = { name = "LSP" },
    ["<leader>o"] = {
      name = "Octo",
      i = "issue",
      p = "pr",
      s = "search (global issues)"
    },
    ["<leader>r"] = { name = "run" },
    ["<leader>m"] = { name = "buffers" },
    ["<leader>n"] = { name = "find files" },
    ["<leader>p"] = { name = "Packer" },
    ["<leader>s"] = { name = "set opt" },
    ["<leader>v"] = {
      name = "view",
      n = "notifications",
    },
    z = {
      name = "fold",
      i = { name = "foldenable toggle" }
    }
  })
end

return M
