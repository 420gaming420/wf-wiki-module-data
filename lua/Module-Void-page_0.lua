--- '''Void/page''' creates infoboxes, message boxes, and drop tables for [[Void Relic]] pages.
--	
--	On this Wiki, Void/page is used in:
--	* [[Template:RelicPage]]
--	
--	@module		void
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Flaicher|Flaicher]] ([[MediaWiki:RelicTable.js]])
--	@image		VoidProjectionsIronD.png
--	@require	[[Module:Void/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Companions/data]]
--	@require	[[Module:Vendors/data]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Baro]]
--	@require	[[Module:Void]]
--	@require	[[Module:Version]]
--	@require	[[Module:DropTables]]
--	@require	[[Module:InfoboxBuilder]]
--	@require	[[Module:Math]]
--	@require	[[Module:Text]]
--	@require	[[MediaWiki:RelicTable.js]] (script for relic refinement buttons)
--	@release	stable
--	

local p = {}

local VoidData = mw.loadData('Module:Void/data')
local WeaponData = require('Module:Weapons/data')
local WarframeData = mw.loadData('Module:Warframes/data')['Warframes']
local ArchwingData = mw.loadData('Module:Warframes/data')['Archwings']
local ResourceData = mw.loadData('Module:Resources/data')['Resources']
local CompanionData = mw.loadData('Module:Companions/data')['Companions']
local ModData = mw.loadData('Module:Mods/data')['Mods']
local VendorsData = mw.loadData('Module:Vendors/data')['Vendors']
local Math = require('Module:Math')
local Text = require('Module:Text')

local RelicData = VoidData['RelicData']
local PrimeData = VoidData['PrimeData']

local Vendor = require('Module:Vendors')
local Baro = require('Module:Baro')
local Void = require('Module:Void')
local Version = require('Module:Version')
local DropTable = require('Module:DropTables')
local InfoboxBuilder = require('Module:InfoboxBuilder')

-- Note that this table ID is used by [[MediaWiki:RelicTable.js]] to change rarity 
-- drop chance elements for different refinements of relics (e.g. Intact vs. Radiant relics).
-- This is used in p.buildRelicDropTable(frame)
local RELIC_TABLE_ID = '72656C6963table'
local ICON_SIZE = '38'	-- Used in getRelicDrops(relic); icon size in pixels

local IMAGE_MAP = {
	Lith = 'LithRelicIntact.png',
	Meso = 'MesoRelicIntact.png',
	Neo  = 'NeoRelicIntact.png',
	Axi  = 'AxiRelicIntact.png',
	Requiem = 'RequiemRelicIntact.png',
	Vanguard = 'AxiRelicIntact.png',
}

-- As of 2026-05-17, these are not available through Void Relic Packs or Endless Void Fissures
-- Only obtainable from Empyrean [[Abandoned Derelict Caches]]
local EMPYREAN_VOID_RELIC_EXCEPTIONS = {
	-- Nyx Prime and Valkyr Prime permanent unvaulting relics
	["Lith C7"] = true,
	["Meso N11"] = true,
	["Neo V9"] = true,
	["Axi S8"] = true,
	["Axi V10"] = true
}

--- Returns relic's Prime Resurgence (Varzia) status.
--	@function		p.Resurgence
--	@param			{string} relicName Name of the relic
--	@return			{boolean} true or false
function p.Resurgence(relicName)
	if type(relicName) == 'table' then relicName = relicName.args[1] end
	return p._Resurgence(relicName)
end
function p._Resurgence(relicName)
	for _, offer in ipairs(VendorsData['Varzia'].Offerings) do
		if offer[1] == relicName .. ' Relic' then
			return true
		end
	end
	return false
end
local isVarzia = p._Resurgence

