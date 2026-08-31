---
title: "Module:Tooltips/icon/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Tooltips/icon/dev"
wiki_timestamp: "2021-09-21T22:15:11Z"
---

*Documentation for this module may be created at [Module:Tooltips/icon/dev/doc](/w/Module:Tooltips/icon/dev/doc?action=edit&redlink=1 "Module:Tooltips/icon/dev/doc (page does not exist)")*

```lua
---	Submodule of [[Module:Tooltips]] responsible for storing details about the tooltip text and icon.
--	The actual tooltip box format is defined in [[Module:Tooltips/tip]]

local p = {}

---	Map that contains the basic information about a database in which a tooltip will be using.
--	@table			p.Modules
--	@field			{string} source /data page link
--	@field			{string} loc name of subtable in the table returned by /data
--	@field[opt]		{string} loc2 name of subtable nested in loc subtable in the table returned by /data
--	@field[opt]		{string} loc3 name of subtable nested in loc2 subtable in the table returned by /data
--	@field			{function} icon function that formats icon image link
--	@field[opt]		{function} color function that returns text color
p.Modules = {
	Ability = {
		source = 'Module:Ability/data', 
		loc = 'Ability',
		icon = function(v, link) return ('[[File:%s|19px|link=%s]]'):format((v or { Icon = 'panel.png' }).Icon, link) end,
	},
	Mods = {
		source = 'Module:Mods/data',
		loc = 'Mods',
		icon = function(v, link) return '[[File:Mod_TT_20px.png|12px|link='..link..']]' end,},
	Warframes = {
		source = 'Module:Warframes/data',
		loc = 'Warframes',
		icon = function(v, link) return ('[[File:%s|19px|link=%s]]'):format(v.Portrait, link) end,
	},
	Void = {
		source = 'Module:Void/data', 
		loc = 'RelicData',
		icon = function(v, link)
			local relicImageMap = { Lith = 'Iron', Meso = 'Bronze', Neo = 'Silver', Axi = 'Gold' }
			return ('[[File:VoidRelic%sIcon64.png|x19px|link=%s]]'):format(relicImageMap[v.Tier], link)
		end,
	},
	Weapons = {
		source = 'Module:Weapons/data',
		loc = 'Weapons',
		icon = function(v, link) return ('[[File:%s|x19px|link=%s]]'):format(v.Image, link) end,
	},
	DamageTypes = {
		source = 'Module:DamageTypes/data',
		loc = 'Types',
		loc2 = 'Health',
		icon = function(v, link) return v.Icon and ('[[File:%s|18px|link=%s]]'):format(v.Icon or 'spacer.png', link) end,
		color = function(v) return (function(s) return s ~= '' and s or nil end)(v.Color) end,
	},
	Arcane = {
		source = 'Module:Arcane/data',
		loc = 'Arcanes',
		icon = function(v, link) return ('[[File:%s|23px|link=%s]]'):format(v.Icon, link) end,
	},
	Resources = {
		source = 'Module:Resources/data/dev',
		loc = 'Resources',
		icon = function(v, link) return ('[[File:%s|30px|link=%s]]'):format(v.Image, link) end,
	},
}

---	Finds the value of a key in a nested table.
--	@function		p._find
--	@param			{table} t Table to be searched through
--	@param			{table, string} keys Array of keys that is in the order in which they are accessed in table; 
--									if keys is a string, it will automatically be converted into a table
--	@return			{any} Value of key that is the last element in keys argument
function p._find(t, keys)
	local temp = t
	keys = (type(keys) == 'string') and { keys } or keys
	for _, v in ipairs(keys) do t = t[v] end
	return t or error('p._find(): Failed to find keys in'..mw.dumpObject(keys)..'in source table'..mw.dumpObject(temp))
end

for name, module in pairs(p.Modules) do
	-- Only loops through the modules
	p[name] = function(index) -- p.Mods(), etc is only called later
		-- For each set of location instructions
		for _, locale in ipairs({ module.loc, module.loc2, module.loc3 }) do
			-- Find data in that location
			local data = p._find(mw.loadData(module.source), locale)
			local v = data[index]

			if not v then
				for k, vv in pairs(data) do
					if index == k:gsub(' ?%(.+%)','') then
						v = vv
						break
					end
				end
			end

			if v then
				return {
					name, -- Source module
					k ~= index and k or nil, -- Key in data table
					v['Link'], -- Link destination (page location)
					icon = module.icon and module.icon(v, v['Link'] or index, k), -- Icon in wikitext
					color = module.color and module.color(v, k), -- Hex color
				}
			end
		end
	end
end

---	Returns a formatted version of the table as seen in a source module's /data subpage
--	@function		p.table
--	@param			{string} name Name of source module (e.g. "Warframes")
--	@return			{table} Formatted table of source module's /data table
function p.table(name)
	local icon = p
	local modules = icon.Modules
	local find = icon._find

	local index = {}

	local module = modules[name]
	for i, locale in ipairs({ module.loc, module.loc2, module.loc3 }) do
		-- Find and iterate through names of objects
		for k, v in pairs(find(mw.loadData(module.source), locale)) do
			-- Removing parentheses in key name
			local formattedKey = k:gsub(' ?%(.+%)', '')
			index[formattedKey] = index[formattedKey] or {}
			table.insert(index[formattedKey], icon[name](k))
			if (not index[k] and formattedKey ~= k) then
				index[k] = index[formattedKey]
			end
		end
	end
	
	return index
end

return p
```

