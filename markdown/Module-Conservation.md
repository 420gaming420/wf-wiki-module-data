---
title: "Module:Conservation"
wiki_url: "https://wiki.warframe.com/w/Module/Conservation"
wiki_timestamp: "2021-11-30T18:40:45Z"
---

**Module:Conservation** contains all of [WARFRAME](/w/WARFRAME "WARFRAME")'s [Conservation](/w/Conservation "Conservation") data.

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Template

In template and articles: `{{#invoke:Conservation|function|input1|input2|...}}`

## Documentation

### Package items

`conservation._getAnimal(animalName)` (function)
:   Returns a specific animal table entry from /data
:   **Parameter**: `animalName` Animal name (string)
:   **Returns**: Animal table (table)

`conservation.buildConservationTab(frame, animalEntry)` (function)
:   Builds a tab for the tabber function of the wiki.
:   **Parameters**:

    * `frame` Frame object (table)
    * `animalEntry` Table entry of animal or the name of animal (table, string; optional)
:   **Returns**: Resultant wikitext of animaltab (string)

`conservation.buildConservationTabber(frame)` (function)
:   Builds a tabber for a conservation animal page.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Resultant wikitext of tabber element (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Conservation/data](/w/Module:Conservation/data "Module:Conservation/data")
* [Conservation/data/doc](/w/Module:Conservation/data/doc "Module:Conservation/data/doc")
* [Conservation/doc](/w/Module:Conservation/doc "Module:Conservation/doc")
* [Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox")
* [Conservation/infobox/doc](/w/Module:Conservation/infobox/doc "Module:Conservation/infobox/doc")
* [Conservation/testcases](/w/Module:Conservation/testcases "Module:Conservation/testcases")
* [Conservation/testcases/doc](/w/Module:Conservation/testcases/doc "Module:Conservation/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • M:Conservation ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
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
---	'''Module:Conservation''' contains all of [[WARFRAME]]'s [[Conservation]] data.  

--	
--	@module			conservation
--	@alias			p
--	@author			[[User:Ethanil239|Ethanil]]
--	@attribution	[[User:Gigamicro|gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image			PobberCommon.png
--	@require		[[Module:Conservation/data]]
--	@require		[[Module:Table]]
--	@release		stable
--	

local p = {}

local ConservationData = mw.loadData [[Module:Conservation/data]]
local Table = require [[Module:Table]]

---	Returns a specific animal table entry from /data
--	@function		p._getAnimal
--	@param			{string} animalName Animal name
--	@returns		{table} Animal table
function p._getAnimal(animalName)
	local animal = ConservationData["Animals"][animalName]
	if animal then return animal end
	error("p._getAnimal(animalName): "..animalName.." does not exist in [[Module:Conservation/data]]")
end

---	Builds a tab for the tabber function of the wiki.
--	@function		p.buildConservationTab
--	@param			{table} frame Frame object
--	@param[opt]		{table, string} animalEntry Table entry of animal or the name of animal
--	@returns		{string} Resultant wikitext of animaltab
function p.buildConservationTab(frame, animalEntry)
	local name = frame.args and frame.args[1] or frame
	
	assert(name, "p.buildConservationTab(frame): empty frame arguments")
	local animal = type(animalEntry) == "table" and animalEntry or p._getAnimal(name)
	
	local result = {}
	
	if animal.Codex and animal.Codex ~= "" and animal.Codex ~= "N/A" then
		table.insert(result, "{{Codex|"..animal.Codex.."}}")
	end
	table.insert(result, p.buildInfobox(tostring(name)))
	
	if animal.Intro and animal.Intro ~= "" and animal.Intro ~= "N/A" then
		table.insert(result, animal.Intro.."  
  
")
	end
	
	if animal.Reward and animal.Reward ~= "" and animal.Reward ~= "N/A" then
		local reward = (animal.Reward):find("Standing") and "{{sc|%s}}" or ("%%sx %s"):format(animal.Reward)
		table.insert(result,(
			[=[When captured via [[Conservation]] they will reward the following:
			{{{!}} class="wikitable"
			{{!}}-
			! Perfect !! Good !! Bad
			{{!}}-
			{{!}} %s {{!}}{{!}} %s {{!}}{{!}} %s
			{{!}}}
		]=]):format(
			reward:format(animal.Perfect),
			reward:format(animal.Good),
			reward:format(animal.Bad),
		nil))
	end
	
	if animal.Notes and animal.Notes ~= "" and animal.Notes ~= "N/A" then
		table.insert(result, animal.Notes)
	end
	
	assert(result[1], "p.buildConservationTab(animalName): empty data entry")
	return animalEntry and table.concat(result, "\n") or frame:preprocess(table.concat(result, "\n"))
end

---	Builds a tabber for a conservation animal page.
--	@function		p.buildConservationTabber
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of tabber element
function p.buildConservationTabber(frame, subtabber)
	local name = frame.args and frame.args[1] or frame
	assert(name, "p.buildConservationTabber(frame): empty frame arguments")
	local animalsFromSpecies = {}
	for k, v in pairs(ConservationData["Animals"]) do
		if v.Family == name then
			animalsFromSpecies[k] = v
		end
	end
	local result = subtabber and { ("|-|%s={{#tag:tabber|"):format(name) } or { "" }
	for i = 1, Table.size(animalsFromSpecies) do
		for k, v in pairs(animalsFromSpecies) do
			if i == v.Rarity then 
				if subtabber then
					table.insert(result, ("%s=%s {{!-}}{{!}}"):format(k, p.buildConservationTab(tostring(k), v)))
				else	
					table.insert(result, ("|-|%s=%s"):format(k, p.buildConservationTab(tostring(k), v))) 
				end
			end
		end
	end
	if subtabber then
		table.insert(result, "}}")
	else
		table.insert(result, "{{clr}}")
	end
	return type(frame) == "string" and table.concat(result, "\n") or frame:preprocess(table.concat(result, "\n"))
end

function p.buildAllTabbers(frame)
	local origin = frame.args and frame.args[1] or frame or true
	local subtabber = frame.args and true or false
	local animals = ConservationData["Animals"]
	local species = {}
	local output = subtabber and "" or ""
	for _, v in pairs(animals) do
		if v.Origin == origin or origin == true then
			species = { v.Family }
			output = output..p.buildConservationTabber(v.Family, subtabber)
			break
		end
	end
	for _, v in pairs(animals) do
		if v.Origin == origin or origin == true then
			local insert = true
			for _, value in pairs(species) do
				if value == v.Family then
					insert = false
				end
			end
			if insert then
				table.insert(species, v.Family)
				output = output..p.buildConservationTabber(v.Family, subtabber)
			end
		end
	end
	output = subtabber and output.."" or output
	return frame:preprocess(output)
end

return p
```

