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
      b = {
        name = "buffer",
        f = "find",
        r = "references",
        s = "symbols",
      },
      d = { name = "diagnostics" },
      g = {
        name = "git",
        c = "commits",
        s = "status",
      },
      h = { name = "help" },
      k = { name = "keymaps" },
      m = { name = "buffers" },
      n = { name = "notifications" },
      p = { name = "projects" },
      t = { name = "TODOs" },
      w = {
        name = "workspace",
        g = "grep",
        r = "references",
        s = "symbols",
      },
    },
    ["<leader>b"] = {
      name = "buffer",
      k = "kill",
      d = "delete",
      o = "only",
    },
    ["<leader>e"] = {
      name = "DAP",
      b = "toggle breakpoint",
      B = "clear breakpoints",
      c = "run to cursor",
      D = "disconnect",
      e = "evaluate expression",
      l = "run last",
      p = "pause",
      r = "REPL [toggle]",
      s = "variables (scopes)",
      t = "test [ctx]",
      S = "stacks",
      v = "view breakpoints",
      w = "watches",
      x = "close",
    },
    ["<leader>g"] = {
      name = "git",
      g = "lazy git",
      n = "notifications (GitHub)",
      -- Git signs
      s = "stage hunk",
      u = "undo stage hunk",
      r = "reset hunk",
      p = "preview hunk",
      S = "stage buffer",
      R = "reset buffer",
      d = "diff buffer",
      b = "blame line",
      B = "toggle blame line (virtual text)",
      D = "toggle deleted",
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
