return {
  { "ahmedkhalf/project.nvim", enabled = false }, -- use the official one instead: nvim-telescope/telescope-project.nvim
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = {
      { "nvim-telescope/telescope-project.nvim", event = "Telescope" },
      { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
      { "nvim-telescope/telescope-ui-select.nvim", event = "VeryLazy" },
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
          base_dirs = { "~/projects", "~/git" },
          hidden_files = true,
        },
      },
    },
    keys = {
      { "<leader>m", "<cmd>Telescope buffers<cr>" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>" },
      { "<leader>fp", "<cmd>Telescope project<cr>" },
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

      telescope.builtin.find_files({
        find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
      })
    end,
  },
}
