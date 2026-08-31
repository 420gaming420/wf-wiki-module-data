---	Submodule of [[Module:Tooltips]] responsible for storing details about the tooltip text and icon.
--	The actual tooltip box format is defined in [[Module:Tooltips/tip]].
--	
--	@module		tooltips/icon
--	@alias		p
--	@author		[[User:Gigamicro|gigamicro]]
--	@attribution
--	@image		TooltipPic.PNG
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Void/data]]
--	@require	[[Module:Icon/data]]
--	@require	[[Module:DamageTypes/data]]
--	@require	[[Module:Arcane/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Companions/data]]
--	@require	[[Module:Focus/data]]
--	@require	[[Module:Sigils/data]]
--	@require	[[Module:Enemies/data]]
--	@require	[[Module:Decrees/data]]
--	@require	[[Module:Keys/data]]
--	@release	stable
--	

local p = {}

---	Map that contains the basic information about a database in which a tooltip will be using.
--	When adding new tooltips, update this map.
--	@table			p.Modules
--	@field			{string} source /data page link
--	@field			{string, table} loc name(s) of subtable in the table returned by /data; nonexistant keys default to parent table; "location"
--	@field			{function} icon function that formats icon image link
--	@field[opt]		{function} color function that returns text color
p.Modules = {
	Ability = {--not plural
		source = 'Module:Ability/data', 
		loc = { 'Ability', 'Archived'},
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage light-invert]]'):format((v or { Icon = 'Panel.png' }).Icon, link) end,
	},
	Mods = {
		source = 'Module:Mods/data',
		loc = { 'Mods', 'Sets', 'DefaultUpgrades' },
		-- icon = function(v, link) return '[[File:Mod TT 20px.png|12px|link='..link..'|class=icon notpageimage]]' end,
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	Warframes = {
		source = 'Module:Warframes/data',
		loc = { 'Warframes', 'Archwings', 'Necramechs' },
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Portrait, link) end,
	},
	Companions = {
		source = 'Module:Companions/data',
		loc = 'Companions',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	Void = {--not plural
		source = 'Module:Void/data', 
		loc = 'RelicData',
		icon = function(v)
			local relicImageMap = {
				Lith = 'LithRelicIntact.png',
				Meso = 'MesoRelicIntact.png',
				Neo = 'NeoRelicIntact.png',
				Axi = 'AxiRelicIntact.png',
				Requiem = 'RequiemRelicIntact.png',
				Vanguard = 'AxiRelicIntact.png'
			}
			return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(relicImageMap[v.Tier], v.Name)
		end,
	},
	Weapons = {
		source = 'Module:Weapons/data',
		loc = '',
		require=true,
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	DamageTypes = {
		source = 'Module:DamageTypes/data',
		loc = {'Types', 'Health', 'Procs'},
		icon = function(v, link) return v.Icon and ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Icon or 'Spacer.png', link) end,
		color = function(v) return (function(s) return s ~= '' and s or nil end)(v.CSSTextColorClass) end,
	},
	Arcane = {--not plural
		source = 'Module:Arcane/data',
		loc = 'Arcanes',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	Resources = {
		source = 'Module:Resources/data',
		loc = {'Resources', 'GenericComponents'},
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	Focus = {
		source = 'Module:Focus/data',
		loc = {'Ways', 'Schools', 'Symbols'},
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon  notpageimage dark-invert]]'):format(v.Image, link) end,
	},
	Sigils = {
		source = 'Module:Sigils/data',
		loc = '',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage light-invert]]'):format(v.Image, link or 'Sigils') end,
	},
	Blueprints = {--TODO i assume
		source = 'Module:Placeholder',
		loc = '',
		icon = function(v, link) return '' end,
	},
	Factions = {
		source = 'Module:Factions/data',
		loc = 'Factions',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage light-invert]]'):format(v.Image, link) end,
	},
	Stats = {
		source = 'Module:Icon/data',--note, this is the only non- 'Module:'..k..'/data'
		loc = 'Buff',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage %s]]'):format(v.Image, link, v.CssClasses) end,
	},
	Enemies = {
		source = 'Module:Enemies/data',
		loc = '',
		require=true,
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.General.Image, link) end,
	},
	Decrees = {
		source = 'Module:Decrees/data',
		loc = '',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Icon, link) end,
	},
	Keys = {
		source = 'Module:Keys/data',
		loc = '',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	},
	Cosmetics = {
		source = 'Module:Cosmetics/data',
		loc = 'Cosmetics',
		icon = function(v, link) return ('[[File:%s|x32px|link=%s|class=icon notpageimage]]'):format(v.Image, link) end,
	}
}

---	Finds the value of a key in a nested table.
--	@function		p._find
--	@param			{table} t Table to be searched through
--	@param			{table, string} keys Array of keys that is in the order in which they are accessed in table; 
--									if keys is a string, it will automatically be converted into a table
--	@return			{any} Value of key that is the last element in keys argument
function p._find(t, keys)
	local temp
	if keys then
		keys = (type(keys) ~= 'table') and { keys } or keys
		for _, v in ipairs(keys) do temp = t[v] end
		return temp or error('p._find(): Failed to find keys in ' .. mw.dumpObject(keys) .. ' in source table ' .. mw.dumpObject(temp))
	end
	
	return t or error('p._find(): Failed to find source table ' .. mw.dumpObject(t))
end

-- Adding a function to each p.Modules key
for name, module in pairs(p.Modules) do
	-- Only loops through the modules
	p[name] = function(index,k) -- p.Mods(), etc is only called later
		local v--,k
		if type(index)=='table' then
			v = index
			index = k
		elseif not module.loaded then
			module.loaded = (module.require and require or mw.loadData)(module.source)
		end
		-- For each set of location instructions
		for _, loc in ipairs(type(module.loc)=='table' and module.loc or {module.loc}) do
			if v then break end
			-- Find data in that location
			local data = module.loaded[loc] or module.loaded
			v = data[index]
			k = index

			if v then break --2x bc another inext() is unnecessary expense
			elseif module.require then
				for kk, vv in pairs(data) do
					if index == kk:gsub(' ?%(.+%)','') then
						v = vv
						k = kk
						break
					end
				end
			end
		end
		return v and {
			name, -- Source module
			k, -- Key in data table
			v['Link'] or (v.General and v.General['Link']), -- Link destination (page location)
			name = v['Name'] or (v.General and v.General['Name']) or k or index, -- Item name
			icon = module.icon and module.icon(v, v['Link'] or index, k), -- Icon in wikitext
			color = module.color and module.color(v, k), -- Hex color
			_data = v,
		}
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
	for i, loc in ipairs(type(module.loc)=='table' and module.loc or {module.loc}) do
		-- Find and iterate through names of objects
		for k, v in pairs(find(mw.loadData(module.source), loc)) do
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
