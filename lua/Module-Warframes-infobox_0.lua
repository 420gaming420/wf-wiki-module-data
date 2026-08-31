--	
local WarframeData = mw.loadData([[Module:Warframes/data]])
local ConclaveData = mw.loadData([[Module:Warframes/Conclave/data]])

local Math = require([[Module:Math]])
local Table = require([[Module:Table]])
local Polarity = require([[Module:Polarity]])
local Tooltip = require([[Module:Tooltips]])
local Version = require([[Module:Version]])
local TextIcons = require([[Module:TextIcons]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Lang = mw.language.new('en')	-- Using for number formatting

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

return {
buildInfobox = function(frame)
	local args = frame.args
	local name = args['Name']
	local warframe = nil

	if args['Conclave'] == 'false' then
		warframe = WarframeData.Warframes[name] or WarframeData.Archwings[name] or
				WarframeData.Necramechs[name] or WarframeData.Operators[name]
	else
		warframe = ConclaveData.Warframes[name]
	end
	
	assert(warframe ~= nil, 'p.buildInfobox(frame): Missing "'..name..'" entry in [[Module:Warframes/data]]')
	
	local sexCategoryMap = {
	  ["Male"] = "Males",
	  ["Female"] = "Females",
	  ["Non-binary"] = "Non-binary"
	}
	
	local sexCategory = sexCategoryMap[warframe.Sex] or warframe.Sex
	
	local imageGallery = {}
	table.insert(imageGallery, { image=warframe.Image, label='Portrait' })
	if warframe['Helmet'] ~= nil then 
		table.insert(imageGallery, { image=warframe['Helmet'], label='Helmet' })
	end 
	for i, imageObj in ipairs(warframe.FullImages) do
		table.insert(imageGallery, { image=imageObj.Image, label=imageObj.TabName })
	end
	if warframe['SquadPortrait'] ~= nil then
		table.insert(imageGallery, { image=warframe['SquadPortrait'], label='Minimap' })
	end
	
	local description = TextIcons.getIcon(warframe.Description,{class='icon'})
	local passive = TextIcons.getIcon(warframe.Passive,{class='icon'})
	
	
	local playstyle = {}
	local playstyleMap ={
		["Crowd Control"] = "WarframeCC256.png",
		["Damage"] = "WarframeDamage256.png",
		["Stealth"] = "WarframeStealth256.png",
		["Support"] = "WarframeSupport256.png",
		["Survival"] = "WarframeSurvival256.png"
	}
	for _, ps in ipairs(warframe.Playstyle or {}) do
		table.insert(playstyle, '[[File:'..playstyleMap[ps]..'|class=icon light-invert]] '..ps)
	end
	playstyle = table.concat(playstyle, '<br/>')
	
	local auraPolarity = {}
	if warframe.AuraPolarity then
		if type(warframe.AuraPolarity) == 'string' then
			table.insert(auraPolarity, Polarity._polarity(warframe.AuraPolarity))
		else	-- For Jade Warframe that has two Aura slots
			for _, polarity in ipairs(warframe.AuraPolarity) do
				table.insert(auraPolarity, Polarity._polarity(polarity))
			end
		end
	end
	auraPolarity = table.concat(auraPolarity, ' ')
	
	local compatibilityTags = {}
	for _, tag in ipairs(warframe.CompatibilityTags or {}) do
		table.insert(compatibilityTags, tag)
	end
	compatibilityTags = table.concat(compatibilityTags, ', ')
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/warframes.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:'..name..']][[Category:'..warframe.Type..'s]]')
		:image(imageGallery)
		:group()
			:caption('CodexSecret', warframe.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
		:done()
		
		:group():header('%s', 'description')
			:caption('Description', warframe.Description and description)
		:done()
		
		:group():header('%s', 'passive')
			:caption('Passive', warframe.Passive and passive)
		:done()
		
		:group():header('%s', 'abilities')
			:row('Ability1', '%s', Tooltip.full(warframe.Abilities[1], 'Ability'), 'first-ability')
			:row('Ability2', '%s', Tooltip.full(warframe.Abilities[2], 'Ability'), 'second-ability')
			:row('Ability3', '%s', Tooltip.full(warframe.Abilities[3], 'Ability'), 'third-ability')
			:row('Ability4', '%s', Tooltip.full(warframe.Abilities[4], 'Ability'), 'fourth-ability')
		:done()
		
		:group():header('%s', 'general-information')
			:row('Sex', '%s', warframe.Sex and (warframe.Sex .. '[[Category:' .. sexCategory .. ']]'), 'sex')
			:row('Mastery', '[[Mastery Rank|%s]]', warframe.Mastery or '0', 'mastery-rank-requirement')
			:row('MaxRank', '%s', warframe.MaxRank, 'max-rank')
			:row('Health', '[[Health|%s]]', warframe.Health and warframe.Health..' ('..(warframe.HealthRank30 or warframe.Health+100)..' at Rank 30)', 'health')
			:row('Shield', '[[Shield|%s]]', warframe.Shield and warframe.Shield..' ('..(warframe.ShieldRank30 or warframe.Shield+100)..' at Rank 30)', 'shields')
			:row('Armor', '[[Armor|%s]]', warframe.ArmorRank30 and warframe.Armor..' ('..warframe.ArmorRank30..' at Rank 30)' or warframe.Armor, 'armor')
			:row('Energy', '[[Energy Capacity|%s]]', warframe.Energy and warframe.Energy..' ('..(warframe.EnergyRank30 or warframe.Energy+50)..' at Rank 30)', 'energy')
			:row('InitialEnergy', '[[Energy Capacity#Starting Energy|%s]]', warframe.InitialEnergy and warframe.InitialEnergy, 'initial-energy')
			:row('Sprint', '[[Sprint Speed|%s]]', Lang:formatNum(warframe.Sprint), 'sprint-speed')
			:row('Mobility', '[[Mobility|%s]]', warframe.Mobility and Lang:formatNum(warframe.Mobility), 'mobility')
			:row('Stamina', '%s', warframe.Stamina, 'stamina')
			:row('Playstyle', '[[Playstyle|%s]]', warframe.Playstyle and playstyle or 'N/A', 'playstyle')
			:row('AuraPolarity', '[[Aura|%s]]', warframe.AuraPolarity and auraPolarity or 'None', 'aura-polarity')
			:row('ExilusPolarity', '[[Exilus Adapter|%s]]', warframe.ExilusPolarity and Polarity._polarity(warframe.ExilusPolarity)  or 'None', 'exilus-polarity')
			:row('Polarities', '[[Mods#Polarity|%s]]', Polarity._pols(warframe.Polarities), 'polarities')
			:row('Introduced', '%s', warframe.Introduced and Version._getVersionLink(warframe.Introduced)..Version._getVersionCategory(warframe.Introduced), 'introduced')
			:row('Themes', '%s', warframe.Themes, 'themes')
			:row('Progenitor', '[[Adversary System#Progenitor Warframe|%s]]', warframe.Progenitor and Tooltip.full(warframe.Progenitor, 'DamageTypes'), 'progenitor-element')
			:row('Subsumed', '[[Helminth#Ability Replacement|%s]]', warframe.Subsumed and Tooltip.full(warframe.Subsumed, 'Ability'), 'subsumed-ability')
			:row('Tactical', '[[Railjack/Tactical Menu#Ability Kinesis|%s]]', warframe.Tactical and Tooltip.full(warframe.Tactical, 'Ability'), 'tactical-ability')
			:row('CompatibilityTags', '[[Compatibility Tag|%s]]', warframe.CompatibilityTags and compatibilityTags, 'compatibility-tags')
			:row('SellPrice', '%s', warframe.SellPrice and (Tooltip.icon('Credits', 'Resources')..' '..Lang:formatNum(warframe.SellPrice)), 'sell-price')
		:done()
		:group():header('%s', 'official-drop-tables')
			:caption('official-drop-tables', 'https://www.warframe.com/droptables', 'official-drop-tables')
		:done()
		:group():header('%s', 'maintenance')
			:caption('UpdateInfoboxData', '[[Module:Warframes/data|📝 %s]]', 'update-infobox-data')
		:done()
	:done()

	return Infobox:_dump(warframe)
end
}
