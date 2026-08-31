---
title: "Module:Version"
wiki_url: "https://wiki.warframe.com/w/Module/Version"
wiki_timestamp: "2025-09-13T00:52:26Z"
---

**Version** stores all build versions of [WARFRAME](/w/WARFRAME "WARFRAME") based on their update/hotfix designation.

On this Wiki, Version is used in:

* [Template:Ver](/w/Template:Ver "Template:Ver")
* [Template:Ver/Lu](/w/Template:Ver/Lu "Template:Ver/Lu")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
  + [1.3 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
  + [2.2 Other items](#Other_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Version|function|input1|input2|...}}`

### Template

In template: `{{#invoke:Ver|function|input1|input2|...}}`  
In articles: `{{Ver|input1|input2|...}}`

### Module

```lua
local p = {}
local Ver = require('Module:Version')

local function func(input)
    return Ver.getVersion(input)
end
```

## Documentation

### Package items

`version._getVersionCategory(name)` (function)
:   Gets the category page link associated with that version.
:   **Parameter**: `name` Version alias (e.g. 'U26' or 'H30.3.5') (string)
:   **Returns**: Version entry as seen in `/data` (table)

`version.getVersion(name)` (function)
:   Gets a version by name or by alias, case insensitive.
:   **Parameter**: `name` (string)
:   **Returns**: Version entry as seen in `/data` (table)

`version.getVersionLink(frame)` (function)
:   Gets a version's link.
:   **Parameter**: `frame` (table)
:   **Returns**: Wikitext of version article link (string)

`version._getVersionLink(name, color, short)` (function)
:   Gets a version's link.
:   **Parameters**:

    * `name` (string)
    * `color` (string)
    * `short` (string)
:   **Returns**: Wikitext of version article link (string)

`version._getVersionDate(name)` (function)
:   Gets a version's date.
:   **Parameter**: `name` (string)
:   **Returns**: ISO date (string)

`version.getToCLines(frame)` (function)
:   Creates all lines for table of contents.
:   **Parameter**: `frame` (table)
:   **Returns**: Wikitext of the table of contents (string)

`version.getAllVersions(frame)` (function)
:   Lists all versions of the game.
:   **Parameter**: `frame` (table)
:   **Returns**: Wikitext of version list (string)

`version.lastVersion(frame)` (function)
:   Returns the latest version of the game.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of version (string)

`version.fullVersionList(frame)` (function)
:   Returns full wikitable of WARFRAME builds.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Wikitext of resultant wikitable (string)

### Other items

`shortToLink(ver)` (function)
:   Creates a wikitext link based on the build version string.
:   **Parameter**: `ver` Build version string (e.g. "U27.0", "H22.5.1", "31.0.2", "Vanilla", "The Silver Grove", "SilGro", "TVW ") (string)
:   **Returns**: Wikitext link of update page (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Version/data](/w/Module:Version/data "Module:Version/data")
* [Version/data/doc](/w/Module:Version/data/doc "Module:Version/data/doc")
* [Version/doc](/w/Module:Version/doc "Module:Version/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • M:Version ([/data](/w/Module:Version/data "Module:Version/data")) |
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
---	'''Version''' stores all build versions of [[WARFRAME]] based on their update/hotfix designation.  

--	
--	On this Wiki, Version is used in:
--	* [[Template:Ver]]
--	* [[Template:Ver/Lu]]
--	
--	@module		version
--	@alias		p
--	@author		[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|gigamicro]]
--	@image		Launcher (English Version).png
--	@require	[[Module:Version/data]]
--	@require	[[Module:String]]
--	@release	stable
--	

local p = {}

local VersionData = require[[Module:Delay]].mw.loadData[[Module:Version/data]]

---	Creates a wikitext link based on the build version string.
--	@function		sanShort
--	@param			{string} name A plaintext name or abbreviation of a named update (e.g. "Vanilla", "The Silver Grove", "SilGro")
--	@return			{string} Wikitext link of update page
--	@local
local sanShort;sanShort = setmetatable({--put this in the data maybe
	['VANILLA'] = 'U0',
	['WEAPON BALANCE'] = 'U7.2.1',
		['WB'] = 'U7.2.1',
	['LUNARO'] = '18.15',
	['SPECTERS OF THE RAIL'] = '18.16',
		['SOTR'] = '18.16',
	['THE SILVER GROVE'] = '18.17',
		['SILGRO'] = '18.17',
		['TSG'] = '18.17',
	['THE VACUUM WITHIN'] = '18.18',
		['TVW'] = '18.18',
	['THE INDEX PREVIEW'] = '18.19',
		['INDEX PREVIEW'] = '18.19',
		['TIP'] = '18.19',
	['RECURRING NIGHTMARES'] = '18.20',
		['RN'] = '18.20',
	['RECURRING DREAMS'] = '18.21',
		['RD'] = '18.21',
},{
	__call = function(self, name)
		return name:upper():gsub('^%a[A-Z ]+', self)
		--gsub(s,pattern,t) will use matches as indices to table t, which are then replaced with the value at that index
		--eg, ('qweasd'):gsub('[ws]',{w='s',s='w'}) == 'qseawd'
	end,
	__index = function(self, index)
		return rawget(self, index) or (
			rawget(self, index:sub(1, -2)) or --trailing space
			error('No number found for '..index)
		)..'.'
	end,
})

---	Creates a wikitext link based on the build version string.
--	@function		shortToLink
--	@param			{string} ver Build version string (e.g. "U27.0", "H22.5.1", "31.0.2", "Vanilla", "The Silver Grove", "SilGro", "TVW ")
--	@return			{string} Wikitext link of update page
function p.shortToLink(ver)
	if ver.args then ver = ver.args[1] end
	-- "H1.2.3" -> "H" "1.2.3" "1"
	local buildType, alias, parent = sanShort(ver):match('([UhuH]?)((%d+)[0-9.]*)')
	-- alias = alias:gsub('^(%d+%.%d+)%.[0.]+$', '%1')
	alias = alias:gsub('%.[0.]+$', '')
	buildType = ({ U='Update', H='Hotfix' })[buildType:upper()] or 
		(alias:find('%.%d+%.') and 'Hotfix' or 'Update')
	return ('[[Update %d#%s %s|%s %s]]'):format(parent, buildType, alias, buildType, alias)
end

---	Gets the category page link associated with that version.
--	@function		p._getVersionCategory
--	@param			{string} name Version alias (e.g. 'U26' or 'H30.3.5')
--	@return			{table} Version entry as seen in /data
function p._getVersionCategory(name)
	assert(name ~= nil, 'p._getVersionCategory(name): name cannot be nil, must put in a version name')
	
	if (name == 'Vanilla' or name == '0') then
		return '[[Category:Vanilla]][[Category:Closed Beta]]'
	elseif (name == 'TBA') then
		return '[[Category:Upcoming content]]'
	end
	
	local Version = p._getVersion(name)
	-- The number before the decimal point is the first mainline update that starts with that number
	local updateNum = string.gsub(Version['Parent'], '(.+)%.(.+)', '%1')
	
	cbt = ''
	-- If parent update alias lesser than 7, that means update was a closed beta one
	if (tonumber(updateNum) < 7) then
		cbt = '[[Category:Closed Beta]]'
	end
	
	return '[[Category:Update '..updateNum..']]'..cbt
end

---	Gets a version by name or by alias, case insensitive.
--	@function		p.getVersion
--	@param			{string} name
--	@return			{table} Version entry as seen in /data
function p._getVersion(name)
	assert(name ~= nil, 'p._getVersion(name): name cannot be nil, must put in a version name')
	local versionEntry = VersionData['Versions'][name] or VersionData['Aliases'][name]
	if (versionEntry ~= nil) then return versionEntry end
	error('p._getVersion(name): Version name or alias"'..name..'" not found (add to [[Module:Version/data]] if needed)')
end

---	Gets a version's link.
--	@function		p.getVersionLink
--	@param			{table} frame
--	@return			{string} Wikitext of version article link
function p.getVersionLink(frame)
	local name = frame.args ~= nil and frame.args[1] or frame
	local color = frame.args ~= nil and frame.args.color or nil
	local short = frame.args ~= nil and frame.args.short or "false"
	return p._getVersionLink(name, color, short)
end

---	Gets a version's link.
--	@function		p._getVersionLink
--	@param			{string} name
--	@param			{string} color
--	@param			{string} short
--	@return			{string} Wikitext of version article link
function p._getVersionLink(name, color, short)
	local Version = p._getVersion(name:gsub('^%s*(.+?)%s*$','%1'))
	local name = ''
	local date = ''
	
	if short ~= nil and string.upper(short) == "TRUE" then
		name = Version.ShortName
	else
		name = Version.Name
		date = ' ('..Version.Date..')'
	end
	
	assert(Version ~= nil, 'p._getVersionLink(name, color, short): version name "'..name..'" not found (add to [[Module:Version/data]] if needed)')
	
	if color ~= nil then
		return "[["..Version.Link.."|"..name.."]]"..date
	end
	return "[["..Version.Link.."|"..name.."]]"..date
end

---	Gets a version's date.
--	@function		p._getVersionDate
--	@param			{string} name
--	@return			{string} ISO date
function p._getVersionDate(name)
	local Version = p._getVersion(name)
	assert(Version ~= nil, 'p._getVersionDate(name): version name "'..name..'" not found (add to [[Module:Version/data]] if needed)')
	return Version.Date
end

---	Creates a line for table of contents.
--	@function		getToCLine
--	@param			{string} parent Parent version
--	@return			{string} Wikitext of a line in the table of contents
local function getToCLine(parent)
	local prevParent = nil
	local result = ""
	local LinkTemp ={}
	
	-- TODO: Refactor so there is not many nested code blocks
	for j, Version in pairs(VersionData["Versions"]) do
		local bracket = "[["--reseting the brackets
		local bracket2 = "]]"
		
		if Version.Parent == parent then
			if prevParent == nil then --check if we've been here before
				if Version.ParentName ~= nil then
					result = "'''"..Version.ParentName..":''' "
				else
					result = "'''Update "..Version.Parent..":''' "
				end
			elseif prevParent ~= nil then --been here -> add spacer
				result = result.." • "
			end
			local shortname = string.upper(string.sub(Version.ShortName,1,1)) --getting the first letter
			if shortname == "U" or shortname == "V" then --bolding the link if Update or Vanilla
				bracket = "'''[["
				bracket2 = "]]'''"
			end
			LinkTemp = mw.text.split(Version.Link, "#", true)--since ToC is used on Update pages only, and only [[#"Header"|"Name"]] links work in edit mode -> split the link and use second part of it on the next line
			result = result..bracket.."#"..LinkTemp[2].."|"..Version.ShortName..bracket2
			prevParent = Version.Parent --for checking if been in this "if" yet
		elseif prevParent ~= nil then -- ->return result if parent switches. The data is ordered so there's no need to loop through the rest for nothing
			return result
		end
	end
	return result --required for the latest update as the previous return's "if" doesn't come up true as it reaches the end of the data
end

---	Gets all parent version strings of a certain update version
--	@function		getToCAllParents
--	@param			{string} parent Parent version (e.g. 0=Closed beta, 7=U7, 12=U12, etc.)
--	@return			{string} Wikitext
local function getToCAllParents(parent)
	local parents ={}
	local hash = {}
	local parentTemp = {}
	local result = ""
	for j, Version in pairs(VersionData["Versions"]) do
		if not hash[Version.Parent] then --if this Version.Parent isn't in table hash, then
			parentTemp = mw.text.split(Version.Parent, ".", true) --splitting the Parent to a temp table
			if parent == parentTemp[1] then --comparing the function input(parent) and the temp table's first string
				parents[#parents+1] = Version.Parent --if true, add the current V.Parent to table parents at position 1+current lenght
				hash[Version.Parent] = true --add V.Parent to table "hash" and assign value "true" to the V.Parent to prevent duplicate entries in table "parents"
			end
		end
	end
	return parents
end

---	Creates all lines for table of contents.
--	@function		p.getToCLines
--	@param			{table} frame
--	@return			{string} Wikitext of the table of contents
function p.getToCLines(frame)
	local parent = frame.args ~= nil and frame.args[1] or frame
	local result = ''
	local parents = getToCAllParents(parent)
	for i,v in pairs(parents) do
		result = result..getToCLine(v)
		if i < #parents then
			result = result.."  
"
		end
	end
	assert(result ~= '', 'p.getToCLines(frame): Parent version "'..parent..'" is not a valid version')
	return result
end

---	Lists all versions of the game.
--	@function		p.getAllVersions
--	@param			{table} frame
--	@return			{string} Wikitext of version list
function p.getAllVersions(frame)
	local result = {}
	for i, v in pairs(VersionData["Versions"]) do
		table.insert('*'..p.getVersionLink(v.Name))
	end
	return table.concat(result, '\n')
end

---	Returns the latest version of the game.
--	@function		p.lastVersion
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of version
function p.lastVersion(frame)
	local color = frame.args["color"]
	local latestUpdate = VersionData["LatestVersion"]
	if color ~= nil then
		return '[['..latestUpdate.Link..'|'..latestUpdate.Name..']]'
	end
	return '[['..latestUpdate.Link..'|'..latestUpdate.Name..']]'..' ('..latestUpdate.Date..')'
end

---	Returns full wikitable of WARFRAME builds.
--	@function		p.fullVersionList
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.fullVersionList(frame)
	local result = { [[{| class="wikitable sortable stickyHeader autosort=7,d"
|-
! Version Name !! Parent Version !! Short Name !! Subtitle !! Aliases !! Is Mainline?
! Release Date !! Forum Link !! Forum Post Unix Timestamp !! Archive Link !! Archive Date
|-
]]
	}
	
	local resultRow = [=[| [[%s|%s]] || %s || %s || %s || %s || %s
| %s || %s || %s || %s || %s
|-	
]=]
	
	for _, version in pairs(VersionData.Versions) do
		local isMainline = version.Name:find('Update') and '✔️' or '❌'
		table.insert(result, resultRow:format(
				version.Link, version.Name, version.Parent, version.ShortName, version.Subtitle or '', 
				version.Aliases and table.concat(version.Aliases, ', ') or '', isMainline,
				version.Date, version.ForumLink, version.Timestamp, version.ArchiveLink, version.ArchiveDate
			)
		)
	end
	
	return table.concat(result, '')..'|}'
end

return p
```

