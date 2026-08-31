---
title: "Module:Codec/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Codec/doc"
wiki_timestamp: "2022-04-07T22:41:49Z"
---

**Codec** is a library for (de)compression algorithms implemented in pure Lua. Originally created for World of Warcraft as LibCompress.lua, the library has been ported to be used on MediaWiki-based wikis.

Authors: jjsheets and Galmok of European Stormrage (Horde) Email : [[email protected]](/cdn-cgi/l/email-protection) and [[email protected]](/cdn-cgi/l/email-protection) Licence: GPL version 2 (General Public License) Revision: $Revision: 83 $ Date: $Date: 2018-07-03 14:33:48 +0000 (Tue, 03 Jul 2018) $

## Contents

* [1 Source](#Source)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Source

For more documentation and original source see <https://www.wowace.com/projects/libcompress>

## Documentation

### Package items

`LibCompress:CompressLZW(uncompressed)` (function)
:   Compresses a string using LZW algorithm. Unless the uncompressed string starts with "\002", this is guaranteed to return a string equal to or smaller than the passed string. the returned string will only contain "\000" characters in rare circumstances, and will contain none if the source string has none.
:   **Parameter**: `uncompressed` Raw string to be compressed using LZW algorithm (string)
:   **Returns**: compressed string if the resultant string is smaller than the original input, otherwise returns the original input since compression does not result in smaller size (string)

`LibCompress:DecompressLZW(compressed)` (function)
:   Decompresses a string using LZW algorithm. If the passed string is a compressed string, this will decompress it and return the decompressed string. Otherwise it return an error message Compressed strings are marked by beginning with "\002"
:   **Parameter**: `compressed` LZW compressed string to be decompressed (string)
:   **Returns**: uncompressed result (string)

`LibCompress:CompressHuffman(uncompressed)` (function)
:   Compresses a string using Huffman coding algorithm. Word size for this huffman algorithm is 8 bits (1 byte). This means the best compression is representing 1 byte with 1 bit, i.e. compress to 0.125 of original size.
:   **Parameter**: `uncompressed` Raw string to be compressed using Huffman coding algorithm (string)
:   **Returns**: compressed string if the resultant string is smaller than the original input, otherwise returns the original input since compression does not result in smaller size (string)

`LibCompress:DecompressHuffman(compressed)` (function)
:   Decompresses a string using Huffman coding algorithm.
:   **Parameter**: `compressed` Huffman compressed string to be decompressed (string)
:   **Returns**: uncompressed result (string)

`LibCompress:Store(uncompressed)` (function)
:   Prepends "\001" to uncompressed string to mark as uncompressed.
:   **Parameter**: `uncompressed` Raw uncompressed string (string)
:   **Returns**: Uncompressed string prepended with "\001" (string)

`LibCompress:DecompressUncompressed(data)` (function)
:   Returns uncompressed string without prepended codec (e. g. "\001" or "\003").
:   **Parameter**: `data` Raw uncompressed string (string)
:   **Returns**: Uncompressed string without prepended codec (string)

`LibCompress:Compress(data)` (function)
:   Generic method that tries all compression codecs (LZW and Huffman) and return the best result.
:   **Parameter**: `data` Raw uncompressed string (string)
:   **Returns**: compressed string if the resultant string is smaller than the original input, otherwise returns the original input since compression does not result in smaller size (string)

`LibCompress:Decompress(data)` (function)
:   Generic method to decompress either a LZW or Huffman compressed string.
:   **Parameter**: `data` LZW or Huffman compressed string to be decompressed (string)
:   **Returns**: uncompressed result (string)

`LibCompress:GetEncodeTable(reservedChar, escapeChars, mapChars)` (function)
:   Builds an encoding table.
:   **Parameters**:

    * `reservedChar` String of reserved characters with no spaces between each unique character (string)
    * `escapeChars` String of escape characters with no spaces between each unique character (string)
    * `mapChars` Sting of characters with no spaces between each unique character; used for encoding reserved characters (string)
:   **Returns**: Encoding table (table)

`LibCompress:GetAddonEncodeTable(reservedChar, escapeChars, mapChars)` (function)
:   Addons: Call this only once and reuse the returned table for all encodings/decodings.
:   **Parameters**:

    * `reservedChar` String of reserved characters with no spaces between each unique character (string)
    * `escapeChars` String of escape characters with no spaces between each unique character (string)
    * `mapChars` Sting of characters with no spaces between each unique character; used for encoding reserved characters (string)
:   **Returns**: Encoding table (table)

`LibCompress:GetChatEncodeTable(reservedChar, escapeChars, mapChars)` (function)
:   Addons: Call this only once and reuse the returned table for all encodings/decodings.
:   **Parameters**:

    * `reservedChar` String of reserved characters with no spaces between each unique character (string)
    * `escapeChars` String of escape characters with no spaces between each unique character (string)
    * `mapChars` Sting of characters with no spaces between each unique character; used for encoding other characters (string)
:   **Returns**: Encoding table (table)

`LibCompress:Encode7bit(str)` (function)
:   Encodes data using values from 0 to 127 inclusive.
:   **Parameter**: `str` String to be encoded (string)
:   **Returns**: Encoded data using 7 bits (string)

`LibCompress:Decode7bit(str)` (function)
:   Decodes data that has only values from 0 to 127 inclusive.
:   **Parameter**: `str` String to be decoded (string)
:   **Returns**: Decoded data (string)

`LibCompress:fcs16init()` (function)
:   Initializes FCS-16 checksum/hash.
:   **Returns**: Value for an unsigned 16 bit integer that has all bits set (number)

`LibCompress:fcs16update(uFcs16, pBuffer)` (function)
:   Updates FCS-16 checksum/hash.
:   **Parameters**:

    * `uFcs16` FCS-16 checksum/hash (number)
    * `pBuffer` Data input (string)
:   **Returns**: Resultant checksum/hash (number)

`LibCompress:fcs16final(uFcs16)` (function)
:   Performs the final bitwise XOR operation for FCS-16 checksum/hash.
:   **Parameter**: `uFcs16` FCS-16 checksum/hash (number)
:   **Returns**: Resultant checksum/hash (number)

`LibCompress:FCS16(...)` (function)
:   Creates a FCS-16 checksum/hash based on input data.
:   **Parameter**: `...` Input data (string)
:   **Returns**: Resultant checksum/hash (number)

`LibCompress:fcs16init()` (function)
:   Initializes FCS-32 checksum/hash.
:   **Returns**: Value for a signed 32 bit integer that has all bits set (number)

`LibCompress:fcs32update(uFcs32, pBuffer)` (function)
:   Updates FCS-32 checksum/hash.
:   **Parameters**:

    * `uFcs32` FCS-32 checksum/hash (number)
    * `pBuffer` Data input (string)
:   **Returns**: Resultant checksum/hash (number)

`LibCompress:fcs32final(uFcs32)` (function)
:   Performs the final bitwise NOT operation for FCS-32 checksum/hash.
:   **Parameter**: `uFcs32` FCS-32 checksum/hash (number)
:   **Returns**: Resultant checksum/hash (number)

`LibCompress:FCS32(...)` (function)
:   Creates a FCS-32 checksum/hash based on input data.
:   **Parameter**: `...` Input data (string)
:   **Returns**: Resultant checksum/hash (number)

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

