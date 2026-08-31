---
title: "Module:Weapons/characteristics"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/characteristics"
wiki_timestamp: "2026-06-21T22:20:14Z"
---

Submodule for handling Characteristics section on weapon articles. Used mainly for advantages and disadvantages strings. See [Braton#Characteristics](/w/Braton#Characteristics "Braton") for sample output.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`weapons/characteristics.advantages(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds string of advantages or disadvantages of a weapon. Percentiles categorization:

    * 90-100% - "Very high"
    * 75-90% - "High"
    * 60-75% - "Above average"
    * 45-60% - Average, doesn't display anything
    * 30-45% - "Below average"
    * 15-30% - "Low"
    * 0-15% - "Very low"
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: str preprocessed wikitext string ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Weapons/characteristics/doc](/w/Module:Weapons/characteristics/doc "Module:Weapons/characteristics/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	Submodule for handling Characteristics section on weapon articles.
--	Used mainly for advantages and disadvantages strings. See [[Braton#Characteristics]] for sample output. 
--	
--	@module		weapons/characteristics
--	@alias		p
--	@author		[[User:FINNER]]
--	@release	stable
--	@require	[[Module:String]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Weapons/ppdata]]
--	

local p = {}

local trim = require('Module:String').trim
local tooltip = require 'Module:Tooltips' 'Weapons' 'full'
local Weapon = require('Module:Weapons')
local Arguments = require('Module:Arguments')
local ppData = mw.loadData('Module:Weapons/ppdata')

---	Builds string of weapons ranked in nth place.
--	@function		behind
--	@param			{table} data
--	@param			{string} place - "First", "Second", or "Third"
--	@param			{string} slot
--	@returns		{string} String of weapon names
local function behind(data, place, slot)
	local weapons = {}
	for _, weapDict in pairs(data) do
		if weapDict.Place == place then
			for _, weapName in ipairs(weapDict) do
				table.insert(weapons, tooltip(weapName))
			end
			break
		end
	end
	if #weapons < 3 then
		return table.concat(weapons, ' and ')
	end
	weapons[#weapons] = 'and ' .. weapons[#weapons]
	return table.concat(weapons, ', ')
end

-- Computes the percentile rank of a stat value using a table of percentile → boundary value pairs.
-- Accounts for skewed percentile boundaries when multiple percentiles share the same value.
local function percentileFromTable(statValue, points)
    -- points: array of {p=val, v=val}, sorted by p descending
	
	-- If top and bottom boundary are the same, entire region is flat, return 0.5
	if points[1].v == points[#points].v then
		return 0.5
	end
	
    -- Above top boundary
    if statValue >= points[1].v then
        return points[1].p
    end

    -- Below bottom boundary
    local last = points[#points]
    if statValue <= last.v then
        return last.p
    end

    -- Between boundaries
    for i = 1, #points - 1 do
        local a = points[i]
        local b = points[i + 1]

        -- Flat region: same value across percentiles → take best (higher p)
        if a.v == b.v and statValue >= a.v then
            return a.p
        end

        -- Normal descending values: v decreases as p decreases
        -- interpolate between distinct values
        if statValue <= a.v and statValue >= b.v and a.v ~= b.v then
            local t = (statValue - b.v) / (a.v - b.v)  -- 0..1
            return b.p + t * (a.p - b.p)
        end
    end

    -- Fallback (shouldn't hit if data is consistent)
    return last.p
end

-- Determine category, based on [[WARFRAME Wiki:Stat Comparison/Percentiles]]
local function categorizeFromPercentile(p)
	if p <= 0.15 then
		return "Very low"
	elseif p <= 0.30 then
		return "Low"
	elseif p <= 0.45 then
		return "Below average"
	elseif p < 0.60 then
		return "Average"
    elseif p < 0.75 then
		return "Above average"
	elseif p < 0.90 then
		return "High"
    else
		return "Very high"
	end
end

local function categorizeInterpolated(statValue, statName, boundaryValues, label, displayAdvantagesOnly)
	local p = percentileFromTable(statValue, boundaryValues)
	
	local category = categorizeFromPercentile(p)
	
	if displayAdvantagesOnly then
		if category == "Above average" or category == "High" or category == "Very high" then
			 return ("**%s %s (%s)"):format(category, statName, label)
		end
    elseif category == "Very low" or category == "Low" or category == "Below average" then
		return ("**%s %s (%s)"):format(category, statName, label)
	end
	return nil
end

---	Builds string of advantages or disadvantages of a weapon.
--	Percentiles categorization:
--	* 90-100% - "Very high"
--	* 75-90% - "High"
--	* 60-75% - "Above average"
--	* 45-60% - Average, doesn't display anything
--	* 30-45% - "Below average"
--	* 15-30% - "Low"
--	* 0-15% - "Very low"
--	@function		p.advantages
--	@param			{table} frame Frame object
--	@returns		{string} str preprocessed wikitext string
function p.advantages(frame)
	local args = Arguments.getArgs(frame)
	local name = mw.text.decode(args['Name'])	-- Need to decode special characters in weapon name
	local weaponClass = args['Class']
	local triggerType = args['Trigger']
	local editorContent =  args[1]	-- Additional notes as defined by editors outside of automated stat comparison
	local isAdv = (not(args['Dis']) and args['Dis'] ~= '') and true or false
	local weapon = Weapon._getWeapon(name)
	local slot = weapon.Slot
	
	local headerText = string.format(
		'%s over other %s %s %s weapons (excluding modular weapons):',
		(isAdv and 'Advantages' or 'Disadvantages'),
		slot,
		(triggerType ~= nil and triggerType or ''),
		(weaponClass ~= nil and weaponClass or '')
	)
	
	-- TODO: May try to not hard code percentiles here and just fetch the percentile table from
	-- [[Module:Weapons/preprocess]]
	local percentileLegendSpan = mw.html.create('span')
		:css('border-bottom', '1px dotted #808080')
		:css('padding', '0em')
		:attr('title', 'Percentiles: "Very low" = 0-15%, "Low" = 15-30%, "Below average" = 30-45%, "Above average" = 60-75%, "High" = 75-90%, "Very high" = 90-100%')
		:wikitext(headerText)

	local str = { tostring(percentileLegendSpan), editorContent }
	
	local atts, attacks, data, stats = {}, {}, {}, {}
	for i, attack in ipairs(weapon.Attacks) do
		local attackCharacteristics = { '*' .. attack.AttackName .. ' (wiki attack index ' .. i .. ')' }
		
		atts = {
			CritChance = "crit chance",
			CritMultiplier = "crit multiplier",
			TotalDamage = "total damage",
			FireRate = "fire rate",
			StatusChance = "status chance",
		}
		if attack.Falloff or weapon.Falloff then
			atts.FalloffEnd = "maximum falloff distance"
			atts.FalloffRate = "active falloff slope"
		end
		if (weapon.Multishot and weapon.Multishot > 1) or (attack.Multishot and attack.Multishot > 1) then
			atts.Multishot = "multishot"
			atts.AvgCritCount = "average number of crits per shot"
			atts.AvgProcCount = "average number of procs per shot"
		end
		if slot == 'Melee' or slot == 'Archmelee' then
			atts.AvgDmgWithAnimSpeedMulti = "damage × attack speed"
			atts.FireRate = "attack speed"
			atts.MeleeRange = "attack range"
			
			if slot == 'Melee' then
				atts.FollowThrough = "follow through"
				atts.BlockAngle = "block angle"
			end
		else
			atts.AvgShotDmg = "[[Average Damage per Shot|damage per shot]]"
			atts.BurstDps = "[[Burst DPS|burst DPS]]"
			atts.SustainedDps = "[[Sustained DPS|sustained DPS]]"
			atts.Magazine = "magazine size"
			atts.AmmoMax = "ammo max"
			atts.AmmoPickup = "ammo pickup"
			atts.ReloadSpeed = "reload speed"
			atts.Accuracy = "accuracy"
		end
		if slot ~= 'Archgun (Atmosphere)' and slot ~= 'Archmelee' and weapon.Class ~= 'Exalted Weapon' then
			atts.Disposition = "disposition"
		end
		
		stats = {}
		
		ppAttack = nil
		if weaponClass ~= nil then
			if triggerType ~= nil then
				ppAttack = ppData[slot].Classes[weaponClass].TriggerTypes[triggerType].Attacks[i] or {Top3 = {}, Percentiles = {}}
			else
				ppAttack = ppData[slot].Classes[weaponClass].Attacks[i] or {Top3 = {}, Percentiles = {}}
			end
		else 
			ppAttack = ppData[slot].Attacks[i] or {Top3 = {}, Percentiles = {}}
		end
	
		data = ppAttack.Top3
		for statKey, u in pairs(data) do
			if atts[statKey] then
				local label = Weapon._getValue(weapon, statKey, i)
				
				if label == nil then
					error('p.advantages(frame):' .. ' label cannot be nil for key "' .. statKey .. '" and entry '.. mw.dumpObject(weapon))
				end
				
				stats[statKey] = label	-- Storing stat value for later when finding out what percentile it falls under
				temp = u['' .. label]	-- Seeing if calculated stat matches any top 3 entries in ppData
				
				label = Weapon._getFormattedValue(weapon, statKey, i)
				
				if temp and temp.Place and isAdv then
					if temp.Place == 'First' then
						table.insert(attackCharacteristics, ('**Highest %s (%s)'):format(atts[statKey], label) )
					elseif temp.Place == 'Second' then
						table.insert(attackCharacteristics, ('**Second highest %s (%s) behind %s'):format(atts[statKey], label, behind(u, 'First', slot) ) )
					elseif temp.Place == 'Third' then
						table.insert(attackCharacteristics, ('**Third highest %s (%s) behind %s'):format(atts[statKey], label, behind(u, 'Second', slot) ) )
					end
					atts[statKey] = nil
				end
			end
		end
		
		data = ppAttack.Percentiles
		for statKey, statName in pairs(atts) do
			if data[statKey] then
				
				local label
				-- Label is not necessarily the same as statKey. For example, we want readers to 
				-- see "1.15x animation speed" instead of "1.15 attacks/sec" for the FireRate key of a melee weapon
				if (statKey == 'ReloadSpeed') then
					label = Weapon._getFormattedValue(weapon, 'Reload', i)
				elseif (statKey == 'FireRate' and Weapon._getValue(weapon, 'IsMelee')) then
					label = Weapon._getFormattedValue(weapon, 'AttackSpeed', i)
				elseif (statKey == 'Accuracy') then
					label = Weapon._getFormattedValue(weapon, 'MinSpread', i) .. ' to '.. Weapon._getFormattedValue(weapon, 'MaxSpread', i)
				else
					label = Weapon._getFormattedValue(weapon, statKey, i)
				end
			
				local statValue = stats[statKey]
				if (statValue == nil) then
					error('p.advantages(frame): statValue is nil, cannot compare against a nil value; must be a number value')
				end
				
				-- Data validation; ideally we should perform it at data level instead of logic level, but
				-- due to how we store data on the wiki, we have limited tooling to support this (e.g. no data definition language)
				for i = 1, 7, 1 do
					if (data[statKey][i] == nil) then
						error(mw.dumpObject(data[statKey]))
					end
				end
				
				local boundaryValues = {
					{ p = 0.9, v = data[statKey][1] },
					{ p = 0.75, v = data[statKey][2] },
					{ p = 0.6, v = data[statKey][3]} ,
					{ p = 0.525, v = data[statKey][4]} ,
					{ p = 0.45, v = data[statKey][5] },
					{ p = 0.3, v = data[statKey][6] },
					{ p = 0.15, v = data[statKey][7] },
				}
				local statCategoryStr = categorizeInterpolated(statValue, statName, boundaryValues, label, isAdv)
				if statCategoryStr ~= nil then
					table.insert(attackCharacteristics, statCategoryStr)
				end
			end
		end
		
		-- If no distinct advantange/disadvantage is added
		if (#attackCharacteristics == 1) then
			table.insert(str, attackCharacteristics[1]..(isAdv and '\n**No numerical advantages.' or '\n**No numerical disadvantages.'))
		else
			table.insert(str, table.concat(attackCharacteristics, '\n'))
		end
	end
	
	str = table.concat(str, '\n')
	return frame:preprocess(str)
end

return p
```

