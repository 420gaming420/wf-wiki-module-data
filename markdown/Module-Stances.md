---
title: "Module:Stances"
wiki_url: "https://wiki.warframe.com/w/Module/Stances"
wiki_timestamp: "2026-02-22T02:38:00Z"
---

**Stances** automates [Stance](/w/Stance "Stance") tables.

See [User blog:Cephalon Scientia/Module:Stances—A New Look and Personality (Stance Tables Remastered)](/w/User_blog:Cephalon_Scientia/Module:Stances%E2%80%94A_New_Look_and_Personality_(Stance_Tables_Remastered) "User blog:Cephalon Scientia/Module:Stances—A New Look and Personality (Stance Tables Remastered)") for a write-up on the origins of this module.

On this Wiki, Stances is used in:

* [Stance](/w/Stance "Stance") and all stance mod articles
  + See [Blind Justice](/w/Blind_Justice "Blind Justice") for an example

Associated CSS stylesheet is stored on [MediaWiki:Stances.css](/w/MediaWiki:Stances.css "MediaWiki:Stances.css").

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Adding New Stance Types](#Adding_New_Stance_Types)
* [3 Adding Support For New Combo Types](#Adding_Support_For_New_Combo_Types)
* [4 Product Backlog](#Product_Backlog)
* [5 Finished Issues](#Finished_Issues)
* [6 Documentation](#Documentation)
  + [6.1 Package items](#Package_items)
* [7 See Also](#See_Also)
* [8 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Stances|function|input1|input2|...}}`

## Adding New Stance Types

Update [Module:Stances/data](/w/Module:Stances/data "Module:Stances/data"), following the schema for a stance entry.

## Adding Support For New Combo Types

1. In Module:Stances, update `COMBO_TYPES` table with the name of combo type key to be added to [Module:Stances/data](/w/Module:Stances/data "Module:Stances/data").
2. In `buildComboRow()`, add a new key-value pair associated with the new combo type for the tooltips/notes.

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Finishers | Dev/database | Planning | Low |  | Add support for storing finisher attacks though there is a different animation for multiple body types (bipedal human, quadruped, heavy, MOA, etc.). Some weapons have unique finishers:   * [Rumblejack](/w/Rumblejack "Rumblejack") | 06:23, 30 January 2022 (UTC) |  |
| Special attacks | Database | Planning | Low |  | Add additional stance entries for weapons with unique combos. Name key of these entries should be just the weapon name in EN locale.   * [Tatsu](/w/Tatsu "Tatsu")'s slide attack when having at least 1 Soul Swarm charge * [Zenistar](/w/Zenistar "Zenistar")'s heavy attack throwing a disk * [Caustacyst](/w/Caustacyst "Caustacyst")'s heavy attack throwing corrosive sludge * [Vaykor Sydon](/w/Vaykor_Sydon "Vaykor Sydon")'s block + heavy attack blind (unsure if this can fit in current schema) | 06:23, 30 January 2022 (UTC) |  |
| Slam and Heavy Slams | Dev/database | Planning | Low |  | Add support for storing slam attacks and heavy slam attacks. Slam/heavy slams should be shared between melee classes with some exceptions:   * [Tenet Exec](/w/Tenet_Exec "Tenet Exec")'s slam/heavy slam * [Vitrica](/w/Vitrica "Vitrica")'s slam on glassed enemies * [Ghoulsaw](/w/Ghoulsaw "Ghoulsaw")/ [Butcher's Revelry](/w/Butcher%27s_Revelry "Butcher's Revelry")'s slam | 06:23, 30 January 2022 (UTC) |  |
| Data validation | Dev/database | Haitus | Medium |  | Create `Module:Stances/data/validate` subpage of `/data` for data validation functions   * Include type checking for each column/attribute * Include checking if a table entry has the required keys (the minimum number of keys needed to support basic features in Module:Stances) * Include boundary checking for stat values | 19:01, 6 September 2021 (UTC) |  |

## Finished Issues

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Completion Date |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Update database schema | Database/Dev | Completed | Low | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | * ✔️ Standardize typings of key-value pairs in `/data` to avoid all the type checking in the module. * ✔️ Add `Image` key to support mapping combos to animation gifs. | 4:06, 23 August 2021 (UTC) | 19:52, 6 September 2021 (UTC) |

## Documentation

### Package items

`stances._getAttackIcon(attackType, modifier)` (function)
:   Returns the icon for melee attack.
:   **Parameters**:

    * `attackType` Melee attack name (e.g. 'Default' or 'Block') (string)
    * `modifier` Attack modifier name (e.g. 'Default' or 'Slam') (string)
:   **Returns**: The icon's image in wikitext (string)

`stances.buildStanceTable(stanceName, comboType)` (function)
:   Builds stance table.
:   **Parameters**:

    * `stanceName` Stance name (string)
    * `comboType` A specific combo type to display (EN locale) (string; optional)
:   **Returns**: Stance table in wikitext (string)

`stances.getStanceWeaponList(table})` (function)
:   Builds list of weapons that can equip a particlar stance mod as seen on [Template:StanceWeapons](/w/Template:StanceWeapons "Template:StanceWeapons").
:   **Parameter**: `table}` frame Frame object w/ first argument being string stanceName
:   **Returns**: Resultant wikitext of comparison list (string)

`stances.buildCompTable(displayAllCombos)` (function)
:   Builds PvE stance comparison table. Used on [Stance](/w/Stance "Stance") page.
:   **Parameter**: `displayAllCombos` (string)
:   **Returns**: Stance comparison table in wikitext (string)

`stances.buildStanceGallery(frame)` (function)
:   Builds stance gallery. Used on [Template:MeleeCategory](/w/Template:MeleeCategory "Template:MeleeCategory").
:   **Parameter**: `frame` (table)
:   **Returns**: Stance (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Stances/data](/w/Module:Stances/data "Module:Stances/data")
* [Stances/data/dev](/w/Module:Stances/data/dev "Module:Stances/data/dev")
* [Stances/data/doc](/w/Module:Stances/data/doc "Module:Stances/data/doc")
* [Stances/dev](/w/Module:Stances/dev "Module:Stances/dev")
* [Stances/doc](/w/Module:Stances/doc "Module:Stances/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • M:Stances ([/data](/w/Module:Stances/data "Module:Stances/data")) |
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
---	'''Stances''' automates [[Stance]] tables.  

--	
--	See [[User blog:Cephalon Scientia/Module:Stances—A New Look and Personality (Stance Tables Remastered)]] 
--	for a write-up on the origins of this module.
--	
--	On this Wiki, Stances is used in:
--	* [[Stance]] and all stance mod articles
--	** See [[Blind Justice]] for an example
--	
--	Associated CSS stylesheet is stored on [[MediaWiki:Stances.css]]. 
--	
--	@module		stances
--	@alias		p
--	@author		[[User:FINNER|FINNER]]
--	@author		[[User:Celphalon Scientia|Celphalon Scientia]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		IconStance.png
--	@require	[[Module:Stances/data]]
--	@require	[[Module:Mods/data]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Arguments]]
--	@release	stable
--	

local p = {}

local StanceData = mw.loadData("Module:Stances/data")
local ModData = mw.loadData("Module:Mods/data")["Mods"]
local Table = require("Module:Table")
local Tooltip = require("Module:Tooltips")
local Weapon = require("Module:Weapons")
local Arguments = require("Module:Arguments")

-- Stores the localized names of the different types of combos.
-- Ordering determines what row they appear in stance table (e.g. Neutral combo is first row)
local COMBO_TYPES = {
	"Neutral", "Forward", "Forward Block", "Block", "Heavy", 
	"Slide", "Aerial", "Wall", "Finisher", "Slam", "Heavy Slam", 
	"Damage", "Hits"	-- Last two "combos" are for legend
}

local MELEE_ATTACK_ICONS = {
	["Default"] = {
		["Default"] = {
			Icon = "BlackBasex64.png",
			Link = "Melee#Normal Attack",
			Title = "Default Melee Attack"
		},
		["Block"] = {
			Icon = "BlackBlockx64.png",
			Link = "Melee#Blocking",
			Title = "Block"
		},
		["Heavy"] = {
			Icon = "BlackChargex64.png",
			Link = "Melee#Heavy Attacks",
			Title = "Heavy Attack"
		},
		["Up"] = {
			Icon = "BlackUpx64.png",
			Link = "Maneuvers",
			Title = "Up"
		},
	},
	["Slam"] = {
		["Default"] = {
			Icon = "RedBasex64.png",
			Link = "Melee#Slam_Radial_Damage",
			Title = "Radial Slam"
		},
		["Block"] = {
			Icon = "RedBlockx64.png",
			Link = "Melee#Blocking",
			Title = "Block"
		},
		["Pause"] = {
			Icon = "RedPausex64.png",
			Link = "Maneuvers",
			Title = "Pause"
		},
		["Heavy"] = {
			Icon = "RedChargex64.png",
			Link = "Melee#Heavy Attacks",
			Title = "Heavy Attack"
		},
		["Up"] = {
			Icon = "RedUpx64.png",
			Link = "Maneuvers",
			Title = "Up"
		},
	},
	["360"] = {
		["Default"] = {
			Icon = "BlueBasex64.png",
			Link = "Melee#Normal Attack",
			Title = "360° Attack"
		},
		["Block"] = {
			Icon = "BlueBlockx64.png",
			Link = "Melee#Blocking",
			Title = "Block"
		},
		["Heavy"] = {
			Icon = "BlueChargex64.png",
			Link = "Maneuvers",
			Title = "Heavy Attack"
		},
		["Up"] = {
			Icon = "BlueUpx64.png",
			Link = "Maneuvers",
			Title = "Up"
		},
	},
	["Ranged"] = {
		["Default"] = {
			Icon = "GunbladeShot.svg",
			Link = "Melee",	-- No better page to link to
			Title = "Ranged"
		},
		["Heavy"] = {
			Icon = "HeavyGunbladeShot.svg",
			Link = "Melee#Heavy Attacks",
			Title = "Ranged"
		},
	},
	["Thrust"] = {
		["Default"] = {
			Icon = "PurpleUpx64.png",	-- Placeholder
			Link = "Melee",
			Title = "Thrust",
		}
	},
	["Dash"] = {
		["Default"] = {
			Icon = "PurpleUpx64.png",	-- Placeholder
			Link = "Melee",
			Title = "Dash",
		}
	},
}

---	Returns the icon for melee attack.
--	@function		p._getAttackIcon
--	@param			{string} attackType Melee attack name (e.g. 'Default' or 'Block')
--	@param			{string} modifier Attack modifier name (e.g. 'Default' or 'Slam')
--	@return			{string} The icon's image in wikitext
function p._getAttackIcon(attackType, modifier)
	if (attackType == nil or attackType == '') then attackType = 'Default' end
	if (modifier == nil or modifier == '') then modifier = 'Default' end
	
	assert(MELEE_ATTACK_ICONS[modifier], 'p._getAttackIcon(attackType, modifier): Invalid modifier type "'..modifier..'"')
	local attackicon = 
		assert(MELEE_ATTACK_ICONS[modifier][attackType], 'p._getAttackIcon(attackType, modifier): Invalid attack type "'..attackType..'"')

	return ('[[File:%s|x19px|link=%s|%s|class=icon]]'):format(attackicon['Icon'], attackicon['Link'], modifier..' '..attackType)
end

---	Returns max number of columns the table needs.
--	@function		getMaxCols
--	@param			{table} stanceData Table containing stance data
--	@return			{number} Max number of columns that the stance table needs 
--							 to display all attack inputs without text wrapping
local function getMaxCols(stanceData)
	local maxCols = 0
	for _, k in ipairs(COMBO_TYPES) do
		local v = stanceData[k]
		-- assert(v,'No "'..k..'" table in '..stanceData.StanceName)
		if v then
			local temp = 0
			assert(v['Attacks'],'No Attacks table in '..stanceData.StanceName..'.'..k)
			for j, w in ipairs(v['Attacks']) do
				temp = temp + 1
			end
			if temp > maxCols then
				maxCols = temp
			end
		end
	end
	
	return maxCols
end

---	Returns individual icon in a combo or error if faulty data.
--	@function		buildComboIcon
--	@param			{string} stanceName Stance name
--	@param			{string} comboName Combo name
--	@param			{string} inputNum Attack input number in combo
--	@return			{string} HTML containing the combo icon as well as the combo 
--							 input's damage multipliers, number of hits, and forced procs
local function buildComboIcon(stanceData, iconData)--comboName, inputNum)
	-- TODO: Pass in stanceData instead of rebuilding stanceData each time function is called
	-- TODO: Build resultant string in a table and perform a table.concat when returning
	local stanceName = stanceData.StanceName
	-- local iconData = stanceData[comboName]['Attacks'][inputNum]
	local iconShape = iconData.Shape or 'Default' -- 'Default', 'Heavy', or nil
	local iconType = iconData.Type or 'Default'	-- 'Default',  '360', 'Slam', 'Ranged'
	local iconNote = iconData.Note and ' [[#Notes|'..iconData.Note..']]' or ''
	local iconHits = iconData.Hits	-- number of hits of unique attack(s)
	local iconDmg = iconData.Dmg	-- damage muliplier of unique attack(s)
	local iconProc = {}				-- any guaranteed procs from attack(s)
	local icon = ''
	local numRows = Table.size(iconHits)	-- for tracking number of rows to be displayed below combo icon
	
	assert(iconHits and iconDmg and iconData)
	
	-- default value is no procs (empty string)
	local tempIconProc = iconData.Procs and iconData.Procs or { '' }
	local tempIconHitTypes = iconData.Types and iconData.Types or { 'Sweep' }
	
	-- adding rows that will sit under combo icon
	for i = 1, numRows do
		local numProcs = 0
		
		-- for hits that have multiple forced procs
		if type(tempIconProc[i]) == 'table' then
			numProcs = Table.size(tempIconProc[i])
			iconProc[i] = tempIconProc[i]
		elseif tempIconProc[i] == '' then
			iconProc[i] = {}
			iconProc[i][1] = ''
		else
			iconProc[i] = {}
			iconProc[i][1] = tempIconProc[i]
			numProcs = 1
		end
		
		local marginTop = 0.4
		if i > 1 then marginTop = 0.8 end
		
		local hitsString = ''
		local dmgString = ''
		
		if iconHits[i] ~= 1 then
			hitsString = iconHits[i]..'x '
		end
		
		if (iconDmg[i] ~= 100) or (iconDmg[i] == 100 and iconHits[i] == 1) then
			dmgString = iconDmg[i]..'%'
		end
		
		-- when there is multiple hits but each hit does 100% of weapon damage
		if iconHits[i] > 1 and iconDmg[i] == 100 then
			hitsString = iconHits[i]..'x '
			dmgString = '100%'
		end
		
		icon = icon..'

'
		
		-- Treat sweeping melee attacks/hits as the default so no need to add an additional icon
		if (tempIconHitTypes[i] ~= nil and tempIconHitTypes[i] ~= 'Sweep' and tempIconHitTypes[i] ~= '') then
			icon = icon..' '..p._getAttackIcon('Default', tempIconHitTypes[i])
		end
		
		icon = icon..' '..hitsString..dmgString
		
		for j = 1, numProcs do
			if iconProc[i][j] ~= nil and iconProc[i][j] ~= '' then
				icon = icon..' '..Tooltip.icon(iconProc[i][j], 'DamageTypes')
			end
		end
		
		icon = icon..'

'
	end
	
	icon = '

'
		..p._getAttackIcon(iconShape, iconType)..iconNote..icon..'

'
	return icon
end

---	Calculates total damage multiplier (in %) for a combo against a single target.
--	@function		calcTotalDmgMulti
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@return			{number} Total damage multiplier of a particular stance combo as a percentage
local function calcTotalDmgMulti(comboData)
	local multiplierSum = 0
	
	for i, attack in ipairs(comboData["Attacks"]) do
		for j, multi in ipairs(attack["Dmg"]) do
			-- Ignore radial slam portions of combo attacks because they do not hit the 
			-- epicenter of a melee strike (unlike AoE weapons and actual slam attacks 
			-- which do produce two damage instances).
			-- In other words, a combo with a slam attack will only produce one damage instance
			-- on direct hit of a target; the radial slam is not applied on direct hit.
			-- Damage multiplier calculations are only relevant for single target anyways.
			if (attack["Types"] == nil or attack["Types"][j] ~= "Slam") then
				multiplierSum = multiplierSum + (multi * attack["Hits"][j])
			end
		end
	end
	
	return multiplierSum
end

---	Calculates average damage multiplier (in %) per second for a combo against a single target.
--	@function		calcAvgDmgMulti
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@return			{number} Average damage multiplier per second of a particular stance combo
local function calcAvgDmgMulti(comboData)
	if (comboData["Duration"] == nil) then return 0/0 end
	
	local multiplierSum = calcTotalDmgMulti(comboData)
	local multiplierAvg = multiplierSum / comboData["Duration"]
	return multiplierAvg
end

---	Calculates total damage multiplier (in %) from slash procs for a combo
--	assuming no status duration mods/modifiers are added (i.e. 6 second slash proc).
--	@function		calcTotalSlashProcMulti
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@return			{number} Total slash proc multiplier for a particular stance combo as a percentage
local function calcTotalSlashProcMulti(comboData)
	local multiplierTotal = 0
	
	for i, attack in ipairs(comboData['Attacks']) do
		for i, proc in ipairs(attack["Procs"] or {}) do
			-- first check needed for hits that have multiple forced procs
			-- second check needed if only forced proc for hit is Slash
			if ((type(proc) == 'table' and Table.contains(proc, 'Bleed')) or proc == 'Bleed') then
				multiplierTotal = multiplierTotal + (attack["Dmg"][i] * attack["Hits"][i])
			end
		end
	end
	
	-- multiplying by 0.35 b/c slash ticks deals 35% of weapon's modded damage
	-- and accounting for 6 ticks of damage
	return multiplierTotal * 0.35 * 6
end

---	Calculates total combo gain for a combo.
--	@function		calcTotalComboGain
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@return			{number} Total combo gain for a particular stance combo
local function calcTotalComboGain(comboData)
	local comboSum = 0
	
	for i, attack in ipairs(comboData['Attacks']) do
		for i, multi in ipairs(attack["Dmg"]) do
			local comboCount = multi / 100
			-- rounding to nearest integer
			comboCount = math.floor(comboCount + 0.5)
			comboSum = comboSum + (comboCount * attack["Hits"][i])
		end
	end
	
	return comboSum
end

---	Calculates average combo gain per second for a combo.
--	@function		calcAvgComboGain
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@return			{string} Average combo gain per second for a particular stance combo (e.g. "5/s")
local function calcAvgComboGain(comboData)
	if (comboData["Duration"] == nil) then return 'N/A' end
	
	local comboSum = calcTotalComboGain(comboData)
	local comboAvg = comboSum / comboData["Duration"]
	-- rounding to nearest hundredth place
	comboAvg = (math.floor(result * 100 + 0.5) / 100)
	return comboAvg..'/s'
end

---	Calculates total Impact, Puncture, or Slash damage multiplier for a combo.
--	@function		calcTotalPhysicalDmgMulti
--	@param			{table} comboData Table that contains data for a particular stance combo
--	@param			{string} physicalDamageType Physical damage type ("Impact", "Puncture", or "Slash")
--	@return			{number} Total Impact, Puncture, or Slash damage multiplier for a particular stance combo as a percentage (e.g. "200")
local function calcTotalPhysicalDmgMulti(comboData, physicalDamageType)
	local dmgToKeyMap = {
		Impact = "ImpactMultiplier",
		Puncture = "PunctureMultiplier",
		Slash = "SlashMultiplier"
	}
	local physicalDamageBonusKey = dmgToKeyMap[physicalDamageType]
	assert(dmgToKeyMap[physicalDamageType] ~= nil, 
		'calcTotalPhysicalDmgMulti(comboData, physicalDamageType): physicalDamageType "'..physicalDamageType..'" is not "Impact", "Puncture", or "Slash"')
	
	local totalPhysicalDmgMulti = 0
	
	for i, attack in ipairs(comboData['Attacks']) do
		for j, physicalDamageMultiplier in ipairs(attack[physicalDamageBonusKey] or {}) do
			-- If element is 1 that means there is no additional physical damage multiplier (100% of the damage or 1x multiplier)
			if (physicalDamageMultiplier > 1) then
				totalPhysicalDmgMulti = totalPhysicalDmgMulti + physicalDamageMultiplier
			end
		end
	end
	
	return totalPhysicalDmgMulti * 100
end

-- TODO: These notes may be redundant as tooltips already have this information; 
-- can safely omit them unless providing readers direct article links are important
-- Required preliminary keys/movements for a combo
local notes = {
	["Neutral"] = 'While Not Moving',
	["Forward"] = 'While Moving',
	["Forward Block"] = 'While [[Melee#Blocking|Blocking]] & Moving',
	["Block"] = 'While [[Melee#Blocking|Blocking]]',
	["Heavy"] = '[[Melee#Heavy Attack|Heavy Attack]]',
	["Slide"] = 'While [[Maneuvers#Sliding|Sliding]]',
	["Aerial"] = 'While [[Maneuvers#Jumping|In Air]]',
	["Wall"] = 'While [[Maneuvers#Wall Latch|Wall Latching]]',
	["Finisher"] = 'On [[Knockdown|Knocked Down]] Enemy',
	["Slam"] = '[[Melee#Slam_Attack|Looking At Ground While In Air]]',
	["Heavy Slam"] = 'Heavy Attack In Midair',
}
-- Tootips for combo names
local title = {
	["Neutral"] = 'Neutral Combo: Performed while standing still or moving sideways/backwards.',
	["Forward"] = 'Forward Combo: Performed while holding any forward movement key.',
	["Forward Block"] = 'Forward Block or Forward Tactical Combo: Performed while holding Block key and moving forward.',
	["Block"] = 'Block or Neutral Tactical Combo: Performed while holding the Block key.',
	["Heavy"] = 'Heavy Attack: Performed by pressing Heavy Attack button.',
	["Slide"] = 'Slide Attack: Performed while sliding.',
	["Aerial"] = 'Aerial Attack: Performed while looking forward and attacking in mid-air.',
	["Wall"] = 'Wall Attack: Performed while wall latching.',
	["Finisher"] = 'Ground Finisher: Performed on knock downed enemies.',
	["Slam"] = 'Slam Attack: Performed by looking at the ground while in mid-air and attacking.',
	["Heavy Slam"] = 'Heavy Slam Attack: Performed by looking at the ground while in mid-air and Heavy Attacking.',
	["Damage"] = 'For table legend',
	["Hits"] = 'For table legend',
}
---	Returns a complete row for a given combo.
--	@function		buildComboRow
--	@param			{string} stanceName Stance name
--	@param			{string} comboType Combo type (e.g. "Neutral" or "Forward")
--	@return			{string} A table row for a particular combo in a stance in wikitext
local function buildComboRow(stanceData, comboType, maxCols)
	local comboData = stanceData[comboType]
	
	local iconcols = {}
	for j = 1, maxCols do
		table.insert(iconcols, '| style="vertical-align:top; text-align:center; border-left:none; border-right:none;" | '
			..(comboData.Attacks[j] and buildComboIcon(stanceData, comboData.Attacks[j]) or '')
		)
	end
	
	return (([=[
|- id="%s"
| style="padding: 0.75em 0.5em; border-bottom: none;" | %s  
/>(%s)
| style="text-align: center;" | %s%s
%s
| style="padding: 0.75em 0.5em; border-bottom: none;" | %.01f%%/s
| style="padding: 0.75em 0.5em; border-bottom: none;" | %.01fs
| [[File:%s|x90px]]
]=]):format(
		comboData.Name,
		title[comboType], comboType,
		notes[comboType],
		comboData.Name, comboData.FromWeapon and '*' or '',
		table.concat(iconcols, '\n'),
		calcAvgDmgMulti(comboData),
		comboData.Duration or 0/0,
		comboData.Image or 'Panel.png',
	nil):gsub('-nan%W*s', 'N/A'))
end

---	Builds the stance table's legend.
--	@function		buildStanceLegend
--	@param			{number} colSpan Number of columns that the stance table span
--	@return			{string} Stance legend in wikitext to be placed at end of stance table
local function _buildStanceLegend(colSpan)
	--could have this be one long string and one format call, but this is easier to read (btw chained concats are one operation)
	return ([=[
|-
| colspan="%s" |

%s Default "Sweep" Attack •
%s 360°/Spin Attack •
%s Direct and Radial Slam Attack •
%s Ranged Attack •
%s "Thrust" Attack

View Full Legend

]=]):format(--head
		colSpan,
		p._getAttackIcon('Default', 'Default'),
		p._getAttackIcon('Default', '360'),
		p._getAttackIcon('Default', 'Slam'),
		p._getAttackIcon('Default', 'Ranged'),
		p._getAttackIcon('Default', 'Thrust')
	)
	..([=[{|
|+ [[Stance#Melee Combos|Key Inputs]]
| colspan="1" | %s Basic Melee  (PC default LMB or E; Xbox, PlayStation, and Nintendo Switch default right button)
|-
| colspan="1" | %s [[Melee#Heavy Attack|Heavy Attack]] (PC default MMB; Xbox, PlayStation, and Nintendo Switch default left trigger)
|-
| colspan="1" | %s [[Melee#Blocking|Block]]  (PC default RMB; Xbox, PlayStation, and Nintendo Switch default right trigger)
|-
| colspan="1" | %s Forward Movement  (PC default W; Xbox, PlayStation, and Nintendo Switch default tilt up right thumbstick)
|}
]=]):format(p._getAttackIcon('Default', ''), p._getAttackIcon('Heavy', ''), p._getAttackIcon('Block', ''), p._getAttackIcon('Up', ''))--keybinds
	..([=[{|
|+ Multipliers and Hits
| colspan="1"| %s Attack does double damage 
|-
| colspan="1" | %s Attack hits twice 
|}
]=]):format(buildComboIcon(StanceData.__Legend, StanceData.__Legend.Damage.Attacks[1]), buildComboIcon(StanceData.__Legend, StanceData.__Legend.Hits.Attacks[1]))--multipliers
	..([=[{|
|+ Forced Procs
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s
|-
| colspan="1" | %s (front, back, or ground) 
|-
| colspan="1" | %s ([[Conclave|PvP]] only) 
|}
]=]):format(--procs
	Tooltip.full('Knockback', 'DamageTypes'),
	Tooltip.full('Weakened', 'DamageTypes'),
	Tooltip.full('Bleed', 'DamageTypes'),
	Tooltip.full('Detonate', 'DamageTypes'),
	Tooltip.full('Knockdown', 'DamageTypes'),
	Tooltip.full('Lifted', 'DamageTypes'),
	Tooltip.full('Stagger', 'DamageTypes'),
	Tooltip.full('Big Stagger', 'DamageTypes'),
	Tooltip.full('Ragdoll', 'DamageTypes'),
	Tooltip.full('Finisher', 'DamageTypes'),
	Tooltip.full('Impair', 'DamageTypes')
)
	..[=[{|
|+ Melee Attack Explanations
|
*"Sweep attack" is an arcing melee strike that hits an enemy with the edge of the blade (the length of obround melee hitbox).
*"Thrust attack" is a melee strike that hits an enemy with the tip of the blade (the rounded edge of obround melee hitbox).
*"360/spin attack" is a sliding sweep attack that hits targets around the player (not always in a 360° arc, but is usually above 180°).
*"Direct slam attack" is a melee strike that hits a single target at the epicenter of a slam attack. Affected by the [[Seismic Wave]] mod.
*"Radial slam attack" is the area-of-effect component of the melee slam attack. Affected by the [[Seismic Wave]] mod.
*"Ranged attack" is any melee attack that launches a ranged projectile or can hit targets beyond melee range.
|-
|}

View Full Legend

*Average Damage Multiplier per second only applies to single-target DPS calculations.
*Hits marked as "Radial Slam Attack" will not apply at the epicenter of a single target hit so these will not be accounted for in Avg Dmg Multi/s calculations.
*Combo animation lengths are approximate and are only accurate within a few tenths of a second.
*Each tile marking in stance preview gifs are 2m apart.
*Combos labeled with an asterisk (*) are shared between weapons within the same weapon type.

]=]--footer
end
-- caches the stance legend, in case that's somehow useful
local function buildStanceLegend(colSpan)
	if type(_buildStanceLegend) == 'function' then
		_buildStanceLegend = _buildStanceLegend '||'
	end
	return (_buildStanceLegend:gsub('||',colSpan))
end

---	Returns completed table for a give stance.
--	@function		buildStanceTable
--	@param			{string} stanceName Stance name
--	@param[opt]		{string} comboType A specific combo type to display (EN locale); for multiple combo types,
--									   delimit with comma in the order you want combos to be displayed (e.g. "Heavy,Slide")
--	@return			{string} A table for a particular stance in wikitext
local function buildStanceTable(stanceName, comboType)
	local stanceData = StanceData[stanceName]
	assert(stanceData, 'buildStanceTable(): No stance "'..stanceName..'" in [[Module:Stances/data]]')
	local maxCols = getMaxCols(stanceData)
	
	local tRows = { ([=[
{| class="foundrytable" style="font-family:Roboto; text-align:left; max-width:100%%;"
|+ Default Combos of Stance or Weapon ([[Module:Stances/data|📝 Edit Stance Data]])
|-
! style="text-align:center; padding: 0 0.5em;" | [[Stance#Combo Types|Combo]]/Attack
! style="text-align:center; padding: 0 0.5em;" | Name
! style="text-align:center; padding: 0 0.5em;" colspan="%s"| Attack Multipliers and Forced Procs
! style="text-align:center; padding: 0 0.5em;" | Avg Dmg Multi/s
! style="text-align:center; padding: 0 0.5em;" | Length @  
1.0 [[Attack Speed]]
! style="text-align:center; padding: 0 0.5em;" | Animation
]=]):format(maxCols) }

	for comboType in (comboType or table.concat(COMBO_TYPES,',')):gmatch('%w[%w ]+%w') do
		if stanceData[comboType] then
			table.insert(tRows, buildComboRow(stanceData, comboType, maxCols))
		end
	end
	
	-- 5 additional columns: combo type, name, length, avg dmg multi, and animation 
	table.insert(tRows, buildStanceLegend(maxCols + 5))
	table.insert(tRows, '\n|}')
	
	return table.concat(tRows)
end

---	Builds stance table.
--	@function		p.buildStanceTable
--	@param			{string} stanceName Stance name
--	@param[opt]		{string} comboType A specific combo type to display (EN locale)
--	@return			{string} Stance table in wikitext
function p.buildStanceTable(frame)
	local args = Arguments.getArgs(frame)
	-- First frame argument is stance name and second frame argument is optional, 
	-- representing a specific combo type to display for a one row wikitable
	return buildStanceTable(mw.text.decode(args[1]), args[2])
end

---	Builds list of weapons that can equip a particlar stance mod as seen on [[Template:StanceWeapons]].
--	@function		p.getStanceWeaponList
--	@param			table} frame Frame object w/ first argument being string stanceName
--	@returns		{string} Resultant wikitext of comparison list
function p.getStanceWeaponList(frame)
	local stanceName = frame.args ~= nil and mw.text.decode(frame.args[1]) or nil
	local Stance = StanceData[stanceName] or
			error('p.getStanceWeaponList(frame): "'..stanceName..'" not found in [[Module:Stances/data]]')
	local pol = ModData[stanceName].Polarity

	local result = {}
	for _, weap in ipairs(Weapon._getMeleeWeapons(Stance.WeaponType, Stance.ConclaveOnly)) do
		-- TODO: If weap.stancePolarity uses shortname of Polarity (e.g. "V" instead of "Madurai"), this comparison
		-- will not properly mark the weapon as being compatible. Somehow need to normalize how we store/retrieve Polarity names.
		table.insert(result, '*'
				..Weapon._statFormat(weap, nil, 'Name')..(weap.StancePolarity == pol and ' ✓' or '')
			)
	end
	return table.concat(result, '\n')
end

---	Builds PvE stance comparison table. Used on [[Stance]] page.
--	@function		p.buildCompTable
--	@param			{string} displayAllCombos
--	@return			{string} Stance comparison table in wikitext
function p.buildCompTable(frame)
	local displayAllCombos
	if string.upper(frame.args[1]) == 'ALL' then
		displayAllCombos = true
	elseif string.upper(frame.args[1]) == 'UNIQUE' then
		displayAllCombos = false
	else
		error('p.buildCompTable(frame): Invalid argument "'..frame.args[1]..'"; must be "all" for all combos or "unique" for only unique combos per stance')
	end
	
	-- only show these combos if ignoring shared combos between melee classes
	-- local uniqueCombos = { Neutral=true, Forward=true, Block=true, ['Forward Block']=true }
	
	local tHeader = ([=[
{| class="listtable sortable mw-collapsible" style="text-align:left; max-width:100%%; font-size:12px;"
|-
! style="text-align:center;" | Stance  
Name
! style="text-align:center;" | Weapon  
Type
! style="text-align:center;" | [[Melee|Combo]]
! style="text-align:center;" | Combo Name
! style="text-align:center;" data-sort-type="number" | Length
! style="text-align:center;" | Total  
Combo  
Gain
! style="text-align:center;" | Total  
Dmg  
Multi
! style="text-align:center;" | Total  
Slash  
Proc  
Multi
! style="text-align:center;" | Total  
Multi
! style="text-align:center;" | Avg  
Dmg  
Multi/s
! style="text-align:center;" | Total  
%s Multi
! style="text-align:center;" | Total  
%s Multi
! style="text-align:center;" | Total  
%s Multi
|-]=]):format(
	Tooltip.icon('Impact', 'DamageTypes'),
	Tooltip.icon('Puncture', 'DamageTypes'),
	Tooltip.icon('Slash', 'DamageTypes')
)
	
	local tRows = {}
	
	for _, stanceData in pairs(StanceData) do
		local stanceName = stanceData["StanceName"]
		-- omitting PvP stances in comparison of PvE stances
		if stanceName ~= "__Legend" and not stanceData["ConclaveOnly"] then
			for _, comboType in pairs(COMBO_TYPES) do
				local combo = stanceData[comboType]
				if combo and (displayAllCombos or not combo.FromWeapon) then
					local duration = combo["Duration"] or 'N/A'
					local weaponType = stanceData["WeaponType"] or stanceName
					local totalDmgMulti = calcTotalDmgMulti(combo)
					local slashProcDmgMulti = calcTotalSlashProcMulti(combo)
					table.insert(
						tRows, 
						('| [[%s]] || %s || %s || %s || %ss || +%s || %d%% || %d%% || %d%% || %.0f%%/s || %d%% || %d%% || %d%%\n|-')
							:format(
								stanceName,
								weaponType,
								comboType,
								combo["Name"],
								duration,
								calcTotalComboGain(combo),
								totalDmgMulti,
								slashProcDmgMulti,
								totalDmgMulti + slashProcDmgMulti,
								calcAvgDmgMulti(combo),
								calcTotalPhysicalDmgMulti(combo, "Impact"),
								calcTotalPhysicalDmgMulti(combo, "Puncture"),
								calcTotalPhysicalDmgMulti(combo, "Slash")
							)
						)
				end
			end
		end
	end
	
	return tHeader..table.concat(tRows, '\n')..'\n|}'
end

local function getAllStancesSameType(weaponType)
	local stances = {}
	for _, Stance in pairs(StanceData) do
		local stanceName = Stance["StanceName"]
		if Stance["WeaponType"] == weaponType then
			stances[stanceName] = Stance
		end
	end
	return stances
end

	
---	Builds stance gallery. Used on [[Template:MeleeCategory]].
--	@function			p.buildStanceGallery
--	@param				{table} frame
--	@return				{string} Stance
function p.buildStanceGallery(frame)
	local weaponType = frame.args ~= nil and mw.text.decode(frame.args[1]) or frame
	local Stances = getAllStancesSameType(weaponType)
	local gallery = {([=[
==%s [[Stance|Stance Mods]]==

	]=]):format(weaponType)
	}
	for _, Stance in pairs(Stances) do
		local stanceName = Stance["StanceName"]
		local modTable = ModData[stanceName]
		-- stances that are used when no stance mod is equipped will not be in M:Mods/data
		if (modTable ~= nil) then
			local galleryEntry = ('File:%s|150px|link=%s|[[%s]]'):format(modTable["Image"], stanceName, stanceName)
			
			if Stance.ConclaveOnly then
				galleryEntry = galleryEntry..'  
([[Conclave]] only)'
			end
			
			table.insert(gallery, galleryEntry)
		end
		
	end
	table.insert(gallery, '')
	gallery = table.concat(gallery, '\n')
	return frame:preprocess(gallery)
end

return p
```

