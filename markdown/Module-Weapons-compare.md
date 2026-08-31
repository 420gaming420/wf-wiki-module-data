---
title: "Module:Weapons/compare"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/compare"
wiki_timestamp: "2026-06-21T02:41:37Z"
---

Contains comparison string builders to be used on weapon articles under Characteristics sections. Invoked on [Template:WeaponComparison](/w/Template:WeaponComparison "Template:WeaponComparison").

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`weapons/compare.buildComparison(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds comparison list between two weapons in PvE.
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of comparison list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`weapons/compare.buildComparison(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds comparison list between two weapons in PvP ([Conclave](/w/Conclave "Conclave")).
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of comparison list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Weapons/compare/doc](/w/Module:Weapons/compare/doc "Module:Weapons/compare/doc")

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
---	Contains comparison string builders to be used on weapon articles under 
--	Characteristics sections. Invoked on [[Template:WeaponComparison]].
--	
--	@module		weapons/compare
--	@alias		p
--	@attribution		[[User:Cephalon Scientia]]
--	@attribution		[[User:Falterfire]]
--	@attribution		[[User:Flaicher]]
--	@attribution		[[User:Gigamicro]]
--	@attribution		[[User:Trajos]]
--	@require			[[Module:Weapons]]
--	@require			[[Module:DamageTypes]]
--	@require			[[Module:Tooltips]]
--	@require			[[Module:Table]]
--	@release			stable
--	

local p = {}

local Weapon = require('Module:Weapons')	-- Using p._getWeapon(), p._statRead() and p._statFormat()
local DamageType = require('Module:DamageTypes')	-- Using p.iterationOrderArray
local Tooltip = require('Module:Tooltips')	-- Using p.full()
local Table = require('Module:Table')	-- Using p.size()

---	Builds comparison string between two values.
--	@function		compareStr
--	@param			{table} weap1 A table used to find the comparing values
--	@param			{table} atk1 A table used to find the comparing values
--	@param			{table} weap2 A table used to find the comparing values
--	@param			{table} atk2 A table used to find the comparing values
--	@param			{string} valName Name of statistic that values represent (e.g. "Critical Damage")
--	@param			{string} var Name of statistic that values are (e.g. "CritDamage")
--	@param[opt]		{table}  compareAdjs Two element table that contains the greater than and less than comparative adjectives (e.g. {"Higher", "Lower", "Different"}) 
--	@param[opt]		{string} prefix What to start the comparison string with if you want to increase the bullet level (e.g. "***")
--	@returns		{string} Resultant wikitext of comparison string (e.g. '**Higher Critical Damage (1.2x vs. 1.1x)')
local function compareStr(weap1, atk1, weap2, atk2, valName, var, compareAdjs, prefix)
	local val1, val2 = Weapon._statRead(weap1, atk1, var), Weapon._statRead(weap2, atk2, var)
	if (val1 == val2) or (val1 ~= val1) or (val2 ~= val2) or not (val1 and val2) then
		return ''
	end

	if type(val1) == 'table' then
		local a, b = val1, val2
		val1, val2 = Table.size(val1), Table.size(val2)
		if val1 == val2 and not (function()
			for k, v in pairs(a) do
				if b[k] ~= v then
					return true
				end
			end
		end)() then
			return ''
		end
	end

	local adj = compareAdjs
	if type(compareAdjs) == 'table' or not compareAdjs then
		adj = (compareAdjs or { "Higher", "Lower", "Different" })[
			val1 > val2 and 1 or
			val1 < val2 and 2 or
			val1 == val2 and 3 or 0--unnecessary catch?
		] or error('compareStr: vals are without compare: '..mw.dumpObject{ val1=val1, val2=val2, compareAdjs=compareAdjs, adj=adj })
		-- local bigWord, smallWord = table.unpack(compareAdjs or {"Higher","Lower"})
		-- adj = bigWord~=smallWord and adj>0 and (bigWord or "Higher") or (smallWord or "Lower")
	end

	return ('%s %s %s (%s vs. %s)'):format(prefix or '**', adj, valName, Weapon._statFormat(weap1, atk1, var), Weapon._statFormat(weap2, atk2, var))
