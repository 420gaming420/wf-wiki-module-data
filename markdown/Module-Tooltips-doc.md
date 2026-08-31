---
title: "Module:Tooltips/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Tooltips/doc"
wiki_timestamp: "2026-04-15T01:48:56Z"
---

**Tooltips** builds tooltip links and icons. It can be used as a static or instantiated class.

Stylesheet for tooltips and tooltip text can be found on [MediaWiki:Tooltips.css](/w/MediaWiki:Tooltips.css "MediaWiki:Tooltips.css"). The JS script that enables tooltips is on [MediaWiki:Tooltips.js](/w/MediaWiki:Tooltips.js "MediaWiki:Tooltips.js")

On this Wiki, Tooltips is used in:

* {{[A](/w/Template:A "Template:A")}}
* {{[M](/w/Template:M "Template:M")}}
* {{[WF](/w/Template:WF "Template:WF")}}
* {{[Companion](/w/Template:Companion "Template:Companion")}}
* {{[Relic](/w/Template:Relic "Template:Relic")}}
* {{[Weapon](/w/Template:Weapon "Template:Weapon")}}
* {{[Arcane](/w/Template:Arcane "Template:Arcane")}}
* {{[D](/w/Template:D "Template:D")}}
* {{[Resource](/w/Template:Resource "Template:Resource")}}
* {{[Focus](/w/Template:Focus "Template:Focus")}}
* {{[Faction](/w/Template:Faction "Template:Faction")}}
* {{[Gear](/w/Template:Gear "Template:Gear")}}
* {{[Stat](/w/Template:Stat "Template:Stat")}}
* {{[E](/w/Template:E "Template:E")}}
* {{[Decree](/w/Template:Decree "Template:Decree")}}
* {{[Key](/w/Template:Key "Template:Key")}} ({{[Quest](/w/Template:Quest "Template:Quest")}} as alias)
* {{[Cosmetic](/w/Template:Cosmetic "Template:Cosmetic")}}

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Examples](#Examples)
* [3 How it works](#How_it_works)
* [4 Errors in usage](#Errors_in_usage)
* [5 Directory](#Directory)
* [6 Documentation](#Documentation)
  + [6.1 Package items](#Package_items)
* [7 See Also](#See_Also)
* [8 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Tooltip|function|input1|input2|...}}`

`{{#invoke:Tooltip|full|name|source|r=displayname}}` (`full` may be replaced with `icon` or `text`) (eg `{{#invoke:Tooltips|full|Vectis|Weapons}}`)

`{{#invoke:Tooltip|full|name|source|index|r=displayname|color=color|i=index_override|icon=Icon.png|l=link_o|n=name_o}}`

`{{#invoke:Tooltip|getTip|index|module|submodule}}` (eg `{{#invoke:Tooltips|getTip|Vectis|Weapons|Primary}}`)

## Examples

Tooltip spans will only work if they were already on the page when it loaded.

* [![](/images/thumb/HavenIcon%28xWhite%29.png/32px-HavenIcon%28xWhite%29.png?6e9e4)](/w/Haven "Haven") [Haven](/w/Haven "Haven")
* [![](/images/thumb/SerrationMod.png/22px-SerrationMod.png?0b8ff)](/w/Serration "Serration") [Serration](/w/Serration "Serration")
* [![](/images/thumb/Mirage_Thumb.png/32px-Mirage_Thumb.png?c6c07)](/w/Mirage "Mirage") [Mirage](/w/Mirage "Mirage")
* [![](/images/thumb/AdarzaKavat.png/32px-AdarzaKavat.png?c023b)](/w/Adarza_Kavat "Adarza Kavat") [Adarza Kavat](/w/Adarza_Kavat "Adarza Kavat")
* [![](/images/thumb/AxiRelicIntact.png/32px-AxiRelicIntact.png?6cadf)](/w/Axi_A1 "Axi A1") [Axi A1](/w/Axi_A1 "Axi A1")
* [![](/images/thumb/Vectis.png/32px-Vectis.png?403a3)](/w/Vectis "Vectis") [Vectis](/w/Vectis "Vectis")
* [![](/images/thumb/ArcaneEnergize.png/44px-ArcaneEnergize.png?cc86e)](/w/Arcane_Energize "Arcane Energize") [Arcane Energize](/w/Arcane_Energize "Arcane Energize")
* [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage"), [Flesh](/w/Flesh "Flesh"), [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")
* [![](/images/thumb/Auron.png/32px-Auron.png?24d35)](/w/Auron "Auron") [Auron](/w/Auron "Auron")
* [![](/images/thumb/FocusProtectiveSling%28xBlack%29.png/32px-FocusProtectiveSling%28xBlack%29.png?4b3f7)](/w/Focus/Vazarin#Protective_Sling "Focus/Vazarin") [Protective Sling](/w/Focus/Vazarin#Protective_Sling "Focus/Vazarin")
* [![](/images/thumb/IconGrineerOn%28xWhite%29.png/32px-IconGrineerOn%28xWhite%29.png?28616)](/w/Grineer "Grineer") [Grineer](/w/Grineer "Grineer")
* [![](/images/thumb/RequiemUltimatum.png/32px-RequiemUltimatum.png?1a391)](/w/Requiem_Ultimatum "Requiem Ultimatum") [Requiem Ultimatum](/w/Requiem_Ultimatum "Requiem Ultimatum")
* [![](/images/thumb/AbilityDurationBuff%28xWhite%29.png/32px-AbilityDurationBuff%28xWhite%29.png?d3e3b)](/w/Ability_Duration "Ability Duration") [Ability Duration](/w/Ability_Duration "Ability Duration")
* [![](/images/thumb/HeavyGunnerDE.png/32px-HeavyGunnerDE.png?aed28)](/w/Heavy_Gunner "Heavy Gunner") [Heavy Gunner](/w/Heavy_Gunner "Heavy Gunner")
* [![](/images/thumb/DecreeMoraleBoost.png/32px-DecreeMoraleBoost.png?86db2)](/w/Tactical_Repositioning "Tactical Repositioning") [Tactical Repositioning](/w/Tactical_Repositioning "Tactical Repositioning")
* [![](/images/thumb/ClanKey.png/32px-ClanKey.png?6f266)](/w/Clan_Key "Clan Key") [Clan Key](/w/Clan_Key "Clan Key")

## How it works

1. When you call a tooltip builder function (e.g. `Tooltips.full(itemName, moduleName, ...)`), it uses [Module:Tooltips/icon](/w/Module:Tooltips/icon "Module:Tooltips/icon") to get the item image and page link from a module's `/data` subpage and builds the basic HTML tooltip tags to put on wiki articles (`<span class="tooltip tooltip-text" data-param-name="..." data-param-source="...">...</span>`).
2. [MediaWiki:Gadget-Tooltips.js](/w/MediaWiki:Gadget-Tooltips.js "MediaWiki:Gadget-Tooltips.js") uses the tooltip span's `data-param-name` (item name) & `data-param-source` (source module basename) attributes to fetch the actual tooltip from [Module:Tooltips/tip](/w/Module:Tooltips/tip "Module:Tooltips/tip") (styled by [MediaWiki:Gadget-Tooltips.css](/w/MediaWiki:Gadget-Tooltips.css "MediaWiki:Gadget-Tooltips.css")).
   * For example, `<span class="tooltip tooltip-full" data-param-name="Artemis Bow" data-param-source="Weapons">...</span>` will display a [Template:Weapon](/w/Template:Weapon "Template:Weapon") tooltip of [Artemis Bow (Weapon)](/w/Artemis_Bow_(Weapon) "Artemis Bow (Weapon)") while `<span class="tooltip tooltip-full" data-param-name="Artemis Bow" data-param-source="Ability">...</span>` will display a [Template:A](/w/Template:A "Template:A") ("A" is a shorthand for abilities) tooltip of [Artemis Bow](/w/Artemis_Bow "Artemis Bow").
   * The processed wikitext for tooltips will be located in a div container on the bottom of articles with an id of `tooltip-storage`.
   * Data fetching uses MediaWiki's Action API.

## Errors in usage

If there are errors with using any tooltip template, these articles will be under the [Category:Pages with tooltip errors](/w/Category:Pages_with_tooltip_errors "Category:Pages with tooltip errors").

## Directory

* [Module:Tooltips](/w/Module:Tooltips "Module:Tooltips") - main/dispatch module, also handles tooltip text
  + [Module:Tooltips/tip](/w/Module:Tooltips/tip "Module:Tooltips/tip") - submodule for tooltip box (getTip)
  + [Module:Tooltips/icon](/w/Module:Tooltips/icon "Module:Tooltips/icon") - submodule that defines locations & icon style for supported modules

## Documentation

### Package items

`tooltips._getText(name, index, rep)` (function)
:   Returns formatted tooltip link text.
:   **Parameters**:

    * `name` Name of object entry to make a tooltip of (string)
    * `index` Tooltip index table (table)
    * `rep` Replacement args (table)
:   **Returns**: Wikitext link (string)

`tooltips._getIcon(_, index)` (function)
:   Returns tooltip icon.
:   **Parameters**:

    * `_` Ignore; unused variable (string)
    * `index` Tooltip index table (table)
:   **Returns**: Image wikilink or nil (string)

`tooltips.full(name, source, index)` (function)
:   Get the tooltip text and icon.
:   **Parameters**:

    * `name` Name of object entry to make a tooltip of (can also be used as index) (string)
    * `source` Name of module containing object entry (nil to check if a manual index is working) (string)
    * `index` Index entry from m:tt/icon, or data point from (source) if source is set (table)
      + - `frame.args.r` Replacement for displayed link text (nil,  *-> <name>) (string)*
        - `frame.args.color` Color replacement for displayed link text (e.g. '#ffffff') (string)
        - `frame.args.i` Index for data replacement (will also prevent data from loading) (string)
        - `frame.args.l` Link for data replacement (string)
        - `frame.args.n` Name for data replacement (string)
        - `frame.args.icon` Icon image name for data replacement (e.g. 'Ash.png') (string)
:   **Returns**: Tooltip  tags, icon, & link in wikitext (string)

`tooltips.text(name, ...)` (function)
:   Get the tooltip text with no icon.
:   **Parameters**:

    * `name` Name of object entry to make a tooltip of (string)
    * `...` see p.full (string)
:   **Returns**: Tooltip text in wikitext (string)

`tooltips.icon(name, ...)` (function)
:   Get the tooltip icon with no text.
:   **Parameters**:

    * `name` Name of object entry to make a tooltip of (string)
    * `...` see p.full (string)
:   **Returns**: Tooltip icon in wikitext (string)

`tooltips._getIndex(name, source)` (function)
:   Get the data index.
:   **Parameters**:

    * `name` Item name (string)
    * `source` Name of source module containing object entry (string)
:   **Returns**: index table (table)

`tooltips.getTip(name, source, partition)` (function)
:   Get the tooltip.
:   **Parameters**:

    * `name` Name of object entry to make a tooltip of (string)
    * `source` Name of source module containing object entry (string)
    * `partition` Name of submodule (string)
:   **Returns**: Tooltip (string)

`tooltips._source(source)` (function)
:   Returns a function that serves as a interface to tooltip builders. Another way of thinking about this function is to treat the entire module as a class. When you require(), the module, you are 'instantiating' a new instance of this class and pass in the name of the database to pull data from. Then you call a tooltip function and pass in a database entry name for the desired tooltip.
:   **Parameter**: `source` Name of source module containing object entry (string)
:   **Returns**: Wrapper function (function)

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

