local map = require("lib.nvim").map

return {
  { "ahmedkhalf/project.nvim", enabled = false }, -- use official one instead: nvim-telescope/telescope-project.nvim
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-telescope/telescope-project.nvim" },
      { "nvim-telescope/telescope-ui-select.nvim" },
    },
    opt = {
      defaults = {
        layout_config = {
          horizontal = {
            mirror = false,
          },
          vertical = {
            mirror = false,
          },
        },
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case", -- smart_case|ignore_case|respect_case
        },
        project = {
          base_dirs = { "~/projects" },
          hidden_files = true,
        },
      },
    },
    keys = {
      { "<leader>m", "<cmd>Telescope buffers<cr>" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
      -- often used
      { "<leader>fh", "<cmd>Telescope help_tags<cr>" },
      { "<leader>fk", "<cmd>Telescope keymaps<cr>" },
      -- git
      { "<leader>fgc", "<cmd>Telescope git_commits<cr>" },
      { "<leader>fgs", "<cmd>Telescope git_status<cr>" },
      -- buffer
      { "<leader>fbf", "<cmd>Telescope current_buffer_fuzzy_find<cr>" },
      { "<leader>fbr", "<cmd>Telescope lsp_references<cr>" },
      { "<leader>fbs", "<cmd>Telescope lsp_document_symbols<cr>" },
      -- workspace
      { "<leader>fwg", "<cmd>Telescope live_grep<cr>" },
      { "<leader>fwr", "<cmd>Telescope lsp_references<cr>" },
      { "<leader>fws", "<cmd>Telescope lsp_workspace_symbols<cr>" },
    },
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
      telescope.load_extension("project")

      map(
        "n",
        "<leader>fp",
        ":lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>",
        { desc = "Project Picker" }
      )

      vim.keymap.set("n", "<leader>n", function()
        require("telescope.builtin").find_files({ hidden = true })
      end, { noremap = true })
    end,
  },
}
