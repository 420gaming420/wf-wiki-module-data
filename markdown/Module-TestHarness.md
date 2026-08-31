---
title: "Module:TestHarness"
wiki_url: "https://wiki.warframe.com/w/Module/TestHarness"
wiki_timestamp: "2022-09-24T02:58:39Z"
---

Scribunto unit test framework.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See also](#See_also)
* [3 See Also](#See_Also_2)
* [4 Code](#Code)

## Documentation

### Package items

`th.code_cov(module_name, test_module, test_cases)` (function)
:   Code coverage analyser.
:   **Parameters**:

    * `module_name` Module name. (string)
    * `test_module` Test module package. (string)
    * `test_cases` Test case data. (string)
:   **Returns**: Code coverage data. (table)

`th.run_tests(f)` (function)
:   Test harness function.
:   **Parameter**: `f` Scribunto frame object. (table)
:   **Returns**: Test report. (string)

`utils.format_key(key, If)` (function)
:   Table index key formatter.
:   **Parameters**:

    * `key` Index key for Lua table. (string|number)
    * `If` `false`, omits dot index. (boolean)
:   **Returns**: Formatted table index. (string)

`engine.test_table(member, case, options)` (function)
:   Unit tester for package methods.
:   **Parameters**:

    * `member` Test member. (table)
    * `case` Test case. (string|number)
    * `options` Test options. (table)
:   **Returns**: Test case result data. (table)

## See also

<https://dev.fandom.com/wiki/Global_Lua_Modules/Testharness>

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [TestHarness/doc](/w/Module:TestHarness/doc "Module:TestHarness/doc")
* [TestHarness/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")
* [TestHarness/i18n/doc](/w/Module:TestHarness/i18n/doc "Module:TestHarness/i18n/doc")

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
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • M:TestHarness ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- 
--- Scribunto unit test framework.
--  @module             th
--  @version            2.2.2
--  @usage              {{#invoke:testharness|run_tests|modulename = String}}
--  @see                https://dev.fandom.com/wiki/Global_Lua_Modules/Testharness

--  Module package.
local th = {}

--  Module dependencies.
local wdsButton = require('Module:WDSButton')
local yesno = require('Module:Yesno')
local i18n = require('Module:I18n').loadMessages('TestHarness', 'Common')
local inspect = require('Module:Inspect')

--  Module variables.
local new_marker = tonumber(mw.site.currentVersion:match('^%d%.%d+')) >= 1.28
local marker_pattern = new_marker
    and '\127\'"`UNIQ%-%-(%l+)%-(%x+)%-?%-QINU`"\'\127'
    or  '\127\'"`UNIQ(%x+)%-(%l+)%-(%x+)%-?%-QINU`"\'\127'
local frame

--- Remove all metatables in [[Global Lua Modules/Inspect]].
--  @function           remove_metatables
--  @param              {table} item Item or metatable to inspect.
--  @param              {path} table Array of keys indexed by preprocessor.
--  @return[opt]        {table} Item to inspect (not a metatable).
--  @see                [[github:kikito/inspect.lua/blob/v3.1.0/README.md#examples]]
--  @local
local function remove_metatables(item, path)
    return path[#path] ~= inspect.METATABLE and item or nil
end
local inspect_options = {
    indent  = ' ',
    newline = '',
    process = remove_metatables
}

--- Unit testing utilites (all private).
local utils = {}

--- Custom Scribunto preprocessor.
--  Remove trailing newlines (e.g. `^\n[:#*]`) for ease of testing.
--  @function           utils.pp
--  @param              {string} str Raw wikitext.
--  @return             {string} Preprocessed text.
--  @local
function utils.pp(str)
    return mw.text.trim(frame:preprocess(str))
end

--- Strip marker preprocessor.
--  @function           utils.reset_markers
--  @param              {string} str1 First string.
--  @param              {string} str2 Second string.
--  @param              {string|nil} key Member key.
--  @return             {string} Differing 1-index/key or empy string.
--  @local
function utils.reset_markers(id, element, index)
    if not index then id, element = element, id end
    local dash, dummy = element == 'h' and '-' or '', '0'

    if new_marker then
        return '\127\'"`UNIQ--' .. element .. '-' .. dummy .. dash .. '-QINU`"\'\127'
    else
        return '\127\'"`UNIQ' .. dummy .. '-' .. element .. '-0' .. dummy .. dash .. '-QINU`"\'\127'
    end
end

--- String comparator.
--  @function           utils.diff_str
--  @param              {string} str1 First string.
--  @param              {string} str2 Second string.
--  @param              {string|nil} key Member key.
--  @return             {string} Differing 1-index/key or empy string.
--  @local
function utils.diff_str(str1, str2, key)
    if str1 == nil and str2 == nil then
        return '', key or 0
    end
    local typ1 = type(str1)
    local typ2 = type(str2)
    if typ1 ~= typ2 then
        return 'type  
'..tostring(typ1)..' vs. '..tostring(typ2)..'', key or 0
    end
    if typ1 == 'number' and str1 ~= str2 then
        return math.abs(str1 - str2)*10^(-math.floor(math.log10(math.abs(str1)))) < 10^-13 and '' or ' ', key or 0
    end
    if typ1 ~= 'string' then
        return str1 == str2 and '' or ' ', key or 0
    end
    
    str1 = tostring(str1):gsub(marker_pattern, utils.reset_markers)
    str2 = tostring(str2):gsub(marker_pattern, utils.reset_markers)
    if str1 == str2 then
        return '', key or 0
    end
    
    local max = math.min(#str1, #str2)
    for i = 1, max do
        if str1:sub(i, i) ~= str2:sub(i, i) then
        	-- Get rid of Unicode stuff
			local tempStr1 = str1:gsub("[\128-\191]", "  "):gsub("[\192-\244]", "   ")
			local tempStr2 = str2:gsub("[\128-\191]", ""):gsub("[\192-\244]", " ")
			if tempStr1 == tempStr2 then
				return '', key or 0
			end
			
			local max2 = math.min(#tempStr1, #tempStr2)
			for j = 1, max2 do
				if tempStr1:sub(j, j) ~= tempStr2:sub(j, j) then
					return (key and tostring(key) or tostring(j))..'  
"'..tempStr1:sub(j, j)..'" vs. "'..tempStr2:sub(j, j)..'"', key or j
				end
			end
			
			return (key and tostring(key) or tostring(i))..'  
"'..str1:sub(i, i)..'" vs. "'..str2:sub(i, i)..'"', key or i
        end
    end
    
    max = max + 1;
    return (key and tostring(key) or tostring(max))..'  
"'..str1:sub(max, max)..'" vs. "'..str2:sub(max, max)..'"', key or max
end

--- Table index key formatter.
--  @function           utils.format_key
--  @param              {string|number} key Index key for Lua table.
--  @param              {boolean} If `false`, omits dot index.
--  @return             {string} Formatted table index.
function utils.format_key(key)
    opts = opts or {}

    -- Support for dot-prefix syntactic sugar (field name index).
    if type(key) == 'string' and key:find('^[%w_]+$') then
        return '.' .. key
    end

    -- Fallback to square brace indexing for key expressions.
    key = type(key) == 'string' and key:gsub('"', '\\"') or key
    local quote = type(key) == 'string' and '"' or ''
    return '[' .. quote .. tostring(key) .. quote .. ']'
end

--- Table comparator.
--  @function           utils.diff_tbl
--  @param              {table} tbl1 First table.
--  @param              {table} tbl2 Second table.
--  @param              {string|nil} key Key of parent member.
--  @return             {string} First different key or empty string.
--  @local
function utils.diff_tbl(tbl1, tbl2, key)
    -- Type comparision.
    local ty1 = type(tbl1)
    local ty2 = type(tbl2)
    if ty1 ~= ty2 then
        return key or 'type  
'..tostring(ty1)..' vs. '..tostring(ty2)..''
    end
    local OTHER_TYPES = {
        ['boolean'] = 1,
        ['nil']     = 1,
        ['number']  = 1,
        ['string']  = 1
    }
    -- String comparision.
    if OTHER_TYPES[ty1] and OTHER_TYPES[ty2] then
        return utils.diff_str(tbl1, tbl2, key)
    end
    -- Strip table methods.
    utils.filter_method(tbl1)
    utils.filter_method(tbl2)
    -- Table comparision.
    key = key or ''
    for key1, val1 in pairs(tbl1) do
        local val2 = tbl2[key1]
        local nest1 = utils.diff_tbl(val1, val2, key .. utils.format_key(key1))
        if nest1 ~= '' then
            return nest1
        elseif val2 == nil then
            return  key1
        end
    end
    for key2, val2 in pairs(tbl2) do
        local val1 = tbl1[key2]
        local nest2 = utils.diff_tbl(val1, val2, key .. utils.format_key(key2))
        if nest2 ~= '' then
            return nest2
        elseif val1 == nil then
            return key2
        end
    end
    -- Return empty string if equal.
    return ''
end

--- Utility to remove methods from a table.
--  @function           utils.filter_method
--  @param              {table} tbl Table.
--  @local
function utils.filter_method(tbl)
    for key, val in pairs(tbl) do
        if type(val) == 'function' then
            tbl[key] = nil
        end
    end
end

--- Test case argument parser.
--  @function           utils.parse_arguments
--  @param              {string} case Test case.
--  @return             {table} Argument table.
--  @local
function utils.parse_arguments(case)
    local arguments = {}

    if type(case) == 'string' then
        local numbered_arguments = {}

        -- Parser defense.
        for str in mw.text.gsplit(case, '|') do
            local _, ob = (numbered_arguments[#numbered_arguments] or ''):gsub('[{%[]', '') -- opening braces
            local _, cb = (numbered_arguments[#numbered_arguments] or ''):gsub('[}%]]', '') -- closing braces
            if (ob - cb) == 0 then
                numbered_arguments[#numbered_arguments+1] = str
            else
                numbered_arguments[#numbered_arguments] = numbered_arguments[#numbered_arguments] .. '|' .. str
            end
        end

        -- Argument and whitespace parsing.
        local param_index = 0
        for index, str in ipairs(numbered_arguments) do
            -- Named parameters.
            if mw.ustring.find(str, '^%s*[^={}]+%s*=') then
                local param, val = mw.ustring.match(str, '^([^=]+)=([%s%S]*)$')
                numbered_arguments[index] = mw.text.trim(param) .. '=' .. mw.text.trim(val)
            -- Anonymous parameters.
            else
                param_index = param_index + 1
                numbered_arguments[index] = tostring(param_index) .. '=' .. str
            end
        end

        -- Argument extraction to table.
        for index, str in ipairs(numbered_arguments) do
            local param, val = mw.ustring.match(str, '([^=]+)=([%s%S]*)')
            local key = ((
                mw.ustring.find(param, '^[1-9][0-9]*$') and                             -- For positive side, must be all digits.
                ((#param < 16) or ((#param == 16) and (param <= '9007199254740992')))   -- Enforce upper bound.
            ) or (param == '0') or (
                mw.ustring.find(param, '^-[1-9][0-9]*$') and                            -- For negative side, must be all digits bar leading sign.
                ((#param < 17) or ((#param == 17) and (param <= '-9007199254740992')))  -- Enforce lower bound.
            )) and tonumber(param) or param
            arguments[key] = val
        end

        if #case == 0 then
            arguments = {}
        end

        -- Argument preprocessing.
        for param, str in pairs(arguments) do
            arguments[param] = frame:preprocess(str)
        end
    end
    -- Initialise arguments metatable.
    local args_mt = {}
    local inext = select(1, ipairs{})
    args_mt.__pairs = function()
        return next, arguments, nil
    end
    args_mt.__ipairs = function()
        return inext, arguments, 0
    end
    args_mt.__index = function(tbl, key)
        return arguments[key]
    end

    return setmetatable({}, args_mt)
end

--- Static getter for frame parent.
--  Overrides `getParent` method to return static parent.
--  @function           utils.get_parent
--  @param              {table} child Child Scribunto frame object.
--  @return             {table} Static parent frame.
--  @local
function utils.get_parent(child)
    local parent = child:getParent()
    child.getParent = function()
        return parent
    end
    return parent
end

--- Wikitext representations of Lua code.
--  @local
utils.wikitext = {}

--- Lua method test case in wikitext form.
--  @function           utils.wikitext.method
--  @param              {string} name Module name.
--  @param              {string} member Member name.
--  @param              {string|table|number} case Test case.
--  @param              {table} options Test options.
--  @return             {string} String representation.
--  @local
function utils.wikitext.method(name, member, case, options)
    local tmp
    if type(case) == 'table' then
        local t = inspect(case, inspect_options)
        if options.unpk == true then
            tmp = t:gsub('^{%s*', ''):gsub('%s*}$', '')
        else
            tmp = t
        end
    elseif type(case) == 'string' then
        tmp = '"' .. case .. '"'
    elseif case ~= nil then
        tmp = tostring(case)
    else
        tmp = ''
    end
    return tostring(name) .. (options.self == true and ':' or '.') .. tostring(member) .. '(' .. tmp .. ')'
end

--- Lua table test case in wikitext form.
--  @function           utils.wikitext.table
--  @param              {string} name Module name.
--  @param              {string} member Member name.
--  @param              {string|number} case Test case.
--  @param              {table} options Test options.
--  @return             {string} String representation.
--  @local
function utils.wikitext.table(name, member, case, options)
    local tmp = ''
    if type(case) == 'table' then
        for index, key in ipairs(case) do
            tmp = tmp .. utils.format_key(key)
        end
    else
        tmp =  utils.format_key(case)
    end
    return tostring(name) .. '.' .. tostring(member) .. tmp
end

--- Lua invocation in wikitext form.
--  @function           utils.wikitext.invocation
--  @param              {string} name Module name.
--  @param              {string} member Member name.
--  @param              {string|table} casee Test case.
--  @param              {table} options Test options.
--  @return             {string} String representation.
--  @local
function utils.wikitext.invocation(name, member, case, options)
    if type(case) == 'table' then
        local tmp = ''
        for index = 1, table.maxn(case) do
            local arguments = case[index]
            if index ~= 1 then tmp = tmp .. '\n' end
            if not options.template and index == 1 then
                tmp = tmp .. '\60\33-- '.. i18n:msg('module', '1') .. ' --\62' .. '\n{{#invoke:'
            else
                tmp = tmp .. '\60\33-- '.. i18n:msg('template', '1') ..' --\62' .. '\n{{'
            end
            tmp = tmp .. tostring(name)
            if not options.template and index == 1 then
                tmp = tmp ..  '|' .. tostring(member)
            end
            tmp = tmp .. (#(arguments or '') ~= 0 and ('|' .. arguments) or '') .. '}}'
        end
        return tmp
    else
        if options.template then
            return
                '{{' .. tostring(name) .. '|' .. tostring(member) ..
                (#(case or '') ~= 0 and ('|' .. case) or '') .. '}}'
        else
            return
                '{{#invoke:' .. tostring(name) .. '|' .. tostring(member) ..
                (#(case or '') ~= 0 and ('|' .. case) or '') .. '}}'
        end
    end
end

--- Unit test engine logic.
local engine = {}

--- Unit tester for package methods.
--  @function           engine.test_method
--  @param              {function} member Test member.
--  @param              {string|table|number|nil} case Test case.
--  @param              {table} options Test options.
--  @param              {table} pkg Module package.
--  @return             {table} Test case result data.
--  @local
function engine.test_method(member, case, options, pkg)
    local epoch = os.clock()
    local exec, ret
    if options.unpk == true then
        if options.self == true then
            exec, ret = pcall(member, pkg, unpack(case))
        else
            exec, ret = pcall(member, unpack(case))
        end
    else
        if options.self == true then
            exec, ret = pcall(member, pkg, case)
        else
            exec, ret = pcall(member, case)
        end
    end
    return { exec, ret, 1000 * (os.clock() - epoch) }
end

--- Unit tester for invocation methods.
--  @function           engine.test_invocation
--  @param              {function} member Test member.
--  @param              {string|nil} case test case.
--  @param              {table} options test options.
--  @return             {table} Test case result data.
--  @local
function engine.test_invocation(member, case, options)
    -- Attach test case arguments to frame.
    local target_frame = frame
    target_frame.args = utils.parse_arguments()
    utils.get_parent(target_frame).args = utils.parse_arguments()
    if options.template then
        target_frame = utils.get_parent(target_frame)
    end
    if type(case) == 'table' then
        for index = 1, table.maxn(case) do
            local args = case[index]
            if index ~= 1 then
                target_frame = utils.get_parent(target_frame)
            end
            if not target_frame then break end
            target_frame.args = utils.parse_arguments(args)
        end
    else
		if options.template then
			target_frame.args = utils.parse_arguments(tostring(member)..'|'..(case or ''))
		else
			target_frame.args = utils.parse_arguments(case)
        end
    end

    -- Invoke method using synthetic frame.
    local epoch = os.clock()
    local out = { pcall(member, frame) }

    out[2] = out[2] == nil and '' or tostring(out[2])
    for index, ret in ipairs(out) do
        if index >= 3 then
            out[2] = out[2] .. tostring(ret)
            out[index] = nil
        end
    end

    out[3] = 1000 * (os.clock() - epoch)

    -- Return invocation output.
    return out
end

--- Unit tester for package methods.
--  @function           engine.test_table
--  @param              {table} member Test member.
--  @param              {string|number} case Test case.
--  @param              {table} options Test options.
--  @return             {table} Test case result data.
function engine.test_table(member, case, options)
    if type(case) == 'table' and #case > 0 then
        local ret
        for index, key in ipairs(case) do
            ret = index == 1 and member[key] or (ret or {})[key]
        end
        return { true, ret, 0 }
    else
        return { true, member[case], 0 }
    end
end

--- Report renderer.
--  @function           render_report
--  @param              {boolean} suite_status Whether the test suite is passing.
--  @param              {number} total_tests Number of tests.
--  @param              {number} failed_tests Number of failed tests.
--  @param              {table} config Test module metadata & suite configuration.
--  @param              {table} failed_members Array of failed member names.
--  @param              {number} time_exec Test execution time (milliseconds).
--  @param              {table} test_results Test results.
--  @param              {table} member_fails Map of failed test counts for failed members.
--  @todo               Tidy parameters.
--  @local
local function render_report(suite_status, total_tests, failed_tests, config, failed_members, time_exec, test_results, member_fails)
    -- Unit testing report.
    local missed = {};
    local mCount = 0;
	for i, v in pairs(config.neg) do
		if string.find(v, '__') == 1 or v == 'e' or v == 'gam' then mCount = mCount + 1; else table.insert(missed, v); end
	end
	table.sort(missed);
    table.sort(failed_members);
	
	local r = mw.text.split(config.res, '/');
	r[2] = tostring(tonumber(r[2]) - mCount);
			
    local report = mw.html.create():wikitext(
        config.noforcetoc and '' or '__NOTOC__',
        '__NOEDITSECTION__'
    )
    -- Report infobox.
    report:tag('table')
        :addClass('infobox WikiaTable')
        :attr('border', '1')
        :css('margin-right', '0')
        :css('margin-top', '0')
        :css('font-size', '15px')
        :tag('tr')
            :tag('th')
                :wikitext(i18n:msg('suite-status'))
                :done()
            :tag('td')
                :wikitext(wdsButton._bubble(
                    suite_status and i18n:msg('passed') or i18n:msg('failed'),
                    suite_status and 'pass' or 'fail'
                ))
                :done()
            :done()
        :tag('tr')
            :tag('th')
                :wikitext(i18n:msg('test-cases'))
                :done()
            :tag('td')
                :wikitext(wdsButton._bubble(
                    tostring(total_tests - failed_tests) ..
                        '/' .. tostring(total_tests),
                    suite_status and 'pass' or 'fail'
                ))
                :done()
            :done()
        :tag('tr')
            :tag('th')
                :wikitext(i18n:msg('code-cov'))
                :done()
            :tag('td')
                :wikitext(wdsButton._bubble(
                    r[1] .. '/' .. r[2],
                    (function(r)
                        if r[1] ~= r[2] then
                            return 'warn'
                        else
                            return 'pass'
                        end
                    end)(r)
                ))
                :done()
            :done()
    -- Report lede.
    report:tag('b')
        :wikitext(i18n:msg('report-lede', config.name))
    -- Report summary.
    report:tag('ul')
    	:tag('li')
            :wikitext('' .. i18n:msg('report-time') .. ': ' .. tostring(math.floor(time_exec * 10 + 0.5) / 10) .. ' ms')
            :done()
    	:tag('li')
            :wikitext('' .. i18n:msg('report-failing') .. ':' .. (#failed_members ~= 0
                    and '

* ' .. table.concat(failed_members, '
* ') .. '

'
                    .. '[[Category:Failing Lua test suites]]'
                    or  ' ' .. i18n:msg('report-none') .. ''
                ))
            :done()
        :tag('li')
			:wikitext('' .. i18n:msg('report-missing') .. ':' .. ((#config.neg - mCount) ~= 0
                and '

* ' .. table.concat(missed, '
* ') .. '

'
                or  ' ' .. i18n:msg('report-none') .. ''
            ))
            :done()
    -- Report results header.
    report:tag('h2')
        :wikitext(i18n:msg('test-cases'))
    -- Report results.
    local i = 1;
    local temp = {};
    for test_member, test_output in pairs(test_results) do
    	temp[i] = test_member;
    	i = i + 1;
    end
    table.sort(temp);
    
    for i, test_member in ipairs(temp) do
    	test_output = test_results[test_member];
        local member_nowiki = test_output.options.nowiki ~= false
            and function(...) return mw.text.nowiki(tostring(...)):gsub('\n
', '  
  
') end
            or  tostring
        local result_table = report:tag('table')
            :addClass('WikiaTable mw-collapsible ' .. (((member_fails[test_member] or 0) == 0) and 'mw-collapsed' or ''))
            :attr('border', '1')
            :css('width', '100%')
            :css('margin-top', '0')
            :css('margin-bottom', '5px')
        -- Test suite member header.
        result_table:tag('tr')
            :tag('th')
                :attr('colspan', ((config.display == true) and 2 or 4) + ((config.diff == true) and 1 or 0))
                :tag('h3')
                    :attr('id', test_member)
                    :css('display', 'inline')
                    :wikitext('' .. config.pkg .. (test_output.options.self and ':' or '.') .. test_member .. '')
                    :done()
                :wikitext(' ' .. wdsButton._bubble(
                    (#test_output - (member_fails[test_member] or 0)) .. '/' .. #test_output,
                    ((member_fails[test_member] or 0) == 0) and 'pass' or 'fail'
                ))
                :done()
        -- Test suite member column headers.
        result_table:tag('tr')
            :tag('th')
                :wikitext(i18n:msg('header-status'))
                :done()
            :tag('th')
                :wikitext(i18n:msg('header-code'))
                :done()
            :node(config.display == false
                and mw.html.create('th'):wikitext(i18n:msg('header-expect'))
                or  nil
            )
            :node(config.display == false
                and mw.html.create('th'):wikitext(i18n:msg('header-actual'))
                or  nil
            )
            :node(config.diff == true
                and mw.html.create('th'):wikitext(i18n:msg('header-diff'))
                or  nil
            )
        -- Test case rendering for member.
        for test_index, test_result in ipairs(test_output) do
        	local _, i = utils.diff_str(test_result.expect, test_result.actual)
        	i = i or 0
            if type(test_result) == 'table' then
                result_table:tag('tr')
                    :tag('td')
                        :wikitext(wdsButton._badge(
                            i18n:msg((test_result.status == true) and 'passing' or 'failing'),
                            (test_result.status == true) and 'pass' or 'fail'
                        ))
                        :done()
                    -- Test case code demonstration.
                    :tag('td')
                        :wikitext(
                            frame:preprocess(
                                tostring(
                                    mw.html.create('pre')
                                        :css('max-width', '200px')
                                        :css('white-space', 'pre-wrap')
                                        :css('word-wrap', 'break-word')
                                        :wikitext(utils.wikitext[test_output.options.mode](
                                            test_output.options.mode == 'invocation'
                                                and (mw.ustring.gsub((config.name:gsub('Module:', '', 1)), '^%u', mw.ustring.lower))
                                                or  config.pkg,
                                            test_member,
                                            test_result.case,
                                            test_output.options
                                        ))
                                )
                            )
                        )
                        :done()
                    -- Expected test case output (non-display mode).
                    :node((i == 0 or (config.display == false and test_output.options.nowiki == false))
                        and mw.html.create('td')
                            :css('white-space', 'normal')
                            --:css('word-break', 'break-all')
                            :wikitext(
                                (test_result.err[1] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
								member_nowiki(type(test_result.expect) == 'table'
                                    and inspect(test_result.expect, inspect_options)
                                    or  '\n'..tostring(test_result.expect)
                                )
                            )
                        or  nil
                    )
                    :node(config.display == false and test_output.options.nowiki ~= false and i ~= 0
                        and mw.html.create('td')
                            :css('white-space', 'normal')
                            --:css('word-break', 'break-all')
                            :wikitext(
                                (test_result.err[1] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
								member_nowiki(type(test_result.expect) == 'table'
                                    and inspect(test_result.expect, inspect_options)
                                    or  '\n'..tostring(test_result.expect):sub(1, i - 1)
                                ) ..
                                ''..
                                member_nowiki(type(test_result.expect) == 'table'
                                    and inspect(test_result.expect, inspect_options)
                                    or  tostring(test_result.expect):sub(i, i)
                                ) ..
                                ''..
                                member_nowiki(type(test_result.expect) == 'table'
                                    and inspect(test_result.expect, inspect_options)
                                    or  tostring(test_result.expect):sub(i + 1)
                                )
                            )
                        or  nil
                    )
                    -- Actual test case output (non-display mode).
                    :node((i == 0 or (config.display == false and test_output.options.nowiki == false))
                        and mw.html.create('td')
                            :css('white-space', 'normal')
                            --:css('word-break', 'break-all')
                            :wikitext(
                                (test_result.err[2] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
                                member_nowiki(type(test_result.actual) == 'table'
                                    and inspect(test_result.actual, inspect_options)
                                    or  '\n'..tostring(test_result.actual)
                                )
                            )
                        or  nil
                    )
                    :node(config.display == false and test_output.options.nowiki ~= false and i ~= 0
                        and mw.html.create('td')
                            :css('white-space', 'normal')
                            --:css('word-break', 'break-all')
                            :wikitext(
                                (test_result.err[2] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
                                member_nowiki(type(test_result.actual) == 'table'
                                    and inspect(test_result.actual, inspect_options)
                                    or  '\n'..tostring(test_result.actual):sub(1, i - 1)
                                ) ..
                                ''..
                                member_nowiki(type(test_result.actual) == 'table'
                                    and inspect(test_result.actual, inspect_options)
                                    or  tostring(test_result.actual):sub(i, i)
                                ) ..
                                ''..
                                member_nowiki(type(test_result.actual) == 'table'
                                    and inspect(test_result.actual, inspect_options)
                                    or  tostring(test_result.actual):sub(i + 1)
                                )
                            )
                        or  nil
                    )
                    :node(config.diff == true
                        and mw.html.create('td'):wikitext(test_result.diff_i)
                        or  nil
                    )
                    :done()
                -- Expected test case output (display mode).
                :node(config.display == true
                    and mw.html.create('tr')
                        :tag('th')
                            :attr('colspan', config.diff == true and 3 or 2)
                            :wikitext(i18n:msg('header-expect'))
                            :done()
                    or  nil
                )
                :node(config.display == true
                    and mw.html.create('tr')
                        :tag('td')
                            :attr('colspan', config.diff == true and 3 or 2)
                            :css('word-break', 'break-all')
                            :newline()
                            :wikitext(
                                (test_result.err[1] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
                                member_nowiki(type(test_result.expect) == 'table'
                                    and inspect(test_result.expect, inspect_options)
                                    or  test_result.expect
                                )
                            )
                        :done()
                    or  nil
                )
                -- Actual test case output (display mode).
                :node(config.display == true
                    and mw.html.create('tr')
                        :tag('th')
                            :attr('colspan', config.diff == true and 3 or 2)
                            :wikitext(i18n:msg('header-actual'))
                            :done()
                    or  nil
                )
                :node(config.display == true
                    and mw.html.create('tr')
                        :tag('td')
                            :attr('colspan', config.diff == true and 3 or 2)
                            :css('word-break', 'break-all')
                            :newline()
                            :wikitext(
                                (test_result.err[2] == true
                                    and wdsButton._bubble(
                                            i18n:msg('error'),
                                            'warn'
                                        ) .. '  
'
                                    or  ''
                                ) ..
                                member_nowiki(type(test_result.actual) == 'table'
                                    and inspect(test_result.actual, inspect_options)
                                    or  test_result.actual
                                )
                            )
                            :done()
                    or  nil
                )
            else
                result_table:tag('tr')
                    :tag('th')
                        :css('font-weight', 'normal')
                        :attr('colspan', ((config.display == true) and 2 or 4) + ((config.diff == true) and 1 or 0))
                        :newline()
                        :wikitext(test_result)
                        :done()
            end
        end
    end
    return tostring(report)
end

--- Unit test execution engine.
--  @function           run_tests
--  @param              {table} test_suite Test case suite.
--  @param              {table} test_module Module package.
--  @param              {table} config Test configuration.
--  @return             {table} Test case result data.
--  @local
local function run_tests(test_suite, test_module, config, pass_only)
    -- Generate test data.
    local test_results = {}
    local time_exec = 0
    for test_member, test_data in pairs(test_suite) do
        test_results[test_member] = {
            ['options'] = test_data.options
        }
        for test_index, test_case in ipairs(test_data.tests) do
            if type(test_case) == 'table' then
                -- Execute member test.
                local test_res = engine['test_' .. test_data.options.mode](
                    test_module[test_member], test_case[1], test_data.options, test_module
                )
                time_exec = time_exec + test_res[3]
                local pp = test_data.options.preprocess or (test_case[3] or {}).pp
                -- Generate test case result.
                local test_result = {
                    -- Test case data.
                    ['case']   = test_case[1],
                    ['actual'] = test_res[2],
                    ['expect'] =  pp
                            and utils.pp(test_case[2])
                            or  test_case[2],
                    -- Test case analysis.
                    ['err']    = {
                        (test_case[3] or {}).err == true,
                        test_res[1] == false
                    }
                }
                -- Test case error preprocessing.
                local a = test_result.actual
                local e = test_result.expect
                local r = test_result.err
                if r[2] == true then
                    test_result.actual = a:gsub('^.+%d:%s', '')
                    a = test_result.actual
                end
                -- Test case comparision.
                test_result.diff_i = (r[1] == r[2])
                    and (test_data.options.deep == true
                        and utils.diff_tbl(e, a)
                        or  utils.diff_str(e, a)
                    )
                    or  'error'
                -- Detect wikitext headers in testcases.
                local header_pattern = '%f[^\n%z]==* *[^\n|]+ =*=%f[\n]'
                if
                    (type(test_result.expect) == 'string' and test_result.expect:find(header_pattern)) or
                    (type(test_result.actual) == 'string' and test_result.actual:find(header_pattern))
                then
                    config.noforcetoc = true
                end
                table.insert(test_results[test_member], test_result)
            else
                table.insert(test_results[test_member], utils.pp(test_case))
            end
        end
    end
    -- Derived data required for report.
    local member_fails = {}
    local failed_members = {}
    local total_tests = 0
    local failed_tests = 0
    for test_member, test_output in pairs(test_results) do
        for test_index, test_result in ipairs(test_output) do
            if type(test_result) == 'table' then
                -- Result count and status.
                total_tests = total_tests + 1
                member_fails[test_member] = member_fails[test_member] or 0
                test_result.status = (
                    test_result.err[1] == test_result.err[2] and
                    #test_result.diff_i == 0
                )
                -- Test logic.
                if test_result.status == false then
                    member_fails[test_member] = member_fails[test_member] + 1
                    failed_tests = failed_tests + 1
                end
            end
        end
    end
    local suite_status = (failed_tests == 0)
    
    if pass_only then return suite_status end
    
    for test_member, fail_count in pairs(member_fails) do
        if fail_count ~= 0 then
            table.insert(failed_members, '[[#p.' .. test_member .. '|' .. test_member .. ']]')
        end
    end
    -- Generate report.
    return render_report(suite_status, total_tests, failed_tests, config, failed_members, time_exec, test_results, member_fails)
end

--  Test harness logic.

--- Code coverage analyser.
--  @function           th.code_cov
--  @param              {string} module_name Module name.
--  @param              {string} test_module Test module package.
--  @param              {string} test_cases Test case data.
--  @return             {table} Code coverage data.
function th.code_cov(module_name, test_module, test_suite)
    local codecov = {}
    local members = {}

    local raw_text = mw.title.new(module_name):getContent()
    local package_name = raw_text:match('\nreturn ([%w_]+)\n?') or 'p'
    local raw_functions = {}

    local coverage = {}
    local covcache = {}
    local positive = {}
    local negative = {}

    -- Direct coverage.
    for member_key, val in pairs(test_module) do
        table.insert(members, member_key)
        raw_functions[member_key] = raw_text:match('\n%f[%w_]%S*[^\n]*' .. package_name .. '[:.]' .. member_key .. '(.-\n%S+)\n')
        if test_suite[member_key] then
            coverage[member_key] = true
        end
    end
    
    -- Test for source code coverage.
    local access_pattern = '[%s%(%[,;=]\26[[.:"\']+(%f[%w_][^\'"%s%([,.:;]+)'
    local scan_continue = true
    local track_metatable = false

    while scan_continue do
        covcache = mw.clone(coverage)
        for member_key in pairs(coverage) do
            -- Test for source member hit.
            if raw_functions[member_key] ~= nil then
                for _, p in ipairs({ 'self', package_name }) do
                    for access_key in raw_functions[member_key]:gmatch(access_pattern:gsub('\26', p)) do
                        if test_module[access_key] then
                            coverage[access_key] = true
                        end
                    end
                end
            elseif not track_metatable then
                track_metatable = true
            end
        end
        scan_continue = #utils.diff_tbl(covcache, coverage) ~= 0
    end

    -- Test for tracker-based access coverage.
    local test_proxy
    if track_metatable then
        test_proxy, mt = {}, {}
        mt.__index = function (tbl, key)
            -- Test for missed member hit.
            for index, access_key in ipairs(codecov.neg) do
                if access_key == key then
                    table.remove(codecov.neg, index)
                    table.insert(codecov.pos, key)
                    codecov.res = tostring(#codecov.pos) .. '/' .. tostring(#members)
                    break;
                end
            end
            return test_module[key]
        end
        setmetatable(test_proxy, mt)
    end

    -- Package members with positive coverage.
    for member_key, _ in pairs(coverage) do
        table.insert(positive, member_key)
    end
    table.sort(positive)

    -- Package membrs with negative coverage.
    for member_key, _ in pairs(test_module) do
        if coverage[member_key] == nil then
            table.insert(negative, member_key);
        end
    end
    table.sort(negative)

    -- Output result.
    codecov.pkg = package_name
    codecov.neg = negative
    codecov.pos = positive
    codecov.res = tostring(#positive) .. '/' .. tostring(#members)
    return codecov, test_proxy
end

--- Test harness function.
--  @function           th.run_tests
--  @param              {table} f Scribunto frame object.
--  @return             {string} Test report.
function th.run_tests(f)
    -- Frame arguments.
    frame = f
    local module_name = (frame.args or {}).modulename or ''
    local test_data  = (frame.args or {}).testdata or ''
    local differs_at = (frame.args or {}).differs_at or 'true'
    local display_mode = (frame.args or {}).display_mode or 'false'
    local pass_only = (frame.args or {}).pass_only or 'false'

    -- Argument validation and defaults.
    local module_ns = mw.site.namespaces[828].canonicalName
    module_name = #module_name ~= 0
        and frame.args.modulename
        or  mw.title.getCurrentTitle().baseText
    module_name = module_ns .. ':' .. module_name
    test_data = #test_data ~= 0
        and module_ns .. ':' .. test_data
        or  module_name .. '/testcases'
    differs_at = (yesno(differs_at) == true or #differs_at == 0)
        and true
        or  false
    display_mode = yesno(display_mode) == true
        and true
        or  false

    -- Load module package.
    local test_module = require(module_name)
    -- Load test cases.
    local _, test_suite = pcall(require, test_data)
    test_suite = test_suite or {}

    -- Remove string and boolean members.
    for member_key, val in pairs(test_module) do
        if type(val) == 'string' or type(val) == 'boolean' then
            test_module[member_key] = nil
        end
    end
	
	if type(test_suite) ~= "table" then
		return false
	end
	
    -- Check execution validity.
    for test_member, test_data in pairs(test_suite) do
        if
            not test_module[test_member] or      -- Nonexistent member.
            type(test_data) ~= 'table' or        -- Old UnitTests format.
            not (test_data.options or {}).mode   -- Unconfigured tests.
        then
            test_suite[test_member] = nil
        end
    end

    -- Unit test configuration.
    local config, test_proxy = th.code_cov(module_name, test_module, test_suite)
    test_module = test_proxy or test_module
    config.diff = differs_at
    config.name = module_name
    config.display = display_mode
    config.pass_only = yesno(pass_only)
    -- Execute tests & generate report.
    return run_tests(test_suite or {}, test_module, config, yesno(pass_only))
end

return th
--
```