end

---	Builds damage comparison string between two attacks.
--	@function		damageComparisonStr
--	@param			{table} Attack1 Attack used for comparison
--	@param			{table} Attack2 Attack used to compare the first attack against
--	@returns		{string} Resultant wikitext of comparison string
local function damageComparisonStr(weap1, atk1, weap2, atk2)
	local result = {}
	for _, dt in ipairs(DamageType.iterationOrderArray) do
		result[#result+1] = compareStr(weap1, atk1, weap2, atk2, Tooltip.full(dt, 'DamageTypes').." damage", dt, nil, "***")
		-- local damage1 = ('%.2f'):format(Attack1.Damage[element] or 0)
		-- local damage2 = ('%.2f'):format(Attack2.Damage[element] or 0)
		-- result = result..bulidCompareString(damage1, damage2, Tooltip.full(element, 'DamageTypes').." damage", nil, nil, {"Higher", "Lower"}, "\n***")
	end
	return table.concat(result,'\n')
end

---	Builds comparison list between two weapons in PvE.
--	@function		p.buildComparison
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of comparison list
function p.buildComparison(frame, getConclave)
	local weapon1Name = frame.args[1] or ''
	local weapon2Name = frame.args[2] or ''

	assert(weapon1Name ~= '' and weapon2Name ~= '', 'p.buildComparison(frame): Must compare two weapons')

	local weap1 = Weapon._getWeapon(weapon1Name, getConclave)
	local weap2 = Weapon._getWeapon(weapon2Name, getConclave)

	local atk1 = Weapon._getAttack(weap1)
	local atk2 = Weapon._getAttack(weap2)
	
	local isMelee = Weapon._statRead(weap1, atk1, "IsMelee") or Weapon._statRead(weap2, atk1, "IsMelee")
	local isProjectile = Weapon._statRead(weap1, atk1, "ShotType") ~= nil or Weapon._statRead(weap2, atk1, "ShotType") ~= nil
	
	local result = {
		-- support method chaining w/ colon syntax
		insert = function(self, elem)
			table.insert(self, elem)
			return self
		end,
		insertCompare = function(self, ...)
			return self:insert(compareStr(weap1, atk1, weap2, atk2, ...))
		end
	}

	result:insert(("* %s (%s), compared to %s (%s):"):format(
		Tooltip.full(weapon1Name, 'Weapons'), Weapon._statRead(weap1, atk1, 'AttackName'),
		Tooltip.full(weapon2Name, 'Weapons'), Weapon._statRead(weap2, atk2, 'AttackName'),
	nil))

	local progenitorBonusNote = (
		Weapon._statRead(weap1, atk1, 'IsLichWeapon') or
		Weapon._statRead(weap2, atk1, 'IsLichWeapon') )
	and " (using max +60% [[Adversary System/Progenitor|Progenitor]] bonus if applicable)" or ""

	local progenitorExcludeNote = progenitorBonusNote=='' and ''
	or " (excluding any [[Adversary System/Progenitor|Progenitor]] bonus)"
	
	local baseDamageStr = (isMelee and not isProjectile) and "base damage" or "base damage per projectile"
	
	result
		-- TODO: Comparing differences in damage composition absent when base damage is equal
		:insert(compareStr(weap1, atk1, weap2, atk2, baseDamageStr, "BaseDamage"):gsub('^$','**Equal base damage')..progenitorExcludeNote)
		:insert(damageComparisonStr(weap1, atk1, weap2, atk2):gsub('^$','**Identical damage distribution'))
		:insertCompare("total damage"..progenitorBonusNote, "TotalDamageWithProgenBonus")
		:insertCompare("base [[critical chance]]", "CritChance")
		:insertCompare("base [[critical multiplier]]", "CritMultiplier")
		:insertCompare("base [[status chance]]", "StatusChance")
	
	if isMelee then
		result -- melee
			:insertCompare("melee [[range]]", "MeleeRange", {"Longer", "Shorter"})
			:insertCompare("[[attack speed]]", "AttackSpeed")
			:insertCompare("[[Melee Combo|Combo Duration]]", "ComboDur")
			:insertCompare("[[Block Angle]]", "BlockAngle")
			:insertCompare("[[Melee#Follow Through|Follow Through]]", "FollowThrough")
			:insertCompare("[[Stance]] Polarity", "StancePolarity", "Different")
	else
		result -- gun
			:insertCompare("[[Average Damage per Shot|average damage per tap]]"..progenitorBonusNote, "AvgTapDmg")
			:insertCompare("[[Burst DPS|burst DPS]]"..progenitorBonusNote, "BurstDps")
			:insertCompare("[[Sustained DPS|sustained DPS]]"..progenitorBonusNote, "SustainedDps")
			:insertCompare("starting [[Damage Falloff|damage falloff]] distance", "FalloffStart", {"Farther", "Closer"})
			:insertCompare("max [[Damage Falloff|damage falloff]] distance", "FalloffEnd", {"Farther", "Closer"})
			:insertCompare("max damage reduction at ending falloff distance", "FalloffReduction", {"Greater", "Lesser"})
			:insertCompare("[[fire rate]]", "FireRate")
			:insertCompare("[[multishot]]", "Multishot")
			:insertCompare("[[magazine]]", "Magazine", {"Larger", "Smaller"})
			-- TODO: Add support for value equality; e.g. rn it doesn't show "same ammo cost per shot"
			:insertCompare("ammo cost per shot", "AmmoCost", {"More", "Less", "Same"})
		
		-- Conditional check needed otherwise will be redundant with Magazine row
		if not (Weapon._statRead(weap1, atk1, 'AmmoCost') == 1 and Weapon._statRead(weap2, atk2, 'AmmoCost') == 1) then
			result:insertCompare("shots per magazine", "ShotsPerMag", {"More", "Fewer"})
		end
		
		result:insertCompare("[[Ammo Maximum|max ammo capacity]]", "AmmoMax", {"Larger", "Smaller"})
			:insertCompare("[[Ammo Pickup|ammo pickup count]]", "AmmoPickup", {"Larger", "Smaller"})
			:insertCompare("[[Reload|reload time]]", "Reload", {"Slower", "Faster"})
			:insertCompare("spool-up", "Spool", {"Slower", "Faster"})
			:insertCompare("[[Accuracy|accurate]]", "Accuracy", {"More", "Less"})
			:insertCompare("first-shot [[Spread|spread]]", "MinSpread", {"Wider", "Tighter"})
			:insertCompare("maximum [[Spread|spread]]", "MaxSpread", {"Wider", "Tighter"})
			:insertCompare("[[Projectile Speed|projectile speed]]", "ShotSpeed", {"Greater", "Lesser"})
	end
	
	result
		:insertCompare("[[Polarity|polarities]]", "Polarities", {"More", "Less", "Different"})
		:insertCompare("[[Mastery Rank]] required", "Mastery")
		:insertCompare("[[disposition]]", "Disposition")

	local se1, se2 = weap1.SyndicateEffect, weap2.SyndicateEffect
	if se1 and not se2 then
		result:insert("\n** Innate [["..se1.."]] effect")
	elseif se2 and not se1 then
		result:insert("\n** No innate [["..se2.."]] effect")
	elseif se1 and se2 and se1 ~= se2 then
		result:insert("\n** Different innate [[Syndicate Radial Effects|Syndicate Effect]] ([["..se1.."]] vs. [["..se2.."]])")
	end

	-- mw.log(mw.dumpObject{['M:Weapon cache']=cache})
	return table.concat(result, '\n'):gsub('\n\n+', '\n')..'[[Category:Automatic Comparison]]'
end

---	Builds comparison list between two weapons in PvP ([[Conclave]]).
--	@function		p.buildComparison
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of comparison list
function p.buildConclaveComparison(frame)
	return p.buildComparison(frame, true)
end

return p
```

