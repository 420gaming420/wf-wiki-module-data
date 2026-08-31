--- '''Mods''' retrieves and stores mod data of [[WARFRAME]].<br/>
--  
--  On this Wiki, Mods is used in:
--  * [[Template:ModBox]]
--  * [[Mod]]
--	
--  @module		mods
--  @alias		p
--  @author		[[User:Brizingr5|Brizingr5]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @image		Fusion_Core_horizontal.png
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Icon]]
--	@require	[[Module:Version]]
--	@require	[[Module:String]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--  @release	stable
--  

local p = {}

local ModData = mw.loadData('Module:Mods/data')['Mods']
local Icon = require('Module:Icon')
local Polarity = require('Module:Polarity')
local Version = require('Module:Version')
local String = require('Module:String')
local Table = require('Module:Table')
local Tooltip = require('Module:Tooltips')

-- TODO: Replace contents with a function map as seen in M:Weapons
--- Gets a specific piece of data about a mod formatted for display on wiki as wikitext.
--  @function		p.getValue
--  @param			{string} modName Mod name
--	@param			{string} valName Mod attribute to fetch (e.g. "Tradable")
--  @return			{table} Mod data
function p.getValue(frame)
	local modName = frame.args[1]
	--modName = String.unescape(modName)
	local valName = frame.args[2]
	
	local modTable = ModData[modName]
	
	if (modName == nil) then
		error('p.getValue(frame): No mod specified')
	elseif (modName == nil) then
		error('p.getValue(frame): No value specified for mod "'..mw.text.nowiki(modName)..'"')
	elseif (modTable == nil) then
		error('p.getValue(frame): No such mod "'..mw.text.nowiki(modName)..'" found (Did you make a typo? If not, may need to add a new entry to [[Module:Mods/data]])')
	end
	
	local valNameUpper = string.upper(valName)
	if (valNameUpper == "NAME") then
		return modName
	elseif (valNameUpper == "IMAGE") then
		return modTable.Image or "Mod.png"
	elseif (valNameUpper == "LINK") then
		return "[["..(modTable.Link or modName).."]]"
	elseif (valNameUpper == "INTRODUCED") then
		if (modTable.Introduced ~= nil) then
			local ver, num = Version._getVersion(modTable.Introduced)
			if (ver ~= nil) then
				return Version.getVersionLink(modTable.Introduced)
			end
		end
		return "Unknown update"
	elseif (valNameUpper == "POLARITY") then
		return modTable.Polarity or "None"
	elseif (valNameUpper == "POLARITYICON") then
		if (modTable.Polarity ~= nil) then
			return Polarity._polarity(modTable.Polarity)
		else
			return ""
		end
	elseif (valNameUpper == "RARITY") then
		return modTable.Rarity or "Unknown"
	elseif (valNameUpper == "TRADETAX") then
		if (modTable.Rarity ~= nil) then
			-- TODO: Turn this into a table map to reduce the number of if/else statements
			if (modTable.Rarity == "Common") then
				return Icon._Item("Credits").." 2,000"
			elseif (modTable.Rarity == "Uncommon") then
				return Icon._Item("Credits").." 4,000"
			elseif (modTable.Rarity == "Rare") then
				return Icon._Item("Credits").." 8,000"
			elseif (modTable.Rarity == "Legendary") then
				return Icon._Item("Credits").." 1,000,000"
			elseif (modTable.Rarity == "Amalgam") then
				return Icon._Item("Credits").." 0"
			elseif (modTable.Rarity == "Peculiar") then
				return Icon._Item("Credits").." 4,000"
			end
		end
		return "Unknown trade tax"
	elseif (valNameUpper == "TRANSMUTABLE") then
		return modTable.Transmutable or false
	elseif (valNameUpper == "INCOMPATIBLE") then
		if (modTable.Incompatible ~= nil) then
			local result = ""
			for i, incompatibleMod in ipairs(ModData[modName]["Incompatible"]) do
				result = result.."[["..incompatibleMod.."]], "
			end
			-- Removing extra comma and whitespace
			result = string.sub(result, 1, string.len(result) - 2)
			return result
		else
			return "No conflicts with other equipped mods"
		end
	elseif (valNameUpper == "TYPE") then
		local type = ModData[modName]["Type"]
		-- Mods with a Primed weapon as its type means it can only be equipped
		-- on Primed variant (as we know it)
		if (string.find(type, "Prime")) then
			return type.." (Excluding base/other variants)"
		elseif (ModData[modName]["IsAugment"]) then
			return type.." (Including its variants)"
		else
		-- Mods with normal variant name as its type means it can be equipped by all
		-- its variants (note that Cernos, Mutalist Cernos, and Proboscis Cernos are considered different weapons)
			return type
		end
	elseif (valNameUpper == "DESCRIPTION") then
		local desc = ModData[modName]["Description"]
		-- Replacing Lua patterns with placeholders; '%d' -> '??' and '%%' -> '%'
		-- return desc and desc:gsub('%%d', '??'):gsub('%%%%', '%%') 
		-- 	or "No description in [[Module:Mods/data]]"
		return desc
	elseif (valNameUpper == "EXILUS") then
		local isExilus = ModData[modName]["IsExilus"]
		return isExilus or false
	else
		return ModData[modName][valName]
	end
end

--- Builds a mod table that sorts mods by rarity.
--	Currently unused on articles due to sheer number of images needed to be loaded.
--	May be useful for debugging purposes.
--  @function		p.buildModTableByRarity
--  @return			{string} Mod table in wikitext
function p.buildModTableByRarity()
	local buildLegendaryTable = ""
	local countLegendary = 0
	local buildRareTable = ""
	local countRare = 0
	local buildUncommonTable = ""
	local countUncommon = 0
	local buildCommonTable = ""
	local countCommon = 0

	for key, Mod in Table.skpairs(ModData) do
		--mw.log(Mod.Rarity)
		if Mod.Rarity == "Legendary" then
			buildLegendaryTable = buildLegendaryTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countLegendary = countLegendary + 1
		elseif Mod.Rarity == "Rare" then
			buildRareTable = buildRareTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countRare = countRare + 1
		elseif Mod.Rarity == "Uncommon" then
			buildUncommonTable = buildUncommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countUncommon = countUncommon + 1
		elseif Mod.Rarity == "Common" then
			buildCommonTable = buildCommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countCommon = countCommon + 1
		end
	end

	local countTotal = countLegendary + countRare + countUncommon + countCommon
	
	local buildTable = ([=[
{| border="1" cellpadding="1" cellspacing="1"
|+ There are total of %s mods
|-
! Legendary (%s)
| %s
|-
! Rare (%s)
| %s
|-
! Uncommon (%s)
| %s
|-
! Common (%s)
| %s
|-
|}]=]):format(countTotal,
			  countLegendary, buildLegendaryTable,
			  countRare, buildRareTable,
			  countUncommon, buildUncommonTable,
			  countCommon, buildCommonTable)

	return buildTable
end

--- Builds a mod table that sorts mods by polarity.
--	Currently unused on articles due to sheer number of images needed to be loaded.
--	May be useful for debugging purposes.
--  @function		p.buildModTableByPolarity
--  @return			{string} Mod table in wikitext
function p.buildModTableByPolarity()
	local buildMaduraiTable = ""
	local buildVazarinTable = ""
	local buildNaramonTable = ""
	local buildZenurikTable = ""
	local buildPenjagaTable = ""
	local buildUnairuTable = ""

	local countMadurai = 0
	local countVazarin = 0
	local countNaramon = 0
	local countZenurik = 0
	local countPenjaga = 0
	local countUnairu = 0

--Madurai "V" "Madurai"
--Vazarin "D"
--Naramon "Bar"
--Zenurik "Ability" "Zenurik"
--Penjaga "Sentinel"
-- Unairu Pol Unairu  - R - Introduced in Update 13.0 and used for certain Melee Stance Mods.

	for key, Mod in Table.skpairs(ModData) do
		--mw.log(Mod.Polarity)
		-- TODO: Factor out the "[[File:..." into a variable
		-- TODO: Add support for "universal" polarity (aka no polarity)
		if Mod.Polarity == "V" or Mod.Polarity == "Madurai" then
			buildMaduraiTable = buildMaduraiTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countMadurai = countMadurai + 1
		elseif Mod.Polarity == "D" or Mod.Polarity == "Vazarin" then
			buildVazarinTable = buildVazarinTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countVazarin = countVazarin + 1
		elseif Mod.Polarity == "Bar" or Mod.Polarity == "Dash" or Mod.Polarity == "Naramon" then
			buildNaramonTable = buildNaramonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countNaramon = countNaramon + 1
		elseif Mod.Polarity == "Ability" or Mod.Polarity == "Zenurik" or Mod.Polarity == "Scratch" then
			buildZenurikTable = buildZenurikTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countZenurik = countZenurik + 1
		elseif Mod.Polarity == "Sentinel" or Mod.Polarity == "Penjaga" then
			buildPenjagaTable = buildPenjagaTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countPenjaga = countPenjaga + 1
		elseif Mod.Polarity == "R" or Mod.Polarity == "Unairu" or Mod.Polarity == "Ward" then
			buildUnairuTable = buildUnairuTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countUnairu = countUnairu + 1
		end
	end

	local countTotal = countMadurai + countVazarin + countNaramon + countZenurik + countPenjaga + countUnairu
	
	local buildTable = ([=[
{| border="1" cellpadding="1" cellspacing="1"
|+ There are a total of %s mods with a polarity
|-
! Madurai (%s)
| %s
|-
! Vazarin (%s)
| %s
|-
! Naramon (%s)
| %s
|-
! Zenurik (%s)
| %s
|-
! Penjaga (%s)
| %s
|-
! Unairu (%s)
| %s
|-
|}]=]):format(countTotal, 
			  countMadurai, buildMaduraiTable,
			  countVazarin, buildVazarinTable,
			  countNaramon, buildNaramonTable,
			  countZenurik, buildZenurikTable,
			  countPenjaga, buildPenjagaTable,
			  countUnairu, buildUnairuTable)

	return buildTable
end

--- Gets the total mod count.
--  @function		p.getModCount
--  @param[opt]			{string} rarity Mod rarity to filter by; defaults to 'All'
--	@param[opt]			{string} polarity Mod polarity to filter by using full name of polarity (e.g. 'Madurai') or 'All; defaults to 'All'
--	@param[opt]			{string} transmutable Mod transmutability to filter by; either 'true' or 'false', or 'All'; defaults to 'All'
--  @return			{table} Mod data
function p.getModCount(frame)
	local rarity = frame.args["rarity"] or "All"
	local polarity = frame.args["polarity"] or "All"
	local transmutable = frame.args["transmutable"] or "All"
	
	if (transmutable == "true") then
		transmutable = true
	elseif (transmutable == "false") then
		transmutable = false
	else
		transmutable = "All"
	end
	
	local total = 0
	-- treating mods without Transmutable key as untransmutable
	for name, modTable in Table.skpairs(ModData) do
		if ((modTable["Rarity"] == rarity or rarity == "All") and 
			(modTable["Polarity"] == polarity or polarity == "All") and
			(modTable["Transmutable"] ~= nil or modTable["Transmutable"] == transmutable or transmutable == "All") and
			not modTable["_IgnoreEntry"]) then
			
			total = total + 1
		end
	end
	
	return total
end

--- Builds a simple sorted list of all mod names in alphabetical order.
--  @function		p.simpleModNameList
--  @return			{string} Mod names separated by breaks
function p.simpleModNameList(frame)
	local result = ""
	local modtable = {}
	for name, Mod in pairs(ModData) do
		--mw.log(name, Mod)
		table.insert(modtable, name)
	end
	table.sort(modtable)
	for i, name in ipairs(modtable) do
		result = result..name.."<br/>"
	end
	return result
end

---	Builds a list of transmutable mods.
--	@function		p.transmutableModsList
--	@return			{string} Resultant wikitext of list
function p.transmutableModsList(frame)
	-- TODO hoist into Mods; though doing so would warrant a rarity trim loop. 
	local rarityOrder = { "Common", "Uncommon", "Rare" }

	-- if the transmutable mods wikitable needs to be reorganised in some way,
	-- this transMods data structure should be reworked as necessary
	local transMods = {} -- two-dimensional
	for polarity,_ in Table.skpairs(Polarity.IMAGE_MAP) do
		transMods[polarity] = {}
		for _,rarity in ipairs(rarityOrder) do
			transMods[polarity][rarity] = {}
		end
	end

	for modName,Mod in pairs(ModData) do
		if (Mod.Transmutable) then
			transMods[Mod.Polarity][Mod.Rarity][modName] = Mod
		end
	end

	-- trim empty polarities
	for polarity,rarities in pairs(transMods) do
		local empty = true
		for _,rarity in ipairs(rarityOrder) do
			empty = empty and (nil == next(rarities[rarity]))
		end
		if (empty) then
			transMods[polarity] = nil
		end
	end

	local wikitable = {
[=[{| class="wikitable mw-collapsible"
! Polarity
]=] }
	for _,rarity in ipairs(rarityOrder) do
		table.insert(wikitable, "!"..rarity) -- rarity columns
	end
	for polarity,rarities in Table.skpairs(transMods) do
		table.insert(wikitable, "|-")
		-- polarity rows
		local polarity_text = Polarity._polarity(polarity).." "..polarity
		table.insert(wikitable, "!"..polarity_text)
		for _,rarity in ipairs(rarityOrder) do
			table.insert(wikitable, "|")
			for modName,Mod in Table.skpairs(rarities[rarity]) do
				table.insert(wikitable, "*"..Tooltip.full(modName, "Mods"))
			end
		end
	end
	table.insert(wikitable, "|}")
	return table.concat(wikitable, "\n")
end

return p
