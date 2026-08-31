--	
local Table = require([[Module:Table]])
local Tooltip = require([[Module:Tooltips]])
local DropTable = require([[Module:DropTables]])
local Vendor = require([[Module:Vendors]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local TextIcons = require([[Module:TextIcons]])
local Version = require ([[Module:Version]])
local ArcaneData = mw.loadData([[Module:Arcane/data]])
local DropData = mw.loadData([[Module:DropTables/data]])
local Lang = mw.language.new('en')

-- Trading tax for Rank 0 Arcanes
local TAX_MAP = {
	Common = 2000,
	Uncommon = 4000,
	Rare = 8000,
	Legendary = 100000,
}

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name'])
	local arcaneData = ArcaneData.Arcanes[name]
	
	assert(arcaneData ~= nil, 'buildInfobox(frame): "'..name..'" does not exist in [[Module:Arcane/data]]')
	
	local incompatibilityTags = {}
	for _, tag in ipairs(arcaneData.IncompatibilityTags or {}) do
		table.insert(incompatibilityTags, tag)
	end
	incompatibilityTags = table.concat(incompatibilityTags, ', ')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name)
		:wikitext('[[Category:Arcane Enhancements]]')
		:image(arcaneData.Image or 'Panel.png')
		:group()
			-- All Arcanes are tradable
			:caption('Tradable', '[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|<span style=\"color:var(--positive-text-color)\">%s</span>]]', 'tradable')
		:done()
		
		:group():header('%s', 'max-rank-description')
			:caption('Description', TextIcons.getIcon(arcaneData.Description, {class='icon'}) )
		:done()

		:group():header('%s', 'general-information')
			:row('Type', '%s', arcaneData.Type..'[[Category:'..arcaneData.Type..' Arcanes]]', 'type')
			:row('Rarity', '[[Rarity|%s]]', arcaneData.Rarity..'[[Category:'..arcaneData.Rarity..' Arcanes]]', 'rarity')
			:row('IsRefreshable', '[[File:RefreshTimerIcon.png|class=icon light-invert]] %s', arcaneData.IsRefreshable and '✔️' or '❌', 'refreshable')
			:row('IncompatibilityTags', '[[Compatibility Tag|%s]]', arcaneData.IncompatibilityTags and incompatibilityTags, 'incompatibility-tags')
			:row('MaxRank', '%s', arcaneData.MaxRank or 'N/A', 'max-rank')
			:row('ArcaneMax', 'Arcanes Required to Max', ((arcaneData.MaxRank + 1) * (arcaneData.MaxRank + 2)) / 2)
			:row('Dissolution', '[[Arcane Dissolution|%s]]', arcaneData.Dissolution and Tooltip.icon('Vosfor', 'Resources')..'&nbsp;'..arcaneData.Dissolution or 'Cannot Sell', 'dissolution')
			:row('TradingTax', '[[Trade System|%s]]', Tooltip.icon('Credits', 'Resources')..'&nbsp;'..Lang:formatNum(TAX_MAP[arcaneData.Rarity]), 'trading-tax')
			:row('Introduced', '%s', arcaneData.Introduced and Version._getVersionLink(arcaneData.Introduced)..Version._getVersionCategory(arcaneData.Introduced), 'introduced')
			--:row('InternalName', '%s', arcaneData.InternalName and '<code>'..arcaneData.InternalName..'</code>' or nil, 'internal-name')
		:done()
	
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	
	Infobox:group():header('%s', 'vendor-sources')
		:value(vendorStr, 'Offerings')
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Arcane/data|📝 %s]]', 'update-infobox-data')
	:done()
	
	return Infobox
end
}
