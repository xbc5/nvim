return {
  {
    'kevinhwang91/rnvimr',
    config = function()
      local map = vim.api.nvim_set_keymap
      local g = vim.api.nvim_set_var

      g('rnvimr_enable_ex', 1) -- replace buitin FM (Netrw)
      g('rnvimr_enable_bw', 1) -- delete buffer when file is deleted

      -- border
      g('rnvimr_draw_border', 1)
      g('rnvimr_ranger_cmd', { 'ranger', '--cmd=set draw_borders both' }) -- inner borders

      -- keys
      local opts = { silent = true, noremap = true }
      map('n', '<A-o>', '<Cmd>RnvimrToggle<CR>', opts)
      map('t', '<A-o>', '<Cmd>RnvimrToggle<CR>', opts)

      vim.cmd [[
      let g:rnvimr_layout = {
        \ 'relative': 'editor',
        \ 'width': float2nr(round(0.96 * &columns)),
        \ 'height': float2nr(round(0.96 * &lines)),
        \ 'col': float2nr(round(0.02 * &columns)),
        \ 'row': float2nr(round(0.02 * &lines)),
        \ 'style': 'minimal'
        \ }
        ]]
    end
  }
}
