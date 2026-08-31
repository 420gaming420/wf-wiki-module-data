---
title: "Module:Baro"
wiki_url: "https://wiki.warframe.com/w/Module/Baro"
wiki_timestamp: "2026-08-08T18:27:51Z"
---

**Baro** stores [Baro Ki'Teer](/w/Baro_Ki%27Teer "Baro Ki'Teer")'s offering history.

On this Wiki, Baro is used in:

* [Template:BaroCurrentOfferings](/w/Template:BaroCurrentOfferings "Template:BaroCurrentOfferings")
* [Template:BaroOfferingsHistoryTable](/w/Template:BaroOfferingsHistoryTable "Template:BaroOfferingsHistoryTable")
* [Template:BaroItemDates](/w/Template:BaroItemDates "Template:BaroItemDates")
* [Module:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox")
* [Module:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox")
* [Module:Void/page](/w/Module:Void/page "Module:Void/page")

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Product Backlog](#Product_Backlog)
* [3 Finished Issues](#Finished_Issues)
* [4 Documentation](#Documentation)
  + [4.1 Package items](#Package_items)
* [5 See Also](#See_Also)
* [6 Code](#Code)

## Usage

### Template

In template: `{{#invoke:Baro|__main}}`  
In articles: `{{template|function|input1|input2|...}}`

## Product Backlog

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |

## Finished Issues

| Name | Type | Status | Priority | Assignee | Description | Date Issued | Last Update |
| --- | --- | --- | --- | --- | --- | --- | --- |
| New `Visits` subtable | Dev | Completed | Low | [User:Cephalon Scientia](/w/User:Cephalon_Scientia "User:Cephalon Scientia") | Add a new subtable to `/data` that uses Baro visit dates to access table entries. Each entry would represent a Baro visit and contain the names of items that were available to be purchased on both PC and Console. Ignore evergreen offerings like Inaros' quest and Fae Step Ephemera.  18:27, 30 October 2021 (UTC) update: Table is automatically generated through [Module:Baro/data/visits](/w/Module:Baro/data/visits "Module:Baro/data/visits") instead of being a subtable in [Module:Baro/data](/w/Module:Baro/data "Module:Baro/data"). | 05:56, 19 July 2021 (UTC) | [05:25, 23 October 2021 (UTC)](https://warframe.fandom.com/wiki/Module:Baro/data/visits?oldid=2237664) |

## Documentation

### Package items

`baro.getItemDates(frame)` (function)
:   Template entry point for #invoke. Standardizes frame arguments.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: formatted plain text based on mode (string)
:   **See also**: \_getItemDates

`baro.buildCurrentOfferings(frame)` (function)
:   Builds current cross-platform offerings display in a gallery format.
:   **Parameter**: `frame` MediaWiki frame object containing template arguments:

    * frame.args.allItems {string} (optional) If 'true', includes all non-discontinued Baro items.
    * frame.args.extraItems {string} (optional) If 'true', appends special extra items to the gallery.
    * frame.args[number] {string} Case-sensitive item names to be offered by Baro.
:   (table)
:   **Returns**: Wikitext of gallery (string)

`baro.buildOfferingHistoryTable(frame)` (function)
:   Builds Baro's offering history tabber wikitable.
:   **Parameter**: `frame` MediaWiki frame object containing template arguments:

    * frame.args[1] {string} Target platform: 'PC' (default), 'Consoles', or 'All'.
    * frame.args[2] {string} Categorization mode: 'HistoryCategory', 'GalleryCategory', 'ItemType', 'Year'.
    * frame.args[3] {string} (Optional) Filter key:
    * nil - (Default) Dynamic aggregation, loops through all categories.
    * 'All' - Forces aggregation into a single unified 'All' tab only.
    * 'Name' - Renders a single specific tab (e.g., 'Weapon').
    * 'Name, Name' - Comma-separated list to render multiple specific tabs simultaneously
:   (frame)
:   **Returns**: (string) Wikitext of the tabbed history tables.

`baro.getTotalCreditCost(frame)` (function)
:   Gets total credit cost of buying all Baro's offerings at least once.
:   **Parameter**: `frame` Frame object, first argument being platform 'PC' or 'Consoles' (table)
:   **Returns**: Total credit cost @deprecated Use \_getTotal instead. (number)

`baro.getTotalDucatCost(frame)` (function)
:   Gets total ducat cost of buying all Baro's offerings at least once.
:   **Parameter**: `frame` Frame object, first argument being platform 'PC' or 'Consoles' (table)
:   **Returns**: Total ducat cost @deprecated Use \_getTotal instead. (number)

`baro.getTotalCost(frame)` (function)
:   Gets total credit and ducat cost of buying all Baro's offerings at least once.
:   **Parameter**: `frame` Frame object, first argument being platform 'PC' or 'Consoles' (table)
:   **Returns**: Total credit and ducat cost with additional formatting @deprecated Use \_getTotal instead. (string)

`baro.getItemCount(frame)` (function)
:   Gets total count of all Baro's offerings.
:   **Parameter**: `frame` Frame object, first argument being platform 'PC' or 'Consoles' (table)
:   **Returns**: Total count @deprecated Use \_getTotal instead. (number)

`baro._buildBaroSourceStrings(name)` (function)
:   Builds a list of dates when an item was able to be purchased from Baro (ignores evergreen items which are always available regardless of visit since their release). Used in infobox builders such as [Module:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox")
:   **Parameter**: `name` Name of item (string)
:   **Returns**: List of dates in wikitext or an empty string if Baro never sold this particular item (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Baro/data](/w/Module:Baro/data "Module:Baro/data")
* [Baro/data/dev](/w/Module:Baro/data/dev "Module:Baro/data/dev")
* [Baro/data/doc](/w/Module:Baro/data/doc "Module:Baro/data/doc")
* [Baro/data/typeConfigs](/w/Module:Baro/data/typeConfigs "Module:Baro/data/typeConfigs")
* [Baro/data/typeConfigs/doc](/w/Module:Baro/data/typeConfigs/doc "Module:Baro/data/typeConfigs/doc")
* [Baro/data/visits](/w/Module:Baro/data/visits "Module:Baro/data/visits")
* [Baro/data/visits/doc](/w/Module:Baro/data/visits/doc "Module:Baro/data/visits/doc")
* [Baro/doc](/w/Module:Baro/doc "Module:Baro/doc")
* [Baro/history](/w/Module:Baro/history "Module:Baro/history")
* [Baro/history/doc](/w/Module:Baro/history/doc "Module:Baro/history/doc")
* [Baro/testcases](/w/Module:Baro/testcases "Module:Baro/testcases")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | M:Baro ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
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
---	'''Baro''' stores [[Baro Ki'Teer]]'s offering history.  

--	
--	On this Wiki, Baro is used in:
--	* [[Template:BaroCurrentOfferings]]
--	* [[Template:BaroOfferingsHistoryTable]]
--	* [[Template:BaroItemDates]]
--	* [[Module:Weapons/infobox]]
--	* [[Module:Mods/infobox]]
--	* [[Module:Void/page]]
--	
--	@module		baro
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Anexera|Anexera]]
--	@attribution	[[User:FINNER|FINNER]]
--	@image		PrismaSigil.png
--	@require	[[Module:Arguments]]
--	@require	[[Module:Entrypoint]]
--	@require	[[Module:Baro/data]]
--	@require	[[Module:Baro/data/typeConfigs]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@release	stable
--	

local p = {}

local Args = require('Module:Arguments');
local Entrypoint = require('Module:Entrypoint');
local BaroData = mw.loadData('Module:Baro/data')
local BaroItems = BaroData['Items']
local TypeConfigs = mw.loadData('Module:Baro/data/typeConfigs')
local Table = require('Module:Table')
local Tooltip = require('Module:Tooltips')
local Lang = mw.language.getContentLanguage()

local seenPool = {}

---	Internal helper to merge, clean, and deduplicate any types of data into existing tables.
--	@function		mergeData
--	@note			Optimized for MediaWiki/Scribunto. It uses a persistent `seenPool` container to avoid repeated table allocation and GC pressure.
--						The pool automatically flushes itself when a new `target` is detected.
--	@param			{table|any} source Data to merge
--		- sequence		: Merges all indexed elements
--		- other types	: Treated as a single element fallback
--		- {}			: Skipped
--	@param			{table} target Target array table for merged and deduplicated results
--	@param			{number} limit Maximum number of elements to merge (optional)
--	@param			{boolean} forward Loop direction (optional, true to loop from start, false to loop from end)
--	@param			{string|number} label Custom suffix appended to each merged item (optional)
--		NOTE: If provided, all input items must be string or number to prevent concatenation errors
--	@return			{nil}
local function mergeData(source, target, limit, forward, label)
	if source == nil then return end
	assert(type(target) == "table", "mergeData(source, target): 'target' must be a table")

	local isTable = type(source) == 'table'
	local isArray = isTable and source[1] ~= nil
	local n = 0

	if seenPool.__lastTarget ~= target then
		for k in pairs(seenPool) do seenPool[k] = nil end
		seenPool.__lastTarget = target
	end

	if isArray then -- count array length
		for _ in ipairs(source) do n = n + 1 end
	elseif isTable then -- distinguish hash vs {}
		for _ in pairs(source) do n = 1 break end
	else -- fallback for single value
		n = 1
	end

	local startIndex, endIndex, step, count = 1, n, 1, 0
	if forward == false then startIndex, endIndex, step = n, 1, -1 end

	for i = startIndex, endIndex, step do
		local d = isArray and source[i] or source
		local cleanD = type(d) == 'string' and d:match("^%s*(.-)%s*$") or d
		if cleanD ~= '' and not seenPool[cleanD] then
			table.insert(target, label and cleanD .. label or cleanD)
			seenPool[cleanD] = true
			if limit then
				count = count + 1; if count >= limit then break end
			end
		end
	end
end

--- Formats a data list into various Wikitext components based on the specified output mode.
-- @function	formatDataList
-- @param		{table} list Array of items (strings) to be formatted and displayed
-- @param		{string} mode Output rendering type ('table', 'list', 'tooltip', 'collapsible', or 'wikitable')
-- @param		{string} caption Display title or label for the component header (optional, defaults to list[1])
-- @param		{string} id Wikitext element ID (recommended; defaults to 'collapsibleList')
-- 						Required only for 'collapsible' mode to separate independent lists or create custom toggle groups
-- @return		{string|table} Wikitext syntax, fallback plain text, or raw table depending on the mode
local function formatDataList(list, mode, caption, id)
	list = type(list) == 'table' and list or {list}
	if mode == 'table' then return list end
	if mode == 'list' then return table.concat(list, '  
') end
	if mode == 'wikitable' then
		return string.format('{| class="wikitable sortable"\n!%s\n|-\n|%s\n|}',
			caption or 'Table', table.concat(list, '\n|-\n|'))
	end

	local firstItem = list[1]
	local displayLabel = caption or firstItem
	if #list > 1 or (caption and firstItem) then
		-- Ensure doesn't repeat the label if the label is the first item
		local startIndex = caption and 1 or 2

		if mode == 'tooltip' then
			local maxLen = 0; for _, v in ipairs(list) do maxLen = math.max(maxLen, #v) end
			local width = math.max(math.floor(maxLen / 2), 6)
			return string.format('%s',
				("￣"):rep(width) .. '\\n' .. table.concat(list, '\\n', startIndex), displayLabel
			)
		elseif mode == 'collapsible' then
			local collapsibleId = id or 'collapsibleList'
			return string.format(
				'%s ▼  
%s',
				collapsibleId, displayLabel, collapsibleId, table.concat(list, '  
', startIndex)
			)
		end
	end

	return displayLabel or ''
end

---	Formats the item display with appropriate links or tooltip.
--	@function		formatItemName
--	@param			{table} ItemEntry The item object containing Name, Type, and Link
--	@return			{string} Formatted output (Wikitext link or Tooltip HTML)
local function formatItemName(ItemEntry)
	local moduleName = (TypeConfigs[ItemEntry.Type or ''] or {}).TooltipModule
	local itemName = ItemEntry.Name
	local itemLink = ItemEntry.Link or itemName

	local condition = ItemEntry.Condition and
		('

%s

🔒 '):format(ItemEntry.Condition) or ''

	if moduleName then
		return condition .. Tooltip.full({ itemLink, moduleName, r = itemName })
	else
		return condition .. '[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]' 
	end
end

--- Core logic to process Baro history dates and generate tooltip or plain text.
-- @function				_getItemDates
-- @param					{table} options Configuration table containing:
-- * '''item''' 			(table|string): ItemEntry array or ItemName string (supports comma-separated values). (optional if extraDates is provided)
--								All dates will be merged and deduplicated into a single list.
-- * '''platform'''			(string): Filter platform, e.g., 'All', 'PC', 'Consoles', 'SharedOnly', 'PcOnly', 'ConsolesOnly' (default: 'PC')
-- * '''mode'''				(string): Output mode, 'table' (default), 'list', 'tooltip', 'collapsible', or 'wikitable'
-- * '''limit'''			(number): Maximum number of elements to fetch (optional)
-- * '''asc'''				(boolean): Sorting order, true for ASC, false for DESC (optional, default: true)
-- * '''platformLabel'''	(boolean): Whether to append platform names as suffixes to dates (optional, default: false)
-- * '''tennocon'''			(boolean): Whether to include TennoCon dates (optional)
-- * '''extraDates'''		(table|string): Additional comma-separated string or array of dates (optional if item is provided)
-- * '''caption'''			(string): Display title or label for 'tooltip', 'collapsible', or 'wikitable' modes header (optional)
-- * '''id'''				{string}: Wikitext element ID for 'collapsible' mode (recommended)
-- @return					{table|string} Table array of dates or formatted HTML/plain text based on mode
local function _getItemDates(options)
	local itemInput		= options.item
	itemInput = (type(itemInput) == 'string' and string.find(itemInput, ",")) and mw.text.split(itemInput, '%s*,%s*') or itemInput

	-- Normalize optional parameters
	local platform		= options.platform or "PC"
	local mode			= options.mode or "table"
	local limit			= options.limit and tonumber(options.limit)
	local asc			= options.asc ~= false and options.asc ~= 'false'
	local platformLabel	= options.platformLabel == true or options.platformLabel == 'true'
	local extraDates	= options.extraDates
	assert(itemInput or extraDates, '_getItemDates(options): item or extraDates cannot be nil')

	-- Merge dates
	local isArray		= type(itemInput) == "table" and itemInput[1] ~= nil
	local dates	= {}
	local mergeCount	= 0

	for i=1, isArray and #itemInput or 1 do
		if not itemInput then break end
		local item			= isArray and itemInput[i] or itemInput
		local ItemEntry		= type(item) == 'table' and item or BaroItems[item]
		assert(ItemEntry, string.format('_getItemDates(options): "%s" does not exist in [[Module:Baro/data]].', tostring(item)))
		assert(ItemEntry.Name, '_getItemDates(options): Invalid ItemEntry object structure (missing "Name").')

		local dateKeyType	= ItemEntry.IsAlways and 'Introduced' or 'OfferingDates'
		if platform == 'All' or platform == 'PC' or platform == 'PcOnly' then
			mergeData(ItemEntry['Pc' .. dateKeyType], dates, limit, asc, platformLabel and ' (PC only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'Consoles' or platform == 'ConsolesOnly' then
			mergeData(ItemEntry['Console' .. dateKeyType], dates, limit, asc, platformLabel and ' (Consoles only)'); mergeCount = mergeCount + 1
		end
		if platform == 'All' or platform == 'PC' or platform == 'Consoles' or platform == 'SharedOnly' then
			mergeData(ItemEntry[dateKeyType], dates, limit, asc); mergeCount = mergeCount + 1
		end
		if options.tennocon == true or options.tennocon == 'true' then
			mergeData(ItemEntry.TennoConOfferingDates, dates, limit, asc); mergeCount = mergeCount + 1
		end
		assert(mergeCount > 0, string.format('_getItemDates(options): Invalid platform %q', platform))
	end

	-- Merge extraDates
	if extraDates then
		local extraList = type(extraDates) == 'string' and mw.text.split(extraDates, '%s*,%s*') or extraDates
		mergeData(extraList, dates, nil, asc); mergeCount = mergeCount + 5
	end

	-- Sorting
	if mergeCount > 1 and asc then
		table.sort(dates, function(a, b) return tostring(a) < tostring(b) end)
	elseif mergeCount > 1 then
		table.sort(dates, function(a, b) return tostring(a) > tostring(b) end)
	end

	-- Truncate list to limit
	if limit and #dates > limit then
		for i = #dates, limit + 1, -1 do dates[i] = nil end
	end

	return formatDataList(dates, mode, options.caption, options.id)
end

---	Template entry point for #invoke. Standardizes frame arguments.
--	@function		p.getItemDates
--	@param			{table} frame Frame object
--	@return			{string} formatted plain text based on mode
--	@see			_getItemDates
function p.getItemDates(frame)
	local args = Args.getArgs(frame)
	if args.mode == 'table' then args.mode = 'wikitable' end

	return _getItemDates(args)
end

--- Internal function to calculate totals from an array of item entries.
--	@function		_getTotal
--	@param			{table} ItemEntries Array of item entries
--	@param			{boolean|nil} returnString If true, returns the formatted string
--	@return			{string|table} A formatted string, or a hash table containing the totals by default
local function _getTotal(ItemEntries, returnString)
	local count, credits, ducats = 0, 0, 0

	for _, entry in ipairs(ItemEntries) do
		if entry.Image then
			count = count + 1; credits = credits + (entry.CreditCost or 0); ducats = ducats + (entry.DucatCost or 0)
		end
	end

	if returnString then
		return string.format('Total Items: %s | Cost: %s %s + %s %s',
			Lang:formatNum(count),
			Tooltip.icon('Credits', 'Resources'), Lang:formatNum(credits),
			Tooltip.icon('Orokin Ducats', 'Resources'), Lang:formatNum(ducats)
		)
	end

	return { count = count, credit = credits, ducat = ducats }
end

---	Builds current offerings display in a gallery format using gallery tags.
--	@function		p.buildGallery
--	@param			{table} ItemEntries Array of item entries that Baro is offering, case sensitive; assuming no duplicate values
--	@return			{string} Wikitext of gallery
local function buildGallery(ItemEntries)
	local container = mw.html.create('div')
	local gallery = mw.html.create('gallery')
	local galInner = { '' }

	gallery:attr({
		['captionposition'] = 'below',
		['captionalign'] = 'center',
		['hideaddbutton'] = 'true',
		['spacing'] = 'small',
		['position'] = 'center',
		['bordersize'] = 'none',
		['widths'] = '125px',
	})

	for _, entry in ipairs(ItemEntries) do
		local displayName = entry.Image and formatItemName(entry) or
			string.format('"%s" does not exist in [[Module:Baro/data]].', entry.Name)

		table.insert(galInner, string.format('%s|link=%s|%s  
%s %s  
%s %s',
			entry.Image or 'UnidentifiedItem.png',
			entry.Link or entry.Name,
			displayName,
			'[[File:OrokinDucats.png|x20px|link=Ducats]]', Lang:formatNum(entry.DucatCost or 0),
			'[[File:Credits64.png|x20px|link=Credits]]', Lang:formatNum(entry.CreditCost or 0)
		))
	end

	galInner = table.concat(galInner, '\n')
	gallery:wikitext(galInner .. '\n')
	container:node(gallery)
	return _getTotal(ItemEntries, true) .. '\n' .. tostring(container)
end

---	Renders a sortable store table from a array of item entries.
--	@function				buildHistoryTable
--	@param					{table} ItemEntries Array of item entries:
--	* ItemEntries.tabName	{string} (Metadata) Current tab name used for element ID
--	* ItemEntries.config	{table} (Metadata) Configuration object passed from the parent builder:
--		* ItemEntries.config.platform	{string} Current platform name
--		* ItemEntries.config.mode		{string} Current categorization mode
--		* ItemEntries.config.itemDates	{table} Map of item names to their respective history date arrays
--	@return 				{string} Wikitext of table
local function buildHistoryTable(ItemEntries)
	local config = ItemEntries.config or error('buildHistoryTable(ItemEntries): missing ItemEntries.config')
	local platform = config.platform
	local itemDates = config.itemDates
	local id = ItemEntries.tabName and ('-' .. platform .. '-' .. config.mode .. '-' .. ItemEntries.tabName):gsub(" ", "_") or ''
	local tableRows = { ([=[Toggle Image
{| class="wikitable sortable lighttable store-table stickyHeader" style="width: 100%%; margin-left: auto; margin-right: auto; text-align: center;" data-tableid="%s"
|-
! style="width: 24%%;" | Item
! style="width: 18%%;" | Type
! style="width: 12%%;" | %s Credit
! style="width: 12%%;" | %s Ducat
! style="width: 17%%;" | Introduced
! style="width: 17%%;" | Date(s) Offered
|-]=]):format('BaroTable' .. id, Tooltip.icon('Credits', 'Resources'), Tooltip.icon('Orokin Ducats', 'Resources')) }

	local rowTemplate = [=[
|- data-rowid="%s"
| %s
| %s
| data-store-currency="Credit" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| data-store-currency="Ducat" data-store-value="%s" data-sort-value="%s" class="sell-col" | %s
| %s
| %s]=]

	local tooltipSpan = '%s'

	for _, entry in ipairs(ItemEntries) do
		local itemName		= entry.Name
		local itemLink		= entry.Link or itemName
		local credit		= entry.CreditCost or 0
		local ducat			= entry.DucatCost or 0
		local dates			= itemDates[itemName]
		local tooltipModule	= (TypeConfigs[entry.Type or ''] or {}).TooltipModule
		local item			= ('[[File:%s|150x220px|link=%s]]  
%s')
			:format(entry.Image or 'UnidentifiedItem.png', itemLink, '[[' .. (itemLink ~= itemName and itemLink .. '|' .. itemName or itemName) .. ']]')

		table.insert(tableRows, string.format(rowTemplate,
			itemName,
			tooltipModule and tooltipSpan:format(itemLink, tooltipModule, itemName, item) or item,
			entry.Type or '',
			credit, credit, Lang:formatNum(credit),
			ducat, ducat, Lang:formatNum(ducat),
			string.sub(dates[#dates] or '', 1, 10),
			entry.IsAlways and 'Always Available' or
				formatDataList(dates, 'collapsible', nil, ('BaroTable-Dates-' .. itemName):gsub(" ", "_")) or ''
		))
	end

	return _getTotal(ItemEntries, true) .. '\n' .. table.concat(tableRows, '\n') .. '\n|}'
end

---	Organizes items into categories and builds a tabber display using a provided configuration object.
--	@function		buildTabbers
--	@param			{table} ItemEntries Array of item entries to be categorized
--	@param			{table} config Configuration object containing tabs, getItemCat, and render functions
--	@return			{string} Wikitext of the nested tabber containing categorized content and summaries
local function buildTabbers(ItemEntries, config)
	local cats = {}
	for _, catName in ipairs(config.tabs) do cats[catName] = {} end

	for _, ItemEntry in ipairs(ItemEntries) do
		if ItemEntry.IsDiscont and cats['Discontinued'] then
			table.insert(cats['Discontinued'], ItemEntry)
		else
			local itemCat = config.getItemCat(ItemEntry)
			if cats['All'] then table.insert(cats['All'], ItemEntry) end
			if cats[itemCat] then table.insert(cats[itemCat], ItemEntry) end
		end
	end

	local tabberParts = {}
	for _, catName in ipairs(config.tabs) do
		local data = cats[catName]
		if #data > 0 then
			data.tabName = catName
			data.config = config
			local content = config.render(data)
			table.insert(tabberParts, string.format("%s=\n%s", catName, content))
		end
	end
	if #tabberParts == 0 then return 'No matched items' end

	return '\n|-|' .. table.concat(tabberParts, '\n|-|') .. '\n'
end

---	Builds current cross-platform offerings display in a gallery format.
--	@function				p.buildCurrentOfferings
--	@param					{table} frame MediaWiki frame object containing template arguments:
--	* frame.args.allItems	{string} (optional) If 'true', includes all non-discontinued Baro items.
--	* frame.args.extraItems	{string} (optional) If 'true', appends special extra items to the gallery.
--	* frame.args[number]	{string} Case-sensitive item names to be offered by Baro.
--	@return					{string} Wikitext of gallery
function p.buildCurrentOfferings(frame)
	local args = Args.getArgs(frame.args)
	assert(args, 'p.buildCurrentOfferings(frame): cannot have empty arguments; arguments must be item names, case sensitive')

	local buildgalleryConfig = {
		tabs = { 'All', 'Mods', 'Appearance', 'Weapons', 'Miscellaneous' },
		getItemCat = function(entry) return (TypeConfigs[entry.Type or ''] or {}).GalleryCategory or 'Unknown' end,
		render = buildGallery
	}

	local ItemEntries = {}
	local extraItems = { -- Always available items, not included in the API.
		 { Condition = "Requires Inaros Prime (Equipped)", CreditCost = 25000, DucatCost = 100,
		 	Image = "BaroVoid-Signal.png", Name = "Baro Void-Signal", Type = "Mission Locator" },
	}

	if args.allItems == 'true' then
		for _, v in pairs(BaroItems) do
			if not v.IsDiscont then table.insert(ItemEntries, v) end
		end
		table.sort(ItemEntries, function(a, b) return a.Type == b.Type and a.Name < b.Name or a.Type < b.Type end)
	else
		for _, itemName in ipairs(args) do
			table.insert(ItemEntries, BaroItems[itemName] or { Name = itemName })
		end
	end

	if args.extraItems == 'true' then
		for i = 1, #extraItems do ItemEntries[#ItemEntries + 1] = extraItems[i] end
	end

	return frame:preprocess(buildTabbers(ItemEntries, buildgalleryConfig))
end

---	Builds Baro's offering history tabber wikitable.
--	@function			p.buildOfferingHistoryTable
--	@param				{frame} frame MediaWiki frame object containing template arguments:
--	* frame.args[1]		{string} Target platform: 'PC' (default), 'Consoles', or 'All'.
--	* frame.args[2]		{string} Categorization mode: 'HistoryCategory', 'GalleryCategory', 'ItemType', 'Year'.
--	* frame.args[3]		{string} (Optional) Filter key:
--		* nil - (Default) Dynamic aggregation, loops through all categories.
--		* 'All' - Forces aggregation into a single unified 'All' tab only.
--		* 'Name' - Renders a single specific tab (e.g., 'Weapon').
--		* 'Name, Name' - Comma-separated list to render multiple specific tabs simultaneously
--	@returns		(string) Wikitext of the tabbed history tables.
function p.buildOfferingHistoryTable(frame)
	local args = Args.getArgs(frame)
	local platform = args[1] or 'PC'
	local cat = args[2]
	local key = args[3]
	local platformMap = { All = 'All', PC = "Pc", Consoles = "Console" }
	assert(platformMap[platform], 'p.buildOfferingHistoryTable(frame): Invalid first argument')

	-- Categories Configuration
	local categories = key == nil and {} or mw.text.split(key, '%s*,%s**')
	local buildHistoryConfig = { platform = platform, tabs = categories, render = buildHistoryTable, itemDates = {}, mode = cat }
	local getItemDatesConfig = { platform = platform, asc = false, platformLabel = true }

	if cat == 'HistoryCategory' or cat == 'GalleryCategory' or cat == 'ItemType' then
		if key == nil then
			if cat == 'ItemType' then
				for k in pairs(TypeConfigs) do table.insert(categories, k) end
			else
				for _, v in pairs(TypeConfigs) do mergeData(v[cat], categories) end
			end
			table.sort(categories)
			table.insert(categories, 1, 'All')
			table.insert(categories, 'Discontinued')
		end
		buildHistoryConfig.getItemCat = cat == 'ItemType' and
			function(entry) return entry.Type or 'Unknown' end or
			function(entry) return (TypeConfigs[entry.Type or ''] or {})[cat] or 'Unknown' end

	elseif cat == 'Year' then
		if key == nil then
			local startYear = platform == 'Consoles' and 2015 or 2014
			for year = os.date('!*t').year, startYear , -1 do
				table.insert(categories, tostring(year))
			end
		end
		buildHistoryConfig.getItemCat = function(entry)
			local dates = buildHistoryConfig.itemDates[entry.Name]
			return #dates >0 and string.sub(dates[#dates], 1, 4) or 'Unknown'
		end
	end

	-- Filter Platform
	local ItemEntries = {}
	local dateKey = platformMap[platform] .. 'OfferingDates'
	for k, v in pairs(BaroItems) do
		if platform == 'All' or v['OfferingDates'] or v[dateKey] or v.IsAlways then
			getItemDatesConfig.item = v
			buildHistoryConfig.itemDates[k] = _getItemDates(getItemDatesConfig)
			table.insert(ItemEntries, v)
		end
	end

	if 	buildHistoryConfig.getItemCat then
		return frame:preprocess(buildTabbers(ItemEntries, buildHistoryConfig))
	else
		ItemEntries.config = buildHistoryConfig
		return buildHistoryTable(ItemEntries)
	end
end

---	Gets total credit cost of buying all Baro's offerings at least once.
--	@function		p.getTotalCreditCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total credit cost
--	@deprecated		Use _getTotal instead.
function p.getTotalCreditCost(frame)
	local platform = frame.args[1]
	local dateKey = nil
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalCreditCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	local total = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			total = total + ((ItemEntry.CreditCost == nil and 0) or ItemEntry.CreditCost)
		end
	end
	return total
end

---	Gets total ducat cost of buying all Baro's offerings at least once.
--	@function		p.getTotalDucatCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total ducat cost
--	@deprecated		Use _getTotal instead.
function p.getTotalDucatCost(frame)
	local platform = frame.args[1]
	local dateKey = nil
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalDucatCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	local total = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			total = total + ((ItemEntry.DucatCost == nil and 0) or ItemEntry.DucatCost)
		end
	end
	return total
end

---	Gets total credit and ducat cost of buying all Baro's offerings at least once.
--	@function		p.getTotalCost
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{string} Total credit and ducat cost with additional formatting
--	@deprecated		Use _getTotal instead.
function p.getTotalCost(frame)
	return frame:preprocess(Tooltip.icon('Credits', 'Resources') .." '''" .. Lang:formatNum(p.getTotalCreditCost(frame)) ..
		"''' + " .. Tooltip.icon('Orokin Ducats', 'Resources') .. " '''" .. Lang:formatNum(p.getTotalDucatCost(frame)) .. "'''"
	)
end

---	Gets total count of all Baro's offerings.
--	@function		p.getItemCount
--	@param			{table} frame Frame object, first argument being platform 'PC' or 'Consoles'
--	@return			{number} Total count
--	@deprecated		Use _getTotal instead.
function p.getItemCount(frame)
	local platform = frame.args[1]
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.getTotalDucatCost(frame): Invalid first argument; valid arguments are "PC" or "Console"')
	end

	-- TODO: Can be optimized probably by iterating over an already filtered dataset
	local count = 0
	for _, ItemEntry in pairs(BaroItems) do
		if (ItemEntry[dateKey] ~= nil or ItemEntry['OfferingDates'] ~= nil) then
			count = count + 1
		end
	end
	return count
end

---	Builds a list of dates when an item was able to be purchased from Baro (ignores
--	evergreen items which are always available regardless of visit since their release).
--	Used in infobox builders such as [[Module:Mods/infobox]]
--	@function		p._buildBaroSourceStrings
--	@param			{string} name Name of item
--	@return			{string} List of dates in wikitext or an empty string if Baro never sold this particular item
function p._buildBaroSourceStrings(name)
	local ItemEntry = BaroItems[name]
	if (ItemEntry == nil) or (ItemEntry.IsDiscont == true) then return '' end

	local currencyStr = ('%s%s%s  
'):format(
		ItemEntry.DucatCost and Tooltip.icon('Orokin Ducats', 'Resources') .. ' ' .. Lang:formatNum(ItemEntry.DucatCost) or '',
		(ItemEntry.DucatCost and ItemEntry.CreditCost) and ' + ' or '',
		ItemEntry.CreditCost and Tooltip.icon('Credits', 'Resources') .. ' ' .. Lang:formatNum(ItemEntry.CreditCost) or ''
	)

	-- Assumes dates are ordered in data
	-- Need to deepCopy b/c tables have metatable that prevents reassignment or modification.
	local pcDateList = Table.deepCopy(ItemEntry.PcOfferingDates or {})
	local consoleDateList = Table.deepCopy(ItemEntry.ConsoleOfferingDates or {})
	local allPlatformsDateList = Table.deepCopy(ItemEntry.OfferingDates or {})
	if #pcDateList == 0 and #consoleDateList == 0 and #allPlatformsDateList == 0 then return '' end

	return ([=[
{| class="wikitable" style="margin: 1em auto;"
|+ [[Baro Ki'Teer]]  
%s
! PC Only  
Dates !! Console Only  
Dates !! All Platforms
|-
| %s || %s || %s
|-
|}
[[Category:Baro Ki'Teer Offering]]
]=]):format(currencyStr, table.concat(pcDateList, '  
'), table.concat(consoleDateList, '  
'), table.concat(allPlatformsDateList, '  
'))
end

p._getItemDates = _getItemDates

p.__main = Entrypoint(p);

return p
```

