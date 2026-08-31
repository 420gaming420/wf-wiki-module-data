---
title: "Module:Resources/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Resources/infobox"
wiki_timestamp: "2026-05-07T03:22:55Z"
---

*Documentation for this module may be created at [Module:Resources/infobox/doc](/w/Module:Resources/infobox/doc?action=edit&redlink=1 "Module:Resources/infobox/doc (page does not exist)")*

```lua
--	
local Table = require([[Module:Table]])
local DropTable = require([[Module:DropTables]])
local Vendor = require([[Module:Vendors]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local ResourceData = mw.loadData([[Module:Resources/data]])
local DropData = mw.loadData([[Module:DropTables/data]])
local Version = require([[Module:Version]])
local TextIcons = require([[Module:TextIcons]])

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name'])
	local resourceData = ResourceData.Resources[name]
	if resourceData == nil then
		error('buildInfobox(frame): "'..name..'" does not exist in [[Module:Resources/data]]')
	end
	
	local description = TextIcons.getIcon(resourceData.Description,{class='icon'})
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:Resources]]')
		:image(resourceData.ContainerImage and { {image=resourceData.Image,label='Pickup'}, {image=resourceData.ContainerImage,label='Deposit'} }
			or resourceData.Image
			or 'Panel.png')
		:group()
			:caption('Tradable', resourceData.Tradable and "[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|Tradeable]][[Category:Tradeable Resources]]" or "[[Trading|Untradeable]][[Category:Untradeable Resources]]")
		:done()
		
		:group():header('Description')
			:caption('Description', description)
		:done()

		:group():header('%s', 'general-information')
			:row('Type', '%s', (resourceData.Type ~= 'Resource') and resourceData.Type..'[[Category:'..resourceData.Type..' Resources]]' or resourceData.Type, 'type')
			:row('Rarity', '[[Rarity|%s]]', resourceData.Rarity and resourceData.Rarity..'[[Category:'..resourceData.Rarity..' Resources]]' or '', 'rarity')
			:row('Amount', '%s', resourceData.Amount and resourceData.Amount[1]..'-'..resourceData.Amount[2]..'x', 'drop-amount')
			:row('Helminth', '[[Helminth#Secretions|Helminth Secretions]]', resourceData.HelminthCategory and resourceData.HelminthCategory..' ('..resourceData.HelminthCost..')[[Category:Helminth Resources]]' or '')
			:row('SellPrice', '%s', '[[File:Credits64.png|x20px|link=Credits]] '..(resourceData.SellPrice and resourceData.SellPrice or 'Cannot Sell'), 'sell-price')
			:row('SortingPriority', '%s', resourceData.SortingPriority and resourceData.SortingPriority, 'sorting-priority')
			:row('Introduced', '%s', resourceData.Introduced and Version._getVersionLink(resourceData.Introduced)..Version._getVersionCategory(resourceData.Introduced), 'introduced')
		:done()
		
	if (
		resourceData.ResourceBoostAble ~= nil or 
		resourceData.ResourceDropChanceBoostAble ~= nil or
		resourceData.RetrieverModAble ~= nil or
		resourceData.BountifulHarvestAble ~= nil
	) then
		Infobox:group():header('Can Be Boosted By')
			:srow('ResourceBoostAble', '[[File:ResourceBooster.png|x20px|link=Resource Booster]] [[Resource Booster]]', 'resource_boost_able', 
				(resourceData.ResourceBoostAble == nil and '' or 
					(resourceData.ResourceBoostAble and 
						'✔️[[Category:Resources affected by Resource Booster]]' or
						'❌[[Category:Resources not affected by Resource Booster]]'
					)
				)
			)
			:srow('BountifulHarvestAble', '[[File:DecreeBountifulHarvest.png|x20px|link=Bountiful Harvest]] [[Bountiful Harvest]] [[Decree]]', 'bountiful_harvest_able', 
				(resourceData.BountifulHarvestAble == nil and '' or 
					(resourceData.BountifulHarvestAble and 
						'✔️[[Category:Resources affected by Resource Booster]]' or
						'❌[[Category:Resources not affected by Resource Booster]]'
					)
				)
			)
			:srow('ResourceDropChanceBoostAble', '[[File:ResourceDropChanceBooster.png|x20px|link=Resource Drop Chance Booster]] [[Resource Drop Chance Booster|Drop Chance Booster]]', 'resource_drop_chance_booster_able', 
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
			:srow('SPDropChanceBoostAble', '[[File:CompleteSteelPathMissions.png|x20px|link=The Steel Path]] [[The Steel Path|SP Drop Chance Booster]]', 'sp_drop_chance_boost_able', 
				(resourceData.ResourceDropChanceBoostAble == nil and '' or 
					(resourceData.ResourceDropChanceBoostAble and 
						'✔️[[Category:Resources affected by Resource Drop Chance Booster]]' or
						'❌[[Category:Resources not affected by Resource Drop Chance Booster]]'
					)
				)
			)
			:caption('BoosterNote', 'Boosters only applies to in-mission pickups. It will not apply to end-of-mission rewards.')
		:done()
	end
	
	local VendorSourceString = Vendor._buildVendorSourceStrings(name)
	if (VendorSourceString ~= "") then
		Infobox:group():header('%s', 'vendor-sources')
			:value(Vendor._buildVendorSourceStrings(name))
		:done()
	end
	
	Infobox:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	
	Infobox:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Resources/data|📝 %s]]', 'update-infobox-data')
	:done()
	
	return Infobox
end
}
```

