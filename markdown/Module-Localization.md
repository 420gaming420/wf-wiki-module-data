---
title: "Module:Localization"
wiki_url: "https://wiki.warframe.com/w/Module/Localization"
wiki_timestamp: "2026-01-19T21:45:15Z"
---

**Localization** retrieves and stores [WARFRAME](/w/WARFRAME "WARFRAME")'s localized messages as found in [Public Export](/w/Public_Export "Public Export").

## Contents

* [1 Usage](#Usage)
  + [1.1 Module](#Module)
* [2 Localization Details](#Localization_Details)
* [3 Documentation](#Documentation)
  + [3.1 Package items](#Package_items)
* [4 See Also](#See_Also)
* [5 Code](#Code)

## Usage

### Module

```lua
local Localization = require('Module:Localization')

local function func(input)
    return Localization._getLocalizationMessages(fileName, messagePath)
end
```

## Localization Details

WARFRAME's localization messages are in the form of a file path, usually starting with "/Lotus/Language/". As of [Update 41.0](/w/Update_41#Update_41.0 "Update 41") (2025-12-10), these are the third-level directories:

* 1999
* 1999Bounties
* 1999Challenges
* 1999Coda
* 1999Demo
* 1999Echoes
* 1999PvPvE - [Faceoff](/w/Faceoff "Faceoff")
* 1999Quest - [The Hex (Quest)](/w/The_Hex_(Quest) "The Hex (Quest)")
* Alchemy - [Alchemy](/w/Alchemy "Alchemy")
* Alerts
* Apostasy - [Apostasy Prologue](/w/Apostasy_Prologue "Apostasy Prologue")
* Arcanes - [Arcane Enhancement](/w/Arcane_Enhancement "Arcane Enhancement")
* Archive
* Armour
* BardQuest - [Octavia's Anthem](/w/Octavia%27s_Anthem "Octavia's Anthem")
* BaroTreasureBox
* Blessings
* Boosters
* Bosses - [Bosses](/w/Bosses "Bosses")
* Bundles
* CapturaScenes - [Captura](/w/Captura "Captura")
* Challenges
* Champions - [Rathuum](/w/Rathuum "Rathuum")
* Changyou - [WARFRAME (China)](/w/WARFRAME_(China) "WARFRAME (China)")
* Chimera - [Chimera Prologue](/w/Chimera_Prologue "Chimera Prologue")
* CircleOfHell - [The Descendia](/w/The_Descendia "The Descendia")
* CitrinesLastWish
* ClanTech - [Research](/w/Research "Research")
* Codex - [Codex](/w/Codex "Codex")
* CommunityMessages
* Consumables
* CorpusGasCity - [Corpus Gas City](/w/Corpus_Gas_City "Corpus Gas City")
* CorpusRailjack
* Cosmetics
* CraftingComponents
* CrewShip - [Railjack](/w/Railjack "Railjack")
* Currency
* DagathUpdate - [Abyss of Dagath](/w/Abyss_of_Dagath "Abyss of Dagath")
* DanteUnbound - [Dante Unbound](/w/Dante_Unbound "Dante Unbound")
* DeadlockProtocol - [The Deadlock Protocol](/w/The_Deadlock_Protocol "The Deadlock Protocol")
* Deluxe - [Deluxe Skins](/w/Deluxe_Skins "Deluxe Skins")
* DisruptionMission - [Disruption](/w/Disruption "Disruption")
* Dojo - [Clan Dojo](/w/Clan_Dojo "Clan Dojo")
* DojoDecos1999
* DojoDecosCorpus
* DojoDecosDuviri
* DojoDecosFestive
* DojoDecosGrineer
* DojoDecosInfested
* DojoDecosNpcs
* DojoDecosOrokin
* DojoDecosOstron
* DojoDecosSolaris
* DojoDecosTenno
* DojoDecosZariman
* DojoPaints - [Pigment](/w/Pigment "Pigment") and [Backdrop](/w/Backdrop "Backdrop")
* Duviri - [Duviri](/w/Duviri "Duviri")
* EidolonPlains - [Plains of Eidolon](/w/Plains_of_Eidolon "Plains of Eidolon")
* Emotes - [Emotes](/w/Emotes "Emotes")
* Enemies
* EnemyLeaders - [Prosecutor](/w/Prosecutor "Prosecutor")
* Entrati - [Entrati](/w/Entrati "Entrati")
* EntratiLab - [Albrecht's Laboratories](/w/Albrecht%27s_Laboratories "Albrecht's Laboratories")
* Ephemera - [Ephemera](/w/Ephemera "Ephemera")
* Episodes - [Nightwave](/w/Nightwave "Nightwave")
* Equipment
* Events - [Event](/w/Event "Event")
* Fish - [Fishing](/w/Fishing "Fishing")
* FiveFates - [Koumei and the Five Fates](/w/Koumei_and_the_Five_Fates "Koumei and the Five Fates")
* Focus - [Focus](/w/Focus "Focus")
* Fragments - [Fragments](/w/Fragments "Fragments")
* G1Quests - 1st Generation of [Quest](/w/Quest "Quest")
* G1Taunts
* Game
* GameModes
* Gems - [Mining](/w/Mining "Mining")
* Gifts
* GlassQuest - [Saya's Vigil](/w/Saya%27s_Vigil "Saya's Vigil")
* Glyphs - [Glyph](/w/Glyph "Glyph")
* Heirloom - [Heirloom Skins](/w/Heirloom_Skins "Heirloom Skins")
* HolsterCustomizations
* Horse - [Kaithe](/w/Kaithe "Kaithe")
* Hoverboards - [K-Drive](/w/K-Drive "K-Drive")
* Inbox
* InfestedBand - [Technocyte Coda](/w/Technocyte_Coda "Technocyte Coda")
* InfestedMicroplanet - [Deimos](/w/Deimos "Deimos")
* InfestedMicroplanetQuest - [Heart of Deimos](/w/Heart_of_Deimos "Heart of Deimos")
* Intrinsics - [Intrinsics](/w/Intrinsics "Intrinsics")
* Isleweaver - [Isleweaver](/w/Isleweaver "Isleweaver")
* ItemDescription
* Items
* JadeShadows - [Jade Shadows](/w/Jade_Shadows "Jade Shadows")
* JunctionReworkChallenges - [Junction](/w/Junction "Junction")
* KahlQuest - [Veilbreaker](/w/Veilbreaker "Veilbreaker")
* Kingpins - [Adversary System](/w/Adversary_System "Adversary System")
* LastWish - [Citrine's Last Wish](/w/Citrine%27s_Last_Wish "Citrine's Last Wish")
* Locations - [Star Chart](/w/Star_Chart "Star Chart")
* LotusEaters - [The Lotus Eaters](/w/The_Lotus_Eaters "The Lotus Eaters")
* Marketing
* Menu
* Messages
* Missions
* ModQuest - [The Teacher](/w/The_Teacher "The Teacher")
* Mods - [Mod](/w/Mod "Mod")
* Narmer - [Narmer](/w/Narmer "Narmer")
* Necromech - [Necramech](/w/Necramech "Necramech")
* NewPlayerQuest - [Awakening](/w/Awakening "Awakening")
* NewWar - [The New War](/w/The_New_War "The New War")
* NewWarIntro
* Ngen - 8th Generation Console Skins
* NightwaveChallenges
* NightwaveSeasonThree
* NokkoColony - [The Vallis Undermind](/w/The_Vallis_Undermind "The Vallis Undermind")
* Npcs
* Objectives
* Objects
* OldPeace - [The Old Peace](/w/The_Old_Peace "The Old Peace")
* Omega - [Riven Mods](/w/Riven_Mods "Riven Mods")
* Onslaught - [Sanctuary Onslaught](/w/Sanctuary_Onslaught "Sanctuary Onslaught")
* Operator - [Operator](/w/Operator "Operator")
* Oraxia - [Oraxia](/w/Oraxia "Oraxia")
* OstronCrafting - [Amp](/w/Amp "Amp"), [Zaw](/w/Zaw "Zaw")
* OstronJobs - [Cetus Bounty](/w/Cetus_Bounty "Cetus Bounty")
* PersonalQuarters
* Pets - [Companion](/w/Companion "Companion")
* Plants
* PrimePacks - [Prime Vault](/w/Prime_Vault "Prime Vault")
* Primes
* PrimeStore - [Prime Resurgence](/w/Prime_Resurgence "Prime Resurgence")
* Props
* Quests - [Quest](/w/Quest "Quest")
* Railjack - [Empyrean](/w/Empyrean "Empyrean")
* RelayReconstruction - [The Pyrus Project](/w/The_Pyrus_Project "The Pyrus Project")
* Relics - [Void Relic](/w/Void_Relic "Void Relic")
* Resources - [Resources](/w/Resources "Resources")
* RevenantQuest - [Mask of the Revenant](/w/Mask_of_the_Revenant "Mask of the Revenant")
* Sacrifice - [The Sacrifice](/w/The_Sacrifice "The Sacrifice")
* Scans - [Codex](/w/Codex "Codex")
* Seasonal
* ShipDecorations - [Orbiter Decorations](/w/Orbiter_Decorations "Orbiter Decorations")
* ShipFeatureItems
* Sigils - [Sigils](/w/Sigils "Sigils")
* Skins
* SolarisJobs - [Fortuna Bounties](/w/Fortuna_Bounties "Fortuna Bounties")
* SolarisQuest - [Vox Solaris (Quest)](/w/Vox_Solaris_(Quest) "Vox Solaris (Quest)")
* SolarisVenus - [Orb Vallis](/w/Orb_Vallis "Orb Vallis")
* SquadLink - [Operation: Orphix Venom](/w/Operation:_Orphix_Venom "Operation: Orphix Venom")
* SteamWorkshop - [TennoGen](/w/TennoGen "TennoGen")
* Stickers
* Subtitles
* Suits - [Warframes](/w/Warframes "Warframes") and Warframe [Abilities](/w/Abilities "Abilities")
* Syandanas - [Syandana](/w/Syandana "Syandana")
* SyndicateRewards
* Syndicates - [Syndicate](/w/Syndicate "Syndicate")
* Synthetics
* Tarot - [Prex](/w/Prex "Prex")
* TauPrequel - [The Old Peace](/w/The_Old_Peace "The Old Peace")
* Titles - [Honoria](/w/Honoria "Honoria")
* Tokens - [Granum Crown](/w/Granum_Crown "Granum Crown")
* UIStyle
* UnrealTournament - [Unreal Tournament Skins](/w/Unreal_Tournament_Skins?action=edit&redlink=1 "Unreal Tournament Skins (page does not exist)")
* Upgrades
* Veilbreaker - [Veilbreaker](/w/Veilbreaker "Veilbreaker")
* VoidEclipse - [Zariman Ten Zero](/w/Zariman_Ten_Zero "Zariman Ten Zero")
* WarframeCrafting
* Weapons - [Weapons](/w/Weapons "Weapons")
* WraithQuest - [Call of the Tempestarii](/w/Call_of_the_Tempestarii "Call of the Tempestarii")
* YareliQuest - [Waverider](/w/Waverider "Waverider")
* Zariman - [Zariman](/w/Zariman "Zariman") and [Incarnon](/w/Incarnon "Incarnon")
* ZarimanApartment - [Dormizone](/w/Dormizone "Dormizone")
* ZarimanQuest - [Angels of the Zariman](/w/Angels_of_the_Zariman "Angels of the Zariman")

## Documentation

### Package items

`localization._getLocalizationMessages(fileName, messagePath)` (function)
:   Returns the table of localized messages of a particular message path.
:   **Parameters**:

    * `fileName` Name of subpage as stored on the wiki (e.g. "Suits.json" for [Module:Localization/Suits.json](/w/Module:Localization/Suits.json "Module:Localization/Suits.json")) (string)
    * `messagePath` Name of key for associated messages (string)
:   **Returns**: Table of localized messages using WARFRAME's language codes (table)

`localization._getLocaleStringByPath(locale, pathName)` (function)
:   Returns associated localized message for a specific locale. For internal module use.
:   **Parameters**:

    * `locale` Supported WARFRAME locale, see [Localization](/w/Localization "Localization") for details (string)
    * `pathName` Path of localization message (string)
:   **Returns**: Localized string (string)

`localization._getLocaleStringByPath(frame)` (function)
:   Returns associated localized message for a specific locale.
:   **Parameter**: `frame` Frame object; contains the localization path and the locale to find the translation for (object)
:   **Returns**: Localized string (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Localization/Suits.json](/w/Module:Localization/Suits.json "Module:Localization/Suits.json")
* [Localization/doc](/w/Module:Localization/doc "Module:Localization/doc")

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

---

```lua
---	'''Localization''' retrieves and stores [[WARFRAME]]'s localized messages as found in [[Public Export]].  

--	
--	@module		localization
--	@alias		p
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@release	stable
--	

local p = {}

local SUPPORTED_FILES = {
	["Suits.json"] = true,
}

--- Returns the table of localized messages of a particular message path.
--  @function       p._getLocalizationMessages
--  @param          {string} fileName Name of subpage as stored on the wiki (e.g. "Suits.json" for [[Module:Localization/Suits.json]])
--  @param          {string} messagePath Name of key for associated messages
--  @return         {table} Table of localized messages using WARFRAME's language codes
function p._getLocalizationMessages(fileName, messagePath)
	jsonAsLuaTable = mw.loadJsonData("Module:Localization/" .. fileName)
	
	return jsonAsLuaTable[messagePath]
end

--- Returns associated localized message for a specific locale. For internal module use.
--  @function       p._getLocaleStringByPath
--  @param          {string} locale Supported WARFRAME locale, see [[Localization]] for details
--	@param			{string} pathName Path of localization message
--  @return         {string} Localized string
function p._getLocaleStringByPath(locale, pathName)
	local localizedStr = nil
	for fileName, _ in pairs(SUPPORTED_FILES) do
		-- Need to encode b/c sometimes item descriptions have special markup that may intefere with wikitext parser (e.g. Warframe passives)
		localizedStr = mw.text.encode(p._getLocalizationMessages(fileName, pathName)[locale])
		localizedStr = localizedStr:gsub("|", "|")	-- mw.text.encode doesn't apply to vertical bars
		if localizedStr ~= nil then
			break
		end
	end
	if localizedStr == nil then
		return error('M:Localization._getLocaleStringByPath(): Cannot find associated ' .. locale .. ' locale string for "' .. pathName '".')	
	end
	return localizedStr
end

--- Returns associated localized message for a specific locale.
--  @function       p._getLocaleStringByPath
--  @param          {object} frame Frame object; contains the localization path and the locale to find the translation for
--  @return         {string} Localized string
function p.getLocaleStringByPath(frame)
	local pathName = frame.args["path"]
	local locale = frame.args["locale"]
	return p._getLocaleStringByPath(locale, pathName)
end

return p
```

