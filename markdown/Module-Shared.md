---
title: "Module:Shared"
wiki_url: "https://wiki.warframe.com/w/Module/Shared"
wiki_timestamp: "2022-06-06T16:06:41Z"
---

**Shared** contains useful utilities, including extensions of STL libraries.

On this Wiki, Shared is used in:

* [Module:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward")

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
local shared = require('Module:Shared')

local function func(input)
    -- ...
    for i, v in shared.skpairs(table) do
        -- ...
    end
    -- ...
end
```

## Documentation

### Package items

`shared.getArgs(frame, options)` (function)
:   For getting frame or parent arguments.
:   **Parameters**:

    * `frame` The input arguments (table)
    * `options` Options for getting the args (table)
:   **Returns**: The arguments (table)

`shared.upk(v)` (function)
:   Reversable table-to-string conversion
:   **Parameter**: `v` (any)
:   **Returns**: (string)

`shared.Cache(s)` (function)
:   **Parameter**: `s` (string)
:   **Returns**: (string)

`shared.assert(cond, message, layer)` (function)
:   A replacement `assert` for blaming other places in the call stack
:   **Parameters**:

    * `cond` The condition under which to not throw the error, passes through (bool)
    * `message` The error message (string)
    * `layer` The layer whose fault the error is, 1 being the line calling this function (int)
:   **Returns**: cond (any)

`shared.assertType(cond, tipe, message)` (function)
:   An alternative `assert` for checking the type of parameters
:   **Parameters**:

    * `cond` The value to be tested, passes through (any)
    * `tipe` The type the condition will be tested for (string)
    * `message` The error message, defaults to a generic "Improper value" (string)
:   **Returns**: cond (any)

`shared.delayRequire(mdule, data)` (function)
:   Delays the require()ment of a module until it is indexed (call to return main table)
:   **Parameters**:

    * `mdule` The module to require (string)
    * `data` Whether to use mw.loadData (boolean; optional)
:   **Returns**: cond (any)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Shared/doc](/w/Module:Shared/doc "Module:Shared/doc")
* [Shared/testcases](/w/Module:Shared/testcases "Module:Shared/testcases")
* [Shared/testcases/doc](/w/Module:Shared/testcases/doc "Module:Shared/testcases/doc")

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
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • M:Shared • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- '''Shared''' contains useful utilities, including extensions of STL libraries.  

--  
--  On this Wiki, Shared is used in:
--  * [[Module:VoidByReward]]
--  
--  @module     shared
--  @alias      p
--  @author     [[User:FINNER|FINNER]]
--  @author     [[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution    [[User:Falterfire|Falterfire]]
--  @attribution    [[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution    [[User:FINNER|FINNER]]
--  @attribution    [[User:Gigamicro|Gigamicro]]
--  @attribution    [[User:NoBrainz|NoBrainz]]
--  @image      
--  @require    [[w:c:dev:Module:Arguments|Module:Arguments]]
--  @release    unmaintained
--  
local p = {}

--  Module Dependencies  -------------------------------------------------------
local Args --= require('Dev:Arguments');-- defined later

--- For getting frame or parent arguments.
--  @function       p.getArgs
--  @param          {table} frame The input arguments
--  @param          {table} options Options for getting the args
--  @return         {table} The arguments
function p.getArgs(frame, options)
    if type(frame[1]) == 'table' and table.getn(frame) < 2 then frame = frame[1]; end
    if type(options) ~= 'table' then options = {options}; end
    
    local args = Args.getArgs(frame, options);
    local tempArgs = {};
    local str;
    if options.replace then
        for i, v in pairs(args) do
            if type(i) ~= 'number' or type(v) ~= 'string' then tempArgs[i] = v;
            else
                str = '('..math.replace(v)..')';
                if options.eval then tempArgs[i] = tonumber(math.eval(str));
                else tempArgs[i] = str; end
            end
        end
        args = tempArgs;
    end
    
    local j = 1;
    tempArgs = {};
    if options.noNil then
        for i, v in pairs(args) do
            if type(i) ~= 'number' then tempArgs[i] = v;
            elseif v then tempArgs[j] = v; j = j + 1; end
        end
        args = tempArgs;
    end
    
    return args;
end

--upk by [[User:gigamicro]], serializes any object (table) to a string
do
    local conversion = {
        string=function(v) 
            v = v:gsub('\n','\\n'):gsub('%c',function(s) return '\\'..s:byte() end)
            if not v:match"'" then 
                return "'"..v.."'" 
            elseif not v:match '"' then 
                return '"'..v..'"' 
            else 
                local n=0; while v:match(']'..(('='):rep(n))..']') do n=n+1 end; local s = (('='):rep(n)); return table.concat{'[',s,'[',v,']',s,']'}
            end
            end,
        boolean=function(v) return v and 'true' or 'false' end,
        number=function(v) return tostring(v) end,
        table=function(v, linedepth)
            local str = {'{'}
            local index = 1
            if linedepth and linedepth > 0 then table.insert(str, '\n') end
            for k,val in pairs(v) do 
                --print (k, '(', type(val), ')')
                if k==index then index=index+1 else table.insert(str, '['..p.upk(k)..'] = ') end
                if v ~= val and k~='_G' and k~='loaded' then
                    table.insert(str, p.upk(val, linedepth and linedepth>0 and linedepth-1))
                else
                    table.insert(str, '')
                end --print (k,'=',str[#str])
                table.insert(str, ', ')
                if linedepth and linedepth>0 then table.insert(str, '\n') end
            end
            table.insert(str,'}')
            --if print then print (table.concat(str)) end
            return table.concat(str)
            end,
        ['function'] = function() return '' end,--function()end' end,
        ['nil']      = function() return 'nil' end,
        userdata     = function() return '' end,
        thread       = function() return '' end,
    }

--- Reversable table-to-string conversion
--  @function       p.upk
--  @author         Gigamicro
--  @param          {any} v
--  @return         {string}
    function p.upk(v, linedepth) return conversion[type(v)](v,linedepth) end
    --(conversion[type(v)..'e'] or function(v,ld) error(type(v)..' is not a recognized type') end)(v, linedepth or 0) end
end--upk

--  @function       p.Cache
--  @author         Gigamicro
--  @param          {string} s
--  @return         {string}
function p.Cache(frame) return p.upk(require(frame.args[1])[frame.args[2]][frame.args[3]]) end

--- A replacement assert for blaming other places in the call stack
--  @function       p.assert
--  @author         Gigamicro
--  @param          {bool} cond The condition under which to not throw the error, passes through
--  @param          {string} message The error message
--  @param          {int} layer The layer whose fault the error is, 1 being the line calling this function
--  @return         {any} cond
function p.assert(cond, message, layer)
	return cond or error(message, (layer or 1) + 1)
end

--- An alternative assert for checking the type of parameters
--  @function       p.assertType
--  @author         Gigamicro
--  @param          {any} cond The value to be tested, passes through
--  @param          {string} tipe The type the condition will be tested for
--  @param          {string} message The error message, defaults to a generic "Improper value"
--  @return         {any} cond
function p.assertType(cond, tipe, message)
	return type(cond)~=tipe and error(message or 'Improper value: expected '..tipe..', got '..type(cond)..' ('..p.upk(cond)..')', 2) or cond
end

--- Delays the require()ment of a module until it is indexed (call to return main table)
--  @function       p.delayRequire
--  @author         Gigamicro
--  @param          {string} mdule The module to require
--  @param[opt]     {boolean} data Whether to use mw.loadData
--  @return         {any} cond
function p.delayRequire(module, data)
	return setmetatable({},{
		__call=function(self)
			local loaded = (data and mw.loadData or require)(module)
			setmetatable(self,{
				__call=function(self)
					--the require()d module's __call event can be triggered by s.dR'm:w/e'()()
					return getmetatable(self).__index
				end,
				__index=loaded,
			})
			return loaded
		end,
		__index=function(self, index)
			return self()[index]
		end,
	})
end
function p.delayLoadData(module)
	return p.delayRequire(module, true)
end

Args=p.delayRequire[[Dev:Arguments]]

return p
```

