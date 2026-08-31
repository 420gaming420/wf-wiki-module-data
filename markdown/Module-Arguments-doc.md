---
title: "Module:Arguments/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Arguments/doc"
wiki_timestamp: "2022-09-23T23:21:14Z"
---

**Arguments** invocation argument extractor for Scribunto modules. It is intended for use by other Lua modules, and should not be called from an invocation (`#invoke`) directly.

This module supports the following features:

* Trimming and blank argument removal.
* Argument inheritance between child and parent frames.
* Argument extraction for external modules and console input.
* Options to customise argument extraction behaviour.

Forked from <https://dev.fandom.com/wiki/Module:Arguments> which is a fork of <https://en.wikipedia.org/wiki/Module:Arguments>

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
* [2 Notes](#Notes)
* [3 See also](#See_also)
* [4 See Also](#See_Also_2)
* [5 Code](#Code)

## Documentation

### Package items

`arguments.getArgs(frame, options)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Main argument extraction utility. Arguments are memoized once fetched for optimal performance, as with the `frame.args` metatable in Scribunto core.
:   The default argument lookup behaviour uses the child frame arguments first, then the parent frame arguments. There are numerous frame options to change this behaviour.
:   The default value tidying behaviour trims parameter values if they are defined strings and treats blank strings as `nil`. This can be customised in the `getArgs` options.
:   **Parameters**:

    :   `frame` Scribunto frame object or Lua arguments table, passed from an invocation or Lua logic such as `frame:getParent()`. If this parameter does not have an `args` field and a `getParent` method, `frame` is assumed to be a Lua arguments table, such as the arguments from a named arguments call. ([frame](#frame)|[table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
    :   `options` Extraction/processing options. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)

        :   `options.trim` Whether to trim the blank arguments present in the arguments table. Accepts `false` only. Default: `true`. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.removeBlanks` Whether to remove blank arguments from the arguments table. Does not shift sequential arguments removed by the processing stage. Accepts `false` only. Default: `true`. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.valueFunc` Custom value tidying function for use if the `trim` and `removeBlanks` options don't cover the developer's argument processing use case. ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"); optional)
        :   `options.frameOnly` Only read arguments from child frame (the `frame` parameter - usually invocation frame). ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.parentOnly` Only read arguments from `frame` parent (the `frame` parameter - usually template frame). ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.parentFirst` Argument lookup in the `frame` parent first, prioritised over the invocation frame arguments. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.wrappers` Individual value or array of values, listing wrapper title name(s) or article ID(s) to permit parent argument lookup from. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
        :   `options.wrapper` Alias of `options.wrappers` - contains title name or article ID to permit parent argument lookup from. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual")|[number](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#number "w:c:dev:Lua reference manual"); optional)
        :   `options.readOnly` Whether to restrict write permissions to the arguments table. When set to a truthy value, an error will be thrown on any write attempt. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.noOverwrite` Whether to restrict overwrite attempts on existing argument keys in the arguments table. When set to a truthy value, an error will be thrown on any write attempt that would result in an existing argument being overwritten. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"); optional)
        :   `options.translate` Map of parameter name aliases to their canonical argument parameter names. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
        :   `options.backtranslate` Map of canonical parameter names to their argument parameter aliases. Supersedes `options.translate` if both options are in use. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
:   **Errors**:

    :   'bad value assigned to option "valueFunc" (function expected, got $type)' (line 317; optional)
    :   'could not write to argument table key "$key"; the table is read-only' (line 407; optional)
    :   'could not write to argument table key "$key"; overwriting existing arguments is not permitted' (line 409; optional)
:   **Returns**: Arguments extracted from invocation. The argument data is embedded as a metatable in the exported table and cannot be accessed with the `#` operator or `table` library methods. However, the exported table can be written to if the `options.readOnly` flag parameter is not truthy. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Note**: Reference tags in the form of `<ref>` will generate phantom references when calling the `pairs` iterator on the arguments table, **IF** the `<ref>` tag does not appear in the dependent module's wikitext output.
:   **Usage**: ```` ```lua
    local getArgs = require('Module:Arguments').getArgs
    function p.main(frame)
        local args = getArgs(frame, {
            wrapper = 'Template:'
        })
        -- Use the args table here.
        -- A common paradigm is return p._main(args).
        -- This allows other Lua modules to access the
        -- main logic in a performant manner without a
        -- frame object.
    end
    ``` ````

## Notes

* The `args` table from the `arguments.getArgs` function is a metatable for performance reasons. Thus, the table will not permit Lua table methods such as `#args`, `next(args)`, and `table` library functions.
* This module will eventually be adapted as a library in [MediaWiki core](https://www.mediawiki.org/wiki/gerrit:q/158323 "mw:gerrit:q/158323"), called as `require('getArgs')`. The core library will remove `options.parentOnly`.

## See also

* [Original module on Wikipedia](https://en.wikipedia.org/wiki/Module:Arguments "wikipedia:Module:Arguments")
* [Test cases for this module](/w/Module:Arguments/testcases?action=edit&redlink=1 "Module:Arguments/testcases (page does not exist)")

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

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
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

