---	'''Tooltips/tip''' builds the tooltip box of a tooltip.
--	CSS stylesheet for tooltips can be found on [[MediaWiki:Gadget-Tooltips.css]].
--	
--	@module		tooltips/tip
--	@author		[[User:Gigamicro|Gigamicro]]
--	@image		TooltipPic.png
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Companions/data]]
--	@require	[[Module:Void/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Icon/data]]
--	@require	[[Module:DamageTypes/data]]
--	@require	[[Module:Arcane/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Focus/data]]
--	@require	[[Module:Sigils/data]]
--	@require	[[Module:Factions/data]]
--	@require	[[Module:Enemies/data]]
--	@require	[[Module:Decrees/data]]
--	@require	[[Module:Keys/data]]
--	@require	[[Module:Cosmetics/data]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:DamageTypes]]
--	@require	[[Module:Delay]]
--	@require	[[Module:Version]]
--	@release	stable
--	

-- Regex for capturing multi-line strings in code
--(?<=\[==\[)[\s\S]+?(?=\]==\])
--.{180,}

local Delay = require([[Module:Delay]])

---	Simple tooltip wikitext template.
--	@function		simpleTooltip
--	@param			{string} img Item image file name
--	@param			{string} name Item name
--	@param			{string} desc Item description
--	@return			{string} Wikitext of resultant tooltip
--	@local
local function simpleTooltip(img, name, desc)
	return([==[
{| class="tt-tooltip-container"
|-
|
{| class="tt-subtable"
|-
| class="tt-image" | [[File:%s|160px]]
|-
| class="tt-spacer" |
|-
! class="tt-title" |%s
|-
| class="tt-spacer" |
|-
| class="tt-description" | %s
|}
|-
|}]==]):format(
		img or "Panel.png",
		name or 'Item',
		desc or 'nil'
	)
end

