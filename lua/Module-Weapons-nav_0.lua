---	Submodule for generating weapon navigation box at bottom of weapon articles.
--	See [[Template:WeaponNav]] for the template that invokes this module.
--	
--	@module			weapons/nav
--	@alias			p
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:N90|N90]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Weapons/data]]
--	@release	stable
--	

local Table = require([[Module:Table]])
local Tooltips = require [[Module:Tooltips]] 
local WeaponData = require([[Module:Weapons/data]])

local CATEGORY_LINK_OVERRIDE_MAP = {
	Claws = "Claws (Melee)",
	Glaive = "Glaive (Weapon Type)",
	Machete = "Machete (Weapon Type)",
	Nikana = "Nikana (Weapon Type)",
}

local function getCategoryLink(category)
	if category:find'^Zaw ' then
		return '[[Zaw|'..category..']]'
	end
	if CATEGORY_LINK_OVERRIDE_MAP[category] ~= nil then
		return '[['..CATEGORY_LINK_OVERRIDE_MAP[category]..']]'
	end
	return '[['..category..']]'
end

-- Initialize database of all weapon names to validate bases
local allWeapons = {}
for _, tbl in pairs(WeaponData) do
	if type(tbl) == "table" then
		for _, weap in pairs(tbl) do
			if type(weap) == "table" and weap.Name then
				allWeapons[weap.Name] = true
			end
		end
	end
end

-- Get variant display name by finding words in name that are not in family name
-- This also accounts for localization differences between variants (e.g. Pangolin Sword and Pangolin Prime)
local function getVariantName(name, family)
	if name == family then
		return nil
	end
	local familyWords = {}
	for word in family:gmatch("[A-Za-z0-9]+") do
		familyWords[word:lower()] = true
	end
	
	local variantWords = {}
	for word in name:gmatch("[A-Za-z0-9]+") do
		local isVariant = true
		if familyWords[word:lower()] then
			isVariant = false
		end
		
		-- Check substrings both ways for any further localization discrepancies,
		-- e.g. Afuris -> Dex Furis, Dual Decurion -> Prisma Dual Decurions
		if string.find(family:lower(), word:lower()) then
			isVariant = false
		end
		for fWord in family:gmatch("[A-Za-z0-9]+") do
			if string.find(word:lower(), fWord:lower()) then
				isVariant = false
				break
			end
		end
		
		if isVariant then
			table.insert(variantWords, word)
		end
	end
	
	if #variantWords == 0 then
		return nil
	end
	return table.concat(variantWords, " ")
end

---	Builds a wikitable row.
--	@function		row
--	@param			{string} cat Weapon class name
--	@param			{table} weaps
--	@return			{string} Resultant wikitext of wikitable row
local function row(cat, weaps)
	local str = {}
	
	local groups = {}
	local groupOrder = {}
	for name, weap in Table.skpairs(weaps) do
		local base = weap.Family or name
		local variant = getVariantName(name, base)
		if not groups[base] then
			groups[base] = {}
			table.insert(groupOrder, base)
		end
		table.insert(groups[base], {
			name = name,
			variant = variant,
			weap = weap
		})
	end
	
	for _, base in ipairs(groupOrder) do
		local list = groups[base]
		if #list == 1 then
			local item = list[1]
			table.insert(str, Tooltips.full{{
				'Weapons',
				item.name,
				item.weap.Link,
				name = item.weap.Name,
				icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(item.weap.Image or 'UnidentifiedItem.png', item.weap.Link or ''),
				overridden = true,
				_data = item.weap,
			}})
		else
			-- Sorting variant names by alphabetical order in group, keeps base name first
			table.sort(list, function(a, b)
				if not a.variant and not b.variant then return false end
				if not a.variant then return true end
				if not b.variant then return false end
				return a.variant < b.variant
			end)
			
			local baseItem = nil
			local variantItems = {}
			for _, item in ipairs(list) do
				if not item.variant then
					baseItem = item
				else
					table.insert(variantItems, item)
				end
			end
			
			local baseLink
			if baseItem then
				baseLink = Tooltips.full{{
					'Weapons',
					baseItem.name,
					baseItem.weap.Link,
					name = baseItem.weap.Name,
					icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(baseItem.weap.Image or 'UnidentifiedItem.png', baseItem.weap.Link or ''),
					overridden = true,
					_data = baseItem.weap,
				}}
			else
				baseLink = base
			end
			
			local variantLinks = {}
			for _, item in ipairs(variantItems) do
				table.insert(variantLinks, Tooltips.full{{
					'Weapons',
					item.name,
					item.weap.Link,
					name = item.variant,
					icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(item.weap.Image or 'UnidentifiedItem.png', item.weap.Link or ''),
					overridden = true,
					_data = item.weap,
				}})
			end
			
			table.insert(str, baseLink .. ' (' .. table.concat(variantLinks, ', ') .. ')')
		end
	end

	local self = mw.html.create('tr')
	if cat == '--' then
		self:tag('td')
			:attr('colspan', '2')
			:css('font-size', 'small')
			:css('font-weight', 'normal')
			:css('text-align', 'center')
			:wikitext(table.concat(str, '  • '))
	else
		self:tag('td')
				:addClass('navboxgroup')
				:wikitext(cat)
			:done()
			:tag('td')
				:css('font-size', 'small')
				:css('font-weight', 'normal')
				:css('text-align', 'left')
				:wikitext(table.concat(str, '  • '))
	end
	return self:allDone()
