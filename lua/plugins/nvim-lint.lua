return {
  -- set this to make them work:
  --   opts = { linters: { ... } }
  {
    "mfussenegger/nvim-lint",
    config = function()
      vim.api.nvim_exec(
        [[augroup NvimLint
          autocmd!
          autocmd BufWritePost <buffer> lua require('lint').try_lint()
          augroup END]],
        true
      )
    end,
  },
}