return {
---	Builds Warframe ability tooltip.
--	@function		Ability
--	@param			{string} name Name of ability
--	@return			{string} wikitext for tooltip
Ability = function(name)
	if name == nil or name == '' then
		error('No ability specified')
	end
	
	local ability = mw.loadData([[Module:Ability/data]])["Ability"][name] or mw.loadData([[Module:Ability/data]])["Archived"][name]
	local TextIcons = require([[Module:TextIcons]])

	if type(ability) ~= 'table' then
		error('No ability "'..name..'" found in [[Module:Ability/data]]')
	end

	-- TODO: put drain here

	return ([==[
<div style="display:inline-block;">
{| class="tt-tooltip-container"|-
|
{| class="tt-subtable" style="width:600px;"|-
| class="tt-spacer"| [[File:%s|180px]]
| class="tt-spacer"|
| class="tt-data" style="text-align:center; width:64px; padding:2px;"|[[File:%s|48px]]<br/>
<div style="display:inline-block;">
<div style="display:inline-block;">[[File:%s|18px]]</div> 
<span style="font-size:14px; font-weight:bold;">%s</span>
</div>
<br>
<div style="display:inline-block;">
<span style="position:relative;background-color:#272727;color:white;padding:1px 4px;border:2px solid #aaadb4;border-radius:5px;font-size:12px;">%s</span>
</div>
| class="tt-spacer"|
| class="tt-description"|<span style="font-weight:bold; font-size:15px;">%s</span> (%s)<br/><br/>%s
|}
|}</div>]==]):format(
		ability["CardImage"], 
		ability["Icon"],
		({energy='EnergyOrb.png', time='AbilityDurationBuff.png', shield='IconShield.png', mutation='MutationGauge.png'})[ability["CostType"] or 'energy'],
		ability["Cost"],
		ability["Key"] or '∅', 
		ability["Name"] or name, ability["Powersuit"], TextIcons.getIcon(ability["Description"], {size=14})
	)
end,

---	Builds mod tooltip.
--	@function		Mods
--	@param			{string} name Name of Mod
--	@return			{string} wikitext for tooltip
Mods = function(name)
	if name == nil or name == '' then
		error('No mod specified')
	end
	
	local ModData = mw.loadData [[Module:Mods/data]]
	local Mod =  ModData['Mods'][name] or ModData['DefaultUpgrades'][name]
	
	if Mod == nil then
		error('No mod "'..name..'" found in [[Module:Mods/data]]')
	end
	-- TODO: Wrap this around unstylized tooltip container
	return ('[[File:%s|192px]]'):format(Mod.Image or 'Mod.png')
end,

---	Builds Warframe tooltip.
--	@function		Warframes
--	@param			{string} name Name of Warframe
--	@return			{string} wikitext for tooltip
Warframes = function(name)
	if name == nil or name == '' then
		error('No name input')
	end

	local warframe = mw.loadData [[Module:Warframes/data]]
	warframe = warframe["Warframes"][name] or warframe["Archwings"][name] or warframe["Necramechs"][name]
	
	if warframe == nil then
		error('No Warframe "'..(name or '<nil>')..'" found in [[Module:Warframes/data]]')
	end
	
	local Polarity = require [[Module:Polarity]]
	
	-- Building abilities list
	local abils
	do
		local abilData = mw.loadData [[Module:Ability/data]]
		
		local abilities = warframe.Abilities
		local t = {}
		for i, abilname in ipairs(abilities or {}) do
			t[i] = ('[[File:%s|30px]] %s'):format(
				abilData['Ability'][abilname]['Icon'] or 'Panel.png',
				abilname
			)
		end
		abils = table.concat(t,'<br/>')
	end
	
	local playstyle = {}
	for _, ps in ipairs(warframe.Playstyle or {}) do
		table.insert(playstyle, ps)
	end
	playstyle = table.concat(playstyle, ', ')
	
	return ([==[
{| class="tt-tooltip-container" |-
|
<div style="position:relative;">
{| class="tt-subtable" |-
| class="tt-image" style="height:120px; padding-bottom:0;" | [[File:%s|120px]]
<div class="tt-top-text defColor">[[File:MasteryAffinity64.png|28px]]<div style="position:absolute;top:4px; left:%gpx;">%s</div></div>
|-
| class="tt-spacer" |
|-
! class="tt-title" | %s
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;" |-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">Playstyle</span>&nbsp;%s
|-
| class="tt-table-half" |<span class="tt-link-text">Health</span>&nbsp;%.0f (%.0f)
| class="tt-table-half" |<span class="tt-link-text">Armor</span>&nbsp;%.0f %s
|-
| class="tt-table-half" |<span class="tt-link-text">Shield</span>&nbsp;%.0f (%.0f)
| class="tt-table-half" |<span class="tt-link-text">Energy</span>&nbsp;%.0f (%.0f)
|-
| class="tt-table-half" |<span class="tt-link-text">Aura Pol</span>&nbsp;%s
| class="tt-table-half" |<span class="tt-link-text">Exilus Pol</span>&nbsp;%s
|-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">Polarities</span>&nbsp;%s
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;" |-
| class="tt-data" style="padding:4px; text-align:left;"|%s
|}
|}
</div>
|}]==]):format(
		warframe.Portrait,
		(warframe.Mastery or 0) >= 10 and 5 or 9.5,
		warframe.Mastery or 0,
		warframe.Name,
		playstyle or "N/A",
		warframe.Health or 0, warframe.HealthRank30 or warframe.Health + 100,
		warframe.Armor  or 0, warframe.ArmorRank30 and ('(%.0f)'):format(warframe.ArmorRank30) or '',
		warframe.Shield or 0, warframe.ShieldRank30 or warframe.Shield + 100,
		warframe.Energy or 0, warframe.EnergyRank30 or warframe.Energy + 50,
		type(warframe.AuraPolarity) == 'table' and Polarity._pols(warframe.AuraPolarity, true) or Polarity._polarity(warframe.AuraPolarity or 'None', true),
		Polarity._polarity(warframe.ExilusPolarity or 'None', true),
		Polarity._pols(warframe.Polarities, true),
		abils
	)
end,

