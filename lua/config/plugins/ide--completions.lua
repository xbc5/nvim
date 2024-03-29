local M = {}

function M.setup(use)
  use {
    'hrsh7th/nvim-cmp',
    requires = 'onsails/lspkind.nvim',  -- this is setup within nvim-cmp config
    config = require("config.plugins.ide--completions").cmp_config,
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = 'hrsh7th/nvim-cmp',
  }
  use {
    'hrsh7th/cmp-buffer',
    requires = 'hrsh7th/nvim-cmp',
  }
  use {
    'hrsh7th/cmp-path',
    requires = 'hrsh7th/nvim-cmp',
  }
  use {
    'saadparwaiz1/cmp_luasnip',
    requires = {
      {
        "L3MON4D3/LuaSnip",
        config = function()
          local ls = require('luasnip')
          local types = require('luasnip.util.types')

          require('luasnip.loaders.from_lua').load({ paths = '~/.snippets/luasnip/'})

          ls.config.set_config({
            history = true,
            updateevents = 'TextChanged,TextChangedI', -- so function and dynamic nodes will update
            enable_autonsippets = true,
            ext_opts = {
              -- see :h luasnip-ext_marks
              [types.choiceNode] = {
                active = {
                  -- when the node is focused
                  virt_text = {{ "<-- Choice", "DiagnosticVirtualTextInfo" }},
                },
              }
            }
          })

          local function next_choice()
            if ls.choice_active() then ls.change_choice(1) end
          end
          local function prev_choice()
            if ls.choice_active() then ls.change_choice(-1) end
          end

          local opts = { silent = true }
          vim.keymap.set("i", "<M-p>", prev_choice, opts)
          vim.keymap.set("s", "<M-p>", prev_choice, opts)
          vim.keymap.set("i", "<M-n>", next_choice, opts) -- BUG: throws when no active choice
          vim.keymap.set("s", "<M-n>", next_choice, opts)

        end
      },
      'hrsh7th/nvim-cmp',
    },
  }

end

function M.cmp_config()
  local cmp = require('cmp')
  local ls = require('luasnip')
  local nvim = require('lib.nvim')

  local function exitInsert() vim.cmd('stopinsert') end

  cmp.setup({
    snippet = {
      expand = function(args)
        if not ls then return end
        ls.lsp_expand(args.body)
      end,
    },

    mapping = {
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ['<M-Space>'] = cmp.mapping(function()
        if cmp.visible() then
          cmp.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          })
        else
          cmp.complete()
        end
      end, { 'i', 'c', 's' }),

      ['<M-h>'] = cmp.mapping(function(fallback)
        if ls.jumpable(-1) then
          ls.jump(-1)
        elseif nvim.is_mode('i') then
          exitInsert()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<M-l>'] = cmp.mapping(function(fallback)
        if ls.jumpable(1) then
          ls.jump(1)
        elseif nvim.is_mode('i') then
          exitInsert()
        else
          fallback()
        end
      end, { 'i', 's' }),

      ['<M-j>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif nvim.is_mode('i') then
          exitInsert()
        else
          fallback()
        end
      end, { 'i', 's' }), -- map it for input and select modes

      ['<M-k>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif nvim.is_mode('i') then
          exitInsert()
        else
          fallback()
        end
      end, { 'i', 's' }),

    },

    formatting = {
      format = require('lspkind').cmp_format({
        mode = 'symbol_text',
      })
    },

    sources = cmp.config.sources(
      -- order of importance, outer table is to facilitate this
      {
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
      },
      {
        { name = 'path' },
        { name = 'buffer', keyword_length = 5 },
      }
    ),

    completion = {
      completeopt = "menuone,preview,noselect,noinsert"
    }
  })
end

function M.lsp_config()
  -- require'lspconfig'['server'].setup({ capabilities = nvim_cmp.lsp_config() })
  -- in other words: use this value to set the 'capabilities' key in lspconfig.
  return require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end

return M
