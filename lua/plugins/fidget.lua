return {
  {
    "j-hui/fidget.nvim",
    config = function()
      local f = require("fidget")
      if f then
        f.setup {
          notification = {
            override_vim_notify = true, -- enables it
          }
        }

        vim.api.nvim_set_keymap(
          "n", "<leader>vn", '<cmd>Fidget history<cr>', { noremap = true }
        )
      end
    end
  }
}
