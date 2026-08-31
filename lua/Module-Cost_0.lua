---	'''Cost''' is a module for constructing manufacturing requirements wikitables.<br />
--	
--	On this Wiki, Cost is used in:
--	* [[Template:BuildAutomatic]]
--	
--	@module			cost
--	@alias			p
--	@author			[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Synthtech|Synthtech]]
--	@image			IconBuild.png
--	@require		[[Module:Tooltips]]
--	@require		[[Module:Icon]]
--	@require		[[Module:Table]]
--	@require		[[Module:String]]
--	@require		[[Module:Math]]
--	@require		[[Module:Research/data]]
--	@require		[[Module:Blueprints/data]]
--	@release		stable
--	

local p = {}

local Tooltip = require('Module:Tooltips')
local Icon = require('Module:Icon')
local Table = require('Module:Table')
local String = require('Module:String')
local Math = require('Module:Math')
local ResearchData = mw.loadData('Module:Research/data')
local BlueprintData = mw.loadData('Module:Blueprints/data')

-- TODO: I18n this module

---	Finding the smallest denomination of time that can express a duration value (in seconds)
--	as a whole number.
--	@function		formatSeconds
--	@param			{number} seconds Number of seconds for build time
--	@return			{number} Duration value for a particular unit
--	@return			{string} Unit name
--	@local
local function formatSeconds(seconds)
	local unitOrder = { 'Day', 'Hour', 'Minute', 'Second' }
	local unitSecondsMap = {
		Day = 86400,
		Hour = 3600,
		Minute = 60,
		Second = 1,
	}
	for _, unit in ipairs(unitOrder) do
		local t = unitSecondsMap[unit]
		if (seconds % t == 0) then
			return seconds / t, unit..'(s)'
		end
	end
	error('formatSeconds(seconds): Unknown time denomination')
end

local function getLabLink(factionName)
	if (ResearchData["Labs"][factionName] == nil) then
		return "[[Research]]"
	else
		local labName = ResearchData["Labs"][factionName].Name
		return "[[Research#"..labName.."|"..labName.." Research]]"
	end
end

local function getResearch(itemName)
	return ResearchData["Research"][itemName]
end

local function buildItemText(Item)
	if (Item == nil) then
		return " "
	end

	local itemText, name, link
	local count = Math.formatnum(Item.Count)

	if (Item.Type == "WarframePart") then
		local split = String.split(Item.Name)
		link = split[1]
		name = split[2]
	else
		name = Item.Name
	end

	if (Item.Type == "Resource" or Item.Type == nil) then
		itemText = Tooltip.full(name, 'Resources').."<br/>"
	elseif (Item.Type == "Item") then
		itemText = Icon._Item(name, nil, 'x32').."<br/>"
	elseif (Item.Type == "PrimePart") then
		itemText = Icon._Item("Prime "..name, nil, 'x32').."<br/>"
	elseif (Item.Type == "WarframePart") then
		itemText = Icon._Item(name, nil, 'x32').."<br/>"
	elseif (Item.Type == "Weapon") then
		itemText = Tooltip.full(name, 'Weapons')..'<br/>'
	end

	if (Item.Type == "WarframePart") then
		itemText = itemText..'[['..link..'|'..Item.Name..']]'
	else
		itemText = itemText..count
	end

	return itemText
end

