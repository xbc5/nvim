local M = {}
-- Define the character set
local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

-- Generate a random string
function M.rand_str(length, prefix)
  math.randomseed(os.time())

  local result = prefix or ""

  for _ = 1, length do
    local index = math.random(1, #characters)
    result = result .. characters:sub(index, index)
  end

  return result
end

-- Insert a string at the cursor position.
function M.insert(str)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { str })
  local new_pos = col + #str
  vim.api.nvim_win_set_cursor(0, { row, new_pos }) -- move to the end of the word
end

-- e.g. #TOu38I. Use this to tag tests.
function M.insert_tag(length)
  M.insert(M.rand_str(length or 6, "#"))
end

return M
