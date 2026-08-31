---
title: "Module:Mods"
wiki_url: "https://wiki.warframe.com/w/Module/Mods"
wiki_timestamp: "2026-01-28T16:36:14Z"
---

**Mods** retrieves and stores mod data of [WARFRAME](/w/WARFRAME "WARFRAME").

On this Wiki, Mods is used in:

* [Template:ModBox](/w/Template:ModBox "Template:ModBox")
* [Mod](/w/Mod "Mod")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
  + [1.3 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Mod|function|input1|input2|...}}`

### Template

In template: `{{#invoke:Mods|function|input1|input2|...}}`  
In articles: `{{template|function|input1|input2|...}}`

### Module

```lua
local Mod = require('Module:Mods')

local function func(input)
    return Mod.getMod(input)
end
```

## Documentation

### Package items

`mods.getValue(modName, valName)` (function)
:   Gets a specific piece of data about a mod formatted for display on wiki as wikitext.
:   **Parameters**:

    * `modName` Mod name (string)
    * `valName` Mod attribute to fetch (e.g. "Tradable") (string)
:   **Returns**: Mod data (table)

`mods.buildModTableByRarity()` (function)
:   Builds a mod table that sorts mods by rarity. Currently unused on articles due to sheer number of images needed to be loaded. May be useful for debugging purposes.
:   **Returns**: Mod table in wikitext (string)

`mods.buildModTableByPolarity()` (function)
:   Builds a mod table that sorts mods by polarity. Currently unused on articles due to sheer number of images needed to be loaded. May be useful for debugging purposes.
:   **Returns**: Mod table in wikitext (string)

`mods.getModCount(rarity, polarity, transmutable)` (function)
:   Gets the total mod count.
:   **Parameters**:

    * `rarity` Mod rarity to filter by; defaults to 'All' (string; optional)
    * `polarity` Mod polarity to filter by using full name of polarity (e.g. 'Madurai') or 'All; defaults to 'All' (string; optional)
    * `transmutable` Mod transmutability to filter by; either 'true' or 'false', or 'All'; defaults to 'All' (string; optional)
:   **Returns**: Mod data (table)

`mods.simpleModNameList()` (function)
:   Builds a simple sorted list of all mod names in alphabetical order.
:   **Returns**: Mod names separated by breaks (string)

`mods.transmutableModsList()` (function)
:   Builds a list of transmutable mods.
:   **Returns**: Resultant wikitext of list (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Mods/csv](/w/Module:Mods/csv "Module:Mods/csv")
* [Mods/csv2](/w/Module:Mods/csv2 "Module:Mods/csv2")
* [Mods/data](/w/Module:Mods/data "Module:Mods/data")
* [Mods/data/dev](/w/Module:Mods/data/dev "Module:Mods/data/dev")
* [Mods/data/doc](/w/Module:Mods/data/doc "Module:Mods/data/doc")
* [Mods/data/validate](/w/Module:Mods/data/validate "Module:Mods/data/validate")
* [Mods/data/validate/doc](/w/Module:Mods/data/validate/doc "Module:Mods/data/validate/doc")
* [Mods/doc](/w/Module:Mods/doc "Module:Mods/doc")
* [Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox")
* [Mods/itemCompatibility](/w/Module:Mods/itemCompatibility "Module:Mods/itemCompatibility")
* [Mods/itemCompatibility/data](/w/Module:Mods/itemCompatibility/data "Module:Mods/itemCompatibility/data")
* [Mods/itemCompatibility/doc](/w/Module:Mods/itemCompatibility/doc "Module:Mods/itemCompatibility/doc")
* [Mods/testcases](/w/Module:Mods/testcases "Module:Mods/testcases")
* [Mods/testcases/doc](/w/Module:Mods/testcases/doc "Module:Mods/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • M:Mods ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
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
--- '''Mods''' retrieves and stores mod data of [[WARFRAME]].  

--  
--  On this Wiki, Mods is used in:
--  * [[Template:ModBox]]
--  * [[Mod]]
--	
--  @module		mods
--  @alias		p
--  @author		[[User:Brizingr5|Brizingr5]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--  @image		Fusion_Core_horizontal.png
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Icon]]
--	@require	[[Module:Version]]
--	@require	[[Module:String]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--  @release	stable
--  

local p = {}

local ModData = mw.loadData('Module:Mods/data')['Mods']
local Icon = require('Module:Icon')
local Polarity = require('Module:Polarity')
local Version = require('Module:Version')
local String = require('Module:String')
local Table = require('Module:Table')
local Tooltip = require('Module:Tooltips')

-- TODO: Replace contents with a function map as seen in M:Weapons
--- Gets a specific piece of data about a mod formatted for display on wiki as wikitext.
--  @function		p.getValue
--  @param			{string} modName Mod name
--	@param			{string} valName Mod attribute to fetch (e.g. "Tradable")
--  @return			{table} Mod data
function p.getValue(frame)
	local modName = frame.args[1]
	--modName = String.unescape(modName)
	local valName = frame.args[2]
	
	local modTable = ModData[modName]
	
	if (modName == nil) then
		error('p.getValue(frame): No mod specified')
	elseif (modName == nil) then
		error('p.getValue(frame): No value specified for mod "'..mw.text.nowiki(modName)..'"')
	elseif (modTable == nil) then
		error('p.getValue(frame): No such mod "'..mw.text.nowiki(modName)..'" found (Did you make a typo? If not, may need to add a new entry to [[Module:Mods/data]])')
	end
	
	local valNameUpper = string.upper(valName)
	if (valNameUpper == "NAME") then
		return modName
	elseif (valNameUpper == "IMAGE") then
		return modTable.Image or "Mod.png"
	elseif (valNameUpper == "LINK") then
		return "[["..(modTable.Link or modName).."]]"
	elseif (valNameUpper == "INTRODUCED") then
		if (modTable.Introduced ~= nil) then
			local ver, num = Version._getVersion(modTable.Introduced)
			if (ver ~= nil) then
				return Version.getVersionLink(modTable.Introduced)
			end
		end
		return "Unknown update"
	elseif (valNameUpper == "POLARITY") then
		return modTable.Polarity or "None"
	elseif (valNameUpper == "POLARITYICON") then
		if (modTable.Polarity ~= nil) then
			return Polarity._polarity(modTable.Polarity)
		else
			return ""
		end
	elseif (valNameUpper == "RARITY") then
		return modTable.Rarity or "Unknown"
	elseif (valNameUpper == "TRADETAX") then
		if (modTable.Rarity ~= nil) then
			-- TODO: Turn this into a table map to reduce the number of if/else statements
			if (modTable.Rarity == "Common") then
				return Icon._Item("Credits").." 2,000"
			elseif (modTable.Rarity == "Uncommon") then
				return Icon._Item("Credits").." 4,000"
			elseif (modTable.Rarity == "Rare") then
				return Icon._Item("Credits").." 8,000"
			elseif (modTable.Rarity == "Legendary") then
				return Icon._Item("Credits").." 1,000,000"
			elseif (modTable.Rarity == "Amalgam") then
				return Icon._Item("Credits").." 0"
			elseif (modTable.Rarity == "Peculiar") then
				return Icon._Item("Credits").." 4,000"
			end
		end
		return "Unknown trade tax"
	elseif (valNameUpper == "TRANSMUTABLE") then
		return modTable.Transmutable or false
	elseif (valNameUpper == "INCOMPATIBLE") then
		if (modTable.Incompatible ~= nil) then
			local result = ""
			for i, incompatibleMod in ipairs(ModData[modName]["Incompatible"]) do
				result = result.."[["..incompatibleMod.."]], "
			end
			-- Removing extra comma and whitespace
			result = string.sub(result, 1, string.len(result) - 2)
			return result
		else
			return "No conflicts with other equipped mods"
		end
	elseif (valNameUpper == "TYPE") then
		local type = ModData[modName]["Type"]
		-- Mods with a Primed weapon as its type means it can only be equipped
		-- on Primed variant (as we know it)
		if (string.find(type, "Prime")) then
			return type.." (Excluding base/other variants)"
		elseif (ModData[modName]["IsAugment"]) then
			return type.." (Including its variants)"
		else
		-- Mods with normal variant name as its type means it can be equipped by all
		-- its variants (note that Cernos, Mutalist Cernos, and Proboscis Cernos are considered different weapons)
			return type
		end
	elseif (valNameUpper == "DESCRIPTION") then
		local desc = ModData[modName]["Description"]
		-- Replacing Lua patterns with placeholders; '%d' -> '??' and '%%' -> '%'
		-- return desc and desc:gsub('%%d', '??'):gsub('%%%%', '%%') 
		-- 	or "No description in [[Module:Mods/data]]"
		return desc
	elseif (valNameUpper == "EXILUS") then
		local isExilus = ModData[modName]["IsExilus"]
		return isExilus or false
	else
		return ModData[modName][valName]
	end
end

--- Builds a mod table that sorts mods by rarity.
--	Currently unused on articles due to sheer number of images needed to be loaded.
--	May be useful for debugging purposes.
--  @function		p.buildModTableByRarity
--  @return			{string} Mod table in wikitext
function p.buildModTableByRarity()
	local buildLegendaryTable = ""
	local countLegendary = 0
	local buildRareTable = ""
	local countRare = 0
	local buildUncommonTable = ""
	local countUncommon = 0
	local buildCommonTable = ""
	local countCommon = 0

	for key, Mod in Table.skpairs(ModData) do
		--mw.log(Mod.Rarity)
		if Mod.Rarity == "Legendary" then
			buildLegendaryTable = buildLegendaryTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countLegendary = countLegendary + 1
		elseif Mod.Rarity == "Rare" then
			buildRareTable = buildRareTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countRare = countRare + 1
		elseif Mod.Rarity == "Uncommon" then
			buildUncommonTable = buildUncommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countUncommon = countUncommon + 1
		elseif Mod.Rarity == "Common" then
			buildCommonTable = buildCommonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countCommon = countCommon + 1
		end
	end

	local countTotal = countLegendary + countRare + countUncommon + countCommon
	
	local buildTable = ([=[
{| border="1" cellpadding="1" cellspacing="1"
|+ There are total of %s mods
|-
! Legendary (%s)
| %s
|-
! Rare (%s)
| %s
|-
! Uncommon (%s)
| %s
|-
! Common (%s)
| %s
|-
|}]=]):format(countTotal,
			  countLegendary, buildLegendaryTable,
			  countRare, buildRareTable,
			  countUncommon, buildUncommonTable,
			  countCommon, buildCommonTable)

	return buildTable
end

--- Builds a mod table that sorts mods by polarity.
--	Currently unused on articles due to sheer number of images needed to be loaded.
--	May be useful for debugging purposes.
--  @function		p.buildModTableByPolarity
--  @return			{string} Mod table in wikitext
function p.buildModTableByPolarity()
	local buildMaduraiTable = ""
	local buildVazarinTable = ""
	local buildNaramonTable = ""
	local buildZenurikTable = ""
	local buildPenjagaTable = ""
	local buildUnairuTable = ""

	local countMadurai = 0
	local countVazarin = 0
	local countNaramon = 0
	local countZenurik = 0
	local countPenjaga = 0
	local countUnairu = 0

--Madurai "V" "Madurai"
--Vazarin "D"
--Naramon "Bar"
--Zenurik "Ability" "Zenurik"
--Penjaga "Sentinel"
-- Unairu Pol Unairu  - R - Introduced in Update 13.0 and used for certain Melee Stance Mods.

	for key, Mod in Table.skpairs(ModData) do
		--mw.log(Mod.Polarity)
		-- TODO: Factor out the "[[File:..." into a variable
		-- TODO: Add support for "universal" polarity (aka no polarity)
		if Mod.Polarity == "V" or Mod.Polarity == "Madurai" then
			buildMaduraiTable = buildMaduraiTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countMadurai = countMadurai + 1
		elseif Mod.Polarity == "D" or Mod.Polarity == "Vazarin" then
			buildVazarinTable = buildVazarinTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countVazarin = countVazarin + 1
		elseif Mod.Polarity == "Bar" or Mod.Polarity == "Dash" or Mod.Polarity == "Naramon" then
			buildNaramonTable = buildNaramonTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countNaramon = countNaramon + 1
		elseif Mod.Polarity == "Ability" or Mod.Polarity == "Zenurik" or Mod.Polarity == "Scratch" then
			buildZenurikTable = buildZenurikTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countZenurik = countZenurik + 1
		elseif Mod.Polarity == "Sentinel" or Mod.Polarity == "Penjaga" then
			buildPenjagaTable = buildPenjagaTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countPenjaga = countPenjaga + 1
		elseif Mod.Polarity == "R" or Mod.Polarity == "Unairu" or Mod.Polarity == "Ward" then
			buildUnairuTable = buildUnairuTable .. "[[File:" .. Mod.Image .. "|114px|link=" .. Mod.Link .."]]"
			countUnairu = countUnairu + 1
		end
	end

	local countTotal = countMadurai + countVazarin + countNaramon + countZenurik + countPenjaga + countUnairu
	
	local buildTable = ([=[
{| border="1" cellpadding="1" cellspacing="1"
|+ There are a total of %s mods with a polarity
|-
! Madurai (%s)
| %s
|-
! Vazarin (%s)
| %s
|-
! Naramon (%s)
| %s
|-
! Zenurik (%s)
| %s
|-
! Penjaga (%s)
| %s
|-
! Unairu (%s)
| %s
|-
|}]=]):format(countTotal, 
			  countMadurai, buildMaduraiTable,
			  countVazarin, buildVazarinTable,
			  countNaramon, buildNaramonTable,
			  countZenurik, buildZenurikTable,
			  countPenjaga, buildPenjagaTable,
			  countUnairu, buildUnairuTable)

	return buildTable
end

--- Gets the total mod count.
--  @function		p.getModCount
--  @param[opt]			{string} rarity Mod rarity to filter by; defaults to 'All'
--	@param[opt]			{string} polarity Mod polarity to filter by using full name of polarity (e.g. 'Madurai') or 'All; defaults to 'All'
--	@param[opt]			{string} transmutable Mod transmutability to filter by; either 'true' or 'false', or 'All'; defaults to 'All'
--  @return			{table} Mod data
function p.getModCount(frame)
	local rarity = frame.args["rarity"] or "All"
	local polarity = frame.args["polarity"] or "All"
	local transmutable = frame.args["transmutable"] or "All"
	
	if (transmutable == "true") then
		transmutable = true
	elseif (transmutable == "false") then
		transmutable = false
	else
		transmutable = "All"
	end
	
	local total = 0
	-- treating mods without Transmutable key as untransmutable
	for name, modTable in Table.skpairs(ModData) do
		if ((modTable["Rarity"] == rarity or rarity == "All") and 
			(modTable["Polarity"] == polarity or polarity == "All") and
			(modTable["Transmutable"] ~= nil or modTable["Transmutable"] == transmutable or transmutable == "All") and
			not modTable["_IgnoreEntry"]) then
			
			total = total + 1
		end
	end
	
	return total
end

--- Builds a simple sorted list of all mod names in alphabetical order.
--  @function		p.simpleModNameList
--  @return			{string} Mod names separated by breaks
function p.simpleModNameList(frame)
	local result = ""
	local modtable = {}
	for name, Mod in pairs(ModData) do
		--mw.log(name, Mod)
		table.insert(modtable, name)
	end
	table.sort(modtable)
	for i, name in ipairs(modtable) do
		result = result..name.."  
"
	end
	return result
end

---	Builds a list of transmutable mods.
--	@function		p.transmutableModsList
--	@return			{string} Resultant wikitext of list
function p.transmutableModsList(frame)
	-- TODO hoist into Mods; though doing so would warrant a rarity trim loop. 
	local rarityOrder = { "Common", "Uncommon", "Rare" }

	-- if the transmutable mods wikitable needs to be reorganised in some way,
	-- this transMods data structure should be reworked as necessary
	local transMods = {} -- two-dimensional
	for polarity,_ in Table.skpairs(Polarity.IMAGE_MAP) do
		transMods[polarity] = {}
		for _,rarity in ipairs(rarityOrder) do
			transMods[polarity][rarity] = {}
		end
	end

	for modName,Mod in pairs(ModData) do
		if (Mod.Transmutable) then
			transMods[Mod.Polarity][Mod.Rarity][modName] = Mod
		end
	end

	-- trim empty polarities
	for polarity,rarities in pairs(transMods) do
		local empty = true
		for _,rarity in ipairs(rarityOrder) do
			empty = empty and (nil == next(rarities[rarity]))
		end
		if (empty) then
			transMods[polarity] = nil
		end
	end

	local wikitable = {
[=[{| class="wikitable mw-collapsible"
! Polarity
]=] }
	for _,rarity in ipairs(rarityOrder) do
		table.insert(wikitable, "!"..rarity) -- rarity columns
	end
	for polarity,rarities in Table.skpairs(transMods) do
		table.insert(wikitable, "|-")
		-- polarity rows
		local polarity_text = Polarity._polarity(polarity).." "..polarity
		table.insert(wikitable, "!"..polarity_text)
		for _,rarity in ipairs(rarityOrder) do
			table.insert(wikitable, "|")
			for modName,Mod in Table.skpairs(rarities[rarity]) do
				table.insert(wikitable, "*"..Tooltip.full(modName, "Mods"))
			end
		end
	end
	table.insert(wikitable, "|}")
	return table.concat(wikitable, "\n")
end

return p
```

