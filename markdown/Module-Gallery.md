---
title: "Module:Gallery"
wiki_url: "https://wiki.warframe.com/w/Module/Gallery"
wiki_timestamp: "2025-01-31T22:30:55Z"
---

**Gallery** provides consistent formatting and a simplified interface for generating galleries of WARFRAME's content on the wiki. Generated galleries should always have a caption beneath images for accessibility.

Gallery can be invoked directly (`{{#invoke:Gallery|function|...}}`), invoked from a template (`{{template|function|...}}`), or used within other modules.

If you want to see the raw wikitext output from calling this module's functions, `{{#invoke:}}` this Module, on [Special:ExpandTemplates](/w/Special:ExpandTemplates "Special:ExpandTemplates").

On this Wiki, Gallery is used in:

* [Pages that `{{#invokes:}}` this module](https://wiki.warframe.com/w/Special:WhatLinksHere?hidelinks=1&target=Module%3AGallery&namespace=0)

## Contents

* [1 Galleries](#Galleries)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Galleries

```lua
{{#invoke:Gallery|buildModGallery|Amalgam Barrel Diffusion|Barrel Diffusion|Primed Continuity|Scorch|Hunter's Bonesaw}}
```

View List▾▾

**Lua error at line 46: data for mw.loadData contains a table with a metatable.**

---

```lua
{{#invoke:Gallery|buildWeaponGallery|Opticor Vandal|Opticor|MK1-Kunai|Dual Heat Swords|Exalted Blade}}
```

View List▾▾

**Lua error at line 46: data for mw.loadData contains a table with a metatable.**

## Documentation

### Package items

`gallery.buildModGallery(frame)` (function)
:   Builds a gallery that displays mods.
:   **Parameter**: `frame` The input arguments, each param represents a mod that is to be displayed in a gallery format; assumes parameters passed in are valid mod names and exist in M:Mods/data (table)
:   **Returns**: Gallery result in wikitext (string)

`gallery.buildWeaponGallery(frame)` (function)
:   Builds a gallery that displays weapons.
:   **Parameter**: `frame` The input arguments, each param represents a mod that is to be displayed in a gallery format; assumes parameters passed in are valid weapon names and exist in M:Weapons/data (table)
:   **Returns**: Gallery result in wikitext (string)

`gallery.buildGallery(frame)` (function)
:   Builds a generalized gallery that displays many different WARFRAME items.
:   **Parameter**: `frame` The input arguments of WARFRAME items to display (table)
:   **Returns**: (string} Gallery result in wikitext

`gallery.buildCosmeticGallery(frame)` (function)
:   Builds a gallery for a non-TennoGen cosmetics.
:   **Parameter**: `frame` (string)
:   **Returns**: Gallery of a specific cosmetic type in wikitext (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Gallery/doc](/w/Module:Gallery/doc "Module:Gallery/doc")
* [Gallery/testcases](/w/Module:Gallery/testcases "Module:Gallery/testcases")
* [Gallery/testcases/doc](/w/Module:Gallery/testcases/doc "Module:Gallery/testcases/doc")

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
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • M:Gallery • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
--- '''Gallery''' provides consistent formatting and a simplified interface for
--  generating galleries of WARFRAME's content on the wiki. Generated galleries 
--  should always have a caption beneath images for accessibility.
--  
--  Gallery can be invoked directly (`{{#invoke:Gallery|function|...}}`), 
--  invoked from a template (`{{template|function|...}}`), or used
--  within other modules.
--  
--  If you want to see the raw wikitext output from calling this module's functions,
--	`{{#invoke:}}` this Module, on [[Special:ExpandTemplates]].
--  
--	On this Wiki, Gallery is used in:
--	* [https://wiki.warframe.com/w/Special:WhatLinksHere?hidelinks=1⌖=Module%3AGallery&namespace=0 Pages that `{{#invokes:}}` this module]
--	
--  @module		gallery
--  @alias		p
--  @author		
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gat235|Gat235]]
--  @image		
--  @require	[[Module:Mods/data]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:TennoGen/data]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Shared]]
--  @release	unmaintained
--  

-- TODO: Put this project on hold b/c I think it will cause more issues than it solves
-- regarding Lua memory usage for our scripts. In other words, we will NOT be replacing
-- all gallery tags with this module. The main thing we should do is to standardize
-- the file names of media uploaded to the wiki and always replace existing file rather
-- than create a new file if something is outdated. - 2021-06-15 [[User:Cephalon Scientia]]

-- TODO: Explore the idea of using DPL queries on specific categories to generate a list of items
-- with a specific property and use that to auto-generate galleries similar to 
-- https://genshin-impact.fandom.com/wiki/Template:Artifacts_by_Category_Table but also using modules
local p = {}

