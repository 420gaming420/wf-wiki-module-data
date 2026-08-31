---
title: "Module:Tooltips/tip/dev"
wiki_url: "https://wiki.warframe.com/w/Module/Tooltips/tip/dev"
wiki_timestamp: "2022-01-19T20:05:13Z"
---

*Documentation for this module may be created at [Module:Tooltips/tip/dev/doc](/w/Module:Tooltips/tip/dev/doc?action=edit&redlink=1 "Module:Tooltips/tip/dev/doc (page does not exist)")*

```lua
---	'''Tooltips/tip''' builds the tooltip box of a tooltip.
--	
--	@module		tooltips/tip
--	@author		[[User:Gigamicro|Gigamicro]]
--	@image		TooltipPic.PNG
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Warframes/data]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Void/data]]
--	@require	([[Module:Icon/data]])
--	@require	[[Module:DamageTypes/data]]
--	@require	[[Module:Arcane/data]]
--	@require	[[Module:Resources/data]]
--	@require	[[Module:Companions/data]]
--	@require	[[Module:Focus/data]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:DamageTypes]]
--	@release	stable
--	

-- TODO: Fix auto documentation transcluding wrong documentation (right now it uses main pages' instead of subpage's documentation)

-- Regex for capturing multi-line strings in code
--(?<=\[==\[)[\s\S]+?(?=\]==\])
--.{180,}

return {
---	Builds Warframe ability tooltip.
--	@function		Ability
--	@param			{string} name Name of ability
--	@return			{string} wikitext for tooltip
Ability = function(name)
	local ability = mw.loadData [[Module:Ability/data]] ["Ability"] [name]
	assert(type(ability) == "table", 'No ability '..name..' found')
	return ([==[

{| class="Tooltip" style="font-family:'Roboto';"|-
|style="padding:0px;"|
{| class="Sub" style="width:500px;"|-
| class="Spacer" style="padding:0;"| [[File:%s|130px]]
| class="Spacer"|
| class="Data" style="line-height:20px; text-align:center; width:64px; padding:2px;"|[[File:%s|48px|class=invert]]  

[[File:EnergyIcon32x.png|18px]]

%s

  

%s

| class="Spacer"|
| class="Data" style="font-size:13px; line-height:16px; padding:2px 3px 2px 3px; white-space:normal;"|%s  
%s
|}
|}

]==]):format(
		ability["CardImage"], 
		ability["Icon"], ability["Cost"], ability["Key"] or '∅', 
		ability["Powersuit"], ability["Description"]
	)
end,

---	Builds mod tooltip.
--	@function		Mods
--	@param			{string} name Name of Mod
--	@return			{string} wikitext for tooltip
Mods = function(name)
	assert(name and name ~= '', 'No mod specified')
	local Mod = mw.loadData [[Module:Mods/data]] ['Mods'] [name]
	assert(Mod, 'No mod "'..name..'" found in [[Module:Mods/data]]')
	return ('[[File:%s|192px]]'):format(Mod.Image or 'Mod.png')
end,

---	Builds Warframe tooltip.
--	@function		Warframes
--	@param			{string} name Name of Warframe
--	@return			{string} wikitext for tooltip
Warframes = function(name)
	assert(name and name~='', 'No name input')

	local warframe = mw.loadData [[Module:Warframes/data]] ["Warframes"] [name]
	assert(warframe, 'No Warframe "'..(name or '')..'" found in [[Module:Warframes/data]]')

	local Polarity = require [[Module:Polarity]]
	
	-- Building abilities list
	local abils
	do
		local abilData = mw.loadData [[Module:Ability/data]]
		local abilities = abilData ['Warframe'] [name:gsub(' Prime',''):gsub(' Umbra','')]
		if (name:find ' Umbra') and (not name:find ' Prime') then
			local aailities, bbilities = abilities, abilData ['Warframe'] [ name ]
			abilities = {}
			for i = 1, 4 do abilities[i] = bbilities[i] or aailities[i] end
		end
		local t = {}
		for i, abilname in ipairs(abilities or {}) do
			t[i] = ('[[File:%s|30px|class=invert]] %s'):format(
				abilData['Ability'][abilname]['Icon'] or 'Panel.png',
				abilname
			)
		end
		abils = table.concat(t,'  
')
	end
	
	return ([==[
{| class="Tooltip" |-
|style="padding:0;"|

{| class="Sub" |-
| class="Image" style="height:120px; padding-bottom:0;" | [[File:%s|120px]]

[[File:MasteryAffinity64.png|28px]]

%s

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="TableHalf" |Health %.0f (%.0f)
| class="TableHalf" |Armor %.0f %s
|-
| class="TableHalf" |Shield %.0f (%.0f)
| class="TableHalf" |Energy %.0f (%.0f)
|-
| style="text-align:center;" colspan=2 |Polarities %s | %s | %s
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="Data" style="padding:4px; text-align:left;"|%s
|}
|}

|}]==]):format(
		warframe.Portrait,
		(warframe.Mastery or 0) >= 10 and 5 or 9.5,
		warframe.Mastery or 0,
		warframe.Health or 0, warframe.HealthRank30 or warframe.Health * 3,
		warframe.Armor  or 0, warframe.ArmorRank30 and ('(%.0f)'):format(warframe.ArmorRank30) or '',
		warframe.Shield or 0, warframe.ShieldRank30 or warframe.Shield * 3,
		warframe.Energy or 0, warframe.EnergyRank30 or warframe.Energy*1.5,
		Polarity._polarity(warframe.AuraPolarity   or 'None', true),
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
	assert(name and name~='', 'No name input')

	local companion = mw.loadData [[Module:Companions/data]] ["Companions"] [name]
	assert(companion, 'No companion "'..(name or '')..'" found in [[Module:Companions/data]]')

	local Polarity = require [[Module:Polarity]]
	
	return ([==[
{| class="Tooltip" |-
|style="padding:0;"|

{| class="Sub" |-
| class="Image" style="height:120px; padding-bottom:0;" | [[File:%s|120px]]

[[File:MasteryAffinity64.png|28px]]

%s

%s

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="TableHalf" |Health %.0f
| class="TableHalf" |Armor %.0f
|-
| class="TableHalf" |Shield %.0f
| class="TableHalf" |Energy %.0f
|-
| style="text-align:center; white-space:normal;" colspan=2 |%s
|-
| style="text-align:center;" colspan=2 |Polarities %s | %s | %s
|}
|}

|}]==]):format(
		companion.Image,
		(companion.Mastery or 0) >= 10 and 5 or 9.5,
		companion.Mastery or 0,
		companion.Category or '',
		companion.Health or 0,
		companion.Armor  or 0,
		companion.Shield or 0,
		companion.Energy or 0,
		companion.Description or '',
		Polarity._polarity(companion.AuraPolarity   or 'None', true),
		Polarity._polarity(companion.ExilusPolarity or 'None', true),
		Polarity._pols(companion.Polarities, true)
	)
end,

---	Builds Void Relic tooltip.
--	@function		Void
--	@param			{string} name Name of Void Relic
--	@return			{string} wikitext for tooltip
Void = function(name)
	assert(name and name~='', 'No name input')
	local Relic = mw.loadData [[Module:Void/data]] ['RelicData'] [name]
	assert(Relic, 'No relic "'..(name or '')..'" found in [[Module:Void/data]]')

	local IconData = mw.loadData [[Module:Icon/data]]
	local WeaponData = mw.loadData('Module:Weapons/data')['Weapons']
	local WarframeData = mw.loadData('Module:Warframes/data')['Warframes']
	local ResourceData = mw.loadData('Module:Resources/data')['Resources']
	local CompanionData = mw.loadData('Module:Companions/data')['Companions']
	
	local function Icon(drop)
		local itemName = drop.Item
		
		return WeaponData[itemName] and WeaponData[itemName]['Image'] or 
				WarframeData[itemName] and WarframeData[itemName]['Image'] or 
				CompanionData[itemName] and CompanionData[itemName]['Image'] or
				ResourceData[itemName] and ResourceData[itemName]['Image'] or
				'Panel.png'
	end

	return ([==[
{| class="Tooltip"
|-
|style="padding:0px;"|
{| class="Relic Sub"
|-
|class="Data"|
{|
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | %s
|-
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | %s
|-
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | %s
|-
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D3D3D3;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#D3D3D3;" | %s
|-
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D3D3D3;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#D3D3D3;" | %s
|-
| rowspan=2 class="Image" | [[File:%s|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D1B962;" | %s
|-
| class = "gradientText" style = "vertical-align:top; color:#D1B962;" | %s
|-
| colspan=2 style = "text-align: center;" | '''%s'''
|-
|}
|}
|}]==]):format(
		Icon(Relic.Drops[1]), Relic.Drops[1].Item, Relic.Drops[1].Part,
		Icon(Relic.Drops[2]), Relic.Drops[2].Item, Relic.Drops[2].Part,
		Icon(Relic.Drops[3]), Relic.Drops[3].Item, Relic.Drops[3].Part,
		Icon(Relic.Drops[4]), Relic.Drops[4].Item, Relic.Drops[4].Part,
		Icon(Relic.Drops[5]), Relic.Drops[5].Item, Relic.Drops[5].Part,
		Icon(Relic.Drops[6]), Relic.Drops[6].Item, Relic.Drops[6].Part,
		(Relic.Vaulted ~= nil) and 'Vaulted' or 'Unvaulted'
	)
end,

---	Builds weapon tooltip.
--	@function		Weapons
--	@param			{string} name Name of Weapon
--	@return			{string} wikitext for tooltip
Weapons = function(name)
	assert(name and name~='', 'No name input')
	-- get weapon
	local Weapon = assert(
		(function(n, d) return d[n] end)(name:gsub('^Dark Split%-Sword$','Dark Split-Sword (Dual Swords)'), mw.loadData [[Module:Weapons/data]] ["Weapons"]), 
		'No weapon "'..name..'" found in [[Module:Weapons/data]]'
	)
	
	local DamageTypes = require [[Module:DamageTypes]]
	local Weapons = require [[Module:Weapons]]	-- p._statRead() and p._statFormat()
	
	local attackNum = Weapon._TooltipAttackDisplay or 1

	local damageTable = {}
	for _, damageType in ipairs(DamageTypes.iterationOrderArray) do
		local dmg = Weapon.Attacks[attackNum].Damage[damageType]
		if (dmg ~= nil) then
			table.insert(damageTable, ("| style=\"padding-right:4px;\" |%s %s"):format(DamageTypes.procIcon(damageType), dmg))
		end
	end
	
	local slot = Weapons._statRead(Weapon, attackNum, 'Slot')
	local bestDmgPercent, bestElement, baseDmg = Weapons._statRead(Weapon, attackNum, 'DamageBias')
	local multishot = Weapons._statRead(Weapon, attackNum, 'Multishot')
	local fireRate = Weapons._statFormat(Weapon, attackNum, 'FireRate')
	local magazine = Weapons._statRead(Weapon, attackNum, 'Magazine')
	local maxAmmo = Weapons._statRead(Weapon, attackNum, 'MaxAmmo')
	local mastery = Weapons._statRead(Weapon, attackNum, 'Mastery')
	
	-- 2D array/matrix to map where elements will be rendered on the tooltip
	-- (imagine dividing rectangle tooltip box into grids)
	-- Each table element should have stat name, stat value/default value
	local vals = { {}, {}, {}, {} }

	vals[1][1] = { 'Slot', slot:gsub('Atmosphere', 'Atmo') }

	vals[2] = {
		{ 'Crit', Weapons._statFormat(Weapon, attackNum, 'CritChance'), Weapons._statFormat(Weapon, attackNum, 'CritMultiplier') },
		{ 'Status', Weapons._statFormat(Weapon, attackNum, 'StatusChance') }
	}
	vals[2][1][2], vals[2][1][3] = ('%s | %s'):format(vals[2][1][2], vals[2][1][3])

	if slot == "Melee" or slot == "Arch-Melee" then
		--vals[1][1]
		vals[1][2] = { "Type", Weapon.Class or '' }
		--vals[2][1], vals[2][2]
		vals[3][1] = { "Atk. Speed", fireRate }
		vals[3][2] = { "Slide Atk.", Weapons._statRead(Weapon, attackNum, 'SlideAttack') }
		vals[4][1] = { "Range", Weapons._statRead(Weapon, attackNum, 'MeleeRange') }
		vals[4][2] = { "Followthru", Weapons._statRead(Weapon, attackNum, 'FollowThrough') }
	else -- Gun
		--vals[1][1]
		vals[1][2] = { "Trigger", Weapons._statRead(Weapon, attackNum, 'Trigger') }
		--vals[2][1], vals[2][2]
		if Weapons._statRead(Weapon, attackNum, 'ChargeTime') > 0 then
			vals[3][1] = { "Charge Time", Weapons._statFormat(Weapon, attackNum, 'ChargeTime') }
		else
			vals[3][1] = { "Fire Rate", fireRate }
		end
		vals[3][2] = { "Multishot", multishot }
		vals[4][1] = { "Reload", Weapons._statFormat(Weapon, attackNum, 'Reload') }
		vals[4][2] = {
			"Ammo", ('%s / %s'):format(magazine, maxAmmo):gsub(' / %z','')
		}
	end

	return (([==[

{| class="Tooltip Main"
|-
|style="padding:0px;"|

{| class="Sub"
|-
| class="Image" style="height:120px;" |

[[File:%s|160px]]

[[File:MasteryAffinity64.png|28px]]

%s

[[File:RivenIcon64.png|28px]]

%s

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |%s %s
| class="TableHalf" |%s %s
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | %s
|-
%s
|-%s
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |%s %s
| class="TableHalf" |%s %s
|-
| class="TableHalf" |%s %s
| class="TableHalf" |%s %s
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |%s %s
| class="TableHalf" |%s %s
|-
| style="text-align:center;" colspan=2 |%s %s | %s
|-
|}
|}

|}

]==]):format(
			Weapons._statRead(Weapon, attackNum, 'Image'), mastery >= 10 and 5 or 9.5, mastery, -- Top image; Mastery rank lock
			Weapons._statRead(Weapon, attackNum, 'Dispo'), -- Disposition
			vals[1][1][1], vals[1][1][2], vals[1][2][1], vals[1][2][2], -- Slot/Type; Slot/Trigger
			Weapons._statRead(Weapon, attackNum, 'AttackName'),	-- Name of attack that is displayed
			table.concat(damageTable,'|'),	-- Damage type values for single projectile
			-- Total damage display
			(bestDmgPercent * baseDmg <= baseDmg and multishot ~= 1) and string.format(
				"\n| colspan=4 |%s × %s = %s (%s %s%%)\n|-",
				baseDmg,
				multishot,
				Weapons._statRead(Weapon, attackNum, 'TotalDamage'),
				DamageTypes.procIcon(bestElement),
				bestDmgPercent * 100
			) or bestDmgPercent * baseDmg < baseDmg and string.format(
				"\n| colspan=4 |%s (%s %s%%)\n|-",
				Weapons._statFormat(Weapon, attackNum, 'TotalDamage'),
				DamageTypes.procIcon(bestElement),
				bestDmgPercent * 100
			) or '',
			vals[2][1][1], vals[2][1][2], vals[2][2][1], vals[2][2][2], -- Crit chance, crit multi, status chance
			vals[3][1][1], vals[3][1][2], vals[3][2][1], vals[3][2][2], -- Fire Rate/Multishot; Atk. Speed/Slide Atk.
			vals[4][1][1], vals[4][1][2], vals[4][2][1], vals[4][2][2], -- Reload/Ammo max; Range/Followthru
			'Polarities', slot == 'Melee' and Weapons._statFormat(Weapon, attackNum, 'StancePolarity') or Weapons._statFormat(Weapon, attackNum, 'ExilusPolarity'), Weapons._statFormat(Weapon, attackNum, 'Polarities') -- Polarities
		):gsub('%.0+(%D)','%1')
	)
end,

---	Builds damage type tooltip.
--	@function		DamageTypes
--	@param			{string} name Name of Damage Type
--	@return			{string} wikitext for tooltip
DamageTypes = function(name)
	assert(name and name~='', 'No name input')

	local DamageData = mw.loadData([[Module:DamageTypes/data]])

	local dType = DamageData["Types"][name] or DamageData["Health"][name] or DamageData["Procs"][name]
	assert(dType, 'No damage, proc, or health type "'..name..'" found in [[Module:DamageTypes/data]]')

	local Colors = { dType.ColorBorder or '#313234', dType.ColorBackground or '#cccccc', dType.Color or '#ffffff' }

	local partTypes = dType.Types and {DamageData.Types[dType.Types[1]], DamageData.Types[dType.Types[2]]}
	partTypes = partTypes and ([==[
| class="Data" style="background-color:%s; background-color:%se6; font-size:16px; line-height:11px;"|[[File:%s|x18px]] '''%s''' + [[File:%s|x18px]] '''%s'''
|-]==]):format(Colors[2], Colors[2],
		partTypes[1].Color, partTypes[1].Icon, dType.Types[1],
		partTypes[2].Color, partTypes[2].Icon, dType.Types[2]
	)

	local function data(t)
		return ([==[
| class="Spacer" style="background-color:%s; background-color:%scc"|
|-
| class="Data" style="background-color:%s; background-color:%se6;"|%s
|-]==]):format(
			Colors[1], Colors[1],
			Colors[2], Colors[2], table.concat(t,'  
')
		) 
	end
	local function modifier(types, color, coeff)
		local t={} 
		for k, v in pairs(types) do 
			local dt = DamageData.Types[v[1] or v] or DamageData.Health[v[1] or v]
			t[#t+1] = ('[[File:%%s|x18px]] %%s %s')
				:format(coeff==0 and 'N/A' or '%+d%%'):format(dt.Color or '#f0f0f0', dt.Icon or 'spacer.png', v[1] or v, color, v[2] and v[2]*coeff) 
		end 
		return data(t)
	end

	return ([==[
{| class="Tooltip"
|-
|style="padding:0;"|
{| class="Damage Sub" style="border:3px solid %s; border:3px solid %scc;"
|-
| class="Data" style="background-color:%s; background-color:%se6; font-size:16px; line-height:11px;"|[[File:%s|x18px]] '''%s'''
|-
%s
%s
%s
%s
%s
|}
|}]==]):format(
		Colors[1], Colors[1],
		Colors[2], Colors[2], Colors[3], dType.Icon or 'spacer.png', name,
		partTypes or '',
		dType.Positives and dType.Positives[1] and modifier(dType.Positives, 'green', 1) or '',
		dType.Negatives and dType.Negatives[1] and modifier(dType.Negatives, 'red',  -1) or '',
		dType.Bypass    and dType.Bypass[1]    and modifier(dType.Bypass,    'grey',  0) or '',
		dType.Status and (function(t) 
			local tt={} 
			for i,v in ipairs(t) do 
				tt[i]=v 
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
	assert(name and name~='', 'No name input')
	local Arcane = assert(
		mw.loadData [[Module:Arcane/data]] ["Arcanes"] [name], 
		'No arcane "'..name..'" found in [[Module:Arcane/data]]'
	)

	return([==[
{| class="Tooltip"
|-
| style="padding:0px;"|
{| class="Sub"
|-
| class="Image"| [[File:%s|160px]]
|-
| class="Spacer"|
|-
! class="Title"|%s
|-
| class="Spacer"|
|-
| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"|Rank %s: %s  
%s
|}
|-
|}]==]):format(
		Arcane.Image or "CosmeticEnhancer.png", 
		name, 
		Arcane.MaxRank or 'nil', 
		Arcane.Criteria or 'nil', 
		Arcane.Description or 'nil'
	)
end,

---	Builds resource tooltip.
--	@function		Resources
--	@param			{string} name Name of resource
--	@return			{string} wikitext for tooltip
Resources = function(name)
	assert(name and name~='', 'No name input')
	local ResourceData = mw.loadData [[Module:Resources/data]]
	local Resource = assert(
		ResourceData["Resources"][name] or ResourceData["GenericComponents"][name], 
		'No resource "'..name..'" found in [[Module:Resources/data]]'
	)

	return([==[
{| class="Tooltip"
|-
| style="padding:0px;"|
{| class="Sub"
|-
| class="Image"| [[File:%s|160px]]
|-
| class="Spacer"|
|-
! class="Title"|%s
|-
| class="Spacer"|
|-
| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"| %s
|}
|-
|}]==]):format(
		Resource.Image or "Stalker cdx.png",
		name,
		Resource.Description or 'nil'
	)
end,

---	Builds Focus tooltip.
--	@function		Focus
--	@param			{string} name Name of Focus way or school
--	@return			{string} wikitext for tooltip
Focus = function(name)
	assert(name and name~='', 'No name input')
	local FocusData = mw.loadData [[Module:Focus/data]]
	local Focus = assert(
		FocusData["Ways"][name] or FocusData["Schools"][name] or FocusData["Symbols"][name], 
		'No Focus "'..name..'" found in [[Module:Focus/data]]'
	)
	
	return([==[
{| class="Tooltip"
|-
| style="padding:0px;"|
{| class="Sub"
|-
| class="Image"| [[File:%s|160px]]
|-
| class="Spacer"|
|-
! class="Title"|%s
|-
| class="Spacer"|
|-
| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"| %s
|}
|-
|}]==]):format(
		Focus.Image or "Stalker cdx.png",
		name,
		Focus.Description or 'nil'
	)
end,
}
```