--- Returns the appropriate message box for relic page.
--	@function		getMessageBox
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of message box
local function getMessageBox(relic)
	if relic['IsBaro'] then
		return [=[
{{ambox
| image = Voidtraderplaceholderthumb.png
| link = Baro Ki'Teer
| quote = Maybe next time.
| type = This [[Void Relic]] is exclusive to the [[Baro Ki'Teer|Void Trader's]] offerings and may not be available for purchase at this time. Players can still [[Trading|trade]] for it, however.
}}]=]
	elseif isVarzia(relic.Name) then
		return [=[
{{ambox
| image = Varzia.png
| link = Prime Resurgence
| quote = Rumours were true. The vault of history is open.
| type = This [[Void Relic]] is obtainable from [[Prime Resurgence]] offerings for a limited time. Players can still [[Trading|trade]] for it, however.
}}]=]
	elseif relic['Vaulted'] then
		-- TODO: Can't we just return "{{Vaulted}}" instead? The module will preprocesses the frame so it should still render properly
			return [=[
{{ambox
| image = AladVPortrait_d.png
| link = Alad V
| quote = Market forces dictate that you need to evolve or die.
| type = This [[Void Relic]] is no longer obtainable from the [[Drop Tables]]. However, vaulted relics can still be opened or [[Trading|traded]] if they are in player inventories.
}}]=]
	else
		return ''
	end
end

--- Returns the relic status.
--	@function		getRelicStatus
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of infobox image caption
local function getRelicStatus(relic) 
	if relic['IsBaro'] then
		return [=[<div style="text-align:center;">'''[[Baro Ki'Teer|Baro Ki'Teer Exclusive]]'''</div>]=]
	elseif isVarzia(relic.Name) then
		return [=[<div style="text-align:center;">'''[[Prime Resurgence|Prime Resurgence Available]]'''</div>]=]
	elseif relic['Vaulted'] then
		return [=[<div style="text-align:center;">]=] .. Text._text("'''VAULTED'''", { color='var(--negative-text-color)' }) .. [=[</div>]=]
	else
		return [=[<div style="text-align:center;">]=] .. Text._text("'''AVAILABLE'''", { color='var(--positive-text-color)' }) .. [=[</div>]=]
	end
end

--- Returns the relic's related categories.
--	@function		getRelicCategories
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext of category links
local function getRelicCategories(relic)
	local categories = { '[[Category:Relic]]' }
	if relic['Vaulted'] then
		table.insert(categories, '[[Category:Vaulted Relics]]')
	end
	if relic['IsBaro'] then
		table.insert(categories, '[[Category:Baro_Ki\'Teer_Offering]][[Category:Removed]]')
	end
	if isVarzia(relic.Name) then
		table.insert(categories, '[[Category:Prime Resurgence Offering]]')
	end
	table.insert(categories, '[[Category:'..relic['Tier']..']]')
	table.insert(categories, Version._getVersionCategory(relic['Introduced']))
	return table.concat(categories)
end


--- Returns interwiki links to wikias with separate relic pages
--	@function		getnterwikiLinks
--	@param			{table} relic Relic entry in /data
--	@return			{string} Wikitext containing interwiki links
local function getInterwikiLinks(relic)
	--returns nothing if RelicData contains not enough data
	if type(relic.Name) ~= 'string' or type(relic.Tier) ~= 'string' or
			not relic.Name:find(' %w') then
		return ''
	end
	--separating Tier from Name
	local relicName = relic.Name:gsub('.+ ','')
	local interwikis = {}
	local iTemplate = '[[%s:%s %s]]'
	-- TODO: Could move localization to [[MediaWiki:Custom-VoidRelics/i18n.json]]
	-- TODO: Missing "Vanguard" localization
	local eligibleWikias = {
		--true value for wikias with identical relic page names
		fr = true,
		es = true,
		ja = true,
		--tables value for wikias with localised relic page names
		['ru'] = {
			Lith = 'Лит',
			Meso = 'Мезо',
			Neo = 'Нео',
			Axi = 'Акси',
			Requiem = 'Реквием',
		},
		['uk'] = {
			Lith = 'Літ',
			Meso = 'Мезо',
			Neo = 'Нео',
			Axi = 'Аксі',
			Requiem = 'Реквієм',
		},
	}
	--generating interwiki links
	for lang, translate in pairs(eligibleWikias) do
		if	translate == true then
			table.insert(interwikis, iTemplate:format(lang,relic.Tier, relicName))
		elseif type(translate) == 'table' and translate[relic.Tier] then
			table.insert(interwikis, iTemplate:format(lang,translate[relic.Tier], relicName))
		end
	end
	return table.concat(interwikis)
