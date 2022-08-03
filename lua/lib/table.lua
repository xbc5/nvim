local M = {}

-- Pass a list initially, then check for a value's existence. DON'T pass in a k/v table,
--  because all values are reset.
-- @example has({"one", "two"})("one") => true
function M.has(t)
  local new = {}
  for _, i in ipairs(t) do
    new[i] = true
  end
  return function(value) return new[value] or false end
end

-- merge two tables (dictionaries; not lists) 
function M.merge(t1, t2)
  local result = {} -- work on a copy

  for k,v in pairs(t1) do
    result[k] = v
  end

  for k,v in pairs(t2) do
    result[k] = v
  end

  return result
end

-- concatenate one list to another
function M.concat(t1, t2)
  local result = {} -- work on a copy

  for i, v in ipairs(t1) do
    result[i] = v
  end

  local len = #result -- we will mutate result
  for i, v in ipairs(t2) do
    result[len+i] = v
  end

  return result
end

return M
