---
title: "Module:Docbunto"
wiki_url: "https://wiki.warframe.com/w/Module/Docbunto"
wiki_timestamp: "2025-02-16T02:48:23Z"
---

**Docbunto** automatic documentation generator for Scribunto modules. The module is based on LuaDoc and LDoc. It produces documentation in the form of MediaWiki markup, using `@tag`-prefixed comments embedded in the source code of a Scribunto module. The taglet parser & doclet renderer Docbunto uses are also publicly exposed to other modules.

Docbunto code items are introduced by a block comment (`--[[]]--`), an inline comment with three hyphens (`---`), or an inline `@tag` comment. The module can use static code analysis to infer variable names, item privacy (`local` keyword), tables (`{}` constructor) and functions (`function` keyword). MediaWiki and Markdown formatting is supported.

Items are usually rendered in the order they are defined, if they are public items, or emulated classes extending the Lua primitives. There are many customisation options available to change Docbunto behaviour.

Forked from <https://dev.fandom.com/wiki/Module:Docbunto>

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

`docbunto.main(f)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Template entrypoint for [Template:Docbunto](/w/Template:Docbunto "Template:Docbunto").
:   **Parameter**: `f` Scribunto frame object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Module documentation output. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`docbunto.build(modname, options)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Scribunto documentation generator entrypoint.
:   **Parameters**:

    :   `modname` Module page name (without namespace). Default: second-level subpage. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
    :   `options` Configuration options. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)

        :   `options.all` Include local items in documentation. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.boilerplate` Removal of boilerplate (license block comments). ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.caption` Infobox image caption. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
        :   `options.code` Only document Docbunto code items - exclude article infobox and lede from rendered documentation. Permits article to be edited in VisualEditor. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.colon` Format tags with a `:` suffix and without the `@` prefix. This bypasses the "doctag soup" some authors complain of. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.image` Infobox image. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
        :   `options.noluaref` Don't link to the [Lua reference manual](/w/Lua_reference_manual?action=edit&redlink=1 "Lua reference manual (page does not exist)") for types. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.plain` Disable Markdown formatting in documentation. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.preface` Preface text to insert between lede & item documentation, used to provide usage and code examples. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
        :   `options.simple` Limit documentation to descriptions only. Removes documentation of subitem tags such as `@param` and `@field` ([see list](#Item_subtags)). ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.sort` Sort documentation items in alphabetical order. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.strip` Remove table index in documentation. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.ulist` Indent subitems as `<ul>` lists (LDoc/JSDoc behaviour). ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)

`docbunto.taglet(modname, options)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Docbunto taglet parser for Scribunto modules.
:   **Parameters**:

    :   `modname` Module page name (without namespace). ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
    :   `options` Configuration options. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
:   **Errors**:

    :   'Lua source code not found in $1' ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); line 906)
    :   'documentation markup for Docbunto not found in $1' ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); line 912)
:   **Returns**: Module documentation data. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

`docbunto.doclet(data, options)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Doclet renderer for Docbunto taglet data.
:   **Parameters**:

    :   `data` Taglet documentation data. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    :   `options` Configuration options. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
:   **Returns**: Wikitext documentation output. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`docbunto.tags` ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   Token dictionary for Docbunto tags. Maps Docbunto tag names to tag tokens.

    * Multi-line tags use the `'M'` token.
    * Multi-line preformatted tags use the `'ML'` token.
    * Identifier tags use the `'ID'` token.
    * Single-line tags use the `'S'` token.
    * Flags use the `'N'` token.
    * Type tags use the `'T'` token.

---

:   *Created with Docbunto*

## See Also

* [Docbunto/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli")
* [Docbunto/cli/doc](/w/Module:Docbunto/cli/doc "Module:Docbunto/cli/doc")
* [Docbunto/doc](/w/Module:Docbunto/doc "Module:Docbunto/doc")
* [Docbunto/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")
* [Docbunto/i18n/doc](/w/Module:Docbunto/i18n/doc "Module:Docbunto/i18n/doc")
* [Docbunto/references](/w/Module:Docbunto/references "Module:Docbunto/references")
* [Docbunto/references/doc](/w/Module:Docbunto/references/doc "Module:Docbunto/references/doc")
* [Docbunto/testcases](/w/Module:Docbunto/testcases "Module:Docbunto/testcases")
* [Docbunto/testcases/doc](/w/Module:Docbunto/testcases/doc "Module:Docbunto/testcases/doc")

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
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • M:Docbunto ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- Docbunto automatic documentation generator for Scribunto modules.
--  The module is based on LuaDoc and LDoc. It produces documentation in
--  the form of MediaWiki markup, using `@tag`-prefixed comments embedded
--  in the source code of a Scribunto module. The taglet parser & doclet
--  renderer Docbunto uses are also publicly exposed to other modules.
--  
--  Docbunto code items are introduced by a block comment (`--[[]]--`), an
--  inline comment with three hyphens (`---`), or an inline `@tag` comment.
--  The module can use static code analysis to infer variable names, item
--  privacy (`local` keyword), tables (`{}` constructor) and functions
--  (`function` keyword). MediaWiki and Markdown formatting is supported.
--  
--  Items are usually rendered in the order they are defined, if they are
--  public items, or emulated classes extending the Lua primitives. There
--  are many customisation options available to change Docbunto behaviour.
--  
--  Forked from https://dev.fandom.com/wiki/Module:Docbunto
--  
--  @module             docbunto
--  @alias              p
--  @require            Module:I18n
--  @require            Module:Lexer
--  @require            Module:Unindent
--  @require            Module:Yesno
--	@require			Template:LuaBox
--  @image              Docbunto.svg
--  @author             [[User:8nml|8nml]]
--  @attribution        [[github:stevedonovan|@stevedonovan]] ([[github:stevedonovan/LDoc|Github]])
--  @release            stable
--  
local p = {}

--  Module dependencies.
local title = mw.title.getCurrentTitle()
local i18n = require('Module:I18n').loadMessages('Docbunto')
local references = mw.loadData('Module:Docbunto/references')
local lexer = require('Module:Lexer')
local unindent = require('Module:Unindent')
local yesno = require('Module:Yesno')

--  Module variables.
local DEV_WIKI = 'https://dev.fandom.com'
local MODULE_LOCALIZATION = mw.site.namespaces[828].name
local BASE_TITLE = title.baseText	-- e.g. 'Module:Tooltips/tip' has baseText == 'Tooltips'
local DEFAULT_TITLE = title.text	-- e.g. 'Module:Tooltips/tip' has text == 'Tooltips/tip'
local frame, gsub, match

--  Docbunto variables & tag tokens.
local TAG_MULTI = 'M'
local TAG_ID = 'ID'
local TAG_SINGLE = 'S'
local TAG_TYPE = 'T'
local TAG_FLAG = 'N'
local TAG_MULTI_LINE = 'ML'

--  Docbunto processing patterns.
local DOCBUNTO_SUMMARY, DOCBUNTO_TYPE, DOCBUNTO_CONCAT
local DOCBUNTO_TAG, DOCBUNTO_TAG_VALUE, DOCBUNTO_TAG_MOD_VALUE

--  Docbunto private logic.

--- Pattern configuration function.
--  Resets patterns for each documentation build.
--  @function           configure_patterns
--  @param              {table} options Configuration options.
--  @param              {boolean} options.colon Colon mode.
--  @local
local function configure_patterns(options)
    -- Setup Unicode or ASCII character encoding (optimisation).
    gsub = options.unicode and mw.ustring.gsub or string.gsub
    match = options.unicode and mw.ustring.match or string.match
    DOCBUNTO_SUMMARY =
        options.iso639_th
            and '^[^ ]+'
            or
        options.unicode
            and '^[^.։。।෴۔።]+[.։。।෴۔።]?'
            or  '^[^.]+%.?'
    DOCBUNTO_CONCAT = ' '

    -- Setup parsing tag patterns with colon mode support.
    DOCBUNTO_TAG = options.colon and '^%s*(%w+):' or '^%s*@(%w+)'
    DOCBUNTO_TAG_VALUE = DOCBUNTO_TAG .. '(.*)'
    DOCBUNTO_TAG_MOD_VALUE = DOCBUNTO_TAG .. '%[([^%]]*)%](.*)'
    DOCBUNTO_TYPE = '^{({*[^}]+}*)}%s*'
end

--- Tag processor function.
--  @function           process_tag
--  @param              {string} str Tag string to process.
--  @return             {table} Tag object.
--  @local
local function process_tag(str)
    local tag = {}

    if str:find(DOCBUNTO_TAG_MOD_VALUE) then
        tag.name, tag.modifiers, tag.value = str:match(DOCBUNTO_TAG_MOD_VALUE)
        local modifiers = {}

        for mod in tag.modifiers:gmatch('[^%s,]+') do
            modifiers[mod] = true
        end

        if modifiers.optchain then
            modifiers.opt = true
            modifiers.optchain = nil
        end

        tag.modifiers = modifiers

    else
        tag.name, tag.value = str:match(DOCBUNTO_TAG_VALUE)
    end

    tag.value = mw.text.trim(tag.value)

    if p.tags._type_alias[tag.name] then
        if p.tags._type_alias[tag.name] ~= 'variable' then
            tag.value = p.tags._type_alias[tag.name] .. ' ' .. tag.value
            tag.name = 'field'
        end

        if tag.value:match('^%S+') ~= '...' then
           tag.value = tag.value:gsub('^(%S+)', '{%1}')
        end
    end

    tag.name = p.tags._alias[tag.name] or tag.name

    if tag.name ~= 'usage' and tag.value:find(DOCBUNTO_TYPE) then
        tag.type = tag.value:match(DOCBUNTO_TYPE)
        if tag.type:find('^%?') then
            tag.type = tag.type:sub(2) .. '|nil'
        end
        tag.value = tag.value:gsub(DOCBUNTO_TYPE, '')
    end

    if p.tags[tag.name] == TAG_FLAG then
        tag.value = true
    end

    return tag
end

--- Module info extraction utility.
--  @function           extract_info
--  @param              {table} documentation Package doclet info.
--  @return             {table} Information name-value map.
--  @local
local function extract_info(documentation)
    local info = {}

    for _, tag in ipairs(documentation.tags) do
        if p.tags._module_info[tag.name] then
            if info[tag.name] then
                if not info[tag.name]:find('^%* ') then
                    info[tag.name] = '* ' .. info[tag.name]
                end
                info[tag.name] = info[tag.name] .. '\n* ' .. tag.value

            else
                info[tag.name] = tag.value
            end
        end
    end

    return info
end

--- Type extraction utility.
--  @function           extract_type
--  @param              {table} item Item documentation data.
--  @return             {string} Item type.
--  @local
local function extract_type(item)
    local item_type
    for _, tag in ipairs(item.tags) do
        if p.tags[tag.name] == TAG_TYPE then
            item_type = tag.name

            if tag.name == 'variable' then
                local implied_local = process_tag('@local')
                table.insert(item.tags, implied_local)
                item.tags['local'] = implied_local
            end

            if p.tags._generic_tags[item_type] and not p.tags._project_level[item_type] and tag.type then
                item_type = item_type .. i18n:msg('separator-colon') .. tag.type
            end
            break
        end
    end
    return item_type
end

--- Name extraction utility.
--  @function           extract_name
--  @param              {table} item Item documentation data.
--  @param              {boolean} project Whether the item is project-level.
--  @return             {string} Item name.
--  @local
local function extract_name(item, opts)
    opts = opts or {}
    local item_name
    for _, tag in ipairs(item.tags) do
        if p.tags[tag.name] == TAG_TYPE then
            item_name = tag.value; break;
        end
    end

    if item_name or not opts.project then
        return item_name
    end

    item_name = item.code:match('\nreturn%s+([%w_]+)')

    if item_name == 'p' and not item.tags['alias'] then
        local implied_alias = { name = 'alias', value = 'p' }
        item.tags['alias'] = implied_alias
        table.insert(item.tags, implied_alias)
    end

    item_name = (item_name and item_name ~= 'p')
        and item_name
        or  item.filename
                :gsub('^' .. MODULE_LOCALIZATION .. ':', '')
                :gsub('^(%u)', mw.ustring.lower)
                :gsub('/', '.'):gsub(' ', '_')

    return item_name
end

--- Source code utility for item name detection.
--  @function           deduce_name
--  @param              {string} tokens Stream tokens for first line.
--  @param              {string} index Stream token index.
--  @param              {table} opts Configuration options.
--  @param[opt]         {boolean} opts.lookahead Whether a variable name succeeds the index.
--  @param[opt]         {boolean} opts.lookbehind Whether a variable name precedes the index.
--  @return             {string} Item name.
--  @local
local function deduce_name(tokens, index, opts)
    local name = ''

    if opts.lookbehind then
        for i2 = index, 1, -1 do
            if tokens[i2].type ~= 'keyword' then
                name = tokens[i2].data .. name
            else
                break
            end
        end

    elseif opts.lookahead then
        for i2 = index, #tokens do
            if tokens[i2].type ~= 'keyword' and not tokens[i2].data:find('^%(') then
                name = name .. tokens[i2].data
            else
                break
            end
        end
    end

    return name
end

--- Code analysis utility.
--  @function           code_static_analysis
--  @param              {table} item Item documentation data.
--  @local
local function code_static_analysis(item)
    local tokens = lexer(item.code:match('^[^\n]*'))[1]
    local t, i = tokens[1], 1
    local item_name, item_type

    while t do
        if t.type == 'whitespace' then
            table.remove(tokens, i)
        end

        t, i = tokens[i + 1], i + 1
    end
    t, i = tokens[1], 1

    while t do
        if t.data == '=' then
            item_name = deduce_name(tokens, i - 1, { lookbehind = true })
        end

        if t.data == 'function' then
            item_type = 'function'
            if tokens[i + 1].data ~= '(' then
                item_name = deduce_name(tokens, i + 1, { lookahead = true })
            end
        end

        if t.data == '{' or t.data == '{}' then
            item_type = 'table'
        end

        if t.data == 'local' and not (item.tags['private'] or item.tags['local'] or item.type == 'type') then
            local implied_local = process_tag('@local')
            table.insert(item.tags, implied_local)
            item.tags['local'] = implied_local
        end

        t, i = tokens[i + 1], i + 1
    end

    item.name = item.name or item_name or ''
    item.type = item.type or item_type
end

--- Array hash map conversion utility.
--  @function           hash_map
--  @param              {table} item Item documentation data array.
--  @return             {table} Item documentation data map.
--  @local
local function hash_map(array)
    local map = array
    for _, element in ipairs(array) do
        if map[element.name] and not map[element.name].name then
            table.insert(map[element.name], mw.clone(element))
        elseif map[element.name] and map[element.name].name then
            map[element.name] = { map[element.name], mw.clone(element) }
        else
            map[element.name] = mw.clone(element)
        end
    end
    return map
end

--- Item export utility.
--  @function           export_item
--  @param              {table} documentation Package documentation data.
--  @param              {string} name Identifier name for item.
--  @param              {string} item_no Identifier name for item.
--  @param              {string} alias Export alias for item.
--  @param              {boolean} factory Whether the documentation item is a factory function.
--  @local
local function export_item(documentation, name, item_no, alias, factory)
    for _, item in ipairs(documentation.items) do
        if name == item.name then
            item.tags['local'] = nil
            item.tags['private'] = nil

            for index, tag in ipairs(item.tags) do
                if p.tags._privacy_tags[tag.name] then
                    table.remove(item.tags, index)
                end
            end

            item.type = item.type:gsub('variable', 'member')

            if factory then
                item.alias =
                    documentation.items[item_no].tags['factory'].value ..
                    (alias:find('^%[') and '' or (not item.tags['static'] and ':' or '.')) ..
                    alias
            else

                item.alias =
                    ((documentation.tags['alias'] or {}).value or documentation.name) ..
                    (alias:find('^%[') and '' or (documentation.type == 'classmod' and not item.tags['static'] and ':' or '.')) ..
                    alias
            end

            item.hierarchy = mw.text.split((item.alias:gsub('["\']?%]', '')), '[.:%[\'""]+')
        end
    end
end

--- Subitem tag correction utility.
--  @function           correct_subitem_tag
--  @param              {table} item Item documentation data.
--  @local
local function correct_subitem_tag(item)
    local field_tag = item.tags['field']
    if item.type ~= 'function' or not field_tag then
        return
    end

    if field_tag.name then
        field_tag.name = 'param'
    else
        for _, tag_el in ipairs(field_tag) do
            tag_el.name = 'param'
        end
    end

    local param_tag = item.tags['param']
    if param_tag and not param_tag.name then
        if field_tag.name then
            table.insert(param_tag, field_tag)
        else
            for _, tag_el in ipairs(field_tag) do
                table.insert(param_tag, tag_el)
            end
        end

    elseif param_tag and param_tag.name then
        if field_tag.name then
            param_tag = { param_tag, field_tag }

        else
            for i, tag_el in ipairs(field_tag) do
                if i == 1  then
                    param_tag = { param_tag }
                end
                for _, tag_el in ipairs(field_tag) do
                    table.insert(param_tag, tag_el)
                end
            end
        end

    else
        param_tag = field_tag
    end

    item.tags['field'] = nil
end

--- Item override tag utility.
--  @function           override_item_tag
--  @param              {table} item Item documentation data.
--  @param              {string} name Tag name.
--  @param[opt]         {string} alias Target alias for tag.
--  @local
local function override_item_tag(item, name, alias)
    if item.tags[name] then
        item[alias or name] = item.tags[name].value
    end
end

--- Markdown header converter.
--  @function           markdown_header
--  @param              {string} hash Leading hash.
--  @param              {string} text Header text.
--  @return             {string} MediaWiki header.
--  @local
local function markdown_header(hash, text)
    local symbol = '='
    return
        '\n' .. symbol:rep(#hash) ..
        ' ' .. text ..
        ' ' .. symbol:rep(#hash) ..
        '\n'
end

--- Item reference formatting.
--  @function           item_reference
--  @param              {string} ref Item reference.
--  @return             {string} Internal MediaWiki link to article item.
--  @local
local function item_reference(ref)
    local temp = mw.text.split(ref, '|')
    local item = temp[1]
    local text = temp[2] or temp[1]

    if references.items[item] then
        item = references.items[item]
    else
        item = '#' .. item
    end

    return '' .. '[[' .. item .. '|' .. text .. ']]' .. ''
end

--- Doclet type reference preprocessor.
--  Formats types with links to the [[Lua reference manual]].
--  @function           preop_type
--  @param              {table} item Item documentation data.
--  @param              {table} options Configuration options.
--  @local
local function type_reference(item, options)
    local interwiki = mw.site.server == DEV_WIKI and '' or 'w:c:dev:'

    if
        not options.noluaref and
        item.value and
        item.value:match('^%S+') == '...'
    then
        item.value = item.value:gsub('^(%S+)', mw.text.tag{
            name = 'code',
            content = '[[' .. interwiki .. 'Lua reference manual#varargs|...]]'
        })
    end

    if not item.type then
        return
    end

    item.type = item.type:gsub(' ', '\26')
    local space_ptn = '[;|][%s\26]*'
    local types, t = mw.text.split(item.type, space_ptn)
    local spaces = {}
    for space in item.type:gmatch(space_ptn) do
        table.insert(spaces, space)
    end

    for index, type in ipairs(types) do
        t = types[index]
        local data = references.types[type]
        local name = data and data.name or t
        if not name:match('%.') and not name:match('^%u') and data then
            name = i18n:msg('type-' .. name)
        end
        if data and not options.noluaref then
            types[index] = '[[' .. interwiki .. data.link .. '|' .. name .. ']]'
        elseif
            not options.noluaref and
            not t:find('^line') and
            not p.tags._generic_tags[t]
        then
            types[index] = '[[#' .. t .. '|' .. name .. ']]'
        end
    end

    for index, space in ipairs(spaces) do
        types[index] = types[index] .. space
    end

    item.type = table.concat(types)
    item.type = item.type:gsub('\26', ' ')
end

--- Markdown preprocessor to MediaWiki format.
--  @function           markdown
--  @param              {string} str Unprocessed Markdown string.
--  @return             {string} MediaWiki-compatible markup with HTML formatting.
--  @local
local function markdown(str)
    -- Bold & italic tags.
    str = str:gsub('%*%*%*([^\n*]+)%*%*%*', '%1')
    str = str:gsub('%*%*([^\n*]+)%*%*', '%1')
    str = str:gsub('%*([^\n*]+)%*', '%1')

    -- Self-closing header support.
    str = str:gsub('%f[^\n%z](#+) *([^\n#]+) *#+%s', markdown_header)

    -- External and internal links.
    str = str:gsub('%[([^\n%]]+)%]%(([^\n][^\n)]-)%)', '[%2 %1]')
    str = str:gsub('%@{([^\n}]+)}', item_reference)

    -- Programming & scientific notation.
    str = str:gsub('%f["`]`([^\n`]+)`%f[^"`]', '%1')
    str = str:gsub('%$%$\\ce{([^\n}]+)}%$%$', '%1')
    str = str:gsub('%$%$([^\n$]+)%$%$', '%1')

    -- Strikethroughs and superscripts.
    str = str:gsub('~~([^\n~]+)~~', '%1')
    str = str:gsub('%^%(([^)]+)%)', '%1')
    str = str:gsub('%^%s*([^%s%p]+)', '%1')

    -- HTML output.
    return str
end

--- Doclet item renderer.
--  @function           render_item
--  @param              {table} stream Wikitext documentation stream.
--  @param              {table} item Item documentation data.
--  @param              {table} options Configuration options.
--  @param[opt]         {function} preop Item data preprocessor.
--  @local
local function render_item(stream, item, options, preop)
    local item_id = item.alias or item.name
    if preop then preop(item, options) end
    local item_name = item.alias or item.name

    if options.strip and item.export and item.hierarchy then
        item_name = item_name:gsub('^[%w_]+[.[]?', '')
    end

    type_reference(item, options)

    stream:wikitext(';' .. item_name .. '' .. i18n:msg('parentheses', item.type)):newline()

    if (#(item.summary or '') + #item.description) ~= 0 then
        local sep = #(item.summary or '') ~= 0 and #item.description ~= 0
            and (item.description:find('^[{:#*]+%s+') and '\n' or ' ')
            or  ''
        local intro = (item.summary or '') .. sep .. item.description
        stream:wikitext(':' .. intro:gsub('\n([{:#*])', '\n:%1'):gsub('\n\n([^=])', '\n:%1')):newline()
    end
end

--- Doclet tag renderer.
--  @function           render_tag
--  @param              {table} stream Wikitext documentation stream.
--  @param              {string} name Item tag name.
--  @param              {table} tag Item tag data.
--  @param              {table} options Configuration options.
--  @param[opt]         {function} preop Item data preprocessor.
--  @local
local function render_tag(stream, name, tag, options, preop)
    if preop then preop(tag, options) end
    if tag.value then
        type_reference(tag, options)
        local tag_name = i18n:msg('tag-' .. name, '1')
        stream:wikitext(':' ..  tag_name .. '' .. i18n:msg('separator-semicolon') .. mw.text.trim(tag.value):gsub('\n([{:#*])', '\n:%1'))

        if tag.value:find('\n[{:#*]') and (tag.type or (tag.modifiers or {})['opt']) then
            stream:newline():wikitext(':')
        end

        if tag.type and (tag.modifiers or {})['opt'] then
            stream:wikitext(i18n:msg{
                key = 'parentheses',
                args = {
                    tag.type ..
                    i18n:msg('separator-colon') ..
                    i18n:msg('optional')
                }
            })

        elseif tag.type then
            stream:wikitext(i18n:msg{
                key = 'parentheses',
                args = { tag.type }
            })

        elseif (tag.modifiers or {})['opt'] then
            stream:wikitext(i18n:msg{
                key = 'parentheses',
                args = { i18n:msg('optional') }
            })
        end

        stream:newline()

    else
        local tag_name = i18n:msg('tag-' .. name, tostring(#tag))
        stream:wikitext(':' .. tag_name .. '' .. i18n:msg('separator-semicolon')):newline()

        for _, tag_el in ipairs(tag) do
            type_reference(tag_el, options)
            stream:wikitext(':' .. (options.ulist and '*' or ':') .. tag_el.value:gsub('\n([{:#*])', '\n:' .. (options.ulist and '*' or ':') .. '%1'))

            if tag_el.value:find('\n[{:#*]') and (tag_el.type or (tag_el.modifiers or {})['opt']) then
                stream:newline():wikitext(':' .. (options.ulist and '*' or ':') .. (tag_el.value:match('^[*:]+') or ''))
            end
    
            if tag_el.type and (tag_el.modifiers or {})['opt'] then
                stream:wikitext(i18n:msg{
                    key = 'parentheses',
                    args = {
                        tag_el.type ..
                        i18n:msg('separator-colon') ..
                        i18n:msg('optional')
                    }
                })

            elseif tag_el.type then
                stream:wikitext(i18n:msg{
                    key = 'parentheses',
                    args = { tag_el.type }
                })

            elseif (tag_el.modifiers or {})['opt'] then
                stream:wikitext(i18n:msg{
                    key = 'parentheses',
                    args = { i18n:msg('optional') }
                })
            end

            stream:newline()
        end
    end
end

--- Doclet function preprocessor.
--  Formats item name as a function call with top-level arguments.
--  @function           preop_function_name
--  @param              {table} item Item documentation data.
--  @param              {table} options Configuration options.
--  @local
local function preop_function_name(item, options)
    local target = item.alias and 'alias' or 'name'

    item[target] = item[target] .. '('

    if
        item.tags['param'] and
        item.tags['param'].value and
        not item.tags['param'].value:find('^[%w_]+[.[]')
    then
        if (item.tags['param'].modifiers or {})['opt'] then
            item[target] = item[target] .. ''
        end

        item[target] = item[target] .. item.tags['param'].value:match('^(%S+)')

        if (item.tags['param'].modifiers or {})['opt'] then
            item[target] = item[target] .. ''
        end

    elseif item.tags['param'] then
        for index, tag in ipairs(item.tags['param']) do
            if not tag.value:find('^[%w_]+[.[]') then
                if (tag.modifiers or {})['opt'] then
                    item[target] = item[target] .. ''
                end

                item[target] = item[target] .. (index > 1 and ', ' or '') .. tag.value:match('^(%S+)')

                if (tag.modifiers or {})['opt'] then
                    item[target] = item[target] .. ''
                end
            end
        end
    end

    item[target] = item[target] .. ')'
end

--- Doclet parameter/field subitem preprocessor.
--  Indents and wraps variable prefix with `code` tag.
--  @function           preop_variable_prefix
--  @param              {table} item Item documentation data.
--  @param              {table} options Configuration options.
--  @local
local function preop_variable_prefix(item, options)
    local indent_symbol = options.ulist and '*' or ':'
    local indent_level, indentation

    if item.value then
        indent_level = item.value:match('^%S+') == '...'
            and 0
            or  select(2, item.value:match('^%S+'):gsub('[.[]', ''))
        indentation = indent_symbol:rep(indent_level)
        item.value = indentation .. item.value:gsub('^(%S+)', '%1')

    elseif item then
        for _, item_el in ipairs(item) do
            preop_variable_prefix(item_el, options)
        end
    end
end

--- Doclet usage subitem preprocessor.
--  Formats usage example with `` tag.
--  @function           preop_usage_highlight
--  @param              {table} item Item documentation data.
--  @param              {table} options Configuration options.
--  @local
local function preop_usage_highlight(item, options)
    if item.value then
        item.value = unindent(mw.text.trim(item.value))
        if item.value:find('^{{.+}}$') then
            item.value = item.value:gsub('=', mw.text.nowiki)
            local multi_line = item.value:find('\n') and '|m = 1|' or '|'

            if item.value:match('^{{([^:]+)') == '#invoke' then
                item.value = item.value:gsub('^{{[^:]+:', '{{t|i = 1' .. multi_line)

            else
                if options.entrypoint then
                    item.value = item.value:gsub('^([^|]+)|%s*([^|}]-)(%s*)([|}])','%1|"%2"%3%4')
                end
                item.value = item.value:gsub('^{{', '{{t' .. multi_line)
            end

            local highlight_class = tonumber(mw.site.currentVersion:match('^%d%.%d+')) > 1.19
                and 'mw-highlight'
                or  'mw-geshi'

            if item.value:find('\n') then
                item.value = '

' .. item.value .. '

'

            else
                item.value = '' .. item.value .. ''
            end

        else
            item.value =
                (item.value:find('\n') and '' or '') ..
                '' ..
                    '' ..
                        item.value ..
                    '' ..
                '' ..
                (item.value:find('\n') and '' or '')
        end

    elseif item then
        for _, item_el in ipairs(item) do
            preop_usage_highlight(item_el, options)
        end
    end
end

--- Doclet error subitem preprocessor.
--  Formats line numbers (`{#}`) in error tag values.
--  @function           preop_error_line
--  @param              {table} item Item documentation data.
local function preop_error_line(item, options)
    if item.name then
        local line

        for mod in pairs(item.modifiers or {}) do
            if mod:find('^%d+$') then line = mod end
        end

        if line then
            if item.type then
                item.type = item.type .. i18n:msg('separator-colon') .. 'line ' .. line

            else
                item.type = 'line ' .. line
            end
        end

    elseif item then
        for _, item_el in ipairs(item) do
            preop_error_line(item_el, options)
        end
    end
end

--  Docbunto package items.

--- Template entrypoint for [[Template:Docbunto]].
--  @function           p.main
--  @param              {table} f Scribunto frame object.
--  @return             {string} Module documentation output.
function p.main(f)
    frame = f:getParent()
    local modname = mw.text.trim(frame.args[1] or frame.args.file or DEFAULT_TITLE)
	
    local options = {}
    options.all = yesno(frame.args.all, false)
    options.boilerplate = yesno(frame.args.boilerplate, false)
    options.caption = frame.args.caption
    options.code = yesno(frame.args.code, false)
    options.colon = yesno(frame.args.colon, false)
    options.image = frame.args.image
    options.noluaref = yesno(frame.args.noluaref, false)
    options.plain = yesno(frame.args.plain, false)
    options.preface = frame.args.preface
    options.simple = yesno(frame.args.simple, false)
    options.sort = yesno(frame.args.sort, false)
    options.strip = yesno(frame.args.strip, false)
    options.ulist = yesno(frame.args.ulist, false)
	
	-- /doc subpages do not have LuaDoc tokens so use main module's LuaDoc
	-- documentation instead for sample render
	if (modname:match('/doc$') ~= nil) then
		return p.build(BASE_TITLE, options)
	end
	
    return p.build(modname, options)
end

--- Scribunto documentation generator entrypoint.
--  @function           p.build
--  @param[opt]         {string} modname Module page name (without namespace).
--                      Default: second-level subpage.
--  @param[opt]         {table} options Configuration options.
--  @param[opt]         {boolean} options.all Include local items in
--                      documentation.
--  @param[opt]         {boolean} options.boilerplate Removal of
--                      boilerplate (license block comments).
--  @param[opt]         {string} options.caption Infobox image caption.
--  @param[opt]         {boolean} options.code Only document Docbunto code
--                      items - exclude article infobox and lede from
--                      rendered documentation. Permits article to be
--                      edited in VisualEditor.
--  @param[opt]         {boolean} options.colon Format tags with a `:` suffix
--                      and without the `@` prefix. This bypasses the "doctag
--                      soup" some authors complain of.
--  @param[opt]         {string} options.image Infobox image.
--  @param[opt]         {boolean} options.noluaref Don't link to the [[Lua
--                      reference manual]] for types.
--  @param[opt]         {boolean} options.plain Disable Markdown formatting
--                      in documentation.
--  @param[opt]         {string} options.preface Preface text to insert
--                      between lede & item documentation, used to provide
--                      usage and code examples.
--  @param[opt]         {boolean} options.simple Limit documentation to
--                      descriptions only. Removes documentation of
--                      subitem tags such as `@param` and `@field` ([[#Item
--                      subtags|see list]]).
--  @param[opt]         {boolean} options.sort Sort documentation items in
--                      alphabetical order.
--  @param[opt]         {boolean} options.strip Remove table index in
--                      documentation.
--  @param[opt]         {boolean} options.ulist Indent subitems as `

`
--                      lists (LDoc/JSDoc behaviour).
function p.build(modname, options)
    modname = modname or DEFAULT_TITLE
    options = options or {}

    local tagdata = p.taglet(modname, options)
    local docdata = p.doclet(tagdata, options)

    return docdata
end

--- Docbunto taglet parser for Scribunto modules.
--  @function           p.taglet
--  @param[opt]         {string} modname Module page name (without namespace).
--  @param[opt]         {table} options Configuration options.
--  @error[906]         {string} 'Lua source code not found in $1'
--  @error[912]         {string} 'documentation markup for Docbunto not found in $1'
--  @return             {table} Module documentation data.
function p.taglet(modname, options)
    modname = modname or DEFAULT_TITLE
    options = options or {}

    local filepath = MODULE_LOCALIZATION .. ':' .. modname
    local content = mw.title.new(filepath):getContent()

    -- Content checks.
    if not content then
        error(i18n:msg('no-content', filepath))
    end
    if
        not content:match('%-%-%-') and
        not content:match(options.colon and '%s+%w+:' or '%s+@%w+')
    then
        error(i18n:msg('no-markup', filepath))
    end

    -- Remove leading escapes.
    content = content:gsub('^%-%-+%s*<[^>]+>\n', '')

    -- Remove closing pretty comments.
    content = content:gsub('\n%-%-%-%-%-+(\n[^-]+)', '\n-- %1')

    -- Remove boilerplate block comments.
    if options.boilerplate then
        content = content:gsub('^%-%-%[=*%[\n.-\n%-?%-?%]%=*]%-?%-?%s+', '')
        content = content:gsub('%s+%-%-%[=*%[\n.-\n%-?%-?%]%=*]%-?%-?$', '')
    end

    -- Configure patterns for colon mode and Unicode character encoding.
    options.unicode = type(content:find('[^%w%c%p%s]+')) == 'number'
    options.iso639_th = type(content:find('\224\184[\129-\155]')) == 'number'
    configure_patterns(options)

    -- Content lexing.
    local lines = lexer(content)
    local tokens = {}
    local dummy_token = {
        data = '',
        posFirst = 1,
        posLast = 1
    }
    local token_closure = 0
    for _, line in ipairs(lines) do
        if #line == 0 then
            dummy_token.type = token_closure == 0
                and 'whitespace'
                or  tokens[#tokens].type
            table.insert(tokens, mw.clone(dummy_token))
        else
            for _, token in ipairs(line) do
                 if token.data:find('^%[=*%[$') or token.data:find('^%-%-%[=*%[$') then
                    token_closure = 1
                end
                if token.data:find(']=*]') then
                    token_closure = 0
                end
                table.insert(tokens, token)
            end
        end
    end

    -- Start documentation data.
    local documentation = {}
    documentation.filename = filepath
    documentation.description = ''
    documentation.code = content
    documentation.comments = {}
    documentation.tags = {}
    documentation.items = {}
    local line_no = 0
    local item_no = 0

    -- Taglet tracking variables.
    local start_mode = true
    local comment_mode = false
    local doctag_mode = false
    local export_mode = false
    local special_tag = false
    local factory_mode = false
    local return_mode = false
    local comment_tail = ''
    local tag_name = ''
    local new_item = false
    local new_tag = false
    local new_item_code = false
    local code_block = false
    local pretty_comment = false
    local comment_brace = false

    local t, i = tokens[1], 1

    pcall(function()

    while t do
        -- Taglet variable update.
        new_item = t.data:find('^%-%-%-') or t.data:find('^%-%-%[%[$')
        comment_tail = t.data:gsub('^%-%-+', '')
        tag_name = comment_tail:match(DOCBUNTO_TAG)
        tag_name = p.tags._alias[tag_name] or tag_name
        new_tag = p.tags[tag_name]
        pretty_comment =
            t.data:find('^%-+$')           or
            t.data:find('[^-]+%-%-+%s*$')  or
            t.data:find('')      or
            t.data:find('')
        comment_brace =
            t.data:find('^%-%-%[%[$') or
            t.data:find('^%-%-%]%]$') or
            t.data:find('^%]%]%-%-$')
        pragma_mode = tag_name == 'pragma'
        export_mode = tag_name == 'export'
        special_tag = pragma_mode or export_mode
        local tags, subtokens, sep

        -- Line counter.
        if t.posFirst == 1 then
            line_no = line_no + 1
        end

        -- Data insertion logic.
        if t.type == 'comment' then
            if new_item then comment_mode = true end

            -- Module-level documentation taglet.
            if start_mode then
                table.insert(documentation.comments, t.data)

                if comment_mode and not new_tag and not doctag_mode and not comment_brace and not pretty_comment then
                    sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
                        and '\n'
                        or  (#documentation.description ~= 0 and DOCBUNTO_CONCAT or '')
                    documentation.description = documentation.description .. sep .. mw.text.trim(comment_tail)
                end

                if new_tag and not special_tag then
                    doctag_mode = true
                    table.insert(documentation.tags, process_tag(comment_tail))

                elseif doctag_mode and not comment_brace and not pretty_comment then
                    tags = documentation.tags
                    if p.tags[tags[#tags].name] == TAG_MULTI then
                        sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
                            and '\n'
                            or  DOCBUNTO_CONCAT
                        tags[#tags].value = tags[#tags].value .. sep .. mw.text.trim(comment_tail)
                    elseif p.tags[tags[#tags].name] == TAG_MULTI_LINE then
                        tags[#tags].value = tags[#tags].value .. '\n' .. comment_tail
                    end
                end
            end

            -- Documentation item detection.
            if not start_mode and (new_item or (new_tag and tokens[i - 1].type ~= 'comment')) and not special_tag then
                table.insert(documentation.items, {})
                item_no = item_no + 1
                documentation.items[item_no].lineno = line_no
                documentation.items[item_no].code = ''
                documentation.items[item_no].comments = {}
                documentation.items[item_no].description = ''
                documentation.items[item_no].tags = {}
            end

            if not start_mode and comment_mode and not new_tag and not doctag_mode and not comment_brace and not pretty_comment then
                sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
                    and '\n'
                    or  (#documentation.items[item_no].description ~= 0 and DOCBUNTO_CONCAT or '')
                documentation.items[item_no].description =
                    documentation.items[item_no].description ..
                    sep ..
                    mw.text.trim(comment_tail)
            end

            if not start_mode and new_tag and not special_tag then
                doctag_mode = true
                table.insert(documentation.items[item_no].tags, process_tag(comment_tail))

            elseif not start_mode and doctag_mode and not comment_brace and not pretty_comment then
                tags = documentation.items[item_no].tags
                if p.tags[tags[#tags].name] == TAG_MULTI then
                    sep = mw.text.trim(comment_tail):find('^[{|!}:#*=]+[%s-}]+')
                        and '\n'
                        or  DOCBUNTO_CONCAT
                    tags[#tags].value = tags[#tags].value .. sep .. mw.text.trim(comment_tail)
                elseif p.tags[tags[#tags].name] == TAG_MULTI_LINE then
                    tags[#tags].value = tags[#tags].value .. '\n' .. comment_tail
                end
            end

            if not start_mode and (comment_mode or doctag_mode) then
                table.insert(documentation.items[item_no].comments, t.data)
            end

            -- Export tag support.
            if export_mode then
                factory_mode = t.posFirst ~= 1
                if factory_mode then
                    documentation.items[item_no].exports = true
                else
                    documentation.exports = true
                end

                subtokens = {}
                while t and (not factory_mode or (factory_mode and t.data ~= 'end')) do
                    if factory_mode then
                        documentation.items[item_no].code =
                            documentation.items[item_no].code ..
                            (t.posFirst == 1 and '\n' or '') ..
                            t.data
                    end
                    t, i = tokens[i + 1], i + 1
                    if t and t.posFirst == 1 then
                        line_no = line_no + 1
                    end
                    if t and t.type ~= 'whitespace' and t.type ~= 'keyword' and t.type ~= 'comment' then
                        table.insert(subtokens, t)
                    end
                end

                local sep = {
                    ['{'] = true, ['}'] = true;
                    [','] = true, [';'] = true;
                }
                local increment = 0
                for index, subtoken in ipairs(subtokens) do
                    if
                        subtoken.type == 'ident' and
                        sep[subtokens[index + 1].data] and
                        (subtokens[index - 1].data == '=' or sep[subtokens[index - 1].data])
                    then
                        local t2, i2, alias = subtoken, index, ''
                        if subtokens[index - 1].data == '=' then
                            t2, i2 = subtokens[i2 - 2], i2 - 2
                        end
                        if not sep[subtokens[index - 1].data] then
	                        while not sep[t2.data] do
	                            alias = t2.data .. alias
	                            t2, i2 = subtokens[i2 - 1], i2 - 1
	                        end
                        end
                        if #alias == 0 then
                            increment = increment + 1
                            alias = '[' .. tostring(increment) .. ']'
                        end
                        export_item(documentation, subtoken.data, item_no, alias, factory_mode)
                    end
                end

                if not factory_mode then
                    break
                else
                    factory_mode = false
                end
            end

            -- Pragma tag support.
            if pragma_mode then
                tags = process_tag(comment_tail)
                options[tags.value] = yesno((next(tags.modifiers or {})), true)
                if options[tags.value] == nil then
                    options[tags.value] = true
                end
            end

        -- Data insertion logic.
        elseif comment_mode or doctag_mode then
            -- Package data post-processing.
            if start_mode then
                documentation.tags = hash_map(documentation.tags)
                documentation.name = extract_name(documentation, { project = true })
                documentation.info = extract_info(documentation)
                documentation.type = extract_type(documentation) or 'module'
                if #documentation.description ~= 0 then
                    documentation.summary = match(documentation.description, DOCBUNTO_SUMMARY)
                    documentation.description = gsub(documentation.description, DOCBUNTO_SUMMARY .. '%s*', '')
                end
                documentation.description = documentation.description:gsub('%s%s+', '\n\n')
                documentation.executable = p.tags._code_types[documentation.type] and true or false
                correct_subitem_tag(documentation)
                override_item_tag(documentation, 'name')
                override_item_tag(documentation, 'alias')
                override_item_tag(documentation, 'summary')
                override_item_tag(documentation, 'description')
                override_item_tag(documentation, 'class', 'type')
            end

            -- Item data post-processing.
            if item_no ~= 0 then
                documentation.items[item_no].tags = hash_map(documentation.items[item_no].tags)
                documentation.items[item_no].name = extract_name(documentation.items[item_no])
                documentation.items[item_no].type = extract_type(documentation.items[item_no])
                if #documentation.items[item_no].description ~= 0 then
                    documentation.items[item_no].summary = match(documentation.items[item_no].description, DOCBUNTO_SUMMARY)
                    documentation.items[item_no].description = gsub(documentation.items[item_no].description, DOCBUNTO_SUMMARY .. '%s*', '')
                end
                documentation.items[item_no].description = documentation.items[item_no].description:gsub('%s%s+', '\n\n')
                new_item_code = true
            end

            -- Documentation block reset.
            start_mode = false
            comment_mode = false
            doctag_mode = false
            export_mode = false
            pragma_mode = false
        end

        -- Don't concatenate module return value into item code.
        if t.data == 'return' and t.posFirst == 1 then
            return_mode = true
        end

        -- Item code concatenation.
        if item_no ~= 0 and not doctag_mode and not comment_mode and not return_mode then
            sep = #documentation.items[item_no].code ~= 0 and t.posFirst == 1 and '\n' or ''
            documentation.items[item_no].code = documentation.items[item_no].code .. sep .. t.data
            -- Code analysis on item head.
            if new_item_code and documentation.items[item_no].code:find('\n') then
                code_static_analysis(documentation.items[item_no])
                new_item_code = false
            end
        end

        t, i = tokens[i + 1], i + 1
    end

    documentation.lineno = line_no

    local package_name = (documentation.tags['alias'] or {}).value or documentation.name
    local package_alias = (documentation.tags['alias'] or {}).value or 'p'
    local export_ptn = '^%s([.[])'

    for _, item in ipairs(documentation.items) do
        if item.name == package_alias or (item.name and item.name:match('^' .. package_alias .. '[.[]')) then
            item.alias = item.name:gsub(export_ptn:format(package_alias), documentation.name .. '%1')
        end
        if
            item.name == package_name or
            (item.name and item.name:find(export_ptn:format(package_name))) or
            (item.alias and item.alias:find(export_ptn:format(package_name)))
        then
            item.export = true
        end
        if item.name and (item.name:find('[.:]') or item.name:find('%[[\'"]')) then
            item.hierarchy = mw.text.split((item.name:gsub('["\']?%]', '')), '[.:%[\'""]+')
        end
        item.type = item.type or ((item.alias or item.name or ''):find('[.[]') and 'member' or 'variable')
        correct_subitem_tag(item)
        override_item_tag(item, 'name')
        override_item_tag(item, 'alias')
        override_item_tag(item, 'summary')
        override_item_tag(item, 'description')
        override_item_tag(item, 'class', 'type')
    end

    -- Item sorting for documentation.
    table.sort(documentation.items, function(item1, item2)
        local inaccessible1 = item1.tags['local'] or item1.tags['private']
        local inaccessible2 = item2.tags['local'] or item2.tags['private']

        -- Send package items to the top.
        if item1.export and not item2.export then
            return true
        elseif item2.export and not item1.export then
            return false

        -- Send private items to the bottom.
        elseif inaccessible1 and not inaccessible2 then
            return false
        elseif inaccessible2 and not inaccessible1 then
            return true

        -- Optional alphabetical sort.
        elseif options.sort then
            return (item1.alias or item1.name) < (item2.alias or item2.name)

        -- Sort via source code order by default.
        else
            return item1.lineno < item2.lineno
        end
    end)

    end)

    return documentation
end

--- Doclet renderer for Docbunto taglet data.
--  @function           p.doclet
--  @param              {table} data Taglet documentation data.
--  @param[opt]         {table} options Configuration options.
--  @return             {string} Wikitext documentation output.
function p.doclet(data, options)
    local documentation = mw.html.create()
    local namespace = '^' .. MODULE_LOCALIZATION .. ':'
    local codepage = data.filename:gsub(namespace, '')

    options = options or {}
    frame = frame or mw.getCurrentFrame():getParent()

    local maybe_md = options.plain and tostring or markdown

    -- Detect Module:Entrypoint for usage formatting.
    options.entrypoint = data.code:find('require[ (]*["\'][MD]%w+:Entrypoint[\'"]%)?')

    -- Disable edit sections for automatic documentation pages.
    if not options.code then
        documentation:wikitext(frame:preprocess('__NOEDITSECTION__'))
    end

    -- Lua infobox for Fandom Developers Wiki.
    if
        not options.code and
        mw.site.server == 'https://warframe.fandom.com' and
        p.tags._code_types[data.type]
    then
        local infobox = {}
        infobox.title = 'LuaBox'
        infobox.args = {}

        if codepage ~= mw.text.split(title.text, '/')[2] then
            infobox.args['Title'] = codepage
            infobox.args['Code'] = codepage
        end

        if options.image or data.info['image'] then
            infobox.args['Image file'] = data.info['image']
        end

        if options.caption or data.info['caption'] then
            infobox.args['Image caption'] = frame:preprocess(maybe_md(
                options.caption or data.info['caption']
            ))
        end

        infobox.args['Type'] = data.type == 'module' and 'invocable' or 'meta'

        if data.info['release'] then
            infobox.args['Status'] = data.info['release']
        end
        
        infobox.args['Suite'] = data.info['module']

        if data.summary then
            local description = data.summary
            if description:find('^(' .. codepage .. ')') then
                description = description:gsub('^' .. codepage .. '%s(%w)', mw.ustring.upper)
            end
            infobox.args['Description'] = frame:preprocess(maybe_md(description))
        end

        if data.info['author'] then
            infobox.args['Author'] = frame:preprocess(maybe_md(data.info['author']))
        end

        if data.info['attribution'] then
            infobox.args['Using code by'] = frame:preprocess(maybe_md(data.info['attribution']))
        end

        if data.info['credit'] then
            infobox.args['Other attribution'] = frame:preprocess(maybe_md(data.info['credit']))
        end

        if data.info['require'] then
            data.info['require'] = data.info['require']
                :gsub('^[^[%s]+$', '[[%1]]')
                :gsub('%* ([^[%s]+)', '* [[%1]]')
            infobox.args['Dependencies'] = frame:preprocess(maybe_md(data.info['require']))
        end

        if codepage ~= 'I18n' and data.code:find('[\'"]Dev:I18n[\'"]') or data.code:find('[\'"]'..MODULE_LOCALIZATION..':I18n[\'"]') then
            infobox.args['Languages'] = 'auto'
        elseif data.code:find('mw%.message%.new') then
            infobox.args['Languages'] = 'mw'
        end

        if data.info['demo'] then
            infobox.args['Examples'] = frame:preprocess(maybe_md(data.info['demo']))
        end

        documentation:wikitext(frame:expandTemplate(infobox)):newline()

    -- Custom infobox for external wikis.
    elseif not options.code then
        local custom, infobox = pcall(require, MODULE_LOCALIZATION..':Docbunto/infobox')
        if custom and type(infobox) == 'function' then
            documentation:wikitext(infobox(data, codepage, frame, options)):newline()
        end
    end

    -- Documentation lede.
    if not options.code and (#(data.summary or '') + #data.description) ~= 0 then
        local sep = #data.summary ~= 0 and #data.description ~= 0
            and (data.description:find('^[{|!}:#*=]+[%s-}]+') and '\n\n' or ' ')
            or  ''
        local intro = (data.summary or '') .. sep .. data.description
        intro = frame:preprocess(maybe_md(intro:gsub('^(' .. codepage .. ')', '%1')))
        documentation:wikitext(intro):newline():newline()
    end

    -- Custom documentation preface.
    if options.preface then
        documentation:wikitext(options.preface):newline():newline()
    end

    -- Start code documentation.
    local codedoc = mw.html.create()
    local function_module = data.tags['param'] or data.tags['return']
    local header_type =
        documentation.type == 'classmod'
            and 'class'
        or  function_module
            and 'function'
            or  'items'
    if (function_module or #data.items ~= 0) and not options.code or options.preface then
        codedoc:wikitext('== ' .. i18n:msg('header-documentation') .. ' =='):newline()
    end
    if (function_module or #data.items ~= 0) then
        codedoc:wikitext('=== ' .. i18n:msg('header-' .. header_type) .. ' ==='):newline()
    end

    -- Function module support.
    if function_module then
        data.type = 'function'
        if not options.code then data.description = '' end
        render_item(codedoc, data, options, preop_function_name)

        if not options.simple and data.tags['param'] then
            render_tag(codedoc, 'param', data.tags['param'], options, preop_variable_prefix)
        end
        if not options.simple and data.tags['error'] then
            render_tag(codedoc, 'error', data.tags['error'], options, preop_error_line)
        end
        if not options.simple and data.tags['return'] then
            render_tag(codedoc, 'return', data.tags['return'], options)
        end
    end

    -- Render documentation items.
    local other_header = false
    local private_header = false
    local inaccessible
    for _, item in ipairs(data.items) do
        inaccessible = item.tags['local'] or item.tags['private']
        if not options.all and inaccessible then
            break
        end

        if
            not other_header and item.type ~= 'section' and item.type ~= 'type' and
            not item.export and not item.hierarchy and not inaccessible
        then
            codedoc:wikitext('=== ' .. i18n:msg('header-other') .. ' ==='):newline()
            other_header = true
        end
        if not private_header and options.all and inaccessible then
            codedoc:wikitext('=== ' .. i18n:msg('header-private') ..  '==='):newline()
            private_header = true
        end

        if item.type == 'section' then
            codedoc:wikitext('=== ' .. mw.ustring.gsub(item.summary or item.alias or item.name, '[.։。।෴۔።]$', '') .. ' ==='):newline()
            if #item.description ~= 0 then
                codedoc:wikitext(item.description):newline()
            end

        elseif item.type == 'type' then
            codedoc:wikitext('=== ' .. (item.alias or item.name) .. ' ==='):newline()
            if (#(item.summary or '') + #item.description) ~= 0 then
                local sep = #(item.summary or '') ~= 0 and #item.description ~= 0
                    and (item.description:find('^[{:#*=]+[%s-}]+') and '\n\n' or ' ')
                    or  ''
                codedoc:wikitext((item.summary or '') .. sep .. item.description):newline()
            end

        elseif item.type == 'function' then
            render_item(codedoc, item, options, preop_function_name)
            if not options.simple and item.tags['param'] then
                render_tag(codedoc, 'param', item.tags['param'], options, preop_variable_prefix)
            end
            if not options.simple and item.tags['error'] then
                render_tag(codedoc, 'error', item.tags['error'], options, preop_error_line)
            end
            if not options.simple and item.tags['return'] then
                render_tag(codedoc, 'return', item.tags['return'], options)
            end

        elseif
            item.type == 'table' or
            item.type:find('^member') or
            item.type:find('^variable')

        then
            render_item(codedoc, item, options)
            if not options.simple and item.tags['field'] then
                render_tag(codedoc, 'field', item.tags['field'], options, preop_variable_prefix)
            end
        end

        if item.type ~= 'section' and item.type ~= 'type' then
            if not options.simple and item.tags['note'] then
                render_tag(codedoc, 'note', item.tags['note'], options)
            end
            if not options.simple and item.tags['warning'] then
                render_tag(codedoc, 'warning', item.tags['warning'], options)
            end
            if not options.simple and item.tags['fixme'] then
                render_tag(codedoc, 'fixme', item.tags['fixme'], options)
            end
            if not options.simple and item.tags['todo'] then
                render_tag(codedoc, 'todo', item.tags['todo'], options)
            end
            if not options.simple and item.tags['usage'] then
                render_tag(codedoc, 'usage', item.tags['usage'], options, preop_usage_highlight)
            end
            if not options.simple and item.tags['see'] then
                render_tag(codedoc, 'see', item.tags['see'], options)
            end
        end
    end

    -- Render module-level annotations.
    local header_paren = options.code and '===' or '=='
    local header_text
    for _, tag_name in ipairs{'warning', 'fixme', 'note', 'todo', 'see'} do
        if data.tags[tag_name] then
            header_text =  i18n:msg('tag-' .. tag_name, data.tags[tag_name].value and '1' or '2')
            header_text = header_paren .. ' ' .. header_text .. ' ' .. header_paren
            codedoc:newline():wikitext(header_text):newline()
            if data.tags[tag_name].value then
                codedoc:wikitext(data.tags[tag_name].value):newline()
            else
                for _, tag_el in ipairs(data.tags[tag_name]) do
                    codedoc:wikitext('* ' .. tag_el.value):newline()
                end
            end
        end
    end

    -- Add nowiki tags for EOF termination in tests.
    codedoc:tag('nowiki', { selfClosing = true })

    -- Code documentation formatting.
    codedoc = maybe_md(tostring(codedoc))
    codedoc = frame:preprocess(codedoc)

    documentation:wikitext(codedoc)
    documentation = tostring(documentation)
    return documentation
end

--- Token dictionary for Docbunto tags.
--  Maps Docbunto tag names to tag tokens.
--   * Multi-line tags use the `'M'` token.
--   * Multi-line preformatted tags use the `'ML'` token.
--   * Identifier tags use the `'ID'` token.
--   * Single-line tags use the `'S'` token.
--   * Flags use the `'N'` token.
--   * Type tags use the `'T'` token.
--  @table              p.tags
p.tags = {
    -- Item-level tags, available for global use.
    ['param'] = 'M', ['see'] = 'M', ['note'] = 'M', ['usage'] = 'ML',
    ['description'] = 'M', ['field'] = 'M', ['return'] = 'M',
    ['fixme'] = 'M', ['todo'] = 'M', ['warning'] = 'M', ['error'] = 'M';
    ['class'] = 'ID', ['name'] = 'ID', ['alias'] = 'ID';
    ['summary'] = 'S', ['pragma'] = 'S', ['factory'] = 'S',
    ['release'] = 'S', ['author'] = 'S', ['copyright'] = 'S', ['license'] = 'S',
    ['image'] = 'S', ['caption'] = 'S', ['require'] = 'S', ['attribution'] = 'S',
    ['credit'] = 'S', ['demo'] = 'S';
    ['local'] = 'N', ['export'] = 'N', ['private'] = 'N', ['constructor'] = 'N',
    ['static'] = 'N';
    -- Project-level tags, all scoped to a file.
    ['module'] = 'T', ['script'] = 'T', ['classmod'] = 'T', ['topic'] = 'T',
    ['submodule'] = 'T', ['example'] = 'T', ['file'] = 'T';
    -- Module-level tags, used to register module items.
    ['function'] = 'T', ['table'] = 'T', ['member'] = 'T', ['variable'] = 'T',
    ['section'] = 'T', ['type'] = 'T';
}
p.tags._alias = {
    -- Normal aliases.
    ['about']       = 'summary',
    ['abstract']    = 'summary',
    ['brief']       = 'summary',
    ['bug']         = 'fixme',
    ['argument']    = 'param',
    ['credits']     = 'credit',
    ['code']        = 'usage',
    ['details']     = 'description',
    ['discussion']  = 'description',
    ['exception']   = 'error',
    ['lfunction']   = 'function',
    ['package']     = 'module',
    ['property']    = 'member',
    ['raise']       = 'error',
    ['requires']    = 'require',
    ['returns']     = 'return',
    ['throws']      = 'error',
    ['typedef']     = 'type',
    -- Typed aliases.
    ['bool']        = 'field',
    ['func']        = 'field',
    ['int']         = 'field',
    ['number']      = 'field',
    ['string']      = 'field',
    ['tab']         = 'field',
    ['vararg']      = 'param',
    ['tfield']      = 'field',
    ['tparam']      = 'param',
    ['treturn']     = 'return'
}
p.tags._type_alias = {
    -- Implicit type value alias.
    ['bool']        = 'boolean',
    ['func']        = 'function',
    ['int']         = 'number',
    ['number']      = 'number',
    ['string']      = 'string',
    ['tab']         = 'table',
    ['vararg']      = '...',
    -- Pure typed modifier alias.
    ['tfield']      = 'variable',
    ['tparam']      = 'variable',
    ['treturn']     = 'variable'
}
p.tags._project_level = {
    -- Contains code.
    ['module']      = true,
    ['script']      = true,
    ['classmod']    = true,
    ['submodule']   = true,
    ['file']        = true,
    -- Contains documentation.
    ['topic']       = true,
    ['example']     = true
}
p.tags._code_types = {
    ['module']      = true,
    ['script']      = true,
    ['classmod']    = true
}
p.tags._module_info = {
    ['image']       = true,
    ['caption']     = true,
    ['release']     = true,
    ['author']      = true,
    ['copyright']   = true,
    ['license']     = true,
    ['require']     = true,
    ['credit']      = true,
    ['attribution'] = true,
    ['demo']        = true
}
p.tags._annotation_tags = {
    ['warning']     = true,
    ['fixme']       = true,
    ['note']        = true,
    ['todo']        = true,
    ['see']         = true
}
p.tags._privacy_tags = {
    ['private']     = true,
    ['local']       = true
}
p.tags._generic_tags = {
    ['variable']    = true,
    ['member']      = true
}

return p
```

