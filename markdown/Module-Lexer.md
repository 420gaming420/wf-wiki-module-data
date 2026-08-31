---
title: "Module:Lexer"
wiki_url: "https://wiki.warframe.com/w/Module/Lexer"
wiki_timestamp: "2022-09-23T22:43:38Z"
---

**Lexer** for Lua source code written in pure Lua. Forked from <https://dev.fandom.com/wiki/Module:Lexer> which was a fork of <https://github.com/LoganDark/lua-lexer>

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package function](#Package_function)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package function

`lexer(text)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Lexer for Lua source code written in pure Lua.
:   **Parameter**: `text` Lua source code to lex. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Table of line arrays containing lexemes. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Lexer/doc](/w/Module:Lexer/doc "Module:Lexer/doc")

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
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • M:Lexer • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
-- 
--- Lexer for Lua source code written in pure Lua.
--  
--  Forked from https://dev.fandom.com/wiki/Module:Lexer which was a fork of https://github.com/LoganDark/lua-lexer
--  
--  @script             lexer
--  @license            MIT
--  @author             [[github:LoganDark|LoganDark]]
--  @param              {string} text Lua source code to lex.
--  @return             {string} Table of line arrays containing lexemes.

--- Mapper for individual token list string.
--  @param              {string} src List of characters or keywords to map.
--  @param[opt]         {table} list Table to extend by reference.
--  @return             {{char=true,...}}, map 
--  @local
local function lookupify(src, list)
	list = list or {}

	if type(src) == 'string' then
		for i = 1, src:len() do
			list[src:sub(i, i)] = true
		end
	elseif type(src) == 'table' then
		for i = 1, #src do
			list[src[i]] = true
		end
	end

	return list
end

--- Base identifier character set.
--  @variable           {string} base_ident
local base_ident = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_'

--- Base identifier character set.
--  @variable           {string} base_digits
local base_digits = '0123456789'

--- Base identifier character set.
--  @variable           {string} base_operators
local base_operators = '+-*/^%#'

--- Map of Lua character patterns.
--  @table              chars
--  @field              {table} whitespace Boolean map of whitespace
--                      tokens.
--  @field              {table} validEscapes Boolean map of valid escape
--                      characters.
--  @field              {table} ident Boolean map of valid identifier
--                      characters.
--  @field              {table} symbols Boolean map of valid symbol and
--                      operator characters.
--  @local
local chars = {
	whitespace = lookupify(' \n\t\r'),
	validEscapes = lookupify('abfnrtv"\'\\'),
	ident = lookupify(
		base_ident .. base_digits,
		{
			start = lookupify(base_ident),
		}
	),

	digits = lookupify(
		base_digits,
		{
			hex = lookupify(base_digits .. 'abcdefABCDEF')
		}
	),

	symbols = lookupify(
		base_operators .. ',{}[]();.:', {
			equality = lookupify('~=><'),
			operators = lookupify(base_operators)
		}
	)
}

--- List of Lua keywords.
--  @table              keywords
--  @field              structure Boolean map of structure keywords.
--  @field              values Boolean map of primitive keywords.
local keywords = {
	structure = lookupify({
		'and', 'break', 'do', 'else', 'elseif', 'end', 'for', 'function',
		'goto', 'if', 'in', 'local', 'not', 'or', 'repeat', 'return', 'then',
		'until', 'while'
	}),

	values = lookupify({
		'true', 'false', 'nil'
	})
}

--  Lexer function export.
return function(text)
	local pos = 1
	local start = 1
	local buffer = {}
	local lines = {}

	local function look(delta)
		delta = pos + (delta or 0)

		return text:sub(delta, delta)
	end

	local function get()
		pos = pos + 1

		return look(-1)
	end

	local function getDataLevel()
		local num = 0

		while look(num) == '=' do
			num = num + 1
		end

		if look(num) == '[' then
			pos = pos + num + 1

			return num
		end
	end

	local function getCurrentTokenText()
		return text:sub(start, pos - 1)
	end

	local currentLineLength = 0
	local lineoffset = 0

	local function pushToken(type, text)
		text = text or getCurrentTokenText()

		local tk = buffer[#buffer]

		if not tk or tk.type ~= type then
			tk = {
				type = type,
				data = text,
				posFirst = start - lineoffset,
				posLast = pos - 1 - lineoffset
			}

			if tk.data ~= '' then
				buffer[#buffer + 1] = tk
			end
		else
			tk.data = tk.data .. text
			tk.posLast = tk.posLast + text:len()
		end

		currentLineLength = currentLineLength + text:len()
		start = pos

		return tk
	end

	local function newline()
		lines[#lines + 1] = buffer
		buffer = {}

		get()
		pushToken('newline')
		buffer[1] = nil

		lineoffset = lineoffset + currentLineLength
		currentLineLength = 0
	end

	local function getData(level, type)
		while true do
			local char = get()

			if char == '' then
				return
			elseif char == '\n' then
				pos = pos - 1
				pushToken(type)
				newline()
			elseif char == ']' then
				local valid = true

				for i = 1, level do
					if look() == '=' then
						pos = pos + 1
					else
						valid = false
						break
					end
				end

				if valid and look() == ']' then
					pos = pos - level - 1

					return
				end
			end
		end
	end

	local function chompWhitespace()
		while true do
			local char = look()

			if char == '\n' then
				pushToken('whitespace')
				newline()
			elseif chars.whitespace[char] then
				pos = pos + 1
			else
				break
			end
		end

		pushToken('whitespace')
	end

	while true do
		chompWhitespace()

		local char = get()

		if char == '' then
			break
		elseif char == '-' and look() == '-' then
			pos = pos + 1

			if look() == '[' then
				pos = pos + 1

				local level = getDataLevel()

				if level then
					getData(level, 'comment')

					pos = pos + level + 2
					pushToken('comment')
				else
					while true do
						local char2 = get()

						if char2 == '' or char2 == '\n' then
							pos = pos - 1
							pushToken('comment')

							if char2 == '\n' then
								newline()
							end

							break
						end
					end
				end
			else
				while true do
					local char2 = get()

					if char2 == '' or char2 == '\n' then
						pos = pos - 1
						pushToken('comment')

						if char2 == '\n' then
							newline()
						end

						break
					end
				end
			end

			pushToken('comment')
		elseif char == '\'' or char == '"' then
			pushToken('string_start')

			while true do
				local char2 = get()

				if char2 == '\\' then
					pos = pos - 1
					pushToken('string')
					get()

					local char3 = get()

					if chars.digits[char3] then
						for i = 1, 2 do
							if chars.digits[look()] then
								pos = pos + 1
							end
						end
					elseif char3 == 'x' then
						if chars.digits.hex[look()] and chars.digits.hex[look(1)] then
							pos = pos + 2
						else
							pushToken('unidentified')
						end
					elseif char3 == '\n' then
						pos = pos - 1
						pushToken('escape')
						newline()
					elseif not chars.validEscapes[char3] then
						pushToken('unidentified')
					end

					pushToken('escape')
				elseif char2 == '\n' then
					pos = pos - 1
					pushToken('string')
					newline()

					break
				elseif char2 == char or char2 == '' then
					pos = pos - 1
					pushToken('string')
					get()

					break
				end
			end

			pushToken('string_end')
		elseif chars.ident.start[char] then
			while chars.ident[look()] do
				pos = pos + 1
			end

			local word = getCurrentTokenText()

			if keywords.structure[word] then
				pushToken('keyword')
			elseif keywords.values[word] then
				pushToken('value')
			else
				pushToken('ident')
			end
		elseif chars.digits[char] or (char == '.' and chars.digits[look()]) then
			if char == '0' and look() == 'x' then
				pos = pos + 1

				while chars.digits.hex[look()] do
					pos = pos + 1
				end
			else
				while chars.digits[look()] do
					pos = pos + 1
				end

				if look() == '.' then
					pos = pos + 1

					while chars.digits[look()] do
						pos = pos + 1
					end
				end

				if look():lower() == 'e' then
					pos = pos + 1

					if look() == '-' then
						pos = pos + 1
					end

					while chars.digits[look()] do
						pos = pos + 1
					end
				end
			end

			pushToken('number')
		elseif char == '[' then
			local level = getDataLevel()

			if level then
				pushToken('string_start')

				getData(level, 'string')
				pushToken('string')

				pos = pos + level + 2
				pushToken('string_end')
			else
				pushToken('symbol')
			end
		elseif char == '.' then
			if look() == '.' then
				pos = pos + 1

				if look() == '.' then
					pos = pos + 1
				end
			end

			if getCurrentTokenText():len() == 3 then
				pushToken('vararg')
			else
				pushToken('symbol')
			end
		elseif char == ':' and look() == ':' then
			get()

			pushToken('label_start')

			chompWhitespace()

			if chars.ident.start[look()] then
				get()

				while chars.ident[look()] do
					get()
				end

				pushToken('label')

				chompWhitespace()

				if look() == ':' and look(1) == ':' then
					get()
					get()

					pushToken('label_end')
				end
			end
		elseif chars.symbols.equality[char] then
			if look() == '=' then
				pos = pos + 1
			end

			pushToken('operator')
		elseif chars.symbols[char] then
			if chars.symbols.operators[char] then
				pushToken('operator')
			else
				pushToken('symbol')
			end
		else
			pushToken('unidentified')
		end
	end

	lines[#lines + 1] = buffer

	return lines
end
```