end

--- Builds relic infobox, adds a message box (if needed), and the categories.
--	@function		p.buildRelicInfobox
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of infobox
function p.buildRelicInfobox(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicInfobox(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicInfobox(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(relicName)
		:image(IMAGE_MAP[relic['Tier']])
		:caption('relic-status', getRelicStatus(relic))
		:caption('tradable', '[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|' .. Text._text('%s', { color = 'var(--positive-text-color)'} ) .. ']][[Category:Tradeable]]', 'tradable')
		:group():header('%s', 'general-information')
			:row('release-date', '%s', Version._getVersionLink(relic['Introduced']), 'introduced')
			:row('latest-vaulting', '%s', relic['Vaulted'] ~= nil and Version._getVersionLink(relic['Vaulted']) or '', 'latest-vaulting')
		:done()

	local vendorStr = Vendor._buildVendorSourceStrings(relicName .. ' Relic')
	local baroStr = Baro._buildBaroSourceStrings(relicName .. ' Relic')
	
	Infobox:group():header('%s', 'vendor-sources')
		:value('<div class="tabber-borderless">'..frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		)..'</div>', 'Offerings')
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	:group():header('%s', 'update-infobox-data')
		:caption('update-infobox-data', '[[Module:Void/data]] / [[Module:DropTables/data]]', 'update-infobox-data')
	:done()
		
	return frame:preprocess(getMessageBox(relic)..tostring(Infobox))..getRelicCategories(relic)..getInterwikiLinks(relic)
end

--- Returns a table of the images, links, and ducat values of drops from a relic.
--	@function		getRelicDrops
--	@param			{table} relic Relic entry in /data
--	@return			{table} Table containing image, links, and ducat values of each item corresponding by index
local function getRelicDrops(relic)
	-- Index will correspond to the entries; i.e. prime part represented by
	-- ImageLinks[1] will have the corresponding ducat value in DucatValues[1]
	local relicDrops = { ImageLinks = {}, DucatValues = {} }
	
	-- Assuming drops are in order of rarity (common to rare)
	for _, drop in pairs(relic['Drops']) do
		local itemName = drop['Item']
		local imageName
		local itemCount = drop['ItemCount'] and Math.formatnum(drop['ItemCount'])..' X ' or ''
		-- TODO: Should fetch these image names from a appropriate data store instead of hardcoding them here
		-- (e.g. M:Resources/data or M:Companions/data)
		if itemName == 'Kavasa Prime' then
			imageName = 'KavasaPrimeKubrowCollar.png'
		else
			imageName = WeaponData[itemName] and WeaponData[itemName]['Image'] or 
					WarframeData[itemName] and WarframeData[itemName]['Image'] or 
					ArchwingData[itemName] and ArchwingData[itemName]['Image'] or 
					ResourceData[itemName] and ResourceData[itemName]['Image'] or
					CompanionData[itemName] and CompanionData[itemName]['Image'] or
					ModData[itemName] and ModData[itemName]['Image'] or
					'UnidentifiedItem.png'
		end
		local itemImageAndLink = string.format('[[File:%s|%spx]] %s[[%s|%s %s]]', 
			imageName,
			ICON_SIZE,
			itemCount,
			itemName,
			itemName,
			Void._getPartName(drop['Part'])
		)
		
		table.insert(relicDrops['ImageLinks'], itemImageAndLink)
		table.insert(relicDrops['DucatValues'], PrimeData[drop['Item']]['Parts'][drop['Part']]['DucatValue'])
	end
	
	return relicDrops
end

--- Builds relic drop table as seen on [[Template:RelicTable]].
--	@function		p.buildRelicDropTable
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of wikitable
function p.buildRelicDropTable(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicDropTable(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicInfobox(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local relicDrops = getRelicDrops(relic)
	
	-- Note that if you want to add % signs in the below string, you have to add %%
	if	relicName == 'Requiem Eterna' then
		local resultTable = string.format([=[
		The '''%s''' [[Relic]] contains the following [[Requiem Mods]]:
		{| class="wikitable" id="%s" style="text-align: center;"
		|-
		! style="width:60%%;"| Component
		! style="width:20%%;"| Ducat Value
		! style="width:20%%;"| Rarity&nbsp;(Chance)
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="8" style="position:relative;"| [[File:IconCommon.png|class=icon]]Common<br /><span id="relic-common-percentage">(100%%)</span><div id="relic-common-bar" style="position:absolute; padding: 0; height:5px; bottom:0; left:0; right:0; background-image:linear-gradient(to right, #61d4d4 100%%, #2d2d2d 0%%);"></div>
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		|}
		]=], 
			relicName,
			RELIC_TABLE_ID,
			-- drops in order of rarity
			relicDrops['ImageLinks'][1],	-- first drop image and link
			relicDrops['DucatValues'][1],	-- first drop ducat value
			relicDrops['ImageLinks'][2],
			relicDrops['DucatValues'][2],
			relicDrops['ImageLinks'][3],
			relicDrops['DucatValues'][3],
			relicDrops['ImageLinks'][4],
			relicDrops['DucatValues'][4],
			relicDrops['ImageLinks'][5],
			relicDrops['DucatValues'][5],
			relicDrops['ImageLinks'][6],
			relicDrops['DucatValues'][6],
			relicDrops['ImageLinks'][7],	-- Additional Drops
			relicDrops['DucatValues'][7],
			relicDrops['ImageLinks'][8],
			relicDrops['DucatValues'][8]
		)
		return frame:preprocess(resultTable)
	else
		local resultTable = string.format([=[
		The '''%s''' [[Relic]] contains the following [[Prime]] components and blueprints:
		{| class="wikitable" id="%s" style="text-align: center;"
		|-
		! style="width:60%%;"| Component
		! style="width:20%%;"| Ducat Value
		! style="width:20%%;"| Rarity&nbsp;(Chance)
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="3" style="position:relative;"| [[File:IconCommon.png|class=icon]]Common<br /><span id="relic-common-percentage">(25.33%%)</span><div id="relic-common-bar" style="position:absolute; padding: 0; height:5px; bottom:0; left:0; right:0; background-image:linear-gradient(to right, #61d4d4 76%%, #2d2d2d 0%%);"></div>
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| rowspan="2" style="position:relative;"| [[File:IconUncommon.png|class=icon]]Uncommon<br /><span id="relic-uncommon-percentage">(11%%)</span><div id="relic-uncommon-bar" style="position:absolute; padding: 0; height:5px; bottom:0; left:0; right:0; background-image:linear-gradient(to right, #61d4d4 22%%, #2d2d2d 0%%);"></div>
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		|-
		| style="padding:0 5px 0 0; height: 32px;"| %s
		| {{dc|%d}}
		| style="position:relative;"| [[File:IconRare.png|class=icon]]Rare <span id="relic-rare-percentage">(2%%)</span><div id="relic-rare-bar" style="position:absolute; padding: 0; height:5px; bottom:0; left:0; right:0; background-image:linear-gradient(to right, #61d4d4 2%%, #2d2d2d 0%%);"></div>
		|-
		| colspan=3 | <span class="button" id="relic-intact-button">Intact</span> <span class="button" id="relic-exceptional-button">Exceptional</span> <span class="button" id="relic-flawless-button">Flawless</span> <span class="button" id="relic-radiant-button">Radiant</span>
		|-
		|}
		]=], 
			relicName,
			RELIC_TABLE_ID,
			-- drops in order of 3 common, 2 uncommon, and 1 rare
			relicDrops['ImageLinks'][1],	-- first drop image and link
			relicDrops['DucatValues'][1],	-- first drop ducat value
			relicDrops['ImageLinks'][2],
			relicDrops['DucatValues'][2],
			relicDrops['ImageLinks'][3],
			relicDrops['DucatValues'][3],
			relicDrops['ImageLinks'][4],
			relicDrops['DucatValues'][4],
			relicDrops['ImageLinks'][5],
			relicDrops['DucatValues'][5],
			relicDrops['ImageLinks'][6],
			relicDrops['DucatValues'][6]
		)
		return frame:preprocess(resultTable)
		end
end

--- Returns the missions and sources where the relic itself can be dropped from.
--	@function		p.buildRelicDropLocations
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of mission wikitable and other text
function p.buildRelicDropLocations(frame)
	assert(frame and frame.args ~= nil, 'p.buildRelicDropLocations(frame): empty frame arguments')
	local relicName = frame.args['name']
	
	local relic = RelicData[relicName]
	assert(relic ~= nil, 'p.buildRelicDropLocations(frame): "'..relicName..'" does not exist in [[Module:Void/data]]')
	
	local missionData = 'None'
	local otherSources = ''
	
	-- If relic is not vaulted and is not a Baro-exclusive, add a mission table 
	-- on where players can get it below relic drop table
	if relic['IsBaro'] then
		otherSources = [=[
*May be available as a random [[Baro Ki'Teer]] offering during one of his biweekly visits to [[Relay]]s
]=]
	elseif isVarzia(relicName) then
		otherSources = "*Offered by [[Varzia]] at the cost of 1 [[Aya]]."
	elseif relic['Tier'] == 'Requiem' then
		if relicName == 'Requiem Eterna' then
			missionData = DropTable.getSingleRelicByLocation(frame)
			otherSources = "*[[Kuva Thrall]]s and [[Hound]]s have a 5% chance to drop a Requiem relic."
		else
			otherSources = "*Offered by [[Palladino]] up to 10 per week for a cost of 10 [[Riven Sliver]]."
		end
	elseif relic['Vaulted'] then
		otherSources = "*This relic is presently vaulted and does not drop in game\n"
	else
		missionData = DropTable.getSingleRelicByLocation(frame)
		otherSources = not EMPYREAN_VOID_RELIC_EXCEPTIONS[relicName] and [=[
*[[Relic Pack]]s
*Endless [[Void Fissure]] missions every fifth rotation reward
]=] or ""
	end
	
	return ([=[
==Mission Drop Locations==
%s
==Other Sources==
*[[Trading]] with other players
%s
]=]):format(missionData, otherSources)
end

--- Builds a relic page, adding an infobox, a message box (if needed), 
--	the relic's drop table, and update category.
--	@function		p.buildRelicPage
--	@param			{table} frame Frame object with 'name' argument for relic name
--	@return			{string} Wikitext of the entire relic page
function p.buildRelicPage(frame)
	return p.buildRelicInfobox(frame)..
			p.buildRelicDropTable(frame)..'__TOC__\n'..
			p.buildRelicDropLocations(frame)..
			-- Modifying the frame passed in so Void.relicsTable(frame) displays all unvaulted relics
			-- TODO: This is kinda hacky, may need to break up Void.relicsTable(frame) into two functions, one for #invoke
			-- and one for module use
			Void.relicsTable((function() frame.args[1] = nil; return frame end)())
end

return p
