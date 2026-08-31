local p = {}
local InfoboxBuilder = require('Module:InfoboxBuilder')
local ResourceData = mw.loadData([[Module:Resources/data]])
local pagename = mw.title.getCurrentTitle().fullText

function p.main(frame)
	local args = frame:getParent().args
	local resourceData = ResourceData.Resources[args.name or pagename]
	
	local tradeable_row = '[[Trading|'
	if args.tradeable then
		tradeable_row = tradeable_row .. frame:preprocess('{{text|red|Untradeable}}')
	else
		tradeable_row = tradeable_row .. frame:preprocess('{{text|green|Tradeable}}')
	end
	tradeable_row = tradeable_row .. ']]'
	
	local faction_row = nil
	if args.tileset_faction then
		faction_row = frame:preprocess('{{Faction|'..args.tileset_faction..'}}')
	end
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(args.name or pagename)
	:image(args.image or 'Mod.png')
	:caption(tradeable_row, tradeable_row)
	:group()
		:header('General Information')
		:row(nil, 'Introduced', args.introduced)
		:row(nil, '[[Planets|Planet]]', args.planet)
		:row(nil, '[[Tile Sets|Tile Set]]', args.tileset)
		:row(nil, '[[Factions|Tileset Faction]]', faction_row)
	:done()
	:group()
		:header('Species Information')
		:row(nil, 'Biome', args.Biome)
		:row(nil, 'Activity', args.Activity)
		:row(nil, 'Spears', args.Spears)
		:row(nil, 'Maximum', args.Maximum)
		:row(nil, 'Rarity', args.Rarity and (args.Rarity..'[[Category:'..args.Rarity..' Fish]]') or nil)
	:done()
	
	if (
		resourceData.ResourceBoostAble ~= nil or 
		resourceData.ResourceDropChanceBoostAble ~= nil or
		resourceData.RetrieverModAble ~= nil or
		resourceData.BountifulHarvestAble ~= nil
	) then
		Infobox:group():header('Can Be Boosted By')
			:srow('ResourceBoostAble', '[[File:30DayResourceBooster.png|x20px|link=Resource Booster]] [[Resource Booster|Resource Boost]]', 'resource_boost_able', 
				(resourceData.ResourceBoostAble == nil and '' or 
					(resourceData.ResourceBoostAble and 
						'✔️[[Category:Resources affected by Resource Booster]]' or
						'❌[[Category:Resources not affected by Resource Booster]]'
					)
				)
			)
			:srow('BountifulHarvestAble', '[[File:DecreeBountifulHarvest.png|x20px|link=Bountiful Harvest]] [[Bountiful Harvest]]', 'bountiful_harvest_able', 
				(resourceData.BountifulHarvestAble == nil and '' or 
					(resourceData.BountifulHarvestAble and 
						'✔️[[Category:Resources affected by Resource Booster]]' or
						'❌[[Category:Resources not affected by Resource Booster]]'
					)
				)
			)
			:srow('ResourceDropChanceBoostAble', '[[File:30DayResourceDropChanceBooster.png|x20px|link=Resource Drop Chance Booster]] [[Resource Drop Chance Booster|Drop Chance Booster]]', 'resource_drop_chance_booster_able', 
				(resourceData.ResourceDropChanceBoostAble == nil and '' or 
					(resourceData.ResourceDropChanceBoostAble and 
						'✔️[[Category:Resources affected by Resource Drop Chance Booster]]' or
						'❌[[Category:Resources not affected by Resource Drop Chance Booster]]'
					)
				)
			)
			:srow('ResourceDropChanceBlessAble', '[[File:MasteryRankBlessingResourceBooster(xBlack).png|x20px|link=Resource Drop Chance Blessing]] [[Resource Drop Chance Blessing|Drop Chance Blessing]]', 'resource_drop_chance_bless_able', 
				(resourceData.ResourceDropChanceBoostAble == nil and '' or 
					(resourceData.ResourceDropChanceBoostAble and 
						'✔️[[Category:Resources affected by Resource Drop Chance Booster]]' or
						'❌[[Category:Resources not affected by Resource Drop Chance Booster]]'
					)
				)
			)
			:srow('RetrieverModAble', '[[File:LoyalRetrieverMod.png|x20px|link=Retriever]] [[Retriever|Retriever Mods]]', 'retriever_mod_able', 
				(resourceData.RetrieverModAble == nil and '' or 
					(resourceData.RetrieverModAble and 
						'✔️[[Category:Resources affected by Retriever Mods]]' or
						'❌[[Category:Resources not affected by Retriever Mods]]'
					)
				)
			)
			:srow('SPDropChanceBoostAble', '[[File:CompleteSteelPathMissions.png|x20px|link=The Steel Path]] [[The Steel Path|SP Drop Chance Boost]]', 'sp_drop_chance_boost_able', 
				(resourceData.ResourceDropChanceBoostAble == nil and '' or 
					(resourceData.ResourceDropChanceBoostAble and 
						'✔️[[Category:Resources affected by Resource Drop Chance Booster]]' or
						'❌[[Category:Resources not affected by Resource Drop Chance Booster]]'
					)
				)
			)
		:done()
	end
	
	Infobox:group()
		:header('Miscellaneous')
		:row(nil, '[[Codex]]', args.codex_scans)
		:header('Drops')
		:row(nil, 'Resources', args.other_drops)
	:done()
	
	return Infobox
end

return p
