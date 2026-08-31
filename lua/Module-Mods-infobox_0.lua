---	'''Mods/infobox''' builds the infobox on mod pages and adds the 
--	appropriate category pages.<br />
--
--	@module		Mods
--	@alias		p
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Trajos|Trajos]]
--	@image		
--	@require	[[Module:Version]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Baro]]
--	@require	[[Module:InfoboxBuilder]]
--	@require	[[Module:Mods/data]]
--	@require	[[Module:TextIcons]]
--	@release	stable
--	
local Version = require([[Module:Version]])
local Polarity = require([[Module:Polarity]])
local Tooltip = require([[Module:Tooltips]])
local Vendor = require([[Module:Vendors]])
local Baro = require([[Module:Baro]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Lang = mw.language.new('en')	-- Using for number formatting
local ModData = mw.loadData([[Module:Mods/data]])
local TextIcons = require([[Module:TextIcons]])

local function makeMTooltip(modTable)
	local str = {}
	for _, modIndex in ipairs(modTable) do
		table.insert(str, Tooltip.full(modIndex, 'Mods'))
	end
	return table.concat(str, '<br />')
end

-- For calculating Endo cost to max a mod
-- Note that there exist additional displayed rarities (e.g. Peculiar, Requiem)
-- that share one of the below 4 values
local RARITY_EMUM = {
	Common = 1,
	Uncommon = 2,
	Rare = 3,
	Legendary = 4,
}

-- Trading tax of mod in Credits
local TAX_MAP = {
	Common = 2000,
	Uncommon = 4000,
	Rare = 8000,
	Legendary = 1000000,
}

return {
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local modData = ModData.Mods[name];
	
	assert(modData ~= nil, ('p.buildInfobox(frame): mod with name "%s" does not exist in [[Module:Mods/data]]'):format(name))
	
	local description = TextIcons.getIcon(modData.Description,{class='icon'})
	
	local endo, credit
	if modData.Rarity ~= nil and not modData.NotUpgradable then
		if modData.Type == 'Antique' then --Tektolyst Artifacts
			endo = Lang:formatNum(160 * RARITY_EMUM[modData.Rarity] * (math.pow(2, modData.MaxRank) - 1))
			credit = Lang:formatNum(5000 * RARITY_EMUM[modData.Rarity] * (math.pow(2, modData.MaxRank) - 1))
		else
			endo = Lang:formatNum(10 * RARITY_EMUM[modData.Rarity] * (math.pow(2, modData.MaxRank) - 1))
			credit = Lang:formatNum(483 * RARITY_EMUM[modData.Rarity] * (math.pow(2, modData.MaxRank) - 1))
		end
	else
		endo, credit = nil, nil
	end
	
	local incompatibilityTags = {}
	for _, tag in ipairs(modData.IncompatibilityTags or {}) do
		table.insert(incompatibilityTags, tag)
	end
	incompatibilityTags = table.concat(incompatibilityTags, ', ')
	
	local compatibilityTags = {}
	for _, tag in ipairs(modData.CompatibilityTags or {}) do
		table.insert(compatibilityTags, tag)
	end
	compatibilityTags = table.concat(compatibilityTags, ', ')
	
	-- TODO: Some reason this snippet does not output a non-empty string when modData.IncompatibilityTags is not nil nor empty
	-- while the above loop + table.concat works. Determine if this is an upstream issue with table.concat's implementation. 
	-- local incompatibilityTags = table.concat(modData.IncompatibilityTags, ', ')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name)
		:wikitext('[[Category:Mods]]')
		:image{
			{image=modData.Image,label='Full'},
			{image=modData.Icon, label='Icon'}
		}
		:group()
			:caption('Tradeable', modData.Tradable and '[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|<span style=\"color:var(--positive-text-color)\">Tradeable</span>]][[Category:Tradeable Mods]]' or '<span style=\"color:var(--negative-text-color)\">Untradeable</span>[[Category:Untradeable Mods]]')
			:caption('Exilus', modData.IsExilus and '[[:Category:Exilus Mods|<span style=\"color:var(--positive-text-color)\">EXILUS</span>]][[Category:Exilus Mods]]' or nil)
			:caption('Transmutable', modData.Transmutable and '[[Transmutation|<span style=\"color:var(--positive-text-color)\">Can be obtained from transmutation</span>]][[Category:Transmutable Mods]]' or '[[Transmutation|<span style=\"color:var(--negative-text-color)\">Cannot be obtained from transmutation</span>]][[Category:Untransmutable Mods]]')
			:caption('CodexSecret', modData.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
		:done()
		
		:group():header('%s', 'max-rank-description')
			:caption('Description', description)
		:done()

		:group():header('%s', 'general-information')
			:row('Type', '[[Mod/Compatibility|%s]]', modData.Type and modData.Type..'[[Category:'..modData.Type..' Mods]]', 'type')
			:row('Polarity', '[[Polarity|%s]]', modData.Polarity and Polarity._polarity(modData.Polarity)..' '..modData.Polarity..'[[Category:'..modData.Polarity..' Mods]]', 'polarity')
			:row('Rarity', '[[Rarity|%s]]', modData.Rarity and modData.Rarity..'[[Category:'..modData.Rarity..' Mods]]', 'rarity')
			:row('Class', '%s', modData.Class and modData.Class..'[[Category:'..modData.Class..' Mods]]', 'class')
			:row('CompatibilityTags', '[[Compatibility Tag|%s]]', modData.CompatibilityTags and compatibilityTags, 'compatibility-tags')
			:row('Incompatible', '[[Mod/Compatibility|%s]]', modData.Incompatible and makeMTooltip(modData.Incompatible), 'incompatible-mods')
			:row('IncompatibilityTags', '[[Compatibility Tag|%s]]', modData.IncompatibilityTags and incompatibilityTags, 'incompatibility-tags')
			:row('MaxRank', '%s', modData.MaxRank, 'max-rank')
			:row('EndoCost', '[[Endo]] Required To Max', endo)
			:row('CreditCost', '[[Credits]] Required To Max', credit)
			:row('BaseDrain', 'Base Capacity Cost', modData.BaseDrain)
			:row('TradingTax', '[[Trade System|%s]]', modData.Tradable and Tooltip.icon('Credits', 'Resources')..'&nbsp;'..Lang:formatNum(TAX_MAP[modData.Rarity]) or nil, 'trading-tax')
			:row('Introduced', '%s', modData.Introduced and Version._getVersionLink(modData.Introduced)..Version._getVersionCategory(modData.Introduced), 'introduced')
		:done()
	
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	local baroStr = Baro._buildBaroSourceStrings(name)
	
	Infobox:group():header('%s', 'vendor-sources')
		:value('<div class="tabber-borderless">'..frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		)..'</div>', 'Offerings')
	:done()
	:group():header('%s', 'official-drop-tables')
		:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
	:done()
	:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Mods/data|📝 %s]]', 'update-infobox-data')
	:done()
	
	return Infobox
end
}