---	Builds Companion tooltip.
--	@function		Companions
--	@param			{string} name Name of companion
--	@return			{string} wikitext for tooltip
Companions = function(name)
	if name == nil or name == '' then
		error('No name input')
	end

	local companion = mw.loadData [[Module:Companions/data]] ["Companions"] [name]
	if companion == nil then
		error('No companion "'..(name or '<nil>')..'" found in [[Module:Companions/data]]')
	end
	
	local function getAttack(attack)
		local Weapon = require([[Module:Weapons/data/companion]])[attack]
		if not Weapon then return '' end
		
		local Weapons = require([[Module:Weapons]])	-- p._statRead() and p._statFormat()
		local DamageTypes = require([[Module:DamageTypes]]) -- p.iterationOrderArray and p.procIcon()
		
		local Attack = Weapons._getAttack(Weapon)
		local weapatk = Attack
		local function statRead(...)
			return Weapons.__StatObject.statRead(weapatk, ...)
		end
		local function statFormat(...)
			return Weapons.__StatObject.statFormat(weapatk, ...)
		end
		
		local damageTable = {}
		for _, damageType in ipairs(DamageTypes.iterationOrderArray) do
			local dmg = Attack.Damage[damageType]
			if (dmg ~= nil) then
				table.insert(damageTable, ("| style=\"padding-right:4px;\" |%s&thinsp;%s"):format(DamageTypes.procIcon(damageType), dmg))
			end
		end
		return ([=[
{| class="tt-data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | <span class="tt-link-text">%s</span>
|-
%s
|}
{| class="tt-data" style="font-size:12px;"
|-
| <span class="tt-link-text">Crit</span> || %s &#124; %s
|-
| <span class="tt-link-text">Status</span> || %s
|-
|}
|-
| class="tt-spacer" |
|-
|
]=]):format(
			attack,
			table.concat(damageTable, '|'),
			statFormat('CritChance'),
			statFormat('CritMultiplier'),
			statFormat('StatusChance')
		)
	end
	
	-- local Polarity = require [[Module:Polarity]]
	local icon = companion.Icon or ({Sentinel = 'IconSentinel.png'})[companion.Type] or nil
	
	return ([==[
{| class="tt-tooltip-container" |-
|
<div style="position:relative;">
{| class="tt-subtable" |-
| class="tt-image" style="height:160px; padding-bottom:0;" | [[File:%s|160px]]
<div class="tt-top-text defColor" style="left: 5px;">[[File:MasteryAffinity64.png|28px]]<div style="margin-top:-26px;">%s</div></div>
<div class="tt-top-text defColor" style="top:10px;right:12px;">%s</div>
|-
| class="tt-spacer" |
|-
! class="tt-title" | %s
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;" |-
| class="tt-table-half" |<span class="tt-link-text">Health</span>&nbsp;%.0f
| class="tt-table-half" |<span class="tt-link-text">Armor</span>&nbsp;%.0f
|-
| class="tt-table-half" |<span class="tt-link-text">Shield</span>&nbsp;%.0f
| class="tt-table-half" |<span class="tt-link-text">Energy</span>&nbsp;%.0f
|}
|-
| class="tt-spacer" |
|-
|
%s{| class="tt-data" style="font-size:12px; text-align:center;"
|<span class="tt-link-text">Description</span>
|-
| style="word-wrap: break-word; white-space: normal;" |%s
|-
|}
|-
|}
</div>
|}]==]):format(
		companion.Image,
		companion.Mastery or 0,
		icon and '[[File:'..icon..'|28px]]' or companion.Type,
		companion.Name,
		companion.Health or 0,
		companion.Armor  or 0,
		companion.Shield or 0,
		companion.Energy or 0,
		companion.Attacks and getAttack(companion.Attacks[1].AttackName) or '',
		companion.Description or ''--,
		-- Polarity._polarity(companion.AuraPolarity   or 'None', true),
		-- Polarity._polarity(companion.ExilusPolarity or 'None', true),
		-- Polarity._pols(companion.Polarities, true)
-- |-
-- | style="text-align:center;" colspan=2 |<span class="tt-link-text">Polarities</span>&nbsp;%s | %s | %s
	)
end,

---	Builds Void Relic tooltip.
--	@function		Void
--	@param			{string} name Name of Void Relic
--	@return			{string} wikitext for tooltip
Void = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local Relic = mw.loadData [[Module:Void/data]] ['RelicData'] [name]
	if Relic == nil then
		error('No relic "'..(name or '<nil>')..'" found in [[Module:Void/data]]')
	end
	
	local Version = require [[Module:Version]]
	local versionLink = Version._getVersionLink(Relic.Introduced)
	local Math = Delay.require([[Module:Math]])
	
	local WeaponData = require([[Module:Weapons/data]])
	local WarframeData = Delay.mw.loadData([[Module:Warframes/data]])
	local ArchwingData = Delay.mw.loadData([[Module:Warframes/data]])
	local CompanionData = Delay.mw.loadData([[Module:Companions/data]])
	local ResourceData = Delay.mw.loadData([[Module:Resources/data]])
	local ModData = Delay.mw.loadData([[Module:Mods/data]])
	
	local function Icon(drop)
		local itemName = drop.Item

		-- TODO: Explore if we can add Kavasa Prime parts to [[Module:Resources/data]]
		if itemName == 'Kavasa Prime' then
			return 'KavasaPrimeKubrowCollar.png'
		else
			return WeaponData[itemName] and WeaponData[itemName]['Image'] or 
					WarframeData['Warframes'][itemName] and WarframeData['Warframes'][itemName]['Image'] or 
					ArchwingData['Archwings'][itemName] and ArchwingData['Archwings'][itemName]['Image'] or 
					CompanionData['Companions'][itemName] and CompanionData['Companions'][itemName]['Image'] or
					ResourceData['Resources'][itemName] and ResourceData['Resources'][itemName]['Image'] or
					ModData['Mods'][itemName] and ModData['Mods'][itemName]['Image'] or
					'Panel.png'
		end
	end

	local rarityColor = { Common = "#9C7344", Uncommon = "#D3D3D3", Rare = "#D1B962" }
	local function ItemDrops()
		local result = ""
		
		for i, drop in ipairs(Relic.Drops) do
			result = result .. ([==[
| class="tt-image" style="border: 2px solid %s;" | [[File:%s|x64px]]
| style="vertical-align:center;  padding-left: 1em;" | %s%s<br/>%s [[File:Icon%s.png|x32px]]
|-
]==]):format(
				rarityColor[drop.Rarity],
				Icon(drop),
				drop.ItemCount and (Math.formatnum(drop.ItemCount)..' X ') or '',
				drop.Item,
				drop.Part,
				drop.Rarity
			)
		end
		
		return result
	end

	return ([==[
{| class="tt-tooltip-container"
|-
|
{| class="tt-relic tt-subtable"
|-
| class="tt-data" |
{|
%s
|}
|-
| class="tt-spacer" |
|-
! class="tt-title" | %s
|-
| class="tt-spacer" |
|-
| class="tt-data" |
{|
| colspan=2 style = "text-align: center;" | '''%s'''
|-
| colspan=2 style = "text-align: center;" | Introduced: '''%s'''
|-
|}
|}
|}]==]):format(
		ItemDrops(),
		Relic.Name .. " Relic",
		(Relic.Vaulted ~= nil) and 'Vaulted' or 'Unvaulted',
		versionLink
	)
