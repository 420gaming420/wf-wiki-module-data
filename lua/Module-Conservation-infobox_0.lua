local ConservationData = require('Module:Conservation/data')

local Infobox = require('Module:InfoboxBuilder')
local Version = require('Module:Version')
local Tooltip = require('Module:Tooltips')
local Math = require('Module:Math')
local DropData = mw.loadData([[Module:DropTables/data]])

return {
---	Builds an infobox for a conservation animal page.
--	@function		p.buildInfobox
--	@param			{table} frame Frame object or animal name if calling within other modules
--	@returns		{string} Resultant wikitext of infobox element
buildInfobox = function(frame)
	local animalName = frame.args and frame.args[1] or frame
	assert(animalName, 'p.buildInfoBox(frame): empty frame arguments')
	local animal = ConservationData['Animals'][animalName] or
			error('p.buildInfoBox(frame): "'..animalName..'" does not exist in [[Module:Conservation/data]]')
	
	local image = ''
	do
		local images = { animal.FullImg, animal.CodexImg, animal.InGameImg, animal.OtherImg }
		local imagesize = 0
		for i, v in pairs(images) do
			imagesize = imagesize + 1
		end
		if imagesize > 1 then
			local map = { 'Full', 'Codex', 'In-game', 'Other' }
			image = { '<gallery>' }
			for i, v in pairs(images) do
				table.insert(image, ('%s|%s'):format(v,map[i]))
			end
			table.insert(image, '</gallery>')
			image = table.concat(image, '\n')
		else
			if imagesize == 1 then
				for i, v in pairs(images) do
					image = v
					break
				end
			end
		end
	end

	local age = ('%d year%s %d month%s - <br />%d year%s %d month%s')
		:format(
			animal.MinAge.Year,	animal.MinAge.Year	== 1 and '' or 's',
			animal.MinAge.Month, animal.MinAge.Month == 1 and '' or 's',
			animal.MaxAge.Year,	animal.MaxAge.Year	== 1 and '' or 's',
			animal.MaxAge.Month, animal.MaxAge.Month == 1 and '' or 's',
		nil)
	
	local tag = Tooltip.icon(animalName..' Tag', 'Resources')
	local standingTT = Tooltip.icon('Standing', 'Resources')
	local capture = ('%s3&nbsp;%s, %s%s (Perfect)<br />2&nbsp;%s, %s%s (Good)<br />1&nbsp;%s, %s%s (Bad)')
		:format(
			(animal.Reward ~= nil and animal.Reward ~= '') and ('[[%s]] [[Standing]]<br />'):format(animal.Reward:gsub(' Standing$', '')) or '',
			tag, standingTT, Math.formatnum((animal.Standing or 0) * 2  ),
			tag, standingTT, Math.formatnum((animal.Standing or 0) * 1.5),
			tag, standingTT, Math.formatnum((animal.Standing or 0)      )
		)

	local resources, others = {}, {}
	local animalDrops = DropData.Enemies[animalName]

	-- Proliferating drop lists from each possible drop table that an animal can have
	-- TODO: Refactor drop list builder in a local function
	-- TODO: This can be refactored into Module:DropTables since that module contains definitions of
	-- item table entries via constants (e.g. ITEM_CHANCE_COL)
	if (animalDrops and not animalDrops._IgnoreEntry) then
		-- Item type to module name (e.g. 'Mod' to 'Mods' for Module:Mods)
		local itemTypeModuleMap = {
			Resource = 'Resources',
		}
		for _, resource in ipairs(animalDrops.Resources or {}) do
			table.insert(resources, ('%s%s&nbsp;%0.2f%%'):format(
				resource[4] and resource[4]..'&nbsp;' or '',
				require('Module:Tooltips/icon')['Resources'](resource[1]) and Tooltip.full(resource[1], 'Resources') or '[['..resource[1]..']]',
				animalDrops.ResourceChance * resource[3] / 100
			))
		end
	end

	local infobox = Infobox('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(animalName)
	:image(image or 'Panel.png')
	:group()
		:caption('UpdateInfoboxData', '[[Module:Conservation/data|📝 %s]]', 'update-infobox-data')
	:done()
	:header('%s', 'general-information')
	:row('Origin', 'Origin', animal.Origin or 'Unknown')
	:row('Faction',	'%s', animal.Faction or 'Wild', 'faction')
	:row('Rarity', '[[Rarity]]', animal.Rarity)
	:row('TranqsNeeded', 'Tranq Shots Needed', animal.TranqsNeeded or 1)
	:group():header('%s', 'statistics')
		:row('Health', '[[Health]]', animal.Health or '?')
		:row('Armor', '[[Armor]]', animal.Armor or '?')
		:row('ArmorDR', 'Dmg.&nbsp;Reduction', ('%.0f%%'):format(100 * (animal.Armor / (animal.Armor + 300) ) ) )
		:row('Weight', 'Weight', animal.MinWeight..' kg - '..animal.MaxWeight..' kg')
		:row('Age', 'Age', age)
	:done()
	
	:group():header('%s', 'miscellaneous')
		:row('Reward', 'Capture Reward', capture)
		:row('CodexScans', '[[Codex]] Scan', animal.CodexScans or '?')
		:row('Introduced', '%s', Version.getVersionLink(animal.Introduced)..Version._getVersionCategory(animal.Introduced) or '?', 'introduced')
		:header(animal.Call and 'Call')
		:caption('CallFile', animal.Call and '[[File:'..animal.Call..']]' or 'N/A')
	:done()
	
	:group():header('%s', 'drops')
		:caption('NoDrops', true
			and not next(resources)
			and not next(others)
			and 'None[[Category:Enemies With No Drops]]' or nil)
		:row('ResourceDrops', '[[Resources|Resource Drops]]', table.concat(resources, '<br />'))
		-- Editor override on articles; these drops are not listed in M:DropTables/data
		:row('OtherDrops', 'Other Drops', table.concat(others, '<br />'))
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	
	return infobox
end
}
