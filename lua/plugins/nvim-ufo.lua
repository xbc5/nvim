return {
-- NOTE: UFO sets `foldmethod=manual`
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
      {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    },
    config = function()
      vim.o.foldcolumn = '1'
      vim.o.foldlevel = 99 -- UFO insists that this is necessary -- don't change!
      vim.o.foldlevelstart = 99 -- folds will auto-close if this is set to 0, use autocmd instead
      vim.o.foldenable = true

      -- you need to remap these
      vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          return {'treesitter', 'indent'}
        end
      })
    end
  }
}
