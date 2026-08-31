---	For outputting different types of tooltips for debugging purposes.
--	Archived module as of 2022-02-02
--	

local Icon = require [[Module:Tooltips/icon]]
local ModuleTable = Icon.Modules
local find = Icon._find

local index = {}

for moduleName, module in pairs(ModuleTable) do 
	for i, locale in ipairs { module.loc, module.loc2, module.loc3 } do
		-- find and iterate through names of objects
		-- TODO: Fix this loop for horizontally partitioned data (M:Weapons/data)
		-- and other errors "Lua error at line 19: attempt to call a table value."
		for k, v in pairs(find(require(module.source), locale)) do
			
			local kk = k:gsub(' ?%(.+%)', '')-- qwe (asd)
			index[kk] = index[kk] or {}

			table.insert(index[kk], 
				Icon[moduleName](k)
				{
					moduleName,-- Source module
					k ~= kk and k or nil,-- Key in data table
					v[module.link],-- Link destination (page location)
					icon = module.icon and module.icon(v, v[module.link] or kk, k),-- Icon in wikitext
					color = module.color and module.color(v, k),
			}) -- add entry to table of 'what is this thing?'  
		end
	end
end

do
	local priority = {
		'Warframes',
		'Ability',
		'Mods',
		'Weapons',
		'Arcane',
		'DamageTypes',
		'Void',
		'Resources',
	}
	for i, v in ipairs(priority) do priority[i] = nil priority[v] = i end
	for k, v in pairs(index) do 
		table.sort(v, function(a, b)
			return priority[a[1]] < priority[b[1]] or (priority[a[1]] == priority[b[1]] and #a < #b)
		end)
	end
end-- ^ sorts by priority then complexity

return index
