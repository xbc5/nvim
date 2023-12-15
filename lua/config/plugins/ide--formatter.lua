--[[
Each formatter should return a table that consiste of:
  exe: the program you wish to run
  args: a table of args to pass
  stdin: If it should use stdin or not.
  cwd : The path to run the program from.
  tempfile_dir: directory for temp file when not using stdin (optional)
  tempfile_prefix: prefix for temp file when not using stdin (optional)
  tempfile_postfix: postfix for temp file when not using stdin (optional)
]]--

--[[
TODO: if local config isn't found, don't load formatter
you don't want to auto-format a code-base that isn't yours.
--]]
local M = {}

function M.setup(use)
  use {
    'mhartington/formatter.nvim',
    config = function()
      vim.api.nvim_exec([[
        augroup FormatAutogroup
        autocmd!
        autocmd BufWritePost *.js,*.ts,*.jsx,*.tsx,*.html,*.scss,*.css,*.md,*.less,*.json,*.yml,*.yaml FormatWrite
        augroup END
      ]], true)

      local config = {
        logging = false,
        filetype = {}
      }

      -- WARN: don't forget to update autocommand when adding new formatters.
      local forPrettier = {"html", "javascript", "typescript", "yaml",
                           "scss", "markdown", "less", "css", "json",
                           "javascriptreact", "typescriptreact"}
      for _, t in pairs(forPrettier) do
        config.filetype[t] = {
          function()
            return {
              exe = "./node_modules/.bin/prettierd",
              args = {vim.api.nvim_buf_get_name(0)},
              stdin = true
            }
          end
        }
      end

      -- disable: ray-x/go does this
      --[[ config.filetype["go"] = {
        function()
          return {
            exe = "gofmt",
            stdin = true
          }
        end
      } ]]

      require('formatter').setup(config)

    end
  }
end

return M
