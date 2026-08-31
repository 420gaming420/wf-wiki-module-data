---
title: "Module:I18n/doc"
wiki_url: "https://wiki.warframe.com/w/Module/I18n/doc"
wiki_timestamp: "2023-05-08T05:52:50Z"
---

[![](/images/thumb/Photo-4.png/60px-Photo-4.png?13cbd)](/w/Lotus "Lotus")

*"It's taking longer than I calculated."*

**This page is actively being worked on** and may not be completely correct. Please assist in making this page accurate by [adding more info](https://wiki.warframe.com/w/Module:I18n/doc?action=edit). For guidance on performing research, see [WARFRAME Wiki:Research](/w/WARFRAME_Wiki:Research "WARFRAME Wiki:Research").

With latest update to MediaWiki v1.39, migrate message data stores from MediaWiki namespace to either Main or Template so that non-admins can contribute to localization on the wiki. There is now a native way to import JSON data to Lua modules.

**I18n** library for message storage in Lua datastores and JSON data. The module is designed to enable message separation from modules & templates. It has support for handling language fallbacks. This module is a Lua port of [I18n-js](/w/I18n-js?action=edit&redlink=1 "I18n-js (page does not exist)") and i18n modules that can be loaded by it are editable through [I18nEdit](/w/I18nEdit?action=edit&redlink=1 "I18nEdit (page does not exist)").

Messages for Lua modules can either be stored in /i18n subpages (e.g. [Module:Math/i18n](/w/Module:Math/i18n "Module:Math/i18n")) or on non-module pages with the JSON content model (see [WARFRAME Wiki:L10n](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n") for details).

Forked from <https://dev.fandom.com/wiki/Global_Lua_Modules/I18n>

## Contents

* [1 Usage](#Usage)
* [2 Fetching the messages](#Fetching_the_messages)
* [3 Editing the messages](#Editing_the_messages)
* [4 Changelog](#Changelog)
* [5 Documentation](#Documentation)
  + [5.1 Package items](#Package_items)
  + [5.2 Data](#Data)
* [6 See also](#See_also)
* [7 See Also](#See_Also_2)
* [8 Code](#Code)

## Usage

To use the module, you need to set up your messages in the appropriate place and correct format. The format of your messages should be as follows:

```lua
return {
    ["en"] = {
        ["message-name"] = "value"
    },
    ["pl"] = {
        ["message-name"] = "value"
    }
}
```

Messages can have arguments for substitution in templates/modules - these should be specified in the form `$n` where n is a integer greater than 0, e.g, `"Hello, $1, my name is $2"`.

## Fetching the messages

The message loader will expect your messages to be in a Dev Wiki page such as `Module:PAGENAME/i18n`, where PAGENAME should be the name of your module. Alternatively, an absolute path can be supplied (**if** PAGENAME contains a ":").

Once you've set up the messages, there are two ways to fetch them.

1. Import the module into a Lua module and create a datastore instance using the **`i18n.loadMessages`** method:

```lua
local i18n = require('Module:I18n').loadMessages('PAGENAME', 'PAGENAME2')
-- If a PAGENAME contains a ":" the path will be treated as absolute!
```

2. Fetch messages directly within your template:

```lua
Template installation: {{#invoke:i18n|main}}

Template usage: {{i18n|getMsg||}}
```

## Editing the messages

The editor used for I18n-js translations has also been made to work with translations using this module. Make sure you switch to Lua translations using the option in the edit dropdown on the [translation picker screen](/w/Special:BlankPage/I18nEdit "Special:BlankPage/I18nEdit").

## Changelog

June 10, 2018 [ALPHA]
:   [KockaAdmiralac](/w/User:KockaAdmiralac "User:KockaAdmiralac"): JSON-centric prototype and template testing.

June 12, 2018 (v0.5.0-v0.7.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Port of [I18n-js](/w/I18n-js?action=edit&redlink=1 "I18n-js (page does not exist)") functions and Lua datastore support.

June 13, 2018 (v0.8.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Functional Lua prototype. Code cleanup and testing.

June 16, 2018 (v0.9.0-v0.9.4)
:   [KockaAdmiralac](/w/User:KockaAdmiralac "User:KockaAdmiralac"), [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Testing and tweaks.

:   * Failed testing of JSON support and caching.
    * Subpage `/lang` detection fix.

July 5, 2018 (v1.0.0 - v.1.0.2) [STABLE]
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Support for absolute source paths.
:   [Technobliterator](/w/User:Technobliterator?action=edit&redlink=1 "User:Technobliterator (page does not exist)"): Scope default datastore path to w:c:dev.

July 12, 2018 (v1.0.3) [STABLE]
:   [KockaAdmiralac](/w/User:KockaAdmiralac "User:KockaAdmiralac"): Support for multiple message datastores.

July 13, 2018 (v1.0.4)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Permit wikitext parsing in messages.

July 14, 2018 (v1.0.5)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Respect `uselang` template parameter when fetching user language.

July 20, 2018 (v1.0.6)
:   [KockaAdmiralac](/w/User:KockaAdmiralac "User:KockaAdmiralac"): Add `i18nd:in*` functions to reflect I18n-js's [recently added functionality](/w/Special:Diff/80749 "Special:Diff/80749").

July 26, 2018 (v1.0.7)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Add support for `qqx` message keys.

July 28, 2018 (v1.0.7)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Add `i18nd:getLang` for Lua modules.

July 28, 2018 (v1.1.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Language detection fixes; `uselang` as override.

August 15, 2018 (v1.1.1)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Language detection for `qqx`.

September 12, 2018 (v1.1.2 - v1.2.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Add `i18nd:fromSource`; support named parameters in `i18nd:msg`.

September 12, 2018 (v1.3.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Add template wrapper support through `i18n.main`.

September 12, 2018 (v1.3.0)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Add template wrapper support through `i18n.main`.

November 6 & 13, 2018 (v1.3.1)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Prioritise subpage language over user language by default.
:   [KockaAdmiralac](/w/User:KockaAdmiralac "User:KockaAdmiralac"): Add content language fallback for wikis without [`{{int:lang}}`](/w/MediaWiki:Lang?action=edit&redlink=1 "MediaWiki:Lang (page does not exist)").

November 19, 2018 (v1.3.2)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Fix subpage test in `i18n.getLang`.

November 20, 2018 (v1.3.2)
:   [MACH-59330](/w/User:MACH-59330?action=edit&redlink=1 "User:MACH-59330 (page does not exist)"): Remove support for `qqx` detection (broken).

## Documentation

### Package items

`i18n.getMsg(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Localized message getter by key. Can be used to fetch messages in a specific language code through `uselang` parameter. Extra numbered parameters can be supplied for substitution into the datastore message.
:   **Parameters**:

    :   `frame` Frame table from invocation. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

        :   `frame.args` Metatable containing arguments. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

            :   `frame.args[1]` ROOTPAGENAME of i18n submodule. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
            :   `frame.args[2]` Key of i18n message. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
            :   `frame.args.lang` Default language of message. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
:   **Error**: 'missing arguments in i18n.getMsg' (line 271)
:   **Returns**: I18n message in localised language. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Usage**: {{[i18n](/w/Template:I18n "Template:I18n")|*<"getMsg">*|*<source>*|*<key>*|*<arg1>*|*<arg2>*|*<uselang [Template:=](/w/Template:%3D?action=edit&redlink=1 "Template:= (page does not exist)") code>*}}

`i18n.loadMessages(...)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   I18n message datastore loader.
:   **Parameter**: `...` ROOTPAGENAME/path for target i18n submodules. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Error**: 'no source supplied to i18n.loadMessages' ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); line 322)
:   **Returns**: I18n datastore instance. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Usage**: `require('Module:I18n').loadMessages('1', '2')`

`i18n.getLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Language code getter. Can validate a template's language code through `uselang` parameter.
:   **Returns**: Language code. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Usage**: {{[i18n](/w/Template:I18n "Template:I18n")|*<"getLang">*|*<uselang [Template:=](/w/Template:%3D?action=edit&redlink=1 "Template:= (page does not exist)") code>*}}

`i18n.main(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Template wrapper for [Template:I18n](/w/Template:I18n "Template:I18n").
:   **Parameter**: `frame` Frame invocation object. ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Module output in template context. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Usage**: {{[i18n](/w/Template:I18n "Template:I18n")|*<main>*}}

`_i18n.isWikitext(msg)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Checks whether a message contains unprocessed wikitext. Used to optimise message getter by not preprocessing pure text.
:   **Parameter**: `msg` Message to check. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Whether the message contains wikitext. ([boolean](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#boolean "w:c:dev:Lua reference manual"))

### `Data`

I18n datastore class. This is used to control language translation and access to individual messages. The datastore instance provides language and message getter-setter methods, which can be used to internationalize Lua modules. The language methods (any ending in `Lang`) are all **chainable**.

`Data:msg(opts, ...)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore message getter utility. This method returns localized messages from the datastore corresponding to a `key`. These messages may have `$n` parameters, which can be replaced by optional argument strings supplied by the `msg` call.
:   This function supports [named arguments](/w/Lua_reference_manual?action=edit&redlink=1 "Lua reference manual (page does not exist)"). The named argument syntax is more versatile despite its verbosity; it can be used to select message language & source(s).
:   **Parameters**:

    :   `opts` Message configuration or key. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual")|[table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))

        :   `opts.key` Message key to return from the datastore. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
        :   `opts.args` Arguments to substitute into the message (`$n`). ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
        :   `opts.sources` Source names to limit to (see `Data:fromSources`). ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
        :   `opts.lang` Temporary language to use (see `Data:inLang`). ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"); optional)
    :   `...` Arguments to substitute into the message (`$n`). ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); optional)
:   **Error**: 'missing arguments in Data:msg' ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); line 115)
:   **Returns**: Localised datastore message or `'<key>'`. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Usage**:

    :   ```` ```lua
        ds:msg{
            key = 'message-name',
            lang = '',
            args = {...},
            sources = {}
        }
        ``` ````
    :   `ds:msg('message-name', ...)`

`Data:parameter(parameter, args)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore template parameter getter utility. This method, given a table of arguments, tries to find a parameter's localized name in the datastore and returns its value, or nil if not present. This method always uses the wiki's content language.
:   **Parameters**:

    :   `parameter` Parameter's key in the datastore ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
    :   `args` Arguments to find the parameter in ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Error**: 'missing arguments in Data:parameter' ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"); line 176)
:   **Returns**: Parameter's value or nil if not present ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual")|[nil](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#nil "w:c:dev:Lua reference manual"))

`Data:fromSource(...)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore temporary source setter to a specificed subset of datastores. By default, messages are fetched from the datastore in the same order of priority as `i18n.loadMessages`.
:   **Parameter**: `...` Source name(s) to use. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Datastore instance. ([Data](#Data))

`Data:getLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore default language getter.
:   **Returns**: Default language to serve datastore messages in. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

`Data:useUserLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore language setter to `wgUserLanguage`.
:   **Returns**: Datastore instance. ([Data](#Data))
:   **Note**: Scribunto only registers `wgUserLanguage` when an invocation is at the top of the call stack.

`Data:useContentLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore language setter to `wgContentLanguage`.
:   **Returns**: Datastore instance. ([Data](#Data))

`Data:useLang(code)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Datastore language setter to specificed language.
:   **Parameter**: `code` Language code to use. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Datastore instance. ([Data](#Data))

`Data:inUserLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Temporary datastore language setter to `wgUserLanguage`. The datastore language reverts to the default language in the next `Data:msg` call.
:   **Returns**: Datastore instance. ([Data](#Data))

`Data:inContentLang()` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Temporary datastore language setter to `wgContentLanguage`. Only affects the next `Data:msg` call.
:   **Returns**: Datastore instance. ([Data](#Data))

`Data:inLang(code)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Temporary datastore language setter to a specificed language. Only affects the next `Data:msg` call.
:   **Parameter**: `code` Language code to use. ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))
:   **Returns**: Datastore instance. ([Data](#Data))

## See also

* [I18n guide](/w/I18n?action=edit&redlink=1 "I18n (page does not exist)")
* [I18n-js](/w/I18n-js?action=edit&redlink=1 "I18n-js (page does not exist)")
* [I18nEdit](/w/I18nEdit?action=edit&redlink=1 "I18nEdit (page does not exist)")

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

