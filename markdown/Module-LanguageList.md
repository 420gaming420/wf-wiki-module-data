---
title: "Module:LanguageList"
wiki_url: "https://wiki.warframe.com/w/Module/LanguageList"
wiki_timestamp: "2022-09-24T01:12:24Z"
---

Language list generator. See docs at <https://dev.fandom.com/wiki/Template:Language_list> for usage info

Forked from <https://dev.fandom.com/wiki/Module:Language_list>

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`languageList.makeLanguageList(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   For manual filling up the language list Used in [Template:Language list](/w/Template:Language_list "Template:Language list")
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.makeLanguageListAuto(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   For automatic filling up the language list with languages from [I18n-js](/w/I18n-js?action=edit&redlink=1 "I18n-js (page does not exist)") JSON data pages Used in [Template:Infobox JavaScript](/w/Template:Infobox_JavaScript?action=edit&redlink=1 "Template:Infobox JavaScript (page does not exist)")
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.listFromJson(title, settings)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   For automatic filling up the language list with languages from a JSON-like page
:   **Parameters**:

    :   `title` Page title ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `settings` Table of optional arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.listFromJavascript(title, settings)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   For automatic filling up the language list with languages from a JavaScript code page
:   **Parameters**:

    :   `title` Page title ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `settings` Table of optional arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.listFromLua(title, settings)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   For automatic filling up the language list with languages from a Lua module data page
:   **Parameters**:

    :   `title` Page title ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `settings` Table of optional arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.keysToList(content, indent, settings)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Search JSON data or JavaScript object and add language keys to list
:   **Parameters**:

    :   `content` Page content ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `indent` Indentation ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `settings` Table of optional arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`languageList.listToWikitext(args, settings)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   List generator
:   **Parameters**:

    :   `args` Table of required arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    :   `settings` Table of optional arguments ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of list ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [LanguageList/doc](/w/Module:LanguageList/doc "Module:LanguageList/doc")

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
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • M:LanguageList • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- Language list generator.
--  
--  See docs at https://dev.fandom.com/wiki/Template:Language_list for usage info
--  
--  Forked from https://dev.fandom.com/wiki/Module:Language_list
--  
--  @alias p
--  @author [[User:OneTwoThreeFall|OneTwoThreeFall]]
--  @require [[Module:Yesno]]
--  @release stable
--  
local p = {}
local yesno = require('Module:Yesno')

--- For manual filling up the language list
--  Used in [[Template:Language list]]
--  @function	p.makeLanguageList
--  @param		{table} frame Frame object
--	@return		{string} Resultant wikitext of list
function p.makeLanguageList(frame)
    local args = frame:getParent().args
    local settings = {
        collapse = yesno(args.collapse),
        nocat = args.nocat and args.nocat ~= 'false',
    }

    if args['source-js'] then
        return p.listFromJavascript(args['source-js'], settings)
    elseif args['source-json'] then
        return p.listFromJson(args['source-json'], settings)
    elseif args['source-lua'] then
        return p.listFromLua(args['source-lua'], settings)
    else
        return p.listToWikitext(args, settings)
    end
end

--- For automatic filling up the language list
--  with languages from [[I18n-js]] JSON data pages
--  Used in [[Template:Infobox JavaScript]]
--  @function		p.makeLanguageListAuto
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of list
function p.makeLanguageListAuto(frame)
    local args = frame.args
    local settings = {
        nocat = args.nocat and args.nocat ~= 'false',
    }

    -- Get the current title
    local title = mw.title.getCurrentTitle()
    if title.namespace ~= 0 then
        -- Return if not in main namespace
        return 'Namespace not supported.'
    else
        -- Get the translation data page
        local pagename = title.rootText
        if pagename == 'I18n-js' then
            pagename = 'I18nEdit'
        end

        local translateLink = ' [[Special:BlankPage/I18nEdit/' .. pagename .. '|' .. args[1] .. ']]'

        -- Only add categories to pages that aren't subpages
        if title.isSubpage then
            settings.nocat = true
        else
            translateLink = translateLink .. '[[Category:Scripts using I18n-js]]'
        end

        return p.listFromJson('MediaWiki:Custom-' .. pagename .. '/i18n.json', settings) .. translateLink
    end
end

