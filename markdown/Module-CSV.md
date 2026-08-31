---
title: "Module:CSV"
wiki_url: "https://wiki.warframe.com/w/Module/CSV"
wiki_timestamp: "2022-03-09T22:22:19Z"
---

cerial. lua

Copyright 2018 wesley werner <[[email protected]](/cdn-cgi/l/email-protection)> This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or any later version. This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

See the GNU General Public License for more details. You should have received a copy of the GNU General Public License along with this program. If not, see <http://www.gnu.org/licenses/>. Serialize a Lua table into a CSV-like string. Handles standard types and circular table references. Does not serialize user data, functions or up-values.

Usage:

* local cerial = require("Module:CSV")
* local cerialstring = cerial.encode(table)
* local reconstructed = cerial.decode(cerialstring)

Performance vs pickle over 10000 encodes

* cerial:
  + serialized to 365 bytes
  + real 0m0.854s
  + user 0m0.852s
  + sys 0m0.000s
* pickle:
  + serialized to 463 bytes
  + real 0m0.740s
  + user 0m0.740s
  + sys 0m0.004s

Modified from original: <https://gist.github.com/wesleywerner/3f1e3a64079d81511084925c465eb34d>

## Contents

* [1 Usage](#Usage)
  + [1.1 Module](#Module)
* [2 Documentation](#Documentation)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Module

```lua
local csv = require('Module:CSV')
```

## Documentation

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [CSV/doc](/w/Module:CSV/doc "Module:CSV/doc")

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
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • M:CSV • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	cerial.lua
--	
--	Copyright 2018 wesley werner <[email protected]>
--	This program is free software: you can redistribute it and/or modify
--	it under the terms of the GNU General Public License as published by
--	the Free Software Foundation, either version 3 of the License, or
--	any later version.
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--	GNU General Public License for more details.
--	You should have received a copy of the GNU General Public License
--	along with this program. If not, see http://www.gnu.org/licenses/.
--	Serialize a Lua table into a CSV-like string.
--	Handles standard types and circular table references.
--	Does not serialize user data, functions or up-values.
--	
--	Usage:
--	* local cerial = require("Module:CSV")
--	* local cerialstring = cerial.encode(table)
--	* local reconstructed = cerial.decode(cerialstring)
--	
--	Performance vs pickle over 10000 encodes
--	* cerial:
--	** serialized to 365 bytes
--	** real	0m0.854s
--	** user	0m0.852s
--	** sys	0m0.000s
--	* pickle:
--	** serialized to 463 bytes
--	** real	0m0.740s
--	** user	0m0.740s
--	** sys	0m0.004s
--	
--	Modified from original: https://gist.github.com/wesleywerner/3f1e3a64079d81511084925c465eb34d
--	
--	@module		csv
--	@alias		cerial
--	@author		[https://gist.github.com/wesleywerner wesleywerner]
--	@release	stable
--	

local cerial = { }
local tablerefs = { }
local sortedrefs = { }

function string.starts(String, Start)
	return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String, End)
	return End=='' or string.sub(String,-string.len(End))==End
end

local function escapeCSV(s)
	if string.find(s, '[,"]') then
		s = '"' .. string.gsub(s, '"', '""') .. '"'
	end
	return s
end

local function fromCSV(s)
	s = s .. ','		-- ending comma
	local t = {}		-- table to collect fields
	local fieldstart = 1

	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(s, '^"', fieldstart) then
			local a, c
			local i  = fieldstart
			repeat
				-- find closing quote
				a, i, c = string.find(s, '"("?)', i+1)
			until c ~= '"'	-- quote not followed by quote?
			if not i then error('unmatched "') end
			local f = string.sub(s, fieldstart+1, i-1)
			table.insert(t, (string.gsub(f, '""', '"')))
			fieldstart = string.find(s, ',', i) + 1
		else
			-- unquoted; find next comma
			local nexti = string.find(s, ',', fieldstart)
			table.insert(t, string.sub(s, fieldstart, nexti-1))
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(s)

	-- remove blanks
	for n, l in ipairs(t) do
		if l:len() == 0 then
			table.remove(t, n)
		end
	end

  return t

end

function cerial.encode(target)

	tablerefs = { }
	sortedrefs = { }
	cerial.getRefs(target)
	local headers = cerial.headers()
	local details = cerial.details()
	return headers .. details

end

function cerial.decode(target)

	function splitlines(str)
		local t = {}
		local function helper(line)
			table.insert(t, line)
			return ""
		end
		helper((str:gsub("(.-)\r?\n", helper)))
		return t
	end

	local lines = splitlines(target)

	decodedrefs = { }
	local headers = { }

	for lineno, line in ipairs(lines) do

		-- split csv
		local fields = fromCSV(line)

		-- first field is record indicator
		local refno = tonumber(fields[1])

		-- build tables and headers
		for fieldno, fieldvalue in ipairs(fields) do

			-- build column names
			if refno == 0 then

				if fieldno == 1 then
					-- create a table reference
					table.insert(decodedrefs, { })
					table.insert(headers, { })
				else
					-- record column name
					table.insert(headers[#headers], fieldvalue)
				end

			end

		end

		-- process columns
		for fieldno, fieldvalue in ipairs(fields) do

			-- build column names
			if refno > 0 and fieldno > 1 then

				local columnname = headers[refno][fieldno - 1]

				-- assign field value
				local startref = string.starts(fieldvalue, "[")
				local endref = string.ends(fieldvalue, "]")

				-- use column index if a number, the name otherwise
				local parsedname = tonumber(columnname) or columnname

				if startref and endref then
					local subrefno = tonumber(fieldvalue:sub(2, -2))
					decodedrefs[refno][parsedname] = decodedrefs[subrefno]
					--print("link",parsedname,decodedrefs[subrefno], subrefno)
				else
					-- parse value as number
					local parsedvalue = tonumber(fieldvalue) or fieldvalue
					decodedrefs[refno][parsedname] = parsedvalue
				end

			end

		end

	end

	return decodedrefs[1]

end

function cerial.headers()

	local lines = { }

	-- headers
	for n, ref in ipairs(sortedrefs) do

		local items = { "00" }

		for k, v in pairs(ref) do
			table.insert(items, k)
		end

		table.insert(lines, table.concat(items, ","))

	end

	return table.concat(lines, "\n").."\n"

end

function cerial.details()

	local lines = { }

	for n, ref in ipairs(sortedrefs) do

		local refno = tablerefs[ref]
		local items = { string.format("%.2d", refno) }

		for k, v in pairs(ref) do
			local subref = tablerefs[v]
			if subref then
				table.insert(items, string.format("[%.2d]", subref))
			else
				table.insert(items, escapeCSV(tostring(v)))
			end
		end

		table.insert(lines, table.concat(items, ","))

	end

	return table.concat(lines, "\n").."\n"

end

function cerial.getRefs(target)

	local counter = 1
	local complete = false

	tablerefs[target] = counter
	counter = counter + 1

	-- root references
	for k, v in pairs(target) do
		if type(v) == "table" then
			if not tablerefs[v] then
				tablerefs[v] = counter
				counter = counter + 1
			end
		end
	end

	-- subtable references
	while not complete do
		complete = true
		for rv, rk in pairs(tablerefs) do
			for k, v in pairs(rv) do
				if type(v) == "table" then
					if not tablerefs[v] then
						complete = false
						tablerefs[v] = counter
						counter = counter + 1
					end
				end
			end
		end
	end

	-- sorted ref list
	for v, k in pairs(tablerefs) do
		sortedrefs[k] = v
	end

end

return cerial
```

