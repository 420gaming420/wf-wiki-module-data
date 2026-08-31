-- <code>options.process</code> item filtering.
local anonymize_password = function(item, path)
  if path[#path] == 2 then return item:gsub('.', '●') end
  return item
end

assert(inspect(info, {process = anonymize_password}) == "{ 'peter', '●●●●●●●●' }" )