--- For automatic filling up the language list
--  with languages from a JSON-like page
--  @function	p.listFromJson
--  @param		{string} title Page title
--	@param		{table} settings Table of optional arguments
--	@return		{string} Resultant wikitext of list
function p.listFromJson(title, settings)
    local page = mw.title.new(title)
    local start = '{\n([ \t]+)"'

    if page.exists then
        -- Get content of JSON page and find all languages in it
        local content = page:getContent()
        local indent = content:match(start)

        if indent == nil then
            return 'Error: Page "' .. title .. '" does not seem to be JSON-like.'
        end

        -- Return the language list
        return p.keysToList(content, indent, settings)
    else
        return 'Error: Page "' .. title .. '" does not exist.'
    end
end

--- For automatic filling up the language list
--  with languages from a JavaScript code page
--  @function	p.listFromJavascript
--  @param		{string} title Page title
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listFromJavascript(title, settings)
    local page = mw.title.new(title)
    local start = '\n([ \t]+)// ?[Ll]anguage list %- start'
    local stop = '// ?[Ll]anguage list %- stop'

    if page.exists then
        -- Get content of code page and find all languages in it
        local content = page:getContent()

        local startPos = content:find(start)
        local _, stopPos = content:find(stop, startPos)

        if startPos == nil or stopPos == nil then
            return 'Error: Page "' .. title .. '" does not contain language list delimiters.'
        end

        local langContent = content:sub(startPos, stopPos)
        local indent = content:match(start)

        -- Return the language list
        return p.keysToList(langContent, indent, settings)
    else
        return 'Error: Page "' .. title .. '" does not exist.'
    end
end

--- For automatic filling up the language list
--  with languages from a Lua module data page
--  @function	p.listFromLua
--  @param		{string} title Page title
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listFromLua(title, settings)
    local success, data = pcall(mw.loadData, title)

    if success then
        -- Collect all the keys from the module's exported table
        local list = {}

        for key, value in pairs(data) do
            if key ~= 'qqq' and key ~= 'qqx' then
                list[#list + 1] = key
            end
        end

        -- 'pairs' uses no fixed order, so sort the list alphabetically
        table.sort(list)

        -- Return the language list
        return p.listToWikitext(list, settings)
    else
        return 'Error: Module data page "' .. title .. '" could not be loaded.'
    end
end

--- Search JSON data or JavaScript object and add language keys to list
--  @function	p.keysToList
--  @param		{string} content Page content
--  @param		{string} indent Indentation
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.keysToList(content, indent, settings)
    -- Find all language codes
    local matches = content:gmatch('\n' .. indent .. '["\']?([a-z-]+)')
    local list = {}

    for lang in matches do
        if lang ~= 'qqq' and lang ~= 'qqx' then
            list[#list + 1] = lang
        end
    end

    -- Return the language list
    return p.listToWikitext(list, settings)
end

--- List generator
--  @function	p.listToWikitext
--  @param		{table} args Table of required arguments
--  @param		{table} settings Table of optional arguments
--  @return		{string} Resultant wikitext of list
function p.listToWikitext(args, settings)
    local list = mw.html.create('ul'):addClass('language-list')
    local link = args.link

    -- If collapse isn't set and there are 5 or more languages, automatically collapse the list
    if settings.collapse == nil and args[5] ~= nil then
        settings.collapse = true
    end

    -- add collapsible classes if requested
    if settings.collapse then
        list:addClass('mw-collapsible mw-collapsed')
    end

    for index, value in ipairs(args) do
        value = mw.text.trim(value)
        local listItem = list:tag('li')
        local lang = mw.language.fetchLanguageName(value)
        local text = (lang ~= '' and lang) or value

        -- use either a specific or generic link
        -- if generic, substitute $1 for the current language code
        if  args[value] then
            text = '[[' .. args[value] .. '|' .. text .. ']]'
        elseif link then
            text = '[[' .. mw.ustring.gsub(link, '$1', value) .. '|' .. text .. ']]'
        end

        listItem:wikitext(text)

        -- for recognised languages, append the language code in brackets and add category
    	local langObj = mw.language.getContentLanguage()
        if lang ~= '' then
            listItem:tag('small')
                :wikitext(' (' .. value .. ')')
            if not settings.nocat then
                listItem:wikitext('[[Category:Translated scripts/' .. langObj:ucfirst(lang) .. ']]')
            end
        end
    end

    return tostring(list)
end

return p
```

