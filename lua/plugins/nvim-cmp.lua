local function cmp_config()
  local cmp = require("cmp")
  local ls = require("luasnip")
  local nvim = require("lib.nvim")
  local neogen = nvim.try_require("neogen")

  local function exitInsert()
    vim.cmd("stopinsert")
  end

  cmp.setup({
    snippet = {
      expand = function(args)
        if not ls then
          return
        end
        ls.lsp_expand(args.body)
      end,
    },

    mapping = {
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ["<C-e>"] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),

      ["<M-Space>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          })
        else
          cmp.complete()
        end
      end, { "i", "c", "s" }),

      ["<M-h>"] = cmp.mapping(function(fallback)
        if neogen and neogen.jumpable() then
          neogen.jump_prev()
        elseif ls.jumpable(-1) then
          ls.jump(-1)
        elseif nvim.is_mode("i") then
          exitInsert()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<M-l>"] = cmp.mapping(function(fallback)
        if neogen and neogen.jumpable() then
          neogen.jump_next()
        elseif ls.jumpable(1) then
          ls.jump(1)
        elseif nvim.is_mode("i") then
          exitInsert()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<M-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif nvim.is_mode("i") then
          exitInsert()
        else
          fallback()
        end
      end, { "i", "s" }), -- map it for input and select modes

      ["<M-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif nvim.is_mode("i") then
          exitInsert()
        else
          fallback()
        end
      end, { "i", "s" }),
    },

    sources = cmp.config.sources(
      -- order of importance, outer table is to facilitate this
      {
        { name = "nvim_lsp_signature_help" },
        { name = "codeium" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
      },
      {
        { name = "path" },
        { name = "buffer", keyword_length = 5 },
      }
    ),

    completion = {
      completeopt = "menuone,preview,noselect,noinsert",
    },
  })
end

return {
  {
    "saadparwaiz1/cmp_luasnip",
    event = "BufEnter",
    dependencies = {
      {
        "hrsh7th/nvim-cmp",
        event = "BufEnter",
        config = cmp_config,
      },
      {
        "L3MON4D3/LuaSnip",
        event = "BufEnter",
        config = function()
          local ls = require("luasnip")
          local types = require("luasnip.util.types")

          require("luasnip.loaders.from_lua").load({ paths = "~/.snippets/luasnip/" })

          ls.config.set_config({
            history = true,
            updateevents = "TextChanged,TextChangedI", -- so function and dynamic nodes will update
            enable_autonsippets = true,
            ext_opts = {
              -- see :h luasnip-ext_marks
              [types.choiceNode] = {
                active = {
                  -- when the node is focused
                  virt_text = { { "<-- Choice", "DiagnosticVirtualTextInfo" } },
                },
              },
            },
          })

          local function next_choice()
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end
          local function prev_choice()
            if ls.choice_active() then
              ls.change_choice(-1)
            end
          end

          local opts = { silent = true }
          vim.keymap.set("i", "<M-p>", prev_choice, opts)
          vim.keymap.set("s", "<M-p>", prev_choice, opts)
          vim.keymap.set("i", "<M-n>", next_choice, opts) -- BUG: throws when no active choice
          vim.keymap.set("s", "<M-n>", next_choice, opts)
        end,
      },
    },
  },
}
