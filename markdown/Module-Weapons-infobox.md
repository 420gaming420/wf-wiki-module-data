---
title: "Module:Weapons/infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/infobox"
wiki_timestamp: "2026-06-23T06:17:18Z"
---

**Weapons/infobox** builds the infobox on weapon pages and adds the appropriate category pages.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`weapons.buildInfobox(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds the weapon infobox.
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Wikitext of infobox ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Weapons/infobox/doc](/w/Module:Weapons/infobox/doc "Module:Weapons/infobox/doc")

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
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • M:Weapons/infobox | |
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
---	'''Weapons/infobox''' builds the infobox on weapon pages and adds the 
--	appropriate category pages.  

--
--	@module		weapons
--	@alias		p
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Weapons/Conclave/data]]
--	@require	[[Module:Math]]
--	@require	[[Module:Table]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Baro]]
--	@require	[[Module:InfoboxBuilder]]
--	@release	stable
--	

local Weapons = require([[Module:Weapons]])
local Math = require([[Module:Math]])
local Table = require([[Module:Table]])
local Polarity = require([[Module:Polarity]])
local Tooltips = require([[Module:Tooltips]])
local Vendor = require([[Module:Vendors]])
local Baro = require([[Module:Baro]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])

return {
--- Builds the weapon infobox.
--	@function	p.buildInfobox
--	@param		{table} frame Frame object
--	@return		{string} Wikitext of infobox
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local isConclaveArticle = mw.title.getCurrentTitle().nsText == 'Conclave'
	local weapon = Weapons._getWeapon(name, isConclaveArticle)
	local formatted = Weapons._statFormatter(weapon, {})
	local isArchwing = Weapons._getValue(weapon, 'IsArchwing')
	local isMelee = Weapons._getValue(weapon, 'IsMelee')
	
	local tradableBaseText = "[[File:TradableIcon.png|x32px|class=icon dark-invert]] '''[[Trading|%s]]  
"
	local tradableTextMap = {
		[0] = "Untradeable",
		[1] = tradableBaseText.."(unranked w/ no Forma or Catalyst)'''",
		[2] = tradableBaseText.."(parts and/or blueprint only)'''",
		[3] = tradableBaseText.."(indirectly through [[Adversary System|Lich]] trading)'''",
		[4] = tradableBaseText.."(only fully built components, not blueprints)'''",
		[5] = tradableBaseText.."(indirectly, comes with parent companion)'''",
	}
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/weapons.json', 'WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(name)
	:image(
		weapon.IncarnonImage and {
			{label='Normal',  image=weapon.Image},
			{label='Incarnon',image=weapon.IncarnonImage}
		}
		or weapon.Image
		or 'UnidentifiedItem.png'
	,'Image')
	:group()
		:caption('Tradeable', weapon.Tradable and tradableTextMap[weapon.Tradable] or tradableTextMap[0], 'tradable')
		:caption('UniqueUpgrade', weapon.IsLichWeapon and 'Innate [[Adversary System#Notes|%s]]' or '', 'progenitor-bonus')
		:caption('CodexSecret', weapon.CodexSecret and '[[Hidden Mastery|%s]]' or nil, 'codex-secret')
	:done()
	:group():header('%s', 'general-information')
		:caption('UniqueTrait', weapon.UniqueTrait and formatted('UniqueTrait'), 'unique-trait')
		:row('Class', '[[File:MiniMapMod.png|x18px|link=Mod/Compatibility]] [[Mod/Compatibility|%s]]', formatted('Class'), 'type')
		:row('Mastery',	'[[File:MasterySigilClear.png|x18px|link=Mastery Rank]] [[Mastery Rank|%s]]', formatted('Mastery'), 'mastery-rank-requirement')
		:row('MaxRank', '%s', formatted('MaxRank'), 'max-rank')
		:row('Slot', '[[File:TopWeapon.png|x18px|link=Weapons]] [[Weapons|%s]]', formatted('Slot'), 'slot')
		:row('Trigger',	'[[Trigger Type|%s]]', formatted('Trigger'), 'trigger-type')
	:done()
	
	:group():header('%s', 'utility')
		:row('Accuracy', '[[Accuracy|%s]]', Weapons._statFormatIf(weapon, nil, 'AccuracyBucket'), 'accuracy')
		:row('AttackSpeed', '[[Attack Speed|%s]]', isMelee and Weapons._statFormat(weapon, nil, 'AttackSpeed') or nil, 'attack-speed')
		:row('AmmoMax', '[[Ammo#Ammo Maximum|%s]]', weapon.AmmoMax and formatted('AmmoMax'), 'ammo-max')
		:row('AmmoPickup', '[[Ammo#Ammo Pickup|%s]]', weapon.AmmoPickup and formatted('AmmoPickup'), 'ammo-pickup')
		:row('AmmoType', '[[Ammo#Ammo Packs|%s]]', weapon.AmmoType and formatted('AmmoType'), 'ammo-type')
		:row('BlockAngle', '[[Melee#Blocking|%s]]', weapon.BlockAngle and formatted('BlockAngle'), 'block-angle')
		:row('ComboDur', '[[Melee|%s]]', weapon.ComboDur and formatted('ComboDur'), 'combo-duration')
		:row('Disposition', '[[Riven_Mods#Disposition|%s]]', formatted('Disposition'), 'disposition')
		:row('FireRate', '[[Fire Rate|%s]]', (not isMelee) and weapon.FireRate and formatted('FireRate') or nil, 'fire-rate')
		:row('FollowThrough', '[[Melee#Follow_Through|%s]]', weapon.FollowThrough and formatted('FollowThrough'), 'follow-through')
		-- :row('IncarnonChargeGain', '[[Incarnon Mode|%s]]', weapon.IncarnonChargeGain and atk_formatted('IncarnonChargeGain'), 'incarnon-charge-gain')
		:row('MeleeRange', '[[Melee#Range|%s]]', weapon.MeleeRange and formatted('MeleeRange'), 'range')
		:row('NoiseLevel', '[[Noise Level|%s]]', weapon.IsSilent and formatted('NoiseLevel'), 'noise-level')
		:row('Magazine', '[[Ammo#Magazine Capacity|%s]]', weapon.Magazine and formatted('Magazine'), 'magazine-size')
		:row('Reload', '[[Reload|%s]]', weapon.Reload and formatted('Reload'), 'reload-time')
		:row('ReloadDelay', '[[Reload|%s]]', weapon.ReloadDelay and formatted('ReloadDelay'), 'reload-delay')
		:row('ReloadRate', '[[Reload|%s]]', weapon.ReloadRate and formatted('ReloadRate'), 'reload-rate')
		:row('ShotSpeed', '[[Projectile Speed|%s]]', weapon.ShotSpeed and formatted('ShotSpeed'), 'projectile-speed')
		:row('ShotType', '%s', weapon.ShotType and formatted('ShotType'), 'projectile-type')
		:row('SniperComboReset', '[[Sniper Rifle|%s]]', weapon.SniperComboReset and formatted('SniperComboReset'), 'combo-decay')
		:row('SniperComboMin', '[[Sniper Rifle|%s]]', weapon.SniperComboMin and formatted('SniperComboMin'), 'combo-min')
		:row('Spread', '[[Spread|%s]]', weapon.MinSpread and formatted('AvgSpread')..' ('..formatted('MinSpread')..' min, '..formatted('MaxSpread')..' max)', 'spread')
		:row('SweepRadius', '[[Sweep Radius|%s]]', weapon.SweepRadius and formatted('SweepRadius'), 'sweep-radius')
		:row('Spool', '[[Fire Rate#Auto-Spool Weapons|%s]]', weapon.Spool and formatted('Spool'), 'spool-up-rate')
		:row('Zoom', '[[Zoom|%s]]', weapon.Zoom and formatted('Zoom'), 'zoom')
	:done()
	
	-- Weapons attack sections
	local horiz, elems, attack
	for i, attackEntry in ipairs(weapon.Attacks) do
		local atk_formatted = Weapons._statFormatter(weapon, i)
		attack = 'Attack'..i
		elems = {}
		for dt, dmg in pairs(attackEntry.Damage) do
			if dt ~= 'Impact' and dt ~= 'Puncture' and dt ~= 'Slash' then
				table.insert(elems, dt)
			end
		end
		
		Infobox=Infobox:group():header(atk_formatted('AttackName') or name)
		
		-- Displaying IPS damage types first to match in-game presentation
		horiz = Infobox:hgroup()
		local damageFormatString = '%s  
(%s)'
		
		if isConclaveArticle then
			horiz:row(attack..'PvPImpact', nil, attackEntry.Damage.Impact and 
					damageFormatString:format(atk_formatted('PvPImpact'), atk_formatted('ImpactDistribution')), 'impact')
				:row(attack..'PvPPuncture', nil, attackEntry.Damage.Puncture and 
					damageFormatString:format(atk_formatted('PvPPuncture'), atk_formatted('PunctureDistribution')), 'puncture')
				:row(attack..'PvPSlash', nil, attackEntry.Damage.Slash and 
					damageFormatString:format(atk_formatted('PvPSlash'), atk_formatted('SlashDistribution')), 'slash')
		else
			horiz:row(attack..'Impact', nil, attackEntry.Damage.Impact and 
					damageFormatString:format(atk_formatted('Impact'), atk_formatted('ImpactDistribution')), 'impact')
				:row(attack..'Puncture', nil, attackEntry.Damage.Puncture and 
					damageFormatString:format(atk_formatted('Puncture'), atk_formatted('PunctureDistribution')), 'puncture')
				:row(attack..'Slash', nil, attackEntry.Damage.Slash and 
					damageFormatString:format(atk_formatted('Slash'), atk_formatted('SlashDistribution')), 'slash')
		end
		
		for _, elem in ipairs(elems) do
			if isConclaveArticle then
				horiz:row(attack..'PvP'..elem, nil, attackEntry.Damage[elem] and 
					damageFormatString:format(atk_formatted('PvP'..elem), atk_formatted(elem..'Distribution')), elem)
			else
				horiz:row(attack..elem, nil, attackEntry.Damage[elem] and 
					damageFormatString:format(atk_formatted(elem), atk_formatted(elem..'Distribution')), elem)
			end
		end
		Infobox=horiz:done()
		
			:row(attack..'Total', '[[Damage|%s]]', atk_formatted('TotalDamage')..' ('..atk_formatted('DamageBias')..')', 'total-damage')
			:row(attack..'Accuracy', '[[Accuracy|%s]]', attackEntry.MinSpread and atk_formatted('AccuracyBucket'), 'accuracy')
			-- A melee weapon's index 1 attack should always be a normal melee sweep
			:row(attack..'AttackSpeed', '[[Attack Speed|%s]]', (isMelee and i == 1) and atk_formatted('AttackSpeed') or nil, 'attack-speed')
			:row(attack..'AmmoCost', '%s', attackEntry.AmmoCost and atk_formatted('AmmoCost'), 'ammo-cost')
			:row(attack..'AmmoMax', '[[Ammo#Ammo Maximum|%s]]', attackEntry.AmmoMax and atk_formatted('AmmoMax'), 'ammo-max')
			:row(attack..'AttackSpeed', '[[Attack Speed|%s]]', attackEntry.AttackSpeed and atk_formatted('AttackSpeed'), 'attack-speed')
			:row(attack..'BurstCount', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstCount and atk_formatted('BurstCount'), 'burst-count')
			:row(attack..'BurstDelay', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstDelay and atk_formatted('BurstDelay'), 'burst-delay')
			:row(attack..'BurstReloadDelay', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstReloadDelay and atk_formatted('BurstReloadDelay'), 'burst-reload-delay')
			:row(attack..'ChargeTime', '[[Fire_Rate#Fire_Rate_and_Charge_Time|%s]]', attackEntry.ChargeTime and atk_formatted('ChargeTime'), 'charge-time')
			:row(attack..'CritChance', '[[Critical Hit|%s]]', atk_formatted('CritChance'), 'crit-chance')
			:row(attack..'CritMultiplier', '[[Critical Hit|%s]]', atk_formatted('CritMultiplier'), 'crit-multiplier')
			:row(attack..'Falloff', '[[Damage Falloff|%s]]', attackEntry.Falloff and atk_formatted('Falloff'), 'damage-falloff')
			:row(attack..'EffectDuration', '%s', attackEntry.Duration and atk_formatted('Duration'), 'effect-duration')
			:row(attack..'ExplosionDelay', '%s', attackEntry.ExplosionDelay and atk_formatted('ExplosionDelay'), 'explosion-delay')
			-- A melee weapon's index 1 attack should always be a normal melee sweep so don't show this attack as
			-- having a Fire Rate; additional attacks that are not Heavy/Slam/Slide attacks should display it as Fire Rate
			-- like in the case of gunblades
			:row(attack..'FireRate', '[[Fire Rate|%s]]', (i ~= 1 or not isMelee) and attackEntry.FireRate and atk_formatted('FireRate'), 'fire-rate')
			:row(attack..'ForcedProcs', '[[Status Effect|%s]]', attackEntry.ForcedProcs and atk_formatted('ForcedProcs'), 'forced-procs')
			:row(attack..'HeadshotMultiplier', '%s', attackEntry.HeadshotMultiplier and atk_formatted('HeadshotMultiplier'), 'headshot-multiplier')
			:row(attack..'IncarnonCharges', '%s', attackEntry.IncarnonCharges and atk_formatted('IncarnonCharges'), 'incarnon-charges')
			:row(attack..'Multishot', '[[Multishot|%s]]', attackEntry.Multishot and ('%d (%s damage per projectile)'):format(attackEntry.Multishot, atk_formatted('BaseDamage')), 'multishot')
			:row(attack..'NoiseLevel', '[[Noise Level|%s]]', atk_formatted('NoiseLevel'), 'noise-level')
			:row(attack..'PunchThrough', '[[Punch Through|%s]]', attackEntry.PunchThrough and atk_formatted('PunchThrough'), 'punch-through')
			:row(attack..'Range', '[[Range|%s]]', attackEntry.Range and atk_formatted('Range'), 'range')
			:row(attack..'Reload', '[[Reload|%s]]', attackEntry.Reload and atk_formatted('Reload'), 'reload-time')
			:row(attack..'Spread', '[[Spread|%s]]', attackEntry.MinSpread and atk_formatted('AvgSpread')..' ('..atk_formatted('MinSpread')..' min, '..atk_formatted('MaxSpread')..' max)', 'spread')
			:row(attack..'StatusChance', '[[Status Chance|%s]]', attackEntry.StatusChance and atk_formatted('StatusChance'), 'status-chance')
			:row(attack..'ShotSpeed', '[[Projectile Speed|%s]]', attackEntry.ShotSpeed and atk_formatted('ShotSpeed'), 'projectile-speed')
			:row(attack..'ShotType', '%s', attackEntry.ShotType and atk_formatted('ShotType'), 'projectile-type')
			:row(attack..'Trigger', '[[Trigger Type|%s]]', attackEntry.Trigger and atk_formatted('Trigger'), 'trigger-type')
		:done()
	end
	
	-- Adding additional melee-only rows; not including Archmelees
	if (isMelee and not isArchwing) then
		Infobox:group():header('%s', 'heavy-attack')
			:row('HeavyAttack', '[[Melee#Heavy Attack|%s]]', formatted('HeavyAttack'), 'heavy-damage')
			:row('WindUp', '[[Melee#Heavy Attack|%s]]', formatted('WindUp'), 'wind-up')
		:done()
		
		:group():header('%s', 'slide-attack')
			:row('SlideAttack', '[[Melee#Slide Attack|%s]]', formatted('SlideAttack'), 'slide-damage')	-- Archmelees don't have slide attacks
		:done()
	end
	
	Infobox:group():header('%s', 'miscellaneous')
		:row('Augment', '[[Weapons Augments|%s]]', weapon.Augment, 'augments')	-- TODO: Rename key to Augments b/c some weapons have multiple augments; also hook getter to M:Weapons
		:row('CompatibilityTags', '[[Compatibility Tag|%s]]', weapon.CompatibilityTags and table.concat(weapon.CompatibilityTags, ', '), 'compatibility-tags')
		:row('RivenFamily', '[[Riven Mods|%s]]', formatted('Family'), 'riven-family')
		:row('ExilusPolarity', '[[Exilus Weapon Adapter|%s]]', weapon.ExilusPolarity and formatted('ExilusPolarity'), 'exilus-polarity')
		:row('Introduced', '%s', weapon.Introduced and formatted('Introduced'), 'introduced')
		:row('Polarities', '[[Polarity|%s]]', formatted('Polarities'), 'polarities')
		:row('SellPrice', '%s', weapon.SellPrice and formatted('SellPrice'), 'sell-price')
		:row('StancePolarity', '[[Stance|%s]]', weapon.StancePolarity and formatted('StancePolarity'), 'stance-polarity')	-- Note Exalted weapons will not show this row
		:row('SyndicateEffect',	'[[Syndicate Radial Effects|%s]]', formatted('SyndicateEffect'), 'syndicate-effect')
		:row('Users', '%s', weapon.Users and formatted('Users'), 'users')
		:row('Variants', '%s', weapon.Family and formatted('FamilyList'), 'variants')
	:done()
	
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	local baroStr = Baro._buildBaroSourceStrings(name)
	
	Infobox:group():header('%s', 'vendor-sources')
		:value('

'..frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		)..'

', 'Offerings')
	:done()
	:group(true,name..' Categories'):header('%s', 'article-categories')
		:value(formatted('Categories'), 'Categories')
	:done()
	:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Weapons/data|📝 %s]]', 'update-infobox-data')
	:done()

	return Infobox:_dump(weapon)
end
}
```

