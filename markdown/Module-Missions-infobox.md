---
title: "Module:Missions/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Missions/infobox"
wiki_timestamp: "2026-06-18T03:38:58Z"
---

*Documentation for this module may be created at [Module:Missions/infobox/doc](/w/Module:Missions/infobox/doc?action=edit&redlink=1 "Module:Missions/infobox/doc (page does not exist)")*

```lua
---	'''Missions/infobox''' builds the infobox on mission pages and adds the 
--	appropriate category pages.  

--
--	@module		Missions
--	@alias		p
--	@author			[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Math]]
--	@require	[[Module:Version]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:InfoboxBuilder]]
--	@require	[[Module:Missions/data]]
--	@release	stable
--	
local Math = require([[Module:Math]])
local Version = require([[Module:Version]])
local Tooltip = require([[Module:Tooltips]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local MissionData = mw.loadData([[Module:Missions/data]])
local MissionTypeData = MissionData["MissionTypes"]

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local nodeEntry = MissionData.by.Name[name][1] or 
			error('p.buildInfobox(frame): Cannot find mission node with name "'..name..'" in [[Module:Missions/data]]');
	
	local regionResources = {}
	for _, resourceName in ipairs(MissionData['RegionResources'][nodeEntry.Planet] or {}) do
		table.insert(regionResources, Tooltip.full(resourceName, 'Resources'))
	end
	regionResources = table.concat(regionResources, '  
')
	
	local darkSectorBonuses = nil
	if (nodeEntry.IsDarkSector) then
		darkSectorBonuses = ('+%s %s  
+%s %s  
+%s %s'):format(
				Math.percentage(nodeEntry.DSResourceBonus), '[[Resources|Resource]] Drop Chance Bonus',
				Math.percentage(nodeEntry.DSXPBonus), '[[Affinity]] Bonus',
				Math.percentage(nodeEntry.DSWeaponBonus), '[[Affinity]] Bonus for '..nodeEntry.DSWeapon
			)
	end
	
	local levelRange = ('%s - %s (Normal)'):format(
			nodeEntry.MinLevel, nodeEntry.MaxLevel
		)
	local steelPathLevelRange = ('%s - %s ([[The Steel Path]])'):format(
			nodeEntry.MinLevel + ((nodeEntry.IsArchwing or nodeEntry.IsRailjack) and 50 or 100),
			nodeEntry.MaxLevel + ((nodeEntry.IsArchwing or nodeEntry.IsRailjack) and 50 or 100)
		)
	
	local controllingFactions
	if (type(nodeEntry.Enemy) == 'table') then
		-- Assume there are only two entries in table (representing contested node)
		controllingFactions = Tooltip.full(nodeEntry.Enemy[1], 'Factions')..' ⚔️ '..Tooltip.full(nodeEntry.Enemy[2], 'Factions')
	else
		controllingFactions = Tooltip.full(nodeEntry.Enemy, 'Factions')
	end
	
	-- TODO: Can refactor these two loops into one
	local nextNodes = {}
	for _, nodeName in ipairs(nodeEntry.NextNodes or {}) do
		local nextNodeEntry = MissionData.by.Name[nodeName][1]
		table.insert(nextNodes, ('[[%s|%s]], %s'):format(nextNodeEntry.Link, nextNodeEntry.Name, nextNodeEntry.Planet))
	end
	nextNodes = table.concat(nextNodes, '  
')
	
	local previousNodes = {}
	for _, nodeName in ipairs(nodeEntry.PreviousNodes or {}) do
		local prevNodeEntry = MissionData.by.Name[nodeName][1]
		table.insert(previousNodes, ('[[%s|%s]], %s'):format(prevNodeEntry.Link, prevNodeEntry.Name, prevNodeEntry.Planet))
	end
	previousNodes = table.concat(previousNodes, '  
')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:Mission Node]]')
		:image(nodeEntry.Image or nodeEntry.Pic or nodeEntry.FactionImage, nil, not nodeEntry.Image and not nodeEntry.Pic and 'dark-invert')

		:group():header('%s', 'general-information')
			:row('Region', '%s', nodeEntry.Planet and '[['..nodeEntry.Planet..']][[Category:'..nodeEntry.Planet..']]', 'region')
			-- TODO: Refactor out MissionTypeData[nodeEntry.Type] into its own variable
			:row('MissionType', '%s', nodeEntry.Type and '[['..MissionTypeData[nodeEntry.Type].Link..'|'..nodeEntry.Type..']][[Category:'..nodeEntry.Type..' Mission]]', 'mission-type')
			:row('IsEndless', '%s', MissionTypeData[nodeEntry.Type].IsEndless and '✔️' or '❌', 'is-endless')
			:row('RewardRotation', '%s', MissionTypeData[nodeEntry.Type].IsEndless and 
					(MissionTypeData[nodeEntry.Type].RewardRotation or error('Error: Missing RewardRotation key in [[Module:Missions/data]]'))
					or nil, 'reward-rotation')
			:row('Boss', '%s', nodeEntry.Boss and '[['..nodeEntry.Boss..']]', 'boss')
			:row('Faction', '%s', controllingFactions, 'faction')
			:row('LevelRange', '%s', levelRange..'  
'..steelPathLevelRange, 'level-range')
			:row('FighterLevelRange', '%s', nodeEntry.IsRailjack and ('%s - %s'):format(nodeEntry.FighterMinLevel, nodeEntry.FighterMaxLevel),'fighter-level-range')
			:row('TileSet', '%s', nodeEntry.Tileset and '[['..nodeEntry.Tileset..']]', 'tile-set')
			:row('MasteryExp', '[[Mastery|%s]]', nodeEntry.MasteryExp and nodeEntry.MasteryExp, 'mastery-exp')
			:row('CreditReward', '[[Credits|%s]]', nodeEntry.CreditReward and Tooltip.icon('Credits', 'Resources')..Math.formatnum(nodeEntry.CreditReward), 'credit-reward')
			:row('AdditionalCreditReward', '%s', nodeEntry.AdditionalCreditReward and Tooltip.icon('Credits', 'Resources')..Math.formatnum(nodeEntry.AdditionalCreditReward), 'additional-credit-reward')
			:row('DarkSectorBonuses', '[[Dark Sectors|%s]]', nodeEntry.IsDarkSector and darkSectorBonuses or nil, 'dark-sector-bonuses')
			:row('RegionResources', '[[Region Resource|%s]]', regionResources, 'region-resources')
			:row('AdditionalRequirements', '%s', nodeEntry.Requirements and nodeEntry.Requirements or nil, 'additional-requirements')
			:row('IsHidden', '%s', nodeEntry.IsHidden and '✔️' or '❌', 'is-hidden')
			:row('NextNodes', '%s', nextNodes, 'next-nodes')
			:row('PreviousNodes', '%s', previousNodes, 'previous-nodes')
			:row('Introduced', '%s', nodeEntry.Introduced and Version._getVersionLink(nodeEntry.Introduced)..Version._getVersionCategory(nodeEntry.Introduced), 'introduced')
			:row('InternalName', '%s', nodeEntry.InternalName and ''..nodeEntry.InternalName..'', 'internal-name')
		:done()
	
	Infobox:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Missions/data|📝 %s]]', 'update-infobox-data')
	:done()
		
	return tostring(Infobox)
end
}
```