---	Builds weapon manufacturing requirements table.
--	@function		p.buildWeaponCostBox
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildWeaponCostBox(frame)
	local WeaponName = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	local WeaponBlueprint = BlueprintData["Blueprints"][WeaponName]

	assert(WeaponBlueprint ~= nil, "p.buildWeaponCostBox(frame): "..WeaponName.." not found in [[Module:Blueprints/data]] or does not have resource build requirements")

	local rowStart = '\n| rowspan="2" style="height:50px; width:50px;" |'
	local smallPart = '\n| style="text-align:left; padding:0em 0.25em;" |'
	local lowRow = '\n| colspan="3" |<small>'

	if (WeaponBlueprint.Parts ~= nil) then
		local tHead = [=[{| class="foundrytable" style="float:left;margin:auto"
! colspan=6 | [[Foundry|Manufacturing]] Requirements<br />[[Module:Blueprints/data|<span class="button">📝 Edit blueprint requirements</span>]]
|-]=]

		local result = {}
		table.insert(result, tHead)
		table.insert(result, rowStart)

		--Adding Credit costs
		if (WeaponBlueprint.Credits ~= nil) then
			table.insert(result, Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(WeaponBlueprint.Credits))
		else
			table.insert(result, 'N/A')
		end

		--Adding part costs
		for i = 1, 4 do
			local part = WeaponBlueprint.Parts[i] 
			if part then
				part = { Count = part.Count, Name = part.Name, Type = part.Type }
				if part.Name == "Chassis" then
					part.Name = "Gun Chassis"
				end
			end
			table.insert(result, rowStart..buildItemText(part))
		end

		--Adding the time, market, and rush cost
		table.insert(result, smallPart)
		if (WeaponBlueprint.Time ~= nil) then
			local t, unit = formatSeconds(WeaponBlueprint.Time)
			table.insert(result, "Time: "..t..' '..unit)
		else
			table.insert(result, 'N/A')
		end
		table.insert(result, '\n|-'..smallPart)
		if (WeaponBlueprint.Rush ~= nil) then
			table.insert(result, 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..WeaponBlueprint.Rush)
		else
			table.insert(result, 'N/A')
		end
		table.insert(result, '\n|-'..lowRow..Icon._Item("Market", "text", 22)..' Price: '..Tooltip.icon("Platinum", "Resources")..' ')
		if (WeaponBlueprint.MarketCost ~= nil) then
			table.insert(result, WeaponBlueprint.MarketCost)
		else
			table.insert(result, "N/A")
		end
		table.insert(result, '</small>'..lowRow..Icon._Item("Blueprint", "text", 22)..' Price:')
		--For Ghoulsaw
		if (WeaponBlueprint.BPCost ~= nil and WeaponBlueprint.BPStanding ~= nil) then
			table.insert(result, Tooltip.icon("Standing", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPStanding)..' + ')
			table.insert(result, Tooltip.icon("Credits", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPCost))
		elseif (WeaponBlueprint.BPCost ~= nil) then
			table.insert(result, Tooltip.icon("Credits", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPCost))
		--This is for Heliocor and Simulor
		elseif (WeaponBlueprint.BPStanding ~= nil) then
			table.insert(result, Tooltip.icon("Standing", "Resources"))
			table.insert(result, Math.formatnum(WeaponBlueprint.BPStanding))
		else
			table.insert(result, "N/A")
		end
		table.insert(result, '</small>')

		-- Add weapon part component costs if needed
		for _, part in pairs(WeaponBlueprint.Parts) do
			if (part.Cost ~= nil) then
				table.insert(result, '\n|-')
				table.insert(result, '\n|colspan=6|'..part.Name)
				--Adding part acquisition cost
				--For Ghoulsaw
				if(part.Cost.BPCost ~= nil and part.Cost.BPStanding ~= nil) then
					table.insert(result, ' • '..Tooltip.icon("Standing", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPStanding)..' + ')
					table.insert(result, Tooltip.icon("Credits", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPCost))
				elseif(part.Cost.BPStanding ~= nil) then
					table.insert(result, ' • '..Tooltip.icon("Standing", "Resources"))
					table.insert(result, Math.formatnum(part.Cost.BPStanding))
				end

				table.insert(result, '\n|-'..rowStart)

				--Adding Credit costs
				if (part.Cost.Credits ~= nil) then
					table.insert(result, Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(part.Cost.Credits))
				else
					table.insert(result, 'N/A')
				end

				--Adding part costs
				for i = 1, 4 do
					table.insert(result, rowStart..buildItemText(part.Cost.Parts[i]))
				end

				--Adding the time, market, and rush cost
				table.insert(result, smallPart)
				if (part.Cost.Time ~= nil) then
					local t, unit = formatSeconds(part.Cost.Time)
					table.insert(result, "Time: "..t..' '..unit)
				else
					table.insert(result, 'N/A')
				end
				table.insert(result, '\n|-'..smallPart)
				if (part.Cost.Rush ~= nil) then
					table.insert(result, 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..part.Cost.Rush)
				else
					table.insert(result, 'N/A')
				end

				--table.insert(result, '</small>')
			end
		end

		--Adding Research costs if needed
		local weapRes = getResearch(WeaponName)
		if (weapRes) then
			table.insert(result, '\n|-\n! colspan=6| [[Category:Research]] '..getLabLink(weapRes.Lab))
			if(weapRes.Affinity ~= nil) then
				table.insert(result, '[[File:ClanAffinity64.png|class=icon]]'..Math.formatnum(weapRes.Affinity))
			end

			table.insert(result, '\n|-'..rowStart)
			--Adding Credit costs
			if (weapRes.Credits ~= nil) then
				table.insert(result, Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(weapRes.Credits))
			else
				table.insert(result, 'N/A')
			end

			--Adding part costs
			for i = 1, 4 do
				table.insert(result, rowStart..buildItemText(weapRes.Resources[i]))
			end

			--Adding the time, market, and rush cost
			table.insert(result, smallPart)
			if (weapRes.Time ~= nil) then
				local t, unit = formatSeconds(weapRes.Time)
				table.insert(result, "Time: "..t..' '..unit)
			else
				table.insert(result, 'N/A')
			end
			table.insert(result, '\n|-'..smallPart)
			if (weapRes.Prereq ~= nil) then
				table.insert(result, 'Prereq: [['..weapRes.Prereq..']]')
			else
				table.insert(result, 'Prereq: N/A')
			end

			--Adding notes about clan sizes
			local clans = '\n|-\n| colspan = 6 |<small>Clan Research Resource Multipliers: '..
				Icon._Clan('Ghost')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x1</span>]] &nbsp; '..
				Icon._Clan('Shadow')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x3</span>]] &nbsp; '..
				Icon._Clan('Storm')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x10</span>]] &nbsp; '..
				Icon._Clan('Mountain')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x30</span>]] &nbsp; '..
				Icon._Clan('Moon')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x100</span>]]</small>'
			table.insert(result, clans)
		end

		table.insert(result, '\n|}<div style="clear:left; margin:0; padding:0;"></div>[[Category:Automatic Cost Table]]')

		return table.concat(result)
	end