end

---	Builds wikitable of weapons in a particular weapon slot (e.g. primary weapons).
--	@function		makeTable
--	@param			{table} data Weapon data
--	@return			{string} Resultant wikitext of wikitable
local function makeTable(data)
	local subTable = mw.html.create('table')
		:addClass('navbox')
		:css('width', '100%')
		:css('font-size', 'small')
		
	local datum = {}
	for _, weaponEntry in pairs(data) do
		local header = weaponEntry['Class'] or 'Unknown Class'
		local section = weaponEntry['Trigger'] or header
		-- If melee nav, add melee category links for first column
		if header == section then
			header = 'Melee'
			section = getCategoryLink(section)
		end

		if datum[header] == nil then
			datum[header] = {}
		end
		if datum[header][section] == nil then
			datum[header][section] = {}
		end

		datum[header][section][weaponEntry.Name] = weaponEntry
	end

	for header, sections in Table.skpairs(datum) do
		subTable:tag('tr')
			:tag('th')
				:addClass('navboxhead')
				:attr('colspan', '2')
				:wikitext('[['..header..']]')
			:done()
		:done()
		for section, weaps in Table.skpairs(sections) do
			subTable:node(row(section, weaps))
		end
	end
	
	return subTable
end

---	Filters table.
--	@function		filterData
--	@param			{string} t Table data
--	@return			{table} New table that only contains weapon entries with _IgnoreEntry == false
local function filterData(t)
	local nt = {}
	for k, v in pairs(t) do
		if not v._IgnoreEntry then
			nt[k] = v
		end
	end
	return nt
end

return {
---	Builds a weapon navigation box.
--	@function		buildWeaponNav
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of navbox
buildWeaponNav = function(frame)
	return tostring(mw.html.create('table')
		:addClass('navbox mw-collapsible mobile-hidden')
		:tag('tr')
			:tag('th')
				:css('text-align', 'center')
				:wikitext('[[Weapons]] • [[Damage]] • [[Incarnon]] • [[Weapon Comparison'
					..(mw.title.getCurrentTitle().nsText=='Conclave' and '/Conclave' or '')
					..'|Compare All]] • [[Weapon Cosmetics|Cosmetics]]')
			:done()
		:done()
		:tag('tr')
			:tag('th')
				:css('padding', '0')
				:tag('div')
					:addClass('tabber-borderless')
					:wikitext(frame:extensionTag('Tabber', tostring(mw.html.create()
						:wikitext('|-|Primary= '):node(makeTable(WeaponData.Primary))
						:wikitext('|-|Secondary= '):node(makeTable(WeaponData.Secondary))
						:wikitext('|-|Melee= '):node(makeTable(WeaponData.Melee))
						:wikitext('|-|Archwing= '):node(makeTable(WeaponData.Archwing))
						:wikitext('|-|Companion= '):node(makeTable(filterData(WeaponData.Robotic))) -- Not 100% Robotic, includes Beast Claws too for some reason
						:wikitext('|-|Modular= '):node(makeTable(filterData(WeaponData.Modular)))
						:wikitext('|-|Railjack= '):node(makeTable(filterData(WeaponData.Railjack)))
					)))
	:allDone())
end
}
