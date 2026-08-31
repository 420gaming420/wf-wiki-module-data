---
title: "Module:Infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Infobox"
wiki_timestamp: "2022-09-24T02:59:37Z"
---

**Infobox** template module for [w:c:dev](https://en.wikipedia.org/wiki/c:dev "w:c:dev") documentation.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 TODO](#TODO)
* [3 See also](#See_also)
* [4 See Also](#See_Also_2)
* [5 Code](#Code)

## Documentation

### Package items

`infobox.breadcrumbs(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Infobox breadcrumb generator for mobile.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Breadcrumb designed for mobile. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **See also**: [Template:Breadcrumb](/w/Template:Breadcrumb?action=edit&redlink=1 "Template:Breadcrumb (page does not exist)")

`infobox.description()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns error for missing description param in infobox.
:   **Returns**: Error message and trancking category ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.categories(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Infobox category generator for type subcategorization.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Type categories corresponding to `Type` infobox argument. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.categoryDoc(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Category documentation generator.
:   **Parameters**:

    :   `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

        :   `frame.args` Frame argument table. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

            :   `frame.args[1]` Infobox type corresponding to [Module:Infobox/data](/w/Module:Infobox/data?action=edit&redlink=1 "Module:Infobox/data (page does not exist)"). ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Table of types against descriptions. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.categoryDesc(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Category description generator. Used on category pages to describe pages.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Category description followed by parent category link. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.luaType(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Alias mapper for {{[Infobox Lua](/w/Template:Infobox_Lua?action=edit&redlink=1 "Template:Infobox Lua (page does not exist)")}} `Type` argument.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Lua type (`'invocable'` or `'meta'`). ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.luaSuite(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Test suite status.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Test suite status badge. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`infobox.main` (member)
:   Template wrapper for [Template:Infobox](/w/Template:Infobox "Template:Infobox").
:   **Usage**: `<code><nowiki>{{#invoke:infobox|main}}</nowiki></code>`

`infobox.getParent(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Returns topmost parent frame.
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Highest parent frame. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

## TODO

* Fill holes in the documentation by replacing question marks.
* Use the already loaded data for sorting category data by name instead of re-reading the page with mw.title.new in p.categoryDoc

## See also

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Infobox/doc](/w/Module:Infobox/doc "Module:Infobox/doc")
* [Infobox/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")
* [Infobox/i18n/doc](/w/Module:Infobox/i18n/doc "Module:Infobox/i18n/doc")

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
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • M:Infobox ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
-- 
--------------------------------------------------------------------------------
-- Infobox template module for [[w:c:dev]] documentation.
--
-- @see [[Category:Infobox templates]]
-- @usage {{#invoke:Infobox}}
-- @module infobox
-- @alias p
-- @version 1.1.2
-- @author Speedit
-- @author DarthKitty
--
-- @todo Fill holes in the documentation by replacing question marks.
-- @todo Use the already loaded data for sorting category data by name
--       instead of re-reading the page with mw.title.new in p.categoryDoc
--------------------------------------------------------------------------------
local p = {}
local yesno = require('Module:Yesno')
local userError = require('Module:UserError')
local wdsButton = require('Module:WDSButton')
local i18n = require('Module:I18n').loadMessages(
    'Infobox',
    'Common',
    'TestHarness'
)
local entrypoint = require('Module:Entrypoint')
local data = mw.loadData('Dev:Infobox/data') -- TODO: Unused on the wiki; contains category mappings unique to the Fandom Dev wiki; decouple code from accessing this table to prevent things from breaking when wiki is forked
local title = mw.title.getCurrentTitle()

--------------------------------------------------------------------------------
-- Date formatter utility.
--
-- @see [[Template:FormatDate]]
--
-- @param {string} d
--     Unprocessed date.
-- @param {string} f
--     Date format to use.
-- @returns {string}
--     Formatted, localised date.
--------------------------------------------------------------------------------
local function dtfm(d, f)
    return mw.getCurrentFrame():expandTemplate{
        title = 'FormatDate',
        args = {
            [1] = d,
            dateformat = f,
            uselang = i18n:getLang()
        }
    }
end

--------------------------------------------------------------------------------
-- Breadcrumb link generator.
--
-- @param {string} t
--     Breadcrumb part.
-- @param {table} parts
--     Collection of title parts.
-- @returns {string}
--     Breadcrumb chunk.
--------------------------------------------------------------------------------
local function crumbpart(parts)
    local d = #parts

    return table.concat({
        (d == 1 and '< ' or ' | '),
        '[[',
        table.concat(parts, '/'),
        '|',
        parts[d],
        ']]'
    })
end

--------------------------------------------------------------------------------
-- Infobox breadcrumb generator for mobile.
--
-- @see [[Template:Breadcrumb]]
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Breadcrumb designed for mobile.
--------------------------------------------------------------------------------
function p.breadcrumbs(frame)
    local parts = {}
    local ret = mw.html.create('center')

    for t in tostring(title.fullText):gmatch('[^/]+') do
        table.insert(parts, t)
        ret:wikitext(crumbpart(parts))
    end

    return frame:preprocess(tostring(ret))
end

--------------------------------------------------------------------------------
-- Infobox data argument handler. Substitutes '$n' arguments with version
-- numbers.
--
-- @example `{{#invoke:infobox|data|{{{Data}}}|ucfirst=1}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @param {string} frame.args[1]
--     Infobox data input.
-- @param {string} frame.args.ucfirst
--     Capitalization boolean.
-- @throws {string}
--     'missing argument from Module:Infobox in p.data'
-- @returns {string}
--     Argument-substituted infobox data.
--------------------------------------------------------------------------------
function p.data(frame)
    if not (frame.args or {})[1] then
        error('missing argument from Module:Infobox in p.data')
    end

    local tArgs = frame:getParent().args
    local ret = frame.args[1]
    local uc1 = yesno(mw.text.trim(frame.args.ucfirst or ''))

    if not string.find(ret, '%$') then
        return ret
    end

    -- Argument substitution.
    local function repl(d)
        local rsub = d == '1'
            and (tArgs.Submodule or i18n:msg('original'))
            or (tArgs['Submodule' .. d] or i18n:msg('version', d))

        return uc1
            and rsub:gsub('^%l', mw.ustring.upper)
            or rsub
    end

    ret = ret:gsub('%$(%d+)', repl)

    return ret
end

--------------------------------------------------------------------------------
-- Infobox date list generator with version numbers.
--
-- @example `{{#invoke:infobox|date}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @param {string} frame.args
--     Invocation arguments.
-- @param {string} frame.args.ext
--     Code type.
-- @param {table} frame:getParent().args
--     Template arguments.
-- @returns {string}
--     Formatted multi-line date string.
--------------------------------------------------------------------------------
function p.date(frame)
    local tArgs = frame:getParent().args
    local dateFmt = tArgs.dateformat or ''
    local ret = ''

    if tArgs.Updated and #tArgs.Updated > 0 then
        -- Generated first formatted date.
        ret = dtfm(tArgs.Updated, dateFmt)

        if tArgs.Submodule or tArgs.Updated2 then
            -- Append first version tag.
            local sub1 = tArgs.Submodule or i18n:msg('original')

            if sub1 ~= '' then
                ret = ret .. ' (' .. sub1 .. ')'
            end
        end

        -- Handle further versions.
        for d = 2, math.huge do
            local p = tArgs['Updated' .. d]

            if not p then
                break
            end

            local s = tArgs['Submodule' .. d] or i18n:msg('version', d)

            ret = (d == 2 and '* ' or '') .. ret
                .. '\n* '
                .. dtfm(p, dateFmt)
                .. ' (' .. s .. ')'
        end

    -- Default date field.
    elseif tArgs.Code then
        -- @todo Use DPL template to extract main code page?
        local ext = frame.args.ext or 'js'
        local suffix = '.' .. ext

        if ext ~= 'css' then
            suffix = '/code' .. suffix
        end

        local u = frame:expandTemplate{
            title = 'Updated',
            args = {
                'MediaWiki:' .. title.baseText .. suffix
            }
        }

        ret = dtfm(u, dateFmt)
    end

    return ret
end

--------------------------------------------------------------------------------
-- Category formatter.
--
-- @param {table} tbl
--     Array of text items to be returned.
-- @param {string} cat
--     Category name.
-- @param {string} sortkey
--     Category sortkey.
--------------------------------------------------------------------------------
local function category(tbl, cat, sortkey)
    table.insert(tbl, '[[Category:')
    table.insert(tbl, cat)

    if sortkey and sortkey ~= '' then
        table.insert(tbl, '|')
        table.insert(tbl, sortkey)
    end

    table.insert(tbl, ']]')
end

--------------------------------------------------------------------------------
-- Returns error for missing description param in infobox.
--
-- @returns {string}
--     Error message and trancking category
--------------------------------------------------------------------------------
function p.description()
    return userError('Description missing', 'Content without description')
end

--------------------------------------------------------------------------------
-- Infobox category generator for type subcategorization.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Type categories corresponding to `Type` infobox argument.
--------------------------------------------------------------------------------
function p.categories(frame)
    local ret = {}
    local typ = frame.args[1]
    local tArgs = p.getParent(frame).args
    local catKeys = tArgs.Type

    if
        mw.ustring.lower(tArgs.Status or '') == 'archive' or
        not data.categories[typ or ''] or
        title.namespace ~= 0
    then
        return ''
    end

    local sortkey = tArgs.Title or title.prefixedText

    category(ret, typ, sortkey)
    table.insert(ret, '[[:Category:')
    table.insert(ret, typ)
    table.insert(ret, '|')
    table.insert(ret, typ)
    table.insert(ret, ']]')

    -- Maintenance category
    local REPORTCAT = 'Content without type categorization'
    local TYPEDOC = ':Category:' .. REPORTCAT .. '#Documentation'

    if catKeys then
        for v in mw.text.gsplit(mw.ustring.lower(catKeys), '%s*,%s*') do
            local cat = data.categories[typ][mw.text.trim(v)]

            if cat then
                category(ret, cat, sortkey)
            end
        end
    elseif typ == 'JavaScript' then
        table.insert(ret, '  
')
        table.insert(ret, userError('Type categorization missing', REPORTCAT))
        table.insert(ret, ' ([[:' .. TYPEDOC .. '|')
        table.insert(
            ret,
            mw.message.new('oasis-more'):useDatabase(false):plain()
        )
        table.insert(ret, ']])')
    end

    return table.concat(ret)
end

--------------------------------------------------------------------------------
-- Category documentation generator.
--
-- @param {table} frame
--     Frame invocation object.
-- @param {table} frame.args
--     Frame argument table.
-- @param {string} frame.args[1]
--     Infobox type corresponding to [[Module:Infobox/data]].
-- @returns {string}
--     Table of types against descriptions.
--------------------------------------------------------------------------------
function p.categoryDoc(frame)
    local typ = frame.args[1] or ''
    local ret = mw.html.create('table'):attr {
        ['class'] = 'WikiaTable',
        ['border'] = '1',
        ['id'] = 'types'
    }
    
    ret:tag('tr')
        :tag('th'):wikitext(i18n:msg('type'))
        :done()
        :tag('th'):wikitext(i18n:msg('description'))
        :done()

    if
        not data.categories[typ] or
        not data.descriptions[typ]
    then
        return ret
    end

    -- Extract categories from data.
    local catData = {}
    local catNames = {}

    for k, n in pairs(data.categories[typ]) do
        if not catData[n] then
            catNames[#catNames + 1] = n
            catData[n] = {k}
        else
            catData[n][#catData[n] + 1] = k
        end

        if
            not catData[n].description and
            data.descriptions[typ][k]
        then
            catData[n].description = data.descriptions[typ][k]
        end
    end

    -- Sort category data by name.
    local dataContent = mw.title.new('Module:Infobox/data'):getContent()

    local function sortKey(a, b)
        local i1, i2 =
            dataContent:find('"' .. a .. '"'),
            dataContent:find('"' .. b .. '"')
        return i1 < i2
    end

    table.sort(catNames, sortKey)

    -- Render documentation table.
    local cat, catRow, catKeys, desc

    for i, n in ipairs(catNames) do
        cat = catData[n]
        catRow = ret:tag('tr')
        catKeys = catRow:tag('td')

        -- Handle multiple keys.
        if #cat >= 2 then
            catKeys = catKeys:tag('ul')

            for i, k in ipairs(cat) do
                catKeys
                    :tag('li'):tag('code')
                    :wikitext(k)
            end
        else
            catKeys
                :tag('code')
                :wikitext(cat[1])
        end

        -- Add description.
        desc = cat.description:gsub('^%l', mw.ustring.upper) .. '.'

        catRow:tag('td')
            :wikitext('[[:Category:' .. n .. ']]')
            :tag('p'):wikitext(desc)
    end

    return tostring(ret)
end

--------------------------------------------------------------------------------
-- Category description generator. Used on category pages to describe pages.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Category description followed by parent category link.
--------------------------------------------------------------------------------
function p.categoryDesc(frame)
    local typ = frame.args[1] or ''
    local key = frame.args[2] or ''
    local ret = data.messages.description

    local desc = (data.descriptions[typ] or {})[key]

    if not desc then
        error('misconfigured arguments in p.categoryDesc from Module:Install')
    end

    ret = ret:gsub('$1', desc) .. '[[Category:' .. typ .. '|{{SUBPAGENAME}}]]'

    return frame:preprocess(ret)
end

--------------------------------------------------------------------------------
-- Alias mapper for {{t|Infobox Lua}} `Type` argument.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Lua type (`'invocable'` or `'meta'`).
--------------------------------------------------------------------------------
function p.luaType(frame)
    local tArgs = frame:getParent().args
    local typ = tArgs.Type or tArgs.type

    return typ
        and data.luaTypes[typ:lower()]
        or ''
end

--------------------------------------------------------------------------------
-- Test suite status.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string}
--     Test suite status badge.
--------------------------------------------------------------------------------
function p.luaSuite(frame)
    local page =
        frame:getParent().Code or
        mw.language.fetchLanguageName(title.baseText) == ''
            and title.baseText
            or title.baseText:match('/*([^/]+)$')
	
    -- DPL query for categories
    local query = table.concat({
        '{{#dpl:',
        '| debug = 0',
        '| mode = userformat',
        '| allowcachedresults = 1',
        '| category = Lua test suites',
        '| titleregexp = ^' .. mw.uri.encode(page, 'WIKI') .. '/testcases/doc$',
        '| addcategories = true',
        '| format = ,%CATNAMES%,,',
        '}}'
    }, '\n')
	
    -- Fetch category data.
    local cats = mw.text.split(frame:preprocess(query), ',')
    local i18n_key = data.luaStatus[cats[1] or ''] or 'unknown'
    
    if frame.args[1] == 'true' then i18n_key = 'passed';
    elseif frame.args[1] == 'false' then i18n_key = 'failed'; end
    
    local badge = mw.html.create('div')
        :addClass('plainlinks')
        :wikitext(
            '[' ..
            mw.site.server ..
            mw.uri.fullUrl('Module:' .. page .. '/testcases').path ..
            ' ' ..
            wdsButton._badge(i18n:msg(i18n_key), i18n_key) ..
            ']'
        )
	
    return tostring(badge)
end

--------------------------------------------------------------------------------
-- Template wrapper for [[Template:Infobox]].
--
-- @usage `{{#invoke:infobox|main}}`
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {string|nil}
--     Package function output.
--------------------------------------------------------------------------------
p.main = entrypoint(p)

--------------------------------------------------------------------------------
-- Returns topmost parent frame.
--
-- @param {table} frame
--     Frame invocation object.
-- @returns {table}
--     Highest parent frame.
--------------------------------------------------------------------------------
function p.getParent(frame)
    local cf = frame
    local pf = frame:getParent()

    if pf then
        return p.getParent(pf)
    else
        return cf
    end
end

return p
```