end

-- TODO: Generalize p.buildWarframeCostBox to support non-conventional builds like multiple Neuroptics/Chassis/Systems
-- with Equinox and no Neuroptics/Chassis/Systems with Excalibur Umbra
---	Builds Warframe manufacturing requirements table.
--	@function		p.buildWarframeCostBox
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildWarframeCostBox(frame)
	local name = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	local MainBp = BlueprintData['Suits'][name] or 
			error('p.buildWarframeCostBox(frame): Main blueprint not found in [[Module:Blueprints/data]]')
	local NeuroBp = BlueprintData['Suits'][name..' Neuroptics'] or 
			error('p.buildWarframeCostBox(frame): Neuroptics blueprint not found in [[Module:Blueprints/data]]')
	local ChassisBp = BlueprintData['Suits'][name..' Chassis'] or 
			error('p.buildWarframeCostBox(frame): Chassis blueprint not found in [[Module:Blueprints/data]]')
	local SystemsBp = BlueprintData['Suits'][name..' Systems'] or 
			error('p.buildWarframeCostBox(frame): Systems blueprint not found in [[Module:Blueprints/data]]')

	-- Format strings for wikitable rows
	local rowStart = '| rowspan="2" style="height:50px; width:50px;" | %s'
	local smallPart = '| style="text-align:left; padding: 0em 0.25em;" | %s'
	local lowRow = '| colspan="3" |<small>%s</small>'
	
	local foundryTable = { '{| class="foundrytable" style="float:left; margin:auto;"' }
	table.insert(foundryTable, '! colspan=6 | [[Foundry|Manufacturing]] Requirements<br /><span class="button">📝 [[Module:Blueprints/data|Edit blueprint requirements]]</span>')
	table.insert(foundryTable, '|-')
	
	local rowContent = 'N/A'
	--Adding Credit costs
	if (MainBp.Credits ~= nil) then
		rowContent = Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(MainBp.Credits)
	end
	table.insert(foundryTable, rowStart:format(rowContent))
	
	--Adding part costs
	for i = 1, 4 do
		table.insert(foundryTable, rowStart:format(buildItemText(MainBp.Parts[i])))
	end

	-- Adding the time, market, and rush cost
	local buildTimeContent = 'N/A'
	if (MainBp.Time ~= nil) then
		local t, unit = formatSeconds(MainBp.Time)
		buildTimeContent = 'Time: '..t..' '..unit
	end
	table.insert(foundryTable, smallPart:format(buildTimeContent))
	table.insert(foundryTable, '|-')
	
	local rushCostContent = 'N/A'
	if (MainBp.Rush ~= nil) then
		rushCostContent = 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..MainBp.Rush
	end
	table.insert(foundryTable, smallPart:format(rushCostContent))
	table.insert(foundryTable, '|-')
	
	local marketCostContent = 'N/A'
	if (MainBp.MarketCost ~= nil) then
		marketCostContent = MainBp.MarketCost
	end
	table.insert(foundryTable, lowRow:format(Icon._Item("Market", "text", 22)..' Price: '..Tooltip.icon("Platinum", "Resources")..' '..marketCostContent))
	
	local blueprintCostContent = 'N/A'
	if (MainBp.BPCost ~= nil) then
		blueprintCostContent = Tooltip.icon("Credits", "Resources")
		blueprintCostContent = blueprintCostContent..Math.formatnum(MainBp.BPCost)
	--This is for Baruuk
	elseif (MainBp.BPStanding ~= nil) then
		blueprintCostContent = Tooltip.icon("Standing", "Resources")
		blueprintCostContent = blueprintCostContent..Math.formatnum(MainBp.BPStanding)
	end
	table.insert(foundryTable, lowRow:format(Icon._Item("Blueprint", "text", 22)..' Price: '..blueprintCostContent))
	
	-- Add Warframe part component costs
	for _, partBp in ipairs({ NeuroBp, ChassisBp, SystemsBp }) do
		table.insert(foundryTable, '|-')
		table.insert(foundryTable, '| colspan=6 | '..partBp.Name)
		table.insert(foundryTable, '|-')
		
		--Adding Credit costs
		local creditCostContent = 'N/A'
		if (partBp.Credits ~= nil) then
			creditCostContent = Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(partBp.Credits)
		end
		table.insert(foundryTable, rowStart:format(creditCostContent))
		
		--Adding part costs
		for i = 1, 4 do
			table.insert(foundryTable, rowStart:format(buildItemText(partBp.Parts[i])))
		end

		--Adding the time, market, and rush cost
		local componentBuildTimeContent = 'N/A'
		if (partBp.Time ~= nil) then
			local t, unit = formatSeconds(partBp.Time)
			componentBuildTimeContent = 'Time: '..t..' '..unit
		end
		table.insert(foundryTable, smallPart:format(componentBuildTimeContent))
		table.insert(foundryTable, '|-')
		
		local componentRushCostContent = 'N/A'
		if (partBp.Rush ~= nil) then
			componentRushCostContent = 'Rush: '..Tooltip.icon("Platinum", "Resources")..' '..partBp.Rush
		end
		table.insert(foundryTable, smallPart:format(componentRushCostContent))
	end

	--Adding Research costs if needed
	local wfResearch = getResearch(name)
	if (wfResearch) then
		local researchParts = {
			[1] = "Blueprint",
			[2] = "Neuroptics",
			[3] = "Chassis",
			[4] = "Systems"
		}

		table.insert(foundryTable, '|-')
		table.insert(foundryTable, '| colspan=6| <div class="mw-collapsible mw-collapsed">'..getLabLink(wfResearch.Lab)..'<div class="mw-collapsible-content">')
		table.insert(foundryTable, '{| class="foundrytable" style="max-width:100%;')

		for _, partName in ipairs(researchParts) do
			local research
			if (partName ~= "Blueprint") then
				research = getResearch(name..' '..partName)
			else
				research = wfResearch
			end
			
			if (research.Resources ~= nil) then
				local clanResearchContent = '| colspan=6 | %s • [[File:ClanAffinity64.png|class=icon]]%s'
				local clanAffinityContent = ''
				if (research.Affinity ~= nil) then
					clanAffinityContent = Math.formatnum(research.Affinity)
				end
				table.insert(foundryTable, clanResearchContent:format(partName, clanAffinityContent))
				table.insert(foundryTable, '|-')
				
				--Adding Credit costs
				local researchCostContent = 'N/A'
				if (research.Credits ~= nil) then
					researchCostContent = Tooltip.icon("Credits", "Resources").."<br/>"..Math.formatnum(research.Credits)
				end
				table.insert(foundryTable, rowStart:format(researchCostContent))
				
				--Adding part costs
				for i = 1, 4 do
					table.insert(foundryTable, rowStart:format(buildItemText(research.Resources[i])))
				end
				
				--Adding the research time and prerequisite research requirements
				local researchTimeContent = 'N/A'
				if (research.Time ~= nil) then
					local t, unit = formatSeconds(research.Time)
					researchTimeContent = 'Time: '..t..' '..unit
				end
				table.insert(foundryTable, smallPart:format(researchTimeContent))
				table.insert(foundryTable, '|-')
				
				local researchPrereqContent = 'Prereq: N/A'
				if (research.Prereq ~= nil) then
					researchPrereqContent = 'Prereq: [['..research.Prereq..']]'
				end
				table.insert(foundryTable, smallPart:format(researchPrereqContent))
				table.insert(foundryTable, '|-')
			end
		end

		--Adding notes about clan sizes
		local clanSizeMultipliers = '| colspan=6 |<small>Clan Research Resource Multipliers: %s&nbsp;%s&nbsp;%s&nbsp;%s&nbsp;%s</small>'
		table.insert(foundryTable, clanSizeMultipliers:format(
				Icon._Clan('Ghost')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x1</span>]]',
				Icon._Clan('Shadow')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x3</span>]]',
				Icon._Clan('Storm')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x10</span>]]',
				Icon._Clan('Mountain')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x30</span>]]',
				Icon._Clan('Moon')..' [[Clan#Clan Tier Multiplier|<span title="Clan Tier Multiplier">x100</span>]]'
		))
		table.insert(foundryTable, '|}</div></div>')
	end
	
	table.insert(foundryTable, '|}<div style="clear:left; margin:0; padding:0;"></div>[[Category:Automatic Cost Table]]')
	return table.concat(foundryTable, '\n')
end

return p
