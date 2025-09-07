return {
  {
    "tmillr/sos.nvim", -- auto-save on a timer
    event = "BufEnter",
    config = function()
      require("sos").setup({
        hooks = {
          buf_autosave_pre = function(bufnr, bufname)
            -- Autosave will auto-accept diffs in the Claude Code plugin, so
            -- we need to fix that. The following solution was provided by:
            --   https://github.com/coder/claudecode.nvim/issues/71#issuecomment-3044077955

            -- Exclude claudecode diff buffers by buffer name patterns
            if
              bufname:match("%(proposed%)")
              or bufname:match("%(NEW FILE %- proposed%)")
              or bufname:match("%(New%)")
            then
              return false
            end

            -- Exclude by buffer variables (claudecode sets these)
            if
              vim.b[bufnr].claudecode_diff_tab_name
              or vim.b[bufnr].claudecode_diff_new_win
              or vim.b[bufnr].claudecode_diff_target_win
            then
              return false
            end

            -- Exclude by buffer type (claudecode diff buffers use "acwrite")
            local buftype = vim.fn.getbufvar(bufnr, "&buftype")
            if buftype == "acwrite" then
              return false
            end

            return true -- Safe to auto-save
          end,
        },
      })
    end,
  },
}
