-- <code>options.process</code> metatable removal.
local account = { 'peter', 'GlaHquq0' }
local account_mt = { __tostring = inspect }
setmetatable(account, account_mt)

local remove_mt = function(item) -- removes specific metatable
    if item ~= account_mt then return item end
end

assert(inspect(t, {process = remove_mt}) == "{ 'peter', 'GlaHquq0' }")

local remove_all_metatables = function(item, path)
    if path[#path] ~= inspect.METATABLE then return item end
end

assert(inspect(t, {process = remove_all_metatables}) == "{ 'peter', 'GlaHquq0' }")
