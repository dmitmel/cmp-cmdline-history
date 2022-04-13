local source = {}

function source.new()
  return setmetatable({}, { __index = source })
end

function source:get_keyword_pattern()
  return '.*'
end

function source:complete(request, callback)
  local hist_type = request.option.history_type or vim.fn.getcmdtype()
  local seen_items = {}
  local items = {}
  for i = 1, vim.fn.histnr(hist_type) do
    local item = vim.fn.histget(hist_type, -i)
    if #item > 0 and not seen_items[item] then
      seen_items[item] = true
      items[#items + 1] = { label = item, dup = 0 }
    end
  end
  callback({ items = items })
end

return source