end,

---	Builds weapon tooltip.
--	@function		Weapons
--	@param			{string} name Name of Weapon
--	@param			{string} slot Slot of Weapon (optional)
--	@return			{string} wikitext for tooltip
Weapons = function(name, slot)
	if name == nil or name == '' then
		error('No name input')
	end
	
	-- get weapon
	local Weapon = type(name) == 'table' and name.Name and name or
		require([[Module:Weapons/data]]..(slot ~= '' and '/'..slot:lower() or ''))[name] or
		error('No weapon "'..name..'" found in [[Module:Weapons/data]]')
		--[name:gsub('^Dark Split%-Sword$','Dark Split-Sword (Dual Swords)')]
	
	local Weapons = require([[Module:Weapons]])	-- p._statRead() and p._statFormat()
	local DamageTypes = require([[Module:DamageTypes]]) -- p.iterationOrderArray and p.procIcon()
	local Polarity = require([[Module:Polarity]])
	
	local Attack = Weapons._getAttack(Weapon)
	local weapatk = Attack
	local function statRead(...)
		return Weapons.__StatObject.statRead(weapatk, ...)
	end
	local function statFormat(...)
		return Weapons.__StatObject.statFormat(weapatk, ...)
	end
	
	local slot = statRead('Slot')
	
	-- Don't want to statFormat(weap, 'Polarities') b/c we need to also invert icons
	-- regardless of site theme b/c of dark tooltip background. statFormat passes
	-- through Polarity._polarity(Weapon[key])
	-- TODO: Read into documentation to see if statFormat allows passing an argument into 
	-- the tail function (e.g. statFormat(weap, 'Polarities', true) -> Polarity._polarity(weap['Polarities'], true))
	local function getStanceExilusPolarity()
		local key = slot == 'Melee' and 'StancePolarity' or 'ExilusPolarity'
		if (Weapon[key] == nil) then
			return 'N/A'
		end
		return Polarity._polarity(Weapon[key], true)
	end
	
	local damageTable = {}
	for _, damageType in ipairs(DamageTypes.iterationOrderArray) do
		local dmg = Attack.Damage[damageType]
		if (dmg ~= nil) then
			table.insert(damageTable, ("| style=\"padding-right:4px;\" |%s&thinsp;%s"):format(DamageTypes.procIcon(damageType), dmg))
		end
	end
	
	-- 2D array/matrix to map where elements will be rendered on the tooltip
	-- (imagine dividing rectangle tooltip box into grids)
	-- Each table element should have stat name, stat value/default value
	local vals = { {}, {}, {}, {} }

	vals[1][1] = { 'Slot', slot:gsub('Atmosphere', 'Atmo') }

	vals[2] = {
		{ 'Crit', statFormat('CritChance'), statFormat('CritMultiplier') },
		{ 'Status', statFormat('StatusChance') }
	}
	vals[2][1][2], vals[2][1][3] = ('%s | %s'):format(vals[2][1][2], vals[2][1][3]), nil

	if slot == "Melee" or slot == "Archmelee" then
		--vals[1][1]
		vals[1][2] = { "Type", Weapon.Class or '' }
		--vals[2][1], vals[2][2]
		vals[3][1] = { "Atk. Speed", statRead('AttackSpeed') }
		vals[3][2] = { "Slide Atk.", statFormat('SlideAttack') }
		vals[4][1] = { "Range", statFormat('MeleeRange') }
		vals[4][2] = { "Follow Thru", statFormat('FollowThrough') }
	else -- Gun
		--vals[1][1]
		vals[1][2] = { "Trigger", statFormat('Trigger') }
		--vals[2][1], vals[2][2]
		if statRead('ChargeTime') > 0 then
			vals[3][1] = { "Charge Time", statFormat('ChargeTime') }
		else
			vals[3][1] = { "Fire Rate", statRead('FireRate') }
		end
		vals[3][2] = { "Multishot", statRead('Multishot') }
		vals[4][1] = { "Reload", statFormat('Reload') }
		vals[4][2] = { "Ammo", ('%s&thinsp;/&thinsp;%s'):format(
			statRead('Magazine'), statRead('AmmoMax')
		):gsub('&thinsp;/&thinsp;%z','') }
	end

	return (([==[
<div style="display:inline-block;">
{| class="tt-tooltip-container"
|-
|<div style="position:relative;">
{| class="tt-subtable"
|-
| class="tt-image" style="height:120px;" | <div style="position:relative;z-index:2;">[[File:%s|160px]]</div>
<div class="tt-top-text defColor" style="left: 5px;">[[File:MasteryAffinity64.png|28px]]<div style="margin-top:-26px;">%s</div></div>
|-
| class="tt-spacer" |
|-
! class="tt-title" | %s
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;"
|-
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | <span class="tt-link-text">%s</span>
|-
%s
|-%s
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;"
|-
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
|-
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
|-
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
| class="tt-table-half" |<span class="tt-link-text">%s</span>&nbsp;%s
|-
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;"
|-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">%s</span>&nbsp;%s
|-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">%s</span>&nbsp;%s
|-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">%s</span>&nbsp;%s
|-
| style="text-align:center;" colspan=2 |<span class="tt-link-text">%s</span>&nbsp;%s
|-
|}
|}
</div>
|}
</div>]==]):format(
			statRead('Image'), -- Top image
			statRead('Mastery'), -- Mastery rank lock
			Weapon.Name,
			vals[1][1][1], vals[1][1][2], vals[1][2][1], vals[1][2][2], -- Slot/Type; Slot/Trigger
			statRead('AttackName'),	-- Name of attack that is displayed
			table.concat(damageTable,'|'),	-- Damage type values for single projectile
			-- Total damage display
			(statRead('Multishot') > 1 or statRead('BiasPortion') < 1) and string.format(
				"\n| colspan=4 |%s (%s %s)\n|-",
				statFormat('TotalDamage'), statFormat('BiasPortion'), statFormat('BiasType')
			) or '',
			vals[2][1][1], vals[2][1][2], vals[2][2][1], vals[2][2][2], -- Crit chance, crit multi, status chance
			vals[3][1][1], vals[3][1][2], vals[3][2][1], vals[3][2][2], -- Fire Rate/Multishot; Atk. Speed/Slide Atk.
			vals[4][1][1], vals[4][1][2], vals[4][2][1], vals[4][2][2], -- Reload/Ammo max; Range/Followthru
			'Disposition', statFormat('Disposition'), -- Disposition
			'Polarities', Polarity._pols(Weapon['Polarities'], true), -- Polarities
			statRead('IsMelee') and 'Stance Pol' or 'Exilus Pol', getStanceExilusPolarity(),
			'Bonus', (
				Weapon['IsLichWeapon'] and ('+ %d-%d dmg'):format(statRead('MinProgenitorBonus'), statRead('ProgenitorBonus')) or
				Weapon['SyndicateEffect'] and statFormat('SyndicateEffect') or
				'-'
			), -- Bonus
		nil):gsub('%.0+(%D)', '%1'):gsub('\n|[^|]+|<span class="tt-link-text">[^\n]-</span>&nbsp;%-?\n|-', '')
	)
