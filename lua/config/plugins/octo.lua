local M = {}

function M.setup(use)
  use {
    'pwntester/octo.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'kyazdani42/nvim-web-devicons',
    },
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { silent = true, noremap = true }

      -- these are to initiate Octo outside of an Octo buffer
      map('n', '<leader>oil', '<CMD>Octo issue list<CR>', opts)
      map('n', '<leader>opl', '<CMD>Octo pr list<CR>', opts)
      map('n', '<leader>opc', '<CMD>Octo pr create<CR>', opts)
      map('n', '<leader>opr', '<CMD>Octo pr checks<CR>', opts)
      map('n', '<leader>os', '<CMD>Octo search<CR>', opts)

      require"octo".setup({
        file_panel = {
          size = 10,                             -- changed files panel rows
        },
        mappings = {
          issue = {
            close_issue = { lhs = "<leader>ic", desc = "close issue" },
            reopen_issue = { lhs = "<leader>io", desc = "reopen issue" },
            list_issues = { lhs = "<leader>il", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload issue" },
            open_in_browser = { lhs = "<C-b>", desc = "open issue in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            add_assignee = { lhs = "<leader>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>ad", desc = "remove assignee" },
            create_label = { lhs = "<leader>lc", desc = "create label" },
            add_label = { lhs = "<leader>la", desc = "add label" },
            remove_label = { lhs = "<leader>ld", desc = "remove label" },
            goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>ca", desc = "add comment" },
            delete_comment = { lhs = "<leader>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
          },
          pull_request = {
            checkout_pr = { lhs = "<leader>po", desc = "checkout PR" },
            merge_pr = { lhs = "<leader>pm", desc = "merge commit PR" },
            squash_and_merge_pr = { lhs = "<leader>psm", desc = "squash and merge PR" },
            list_commits = { lhs = "<leader>pc", desc = "list PR commits" },
            list_changed_files = { lhs = "<leader>pf", desc = "list PR changed files" },
            show_pr_diff = { lhs = "<leader>pd", desc = "show PR diff" },
            add_reviewer = { lhs = "<leader>va", desc = "add reviewer" },
            remove_reviewer = { lhs = "<leader>vd", desc = "remove reviewer request" },
            close_issue = { lhs = "<leader>ic", desc = "close PR" },
            reopen_issue = { lhs = "<leader>io", desc = "reopen PR" },
            list_issues = { lhs = "<leader>il", desc = "list open issues on same repo" },
            reload = { lhs = "<C-r>", desc = "reload PR" },
            open_in_browser = { lhs = "<C-b>", desc = "open PR in browser" },
            copy_url = { lhs = "<C-y>", desc = "copy url to system clipboard" },
            goto_file = { lhs = "gf", desc = "go to file" },
            add_assignee = { lhs = "<leader>aa", desc = "add assignee" },
            remove_assignee = { lhs = "<leader>ad", desc = "remove assignee" },
            create_label = { lhs = "<leader>lc", desc = "create label" },
            add_label = { lhs = "<leader>la", desc = "add label" },
            remove_label = { lhs = "<leader>ld", desc = "remove label" },
            goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>ca", desc = "add comment" },
            delete_comment = { lhs = "<leader>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
          },
          review_thread = {
            goto_issue = { lhs = "<leader>gi", desc = "navigate to a local repo issue" },
            add_comment = { lhs = "<leader>ca", desc = "add comment" },
            add_suggestion = { lhs = "<leader>sa", desc = "add suggestion" },
            delete_comment = { lhs = "<leader>cd", desc = "delete comment" },
            next_comment = { lhs = "]c", desc = "go to next comment" },
            prev_comment = { lhs = "[c", desc = "go to previous comment" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            react_hooray = { lhs = "<leader>rp", desc = "add/remove 🎉 reaction" },
            react_heart = { lhs = "<leader>rh", desc = "add/remove ❤️ reaction" },
            react_eyes = { lhs = "<leader>re", desc = "add/remove 👀 reaction" },
            react_thumbs_up = { lhs = "<leader>r+", desc = "add/remove 👍 reaction" },
            react_thumbs_down = { lhs = "<leader>r-", desc = "add/remove 👎 reaction" },
            react_rocket = { lhs = "<leader>rr", desc = "add/remove 🚀 reaction" },
            react_laugh = { lhs = "<leader>rl", desc = "add/remove 😄 reaction" },
            react_confused = { lhs = "<leader>rc", desc = "add/remove 😕 reaction" },
          },
          submit_win = {
            approve_review = { lhs = "<C-a>", desc = "approve review" },
            comment_review = { lhs = "<C-m>", desc = "comment review" },
            request_changes = { lhs = "<C-r>", desc = "request changes review" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
          },
          review_diff = {
            add_review_comment = { lhs = "<leader>ca", desc = "add a new review comment" },
            add_review_suggestion = { lhs = "<leader>sa", desc = "add a new review suggestion" },
            focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
            next_thread = { lhs = "]t", desc = "move to next thread" },
            prev_thread = { lhs = "[t", desc = "move to previous thread" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader><leader>", desc = "toggle viewer viewed state" },
          },
          file_panel = {
            next_entry = { lhs = "j", desc = "move to next changed file" },
            prev_entry = { lhs = "k", desc = "move to previous changed file" },
            select_entry = { lhs = "<cr>", desc = "show selected changed file diffs" },
            refresh_files = { lhs = "R", desc = "refresh changed files panel" },
            focus_files = { lhs = "<leader>e", desc = "move focus to changed file panel" },
            toggle_files = { lhs = "<leader>b", desc = "hide/show changed files panel" },
            select_next_entry = { lhs = "]q", desc = "move to previous changed file" },
            select_prev_entry = { lhs = "[q", desc = "move to next changed file" },
            close_review_tab = { lhs = "<C-c>", desc = "close review tab" },
            toggle_viewed = { lhs = "<leader>tv", desc = "toggle viewer viewed state" },
          }
        }
      })
    end
  }
end

return M