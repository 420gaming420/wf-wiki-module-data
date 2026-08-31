--	
local CompanionData = mw.loadData([[Module:Companions/data]])

local Math = require([[Module:Math]])
local Polarity = require([[Module:Polarity]])
local Tooltip = require([[Module:Tooltips]])
local Version = require([[Module:Version]])
local Vendor = require([[Module:Vendors]])
local Baro = require([[Module:Baro]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Lang = mw.language.new('en')	-- Using for number formatting

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end


local function attackGroup(Infobox, companion)
	if not companion or not companion.Attacks then return end
	for i, attackData in ipairs(companion.Attacks) do
		local attack = 'Attack'..i
		local elems = {}
		local highestDmgDistr = -1
		for damageType, dmg in pairs(attackData.Damage) do
			if highestDmgDistr < dmg then
				highestDmgDistr = dmg
				highestDmgDistrType = damageType
			end
			if damageType ~= 'Impact' 
			and damageType ~= 'Puncture' 
			and damageType ~= 'Slash' 
			then
				table.insert(elems, damageType)
			end
		end

		-- table.sort(elems)

		Infobox=Infobox
		:group():header(attackData.AttackName)
			:hgroup()
				:row(attack..'Impact', nil, attackData.Damage.Impact and 
					Tooltip.icon('Impact', 'DamageTypes', true)..' '..Math.formatnum(attackData.Damage.Impact), 'impact')
				:row(attack..'Puncture', nil, attackData.Damage.Puncture and 
					Tooltip.icon('Puncture', 'DamageTypes', true)..' '..Math.formatnum(attackData.Damage.Puncture), 'puncture')
				:row(attack..'Slash', nil, attackData.Damage.Slash and 
					Tooltip.icon('Slash', 'DamageTypes', true)..' '..Math.formatnum(attackData.Damage.Slash), 'slash')
		
				for _, elem in ipairs(elems) do Infobox=Infobox
				:row(attack..elem, nil,
					attackData.Damage[elem] and 
					 Tooltip.icon(elem, 'DamageTypes', true)..' '..Math.formatnum(attackData.Damage[elem]),
					elem
				)
				end Infobox=Infobox
			:done()
			:row(attack..'Total', '[[Damage|%s]]', ('%s (%s %s%%)'):format( -- 'total (highest elem %)'
				Math.formatnum(attackData.TotalDamage), 
				Tooltip.icon(highestDmgDistrType, 'DamageTypes', true), 
				Math.round(100 * highestDmgDistr / attackData.TotalDamage, 0.01)
			), 'total-damage')
			:row(attack..'CritChance', '[[Critical Hit|%s]]', attackData.CritChance and Math.round(100 * attackData.CritChance, 0.01)..'%', 'crit-chance')
			:row(attack..'CritMultiplier', '[[Critical Hit|%s]]', string.format("%.1fx", attackData.CritMultiplier), 'crit-multiplier')
			:row(attack..'StatusChance', '[[Status Chance|%s]]', attackData.StatusChance and Math.round(100 * attackData.StatusChance, 0.01)..'%', 'status-chance')
		:done()
	end
end

return {
buildInfobox = function(frame)
	local args = frame.args
	local name = args['Name']
	local companion = nil
	
	companion = CompanionData.Companions[name]
	
	assert(companion ~= nil, 'p.buildInfobox(frame): Missing "'..name..'" entry in [[Module:Companions/data]]')
	
	local imageGallery = {}
	table.insert(imageGallery, { image=companion.Image, label='In-Game Menus' })
	if companion['Icon'] ~= nil then
		table.insert(imageGallery, { image=companion.Icon, label='Icon' })
	end
	if companion['SquadPortrait'] ~= nil then
		table.insert(imageGallery, { image=companion['SquadPortrait'], label='Minimap' })
	end
	
	local compatibilityTags = {}
	for _, tag in ipairs(companion.CompatibilityTags or {}) do
		table.insert(compatibilityTags, tag)
	end
	compatibilityTags = table.concat(compatibilityTags, ', ')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/weapons.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:'..name..']][[Category:Companion]]')
		:image(imageGallery)
		:group()
			:caption('Tradable', companion.Tradable and "[[File:TradableIcon.png|x32px|class=icon dark-invert]] [[Trading|<span style=\"color:var(--positive-text-color)\">Tradeable</span>]]" or "[[Trading|<span style=\"color:var(--negative-text-color)\">Untradeable</span>]]")
			:caption('CodexSecret', companion.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
			:caption('UpdateInfoboxData', '[[Module:Companions/data|📝 %s]]', 'update-infobox-data')
		:done()
		:group():header('%s', 'description')
			:caption('Description', companion.Description and companion.Description)
		:done()
		:group():header('%s', 'general-information')
			:row('Type', '%s', companion.Type..'[[Category:'..companion.Type..']]', 'type')
			:row('MaxRank', '%s', companion.MaxRank or 30, 'max-rank')
			:row('Health', '[[Health|%s]]', companion.Health, 'health')
			:row('Shield', '[[Shield|%s]]', companion.Shield, 'shields')
			:row('Armor', '[[Armor|%s]]', companion.Armor, 'armor')
			:row('Polarities', '[[Mods#Polarity|%s]]', Polarity._pols(companion.Polarities), 'polarities')
		:done()
		
		attackGroup(Infobox, companion)
		
		Infobox:group():header('%s', 'miscellaneous')
			:row('Introduced', '%s', companion.Introduced and Version._getVersionLink(companion.Introduced)..Version._getVersionCategory(companion.Introduced), 'introduced')
			:row('CompatibilityTags', '[[Compatibility Tag|%s]]', companion.CompatibilityTags and compatibilityTags, 'compatibility-tags')
			:row('SellPrice', '%s', companion.SellPrice and (Tooltip.icon('Credits', 'Resources')..' '..Lang:formatNum(companion.SellPrice)), 'sell-price')
		:done()
	:done()
	
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	local baroStr = Baro._buildBaroSourceStrings(name)
	
	Infobox:group():header('%s', 'vendor-sources')
		:_row():addClass('tabber-borderless'):wikitext(frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		))
	:done()
	
	return Infobox
end
}