end,

---	Builds damage type tooltip.
--	@function		DamageTypes
--	@param			{string} name Name of Damage Type
--	@return			{string} wikitext for tooltip
DamageTypes = function(name)
	if name == nil or name == '' then
		error('No name input')
	end

	local DamageData = mw.loadData([[Module:DamageTypes/data]])

	local dType = DamageData["Types"][name] or DamageData["Health"][name] or DamageData["Procs"][name]
	if dType == nil then
		error('No damage, proc, or health type "'..name..'" found in [[Module:DamageTypes/data]]')
	end
	
	local Colors = {
		dType.CSSBorderColorClass or 'var(--dt-default-border-color)',
		dType.CSSBackgroundColorClass or 'var(--dt-default-background-color)',
		dType.CSSTextColorClass or 'var(--dt-default-text-color)'
	}

	local partTypes = dType.Types and { DamageData.Types[dType.Types[1]], DamageData.Types[dType.Types[2]] }
	partTypes = partTypes and ([==[
| class="tt-data" style="background-color:%s; font-size:16px; line-height:11px;"|
<span style="white-space:nowrap;color:%s;">[[File:%s|x18px]]&thinsp;'''%s'''</span> + 
<span style="white-space:nowrap;color:%s;">[[File:%s|x18px]]&thinsp;'''%s'''</span>
|-]==]):format(Colors[2],
		partTypes[1].CSSTextColorClass, partTypes[1].Icon, dType.Types[1],
		partTypes[2].CSSTextColorClass, partTypes[2].Icon, dType.Types[2]
	)

	local function data(t)
		return ([==[
| class="tt-spacer" style="background-color:%s;"|
|-
| class="tt-data" style="background-color:%s;"|%s
|-]==]):format(
			Colors[1],
			Colors[2], table.concat(t,'<br/>')
		) 
	end
	local function modifier(types, color, coeff)
		local t = {} 
		for k, v in pairs(types) do 
			local dt = DamageData.Types[v[1] or v] or DamageData.Health[v[1] or v]
			t[#t + 1] = ('<span style="white-space:nowrap;">[[File:%%s|x18px]]&thinsp;%%s</span> <span class="tt-value" style="color:%%s">%s</span>')
				:format(coeff == 0 and 'N/A' or '%+d%%')
				:format(dt.Icon or 'spacer.png', v[1] or v, color, (v[2] or 50) * coeff) 
		end
		return data(t)
	end
	
	-- Note: Cannot append "CC" opacity to end of var(--css-variable) w/o defining new CSS variable
	return ([==[
{| class="tt-tooltip-container" style="background-color:%s;"
|-
|
{| class="tt-damage tt-subtable" style="border:3px solid %s"
|-
| class="tt-data" style="background-color:%s; font-size:16px; line-height:11px;"|
<span style="white-space:nowrap;color:%s;">[[File:%s|x18px]]&thinsp;'''%s'''</span>
|-
%s
%s
%s
%s
%s
|}
|}]==]):format(
		Colors[2],
		Colors[1],
		Colors[2], Colors[3], dType.Icon or 'Spacer.png', name,
		partTypes or '',
		dType.Positives and dType.Positives[1] and modifier(dType.Positives, 'var(--positive-text-color)', 1) or '',
		dType.Negatives and dType.Negatives[1] and modifier(dType.Negatives, 'var(--negative-text-color)',  -1) or '',
		dType.Bypass    and dType.Bypass[1]    and modifier(dType.Bypass,    'var(--slight-dark-gray)',  0) or '',
		dType.Status and (function(t) 
			local tt = {} 
			for i, v in ipairs(t) do 
				tt[i] = v 
			end 
			return data(tt)
		end)(dType.Status) or ''
	)
end,

---	Builds Arcane tooltip.
--	@function		Arcane
--	@param			{string} name Name of Arcane
--	@return			{string} wikitext for tooltip
Arcane = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local Arcane = mw.loadData([[Module:Arcane/data]])["Arcanes"][name]
	
	if Arcane == nil then
		error('No arcane "'..name..'" found in [[Module:Arcane/data]]')
	end
	
	local TextIcons = require([[Module:TextIcons]])
	
	return ([==[
{|class="tt-tooltip-container"|-
|
<div style="position:relative;">
{|class="tt-subtable"|-
|class="tt-image"|[[File:%s|160px|link=]]%s
|-
|class="tt-spacer"|
|-
!class="tt-title"|%s
|-
|class="tt-spacer"|
|-
|
{|class="tt-data" style="font-size:13px; text-align:center; padding:2px;"|-
|<span class="tt-link-text">Type</span>&nbsp;&nbsp;%s
|-
|<span class="tt-link-text">Dissolution</span>&nbsp;&nbsp;[[File:Vosfor.png|16px|link=]]&nbsp;%d
|}
|-
|class="tt-spacer"|
|-
|
{|class="tt-data"
|style="word-wrap:break-word; white-space:normal; font-size:13px; line-height:16px; padding:6px;" |'''Rank %d:''' %s
|-
|}
|-
|}
|-
|}]==]):format(
		Arcane.Image,
		Arcane.IsRefreshable and '<div class="tt-top-text defColor" style="right: 6px;">[[File:RefreshTimerIcon.png|32px|link=]]</div>' or '',
		Arcane.Name,
		Arcane.Type,
		Arcane.Dissolution or 0,
		Arcane.MaxRank,
		TextIcons.getIcon(Arcane.Description,{size=12}) or 'nil'
	)

end,

---	Builds resource tooltip.
--	@function		Resources
--	@param			{string} name Name of resource
--	@return			{string} wikitext for tooltip
Resources = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local ResourceData = mw.loadData([[Module:Resources/data]])
	local Resource = ResourceData["Resources"][name] or ResourceData["GenericComponents"][name]
	
	if Resource == nil then
		error('No resource "'..name..'" found in [[Module:Resources/data]]')
	end
	
	local TextIcons = require([[Module:TextIcons]])

	return simpleTooltip(
		Resource.Image or "Stalker cdx.png",
		name,
		TextIcons.getIcon(Resource.Description,{size=14}) or 'nil'
	)
end,

---	Builds cosmetics tooltip.
--	@function		Cosmetics
--	@param			{string} name Name of resource
--	@return			{string} wikitext for tooltip
Cosmetics = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local CosmeticData = mw.loadData([[Module:Cosmetics/data]])
	local Cosmetic = CosmeticData["Cosmetics"][name]
	
	if Cosmetic == nil then
		error('No cosmetic "'..name..'" found in [[Module:Cosmetics/data]]')
	end
	
	local TextIcons = require([[Module:TextIcons]])

	return simpleTooltip(
		Cosmetic.Image or "Stalker cdx.png",
		name,
		TextIcons.getIcon(Cosmetic.Description,{size=14}) or 'nil'
	)
end,

---	Builds Focus tooltip.
--	@function		Focus
--	@param			{string} name Name of Focus way or school
--	@param[opt]		{string} school Name pf focus school for Ways
--	@return			{string} wikitext for tooltip
Focus = function(name, school)
	if name == nil or name == '' then
		error('No name input')
	end

	local focusSchools = {
		Madurai = true,
		Vazarin = true,
		Naramon = true,
		Unairu = true,
		Zenurik = true,
		["Focus Points"] = true
	}
	
	-- For transcluding focus node article content into tooltip popup
	if not focusSchools[name] then
		local function nonempty(s)
			return s~='' and s
		end
		local frame = mw.getCurrentFrame()
		return '<div class="page page__main" style="width:700px; margin-right:-650px; font-size:small; min-height:0; padding:0; background-color:var(--body-background-color)">'..(nil
		or school ~= '' and (nonempty(frame:callParserFunction('#lsth', 'Focus/'..school, name)) or error('no way "'..name..'" in focus school "'..school..'"'))
		or nonempty(frame:callParserFunction('#lsth', 'Focus/Madurai', name))
		or nonempty(frame:callParserFunction('#lsth', 'Focus/Vazarin', name))
		or nonempty(frame:callParserFunction('#lsth', 'Focus/Naramon', name))
		or nonempty(frame:callParserFunction('#lsth', 'Focus/Unairu' , name))
		or nonempty(frame:callParserFunction('#lsth', 'Focus/Zenurik', name))
		or '(err)').. '</div>'
	end
	
	local FocusData = mw.loadData([[Module:Focus/data]])
	local Focus = FocusData["Ways"][name] or FocusData["Schools"][name] or FocusData["Symbols"][name]
	
	if Focus == nil then
		error('No Focus "'..name..'" found in [[Module:Focus/data]]')
	end
	
	return simpleTooltip(
		Focus.Image or "Stalker cdx.png",
		name,
		Focus.Description or 'nil'
	)
end,

---	Builds sigil tooltip.
--	@function		Sigils
--	@param			{string} name Name of sigil
--	@return			{string} wikitext for tooltip
Sigils = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local SigilData = mw.loadData([[Module:Sigils/data]])
	local Sigil = SigilData[name]
	
	if Sigil == nil then
		error('No sigil "'..name..'" found in [[Module:Sigils/data]]')
	end
	
	return simpleTooltip(
		Sigil.Image,
		name,
		Sigil.Description or 'No description'
	)
end,

---	Builds blueprint tooltip.
--	@function		Blueprints
--	@param			{string} name Name of blueprint
--	@return			{string} wikitext for tooltip
Blueprints = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	return ''
end,

---	Builds faction tooltip.
--	@function		Factions
--	@param			{string} name Name of faction
--	@return			{string} wikitext for tooltip
Factions = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local FactionData = mw.loadData([[Module:Factions/data]])
	local Faction = FactionData[name]
	
	if Faction == nil then
		error('No faction "'..name..'" found in [[Module:Factions/data]]')
	end
	
	return simpleTooltip(
		Faction.Image,
		name,
		Faction.Description or 'No description'
	)
end,

---	Builds stat tooltip.
--	@function		Stats
--	@param			{string} name Name of stat
--	@return			{string} wikitext for tooltip
Stats = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local StatData = mw.loadData([[Module:Icon/data]])['Buff']
	local Stat = StatData[name]
	
	if Stat == nil then
		error('No stat "'..name..'" found in [[Module:Icon/data]]')
	end
	
	return simpleTooltip(
		Stat.Image,
		name,
		Stat.Description or 'No description'
	)
end,

---	Builds Enemy tooltip.
--	@function		Enemies
--	@param			{string} name Name of Enemy
--	@return			{string} wikitext for tooltip
Enemies = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local EnemyData = require([[Module:Enemies/data]])
	local Enemy = EnemyData[name]
	
	if Enemy == nil then
		error('No enemy "'..name..'" found in [[Module:Enemies/data]]')
	end
	
	local DamageTypes = require([[Module:DamageTypes]])
	
	-- TODO: UpdateMe Grineer, Corpus, Infested, Orokin icons?
	local FactionIcons = {
		Grineer = "IconGrineerOn.png",
		["Kuva Grineer"] = "KuvaGrineer.png",
		Corpus = "IconCorpusOn.png",
		["Corpus Amalgam"] = "CorpusAmalgam.png",
		Infestation = "Infestation_w.svg",
		Infested = "Infestation_w.svg",
		["Infested Deimos"] = "DeimosInfested.png",
		
		Orokin = "IconOrokinOn.png",
		Sentient = "SentientFactionIcon.png",
		Stalker = "StalkerSigil.png",
		Narmer = "IconNarmer.png",
		["The Murmur"] = "MurmurIcon.png",
		Scaldra = "ScaldraIcon.png",
		Techrot = "TechrotIcon.png",
		Anarchs = "IconAnarchs.png",
		Tenno = "IconTenno.png"
	}
	
	return ([==[
{| class="tt-tooltip-container" |-
|
<div style="position:relative;">
{| class="tt-subtable" |-
| class="tt-image" style="height:120px; padding-bottom:0;" | [[File:%s|120px]]
<div class="tt-top-text defColor" style="top:10px;right:12px;">[[File:%s|28px]]</div>
|-
| class="tt-spacer" |
|-
! class="tt-title" | %s
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px; text-align:center;"
|<span class="tt-link-text">Faction</span>&nbsp;&nbsp;&nbsp;%s
|-
| %s
|-
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px;"
| class="tt-table-half" |<span class="tt-link-text">Health</span>&nbsp;%d
| class="tt-table-half" |<span class="tt-link-text">Armor</span>&nbsp;%d
|-
| class="tt-table-half" |<span class="tt-link-text">Shield</span>&nbsp;%d
| class="tt-table-half" |<span class="tt-link-text">Affinity</span>&nbsp;%d
|}
|-
| class="tt-spacer" |
|-
|
{| class="tt-data" style="font-size:12px; text-align:center;"
|<span class="tt-link-text">Description</span>
|-
| style="word-wrap: break-word; white-space: normal;" |%s
|-
|}
|-
|}
</div>
|}]==]):format(
		Enemy.General.Image,
		FactionIcons[Enemy.General.Faction] or 'IconWild.png',
		Enemy.General.Name,
		Enemy.General.Faction,
		DamageTypes.healthMod(Enemy.General.FactionDamageOverride or Enemy.General.Faction),
		Enemy.Stats.Health or 0,
		Enemy.Stats.Armor  or 0,
		Enemy.Stats.Shield or 0,
		Enemy.Stats.Affinity or 0,
		Enemy.General.Description or 'No Codex description'
	)
