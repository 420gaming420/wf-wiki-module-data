---
title: "Module:String"
wiki_url: "https://wiki.warframe.com/w/Module/String"
wiki_timestamp: "2025-11-13T01:46:58Z"
---

**String** is an extension of the string STL which provides operations on string values.

String can be invoked directly (`{{#invoke:String|function|...}}`), invoked from a template (`{{template|function|...}}`), or used within other modules.

For additional functions that operate on strings, you can look into the mw.ustring and mw.text libraries that comes with Scribunto:

* <https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_library>
* <https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Text_library>

On this Wiki, String is used in:

* [Module:Shared](/w/Module:Shared "Module:Shared")

## Contents

* [1 Usage](#Usage)
  + [1.1 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Module

```lua
local p = {}
local String = require('Module:String')

local function func(input)
    -- ...
    -- input -> stuff
    -- ...
    return String.titleCase(stuff)
end
```

## Documentation

### Package items

`string.contains(str, search, ignoreCase)` (function)
:   Performs a case-sensitive check if a string is a substring of a string.
:   **Parameters**:

    * `str` A string (string)
    * `search` The element that is being searched for (string)
    * `ignoreCase` If false, search is case-sensitive; true otherwise; defaults to false (boolean; optional)
:   **Returns**: True if element exists in List, false otherwise (boolean)

`string.split(str, sep)` (function)
:   Splits a string into substrings based on a separating character. For example, split('Lith V1 Relic', '%s') would return { 'Lith', 'V1', 'Relic' }
:   **Parameters**:

    * `str` Input string (string)
    * `sep` A string separator using Lua's character sequences; default '%s', note that separator will be trimmed of whitespace (string; optional)
:   **Returns**: A table with substrings of inputstr (table)

`string.startsWith(str, start, ignoreCase)` (function)
:   Checks if a string begins with a certain substring. For example calling startsWith ("Lith V1 Relic", "Lith") would return true.
:   **Parameters**:

    * `str` String to be checked (string)
    * `start` Potential starting substring of str (string)
    * `ignoreCase` If false, search is case-sensitive; true otherwise; defaults to false (boolean)
:   **Returns**: True if a string begins with start, false otherwise (boolean)

`string.trim(str)` (function)
:   Trims leading and trailing whitespace of a string. Source: <http://lua-users.org/wiki/StringTrim>
:   **Parameter**: `str` Input string (string)
:   **Returns**: Trimed string (string)

`string.titleCase(str)` (function)
:   Returns a string in title casing format. Originally from [Module:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") written by [User:NoBrainz](/w/User:NoBrainz "User:NoBrainz"). Reworked on 11/9/2020 by [User:Gigamicro](/w/User:Gigamicro "User:Gigamicro").
:   **Parameter**: `str` Input string (string)
:   **Returns**: Trimmed resultant string in title casing format (string)

`string.newLinesToBreaks(str)` (function)
:   Converts newlines to HTML line breaks.
:   **Parameter**: `str` Input string (string)
:   **Returns**: A string that has its carriage returns and newlines replaced with break tag (string)

`string.UNPRINTABLE_CHARACTER_MAP` (table)
:   Mapping unprintable characters (1 byte) to printable ones (2 bytes). Mapping control characters U+0000 to U+001F with Cyrillic characters U+0400 to U+041F. Mapping U+007F to U+00FF with Cyrillic characters U+0420 to U+0482 and U+048A to U+04A7 (skipping accent marks) Any characters between \127 and \255 inclusive are not printable to debug console for some reason which is why this map is needed.

`string.escape(str)` (function)
:   Escapes any unprintable characters to its Lua 3-digit encoding equivalent (e. g. embedded zeroes are "\000")
:   **Parameter**: `str` Input string (string)
:   **Returns**: A string with unprintable characters escaped (string)

`string.hexquad` (table)
:   Mapping hex chars to equivalent 4b binary strings octal is a little slower but cuts this table, just use ('%O'):format()

`string.integerToBinary(x)` (function)
:   Returns the binary representation of an unsigned integer, ignoring any decimal places (no padded zeros and in big-endian).
:   **Parameter**: `x` Input number (string|number)
:   **Returns**: The binary representation of unsigned integer (string)

`string.charToBinary(x)` (function)
:   Returns the binary representation of a character (no padded zeros and in big-endian).
:   **Parameter**: `x` Input string (string)
:   **Returns**: The binary representation of character (string)

`string.stringToBinary(x)` (function)
:   Returns the binary representation of a string (with padded zeroes and in big-endian) with each character separated by a space.
:   **Parameter**: `x` Input string (string)
:   **Returns**: The binary representation of string (string)

`string.join()` (function)
:   join Join all non empty arguments together; the first argument is the separator. Usage: oneseptwosepthree ]]

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [String/doc](/w/Module:String/doc "Module:String/doc")
* [String/testcases](/w/Module:String/testcases "Module:String/testcases")
* [String/testcases/doc](/w/Module:String/testcases/doc "Module:String/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • M:String • [M:Table](/w/Module:Table "Module:Table") |
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
---	'''String''' is an extension of the string STL which provides operations on 
--	string values.  

--	
--	 String can be invoked directly (`{{#invoke:String|function|...}}`), 
--	 invoked from a template (`{{template|function|...}}`), or used
--	 within other modules.  

--	
--	For additional functions that operate on strings, you can look into the mw.ustring and mw.text 
--	libraries that comes with Scribunto:  

--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Ustring_library
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#Text_library
--	
--	On this Wiki, String is used in:
--	* [[Module:Shared]]
--	
--	@module		string
--	@alias		p
--	@attribution  [[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution  [[User:Gigamicro|Gigamicro]]
--	@attribution  [[User:NoBrainz|NoBrainz]]
--	@image		Panel.png
--	@require	[[Module:Arguments]]
--	@require	[[Module:Entrypoint]]
--	@require	[[Module:UserError]]
--	@release	stable
--	

local p = {};

--  Module dependencies  -------------------------------------------------------
local args		 = require('Module:Arguments');
local entrypoint = require('Module:Entrypoint');
local userError  = require('Module:UserError');

-- Local functions  ------------------------------------------------------------
---	For getting frame or parent arguments. Extends args.getArgs() with
--	additional arguments other than the ones listed [https://dev.fandom.com/wiki/Global_Lua_Modules/Arguments here].
--	@function		p.getArgs
--	@param			{table} frame The input arguments
--	@param			{table} options Options for getting the args
--					* {boolean} noNil If true, does not replace empty strings, 
--								strings with only spaces/newlines with nil; default false
--	@return			{table} The arguments
local function getArgs(frame, options)
	if type(frame[1]) == 'table' and table.getn(frame) < 2 then frame = frame[1]; end
	if type(options) ~= 'table' then options = {options}; end
	
	local args = args.getArgs(frame, options);
	local tempArgs = {};
	
	local j = 1;
	tempArgs = {};
	if options.noNil then
		for i = 1, math.max(#frame, #args) do
			if type(args[i]) ~= 'number' then tempArgs[i] = args[i] or frame[i];
			elseif not(tempArgs[i]) and type(args[i]) ~= 'number' and frame.args then tempArgs[i] = frame.args[i];
			elseif args[i] then tempArgs[j] = args[i]; j = j + 1; end
		end
		args = tempArgs;
	end
	
	return args;
end

-- Member functions  -----------------------------------------------------------
---	Performs a case-sensitive check if a string is a substring of a string.
--	@function		p.contains
--	@param			{string} str A string
--	@param			{string} search The element that is being searched for
--	@param[opt]		{boolean} ignoreCase If false, search is case-sensitive; true otherwise; defaults to false
--	@return			{boolean} True if element exists in List, false otherwise
function p.contains(...)
	local args = getArgs({...});
	local str = args[1];
	local search = args[2];
	local ignoreCase = args[3];
	assert(str and search, 'String.contains(str, search [, ignoreCase]): not enough arguments');

	if ignoreCase then
		if type(str) == 'table' then
			for i = 1, #str do
				str[i] = string.lower(str[i]);
			end
		else
			str = string.lower(str);
		end
		search = string.lower(search);
	end
	
	local isSubstring;
	
	if type(str) == 'table' then
		for i = 1, #str do
			isSubstring = string.find(str[i], search);
			if isSubstring then
				return true;
			end
		end
	else
		isSubstring = string.find(str, search);
	end
	
	return isSubstring ~= nil;
end

---	Splits a string into substrings based on a separating character.
--	For example, split('Lith V1 Relic', '%s') would return { 'Lith', 'V1', 'Relic' }
--	@function		p.split
--	@param			{string} str Input string
--	@param[opt]		{string} sep A string separator using Lua's character sequences; default '%s', 
--								 note that separator will be trimmed of whitespace
--	@return			{table} A table with substrings of inputstr
function p.split(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	local sep = args[2];
	assert(str ~= nil, 'String.split(str [, sep]): not enough arguments')
	
	if sep == nil then sep = '%s'; end
	
	local t = {};
	if sep == '' then
		-- Extracting all characters from string
		str:gsub(".", function(c) table.insert(t, c) end);
	else
		for substr in string.gmatch(str, '([^'..sep..']+)') do
			table.insert(t, substr);
		end
	end
	
	return t;
end

---	Checks if a string begins with a certain substring.
--	For example calling startsWith ("Lith V1 Relic", "Lith") would return true.
--	@function		p.startsWith
--	@param			{string} str String to be checked
--	@param			{string} start Potential starting substring of str
--	@param			{boolean} ignoreCase If false, search is case-sensitive; true otherwise; defaults to false
--	@return			{boolean} True if a string begins with start, false otherwise
function p.startsWith(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	local start = args[2];
	local ignoreCase = args[3];
	assert(str and start, 'String.startsWith(str, start): not enough arguments');
	-- Technically all strings start with an empty string
	if start == "" then return true; end
	
	if ignoreCase then
		str = string.lower(str);
		start = string.lower(start);
	end
	
	return string.sub(str, 1, string.len(start)) == start;
end

-- TODO: Can just be a wrapper function around mw.text.trim()
---	Trims leading and trailing whitespace of a string.
--	Source: http://lua-users.org/wiki/StringTrim
--	@function		p.trim
--	@param			{string} str Input string
--	@return			{string} Trimed string
function p.trim(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	assert(str ~= nil, 'String.trim(str): not enough arguments');
	-- Replaces "^%s*(.-)%s*$" with "%1" in str
	-- ^%s*(.-)%s*$ matches:
	-- ^:beginning of string
	-- %s*:any number of spaces
	-- (.-):any number of any character, minimum possible, saved to %1
	-- %s* again
	-- $: end of string
	-- %1 inserts the content of the parentheses
	return str:gsub("^%s*(.-)%s*$", "%1");
end

---	Returns a string in title casing format.
--	Originally from [[Module:VoidByReward]] written by [[User:NoBrainz]].
--	Reworked on 11/9/2020 by [[User:Gigamicro]].
--	@function		p.titleCase
--	@param			{string} str Input string
--	@return			{string} Trimmed resultant string in title casing format
function p.titleCase(...)
	local args = getArgs({...}, { noNil = true });
	local str = args[1];
	assert(str ~= nil, 'String.titleCase(str): not enough arguments');
	assert(type(str)=='string', 'String.titleCase: expected string, got '..type(s));
	return ({ 
		p.trim(str):gsub('(%S)(%S*)', 
			function(h,t) return h:upper()..t:lower() end 
		) 
	})[1];
end

-- functions above this point use getArgs{...} while those below do not

---	Converts newlines to HTML line breaks.
--	@function		p.newLinesToBreaks
--	@param			{string} str Input string
--	@return			{string} A string that has its carriage returns and newlines replaced with break tag
function p.newLinesToBreaks(str)
	assert(str ~= nil, 'String.newLinesToBreaks(str): not enough arguments');
	return (str:gsub('\r?\n', '  
'));
end

-- TODO: Programmatically create this table
---	Mapping unprintable characters (1 byte) to printable ones (2 bytes).
--	Mapping control characters U+0000 to U+001F with Cyrillic characters U+0400 to U+041F.
--	Mapping U+007F to U+00FF with Cyrillic characters U+0420 to U+0482 and U+048A to U+04A7 (skipping accent marks)
--	Any characters between \127 and \255 inclusive are not printable to debug console for some reason
--	which is why this map is needed.
--	@table		p.UNPRINTABLE_CHARACTER_MAP
p.UNPRINTABLE_CHARACTER_MAP = {
	[0] = 'Ѐ',
	[1] = 'Ё',
	[2] = 'Ђ',
	[3] = 'Ѓ',
	[4] = 'Є',
	[5] = 'Ѕ',
	[6] = 'І',
	[7] = 'Ї',
	[8] = 'Ј',
	[9] = 'Љ',
	[10] = 'Њ',
	[11] = 'Ћ',
	[12] = 'Ќ',
	[13] = 'Ѝ',
	[14] = 'Ў',
	[15] = 'Џ',
	[16] = 'А',
	[17] = 'Б',
	[18] = 'В',
	[19] = 'Г',
	[20] = 'Д',
	[21] = 'Е',
	[22] = 'Ж',
	[23] = 'З',
	[24] = 'И',
	[25] = 'Й',
	[26] = 'К',
	[27] = 'Л',
	[28] = 'М',
	[29] = 'Н',
	[30] = 'О',
	[31] = 'П',
	[127] = 'Р',	-- Delete character
	[128] = 'С',
	[129] = 'Т',
	[130] = 'У',
	[131] = 'Ф',
	[132] = 'Х',
	[133] = 'Ц',
	[134] = 'Ч',
	[135] = 'Ш',
	[136] = 'Щ',
	[137] = 'Ъ',
	[138] = 'Ы',
	[139] = 'Ь',
	[140] = 'Э',
	[141] = 'Ю',
	[142] = 'Я',
	[143] = 'а',
	[144] = 'б',
	[145] = 'в',
	[146] = 'г',
	[147] = 'д',
	[148] = 'е',
	[149] = 'ж',
	[150] = 'з',
	[151] = 'и',
	[152] = 'й',
	[153] = 'к',
	[154] = 'л',
	[155] = 'м',
	[156] = 'н',
	[157] = 'о',
	[158] = 'п',
	[159] = 'р',
	[160] = 'с',
	[161] = 'т',
	[162] = 'у',
	[163] = 'ф',
	[164] = 'х',
	[165] = 'ц',
	[166] = 'ч',
	[167] = 'ш',
	[168] = 'щ',
	[169] = 'ъ',
	[170] = 'ы',
	[171] = 'ь',
	[172] = 'э',
	[173] = 'ю',
	[174] = 'я',
	[175] = 'ѐ',
	[176] = 'ё',
	[177] = 'ђ',
	[178] = 'ѓ',
	[179] = 'є',
	[180] = 'ѕ',
	[181] = 'і',
	[182] = 'ї',
	[183] = 'ј',
	[184] = 'љ',
	[185] = 'њ',
	[186] = 'ћ',
	[187] = 'ќ',
	[188] = 'ѝ',
	[189] = 'ў',
	[190] = 'џ',
	[191] = 'Ѡ',
	[192] = 'ѡ',
	[193] = 'Ѣ',
	[194] = 'ѣ',
	[195] = 'Ѥ',
	[196] = 'ѥ',
	[197] = 'Ѧ',
	[198] = 'ѧ',
	[199] = 'Ѩ',
	[200] = 'ѩ',
	[201] = 'Ѫ',
	[202] = 'ѫ',
	[203] = 'Ѭ',
	[204] = 'ѭ',
	[205] = 'Ѯ',
	[206] = 'ѯ',
	[207] = 'Ѱ',
	[208] = 'ѱ',
	[209] = 'Ѳ',
	[210] = 'ѳ',
	[211] = 'Ѵ',
	[212] = 'ѵ',
	[213] = 'Ѷ',
	[214] = 'ѷ',
	[215] = 'Ѹ',
	[216] = 'ѹ',
	[217] = 'Ѻ',
	[218] = 'ѻ',
	[219] = 'Ѽ',
	[220] = 'ѽ',
	[221] = 'Ѿ',
	[222] = 'ѿ',
	[223] = 'Ҁ',
	[224] = 'ҁ',
	[225] = '҂',
	[226] = 'Ҋ',
	[227] = 'ҋ',
	[228] = 'Ҍ',
	[229] = 'ҍ',
	[230] = 'Ҏ',
	[231] = 'ҏ',
	[232] = 'Ґ',
	[233] = 'ґ',
	[234] = 'Ғ',
	[235] = 'ғ',
	[236] = 'Ҕ',
	[237] = 'ҕ',
	[238] = 'Җ',
	[239] = 'җ',
	[240] = 'Ҙ',
	[241] = 'ҙ',
	[242] = 'Қ',
	[243] = 'қ',
	[244] = 'Ҝ',
	[245] = 'ҝ',
	[246] = 'Ҟ',
	[247] = 'ҟ',
	[248] = 'Ҡ',
	[249] = 'ҡ',
	[250] = 'Ң',
	[251] = 'ң',
	[252] = 'Ҥ',
	[253] = 'ҥ',
	[254] = 'Ҧ',
	[255] = 'ҧ',
}

---	Escapes any unprintable characters to its Lua 3-digit encoding equivalent
--	(e.g. embedded zeroes are "\000")
--	@function		p.escape
--	@param			{string} str Input string
--	@return			{string} A string with unprintable characters escaped
function p.escape(str)
	local result = {};
	local escapeChars = {
		[92] = true,	-- Backslash, also used to escape characters so should also be escaped to reduce confusion
	};
	for i = 1, #str do
		local character = str:sub(i, i);
		local code = string.byte(character);	-- ASCII number in decimal
		-- Only escape unprintable characters. ASCII 0 is null char
		-- and ASCII 31 is unit separator (control characters). Any characters between
		-- \127 and \255 inclusive are not printable to debug console for some reason.
		if (code >= 0 and code <= 31) or (code >= 127) or escapeChars[code] then
			character = "\\"..string.format("%03d", code)
		end
		table.insert(result, character);
	end
	return table.concat(result, '');
end

---	Mapping hex chars to equivalent 4b binary strings
--	octal is a little slower but cuts this table, just use ('%O'):format()
--	@table		p.hexquad
p.hexquad = {
	['0']='0000',['1']='0001',['2']='0010',['3']='0011',
	['4']='0100',['5']='0101',['6']='0110',['7']='0111',
	['8']='1000',['9']='1001',['A']='1010',['B']='1011',
	['C']='1100',['D']='1101',['E']='1110',['F']='1111',
}

---	Returns the binary representation of an unsigned integer,
--	ignoring any decimal places (no padded zeros and in big-endian).
--	@function		p.integerToBinary
--	@param			{string|number} x Input number
--	@return			{string} The binary representation of unsigned integer
function p.integerToBinary(x)
	x = tonumber(x) or error('p.integerToBinary(x): x could not be coerced into a number (is '..type(x)..')')
	if x < 0 then
		error('p.integerToBinary(x): Only accept unsigned integers')
		--could allow; would lead to 64bit 2s complement or w/e
	end
	return (('%X'):format(x):gsub('%x',p.hexquad):gsub('^00?0?',''))
end

---	Returns the binary representation of a character (no padded zeros and in big-endian).
--	@function		p.charToBinary
--	@param			{string} x Input string
--	@return			{string} The binary representation of character
function p.charToBinary(x)
	if type(x) ~= 'string' or #x ~= 1 then
		error('p.charToBinary(x): Only accept a single character');
	end
	return p.integerToBinary(x:byte())
end

---	Returns the binary representation of a string (with padded zeroes and in big-endian)
--	with each character separated by a space.
--	@function		p.stringToBinary
--	@param			{string} x Input string
--	@return			{string} The binary representation of string
function p.stringToBinary(x)
	if type(x) ~= 'string' then
		error('p.charToBinary(x): Only accept strings');
	end
	return x:gsub('.',function(char)
		return ('%X'):format(char:byte()):gsub('%x',p.hexquad)
	end)
end

--[[
join

Join all non empty arguments together; the first argument is the separator.
Usage:
{{#invoke:String|join|sep|one|two|three}}
]]
function p.join(frame)
	local args = {}
	local sep
	for _, v in ipairs( frame.args ) do
		if sep then
			if v ~= '' then
				table.insert(args, v)
			end
		else
			sep = v
		end
	end
	return table.concat( args, sep or '' )
end

--  All String STL functions  --------------------------------------------------
-- https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#String_library
p.byte = string.byte;
p.char = string.char;
p.dump = string.dump;
p.find = string.find;
p.format = string.format;
p.gmatch = string.gmatch;
p.gsub = string.gsub;
p.len = string.len;
p.lower = string.lower;
p.match = string.match;
p.rep = string.rep;
p.reverse = string.reverse;
p.sub = string.sub;
p.ulower = string.ulower;
p.upper = string.upper;
p.uupper = string.uupper;

p.__main = entrypoint(p);
return p;
```

