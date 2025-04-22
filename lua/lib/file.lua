local M = {}

-- Read the lines from a file path.
-- @param filepath The full path to the file to open.
-- @param trim A boolean; should it trim lines--and also exclude empty lines?
-- @return table Empty when file not found, or there's no contents; otherwise a list of lines.
function M.read_lines(filepath, trim)
  local extracted_lines = {}

  local file = io.open(filepath, "r")
  if not file then
    vim.notify("File not found: " .. filepath, vim.log.levels.ERROR)
    return {}
  end

  local lines = file:lines()

  if trim then
    for line in lines do
      local trimmed = vim.trim(line)
      if trimmed then
        table.insert(extracted_lines, trimmed)
      end
    end
  else
    for line in lines do
      table.insert(extracted_lines, line)
    end
    return extracted_lines
  end

  file:close()
  return extracted_lines
end

return M