end,

---	Builds Decree tooltip.
--	TODO: We need to wrap this around an unstyled tooltip container
--	@function		Decrees
--	@param			{string} name Name of Decree
--	@return			{string} wikitext for tooltip
Decrees = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local DecreeData = require([[Module:Decrees/data]])
	local Decree = DecreeData[name]
	
	if Decree == nil then
		error('No [[decree]] "'..name..'" found in [[Module:Decrees/data]]')
	end
	
	local TextIcons = require([[Module:TextIcons]])
	
	return ('<div style="display: inline-block; position: relative; width: 240px; height: 384px;"><div>[[File:Decree%s.png|240px|link=]]</div><div style="position: absolute; top: 36px; left: 82.5px;%s">[[File:%s|75px|link=]]</div><div style="position: absolute; top: 50%%; left: 50%%; transform: translate(-50%%, -50%%); width: 160px; color: %s; text-align: center; font-weight: 400;"><span style="display: block; font-size: 18px; line-height:1; text-transform: uppercase; margin: 3px;">%s</span><span style="display: block; font-size: 13.5px; line-height:1.1;">%s</span></div><div style="position: absolute; width: 100%%; bottom: 75px; text-align: center;>%s</div><div style="position: absolute; bottom: 22px; left: 90px;">[[File:Icon%s.png|60px|link=]]</div></div>'):format(
		Decree.Rarity == 'Corrupt' and 'Spiteful' or Decree.Rarity,
		Decree.Rarity == 'Corrupt' and ' filter: drop-shadow(0 0 6px red) drop-shadow(0 0 6px red);' or '',
		Decree.Icon,
		Decree.Rarity == 'Corrupt' and 'white' or 'black',
		Decree.Name,
		TextIcons.getIcon(Decree.Description,{size=12}),
		string.rep('<span style="margin: -4.5px;">[[File:DecreeRankActive.png|27px|link=]]</span>', Decree.MaxStacks),
		Decree.Rarity
	)
end,

---	Builds key tooltip.
--	@function		Keys
--	@param			{string} name Name of key
--	@return			{string} wikitext for tooltip
Keys = function(name)
	if name == nil or name == '' then
		error('No name input')
	end
	
	local KeyData = mw.loadData([[Module:Keys/data]])
	local Key = KeyData[name]
	
	if Key == nil then
		error('No key "'..name..'" found in [[Module:Keys/data]]')
	end
	
	local TextIcons = require([[Module:TextIcons]])

	return simpleTooltip(
		Key.Image or "Stalker cdx.png",
		name,
		TextIcons.getIcon(Key.Description,{size=14}) or 'nil'
	)
end,
}