local Weapon = require [[Module:Weapons]]
local Tooltip = require [[Module:Tooltips]]
local Shared = require [[Module:Shared]]

local ModData = mw.loadData [[Module:Mods/data]] ['Mods']
local WeaponData = mw.loadData [[Module:Weapons/data]]
local WarframeData = mw.loadData [[Module:Warframes/data]]
local TennoGenData = mw.loadData [[Module:TennoGen/data]]

p.DEFAULT_GALLERY_PARAMS = 'captionposition="below" captionalign="center"'..
	'hideaddbutton="true" spacing="small" position="center" bordersize="none"'..
	'bordercolor="#FFFFFF" navigation="true"'

-- TODO: Should this module only contain an exported constant DEFAULT_GALLERY_PARAMS
-- to standardize the styling of all galleries made in other modules? In other words,
-- should buildGallery() functions be moved to the appropriate module instead? There
-- is really nothing unique about this module that the functions require other than
-- the constant that standardizes gallery formats.

---	Builds a gallery that displays mods.
--	@function		p.buildModGallery
--	@param			{table} frame The input arguments, each param represents 
--							a mod that is to be displayed in a gallery format; assumes 
--							parameters passed in are valid mod names and exist in M:Mods/data
--	@return			{string} Gallery result in wikitext
function p.buildModGallery(frame)
    local gallery = {''}
    
    -- TODO: edit functionality of ipairs so it traverses in alphabetical order
    for _, modName in ipairs(frame.args or frame) do
        local modTable = ModData[modName]
        table.insert(gallery, table.concat({
        	'\n', modTable.Image, '|', 
    		Tooltip.getFullTooltip({ args={ modName, 'Mods' } }), '|link=', modTable.Link or modTable.Name
        })
        )
    end
    table.insert(gallery, '\n')
    
	gallery = table.concat(gallery)
    -- preprocess() needed to properly process gallery tags in string for display
    -- on the wiki
    gallery = frame:preprocess(gallery)
    return gallery
end

---	Builds a gallery that displays weapons.
--	@function		p.buildWeaponGallery
--	@param			{table} frame The input arguments, each param represents 
--							a mod that is to be displayed in a gallery format; assumes 
--							parameters passed in are valid weapon names and exist in M:Weapons/data
--	@return			{string} Gallery result in wikitext
function p.buildWeaponGallery(frame)
	local gallery = {''}
	
    for _, weaponName in ipairs(frame.args or frame) do
        local weaponTable = Weapon._getWeapon(weaponName)
        table.insert(gallery, table.concat({
        	'\n', weaponTable.Image, '|', 
    		Tooltip.getFullTooltip( { args={ weaponName, 'Weapons' } } ), '|link=', weaponTable.Link or weaponTable.Name
        }))
    end
    table.insert(gallery, '\n')
    
	gallery = table.concat(gallery)
	return frame:preprocess(gallery)
end

---	Builds a generalized gallery that displays many different WARFRAME items.
--	@function		p.buildGallery
--	@param			{table} frame The input arguments of WARFRAME items to display
--	@return			(string} Gallery result in wikitext
function p.buildGallery(frame)
	assert(frame.args ~= nil, 'p.buildGallery(): no input arguments')
	
	local gallery = {''}
	
	-- TODO: Implement logic for generating a generalized gallery, must support
	-- both weapons, mods, enemies, and more by name only
	
	-- Issue arises where there are multiple items with the same name but in 
	-- different /data e.g. Exalted Blade weapon vs the stance mod
	for _, itemName in ipairs(frame.args) do
		local image = Tooltip.getImage( { args={ itemName } } )	-- [[File:ExcaliburIcon272.png|19px|link=Excalibur]]
		image = string.match(image, 'File:(.+.png)')	-- hacky way of getting image file name
		local tooltip = Tooltip.getFullTooltip( { args={ itemName } } )
		
		table.insert(gallery, ("%s|link=%s|%s"):format(
	                image,
	                itemName,
	                tooltip)
	            )
    end
	table.insert(gallery, '')
	
	gallery = table.concat(gallery, '\n')
	return frame:preprocess(gallery)
end

---	Builds a gallery for a non-TennoGen cosmetics.
--	@function		p.buildCosmeticGallery
--	@param			{string} frame 
--	@return			{string} Gallery of a specific cosmetic type in wikitext
function p.buildCosmeticGallery(frame)
	local cosmeticType = frame.args[1]
	local gallery = {''}
	
	table.insert(gallery, '\n')
	gallery = table.concat(gallery)
	return frame:preprocess(gallery)
end

return p
```

