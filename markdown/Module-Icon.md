---
title: "Module:Icon"
wiki_url: "https://wiki.warframe.com/w/Module/Icon"
wiki_timestamp: "2025-05-18T02:33:14Z"
---

**Icon** returns the in-game icon of a particular item.

On this Wiki, Icon is used in:

* [Module:DropTables](/w/Module:DropTables "Module:DropTables")
* [Template:Icon](/w/Template:Icon "Template:Icon")

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
  + [1.2 Module](#Module)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
  + [2.2 Other items](#Other_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Template

In template: `{{#invoke:Icon|function|input1|input2|...}}`  
In articles: `{{Icon|Type|input1|input2|...}}`

### Module

```lua
local p = {}
local Icon = require('Module:Icon')

local function func(iconname, textexist, imagesize)
    return Icon._Item(iconname, textexist, imagesize)
end
```

## Documentation

### Package items

### Other items

`Item(iconname, textexist, imagesize)` (function)
:   Returns the icon for an item.
:   **Parameters**:

    * `iconname` Item name (string)
    * `textexist` If set to 'Text' or 'text', text is added after icon (string; optional)
    * `imagesize` Image size, defaults to 'x26' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`_Item(iconname, textexist, imagesize)` (function)
:   Returns the icon for an item.
:   **Parameters**:

    * `iconname` Item name (string)
    * `textexist` If set to 'Text' or 'text', text is added after icon (string; optional)
    * `imagesize` Image size, defaults to 'x26' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`HUD(iconname, textexist, imagesize)` (function)
:   Returns the icon for a HUD element.
:   **Parameters**:

    * `iconname` HUD element name (string)
    * `textexist` If set to 'Text' or 'text', text is added after icon (string; optional)
    * `imagesize` Image size, defaults to 'x20' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`Flag(iconname, tooltip, dest, textexist)` (function)
:   Returns the icon for a real-world country flag.
:   **Parameters**:

    * `iconname` HUD element name (string)
    * `tooltip` If set to 'Text' or 'text', text is added after icon (string)
    * `dest` Name of a destination article for linking purposes (string)
    * `textexist` If set to 'Text' or 'text', text is added after icon (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`Buff(iconname, textexist, imagesize)` (function)
:   Returns the icon for a HUD buff or debuff.
:   **Parameters**:

    * `iconname` Buff name (string)
    * `textexist` If set to 'Text' or 'text', text is added after icon (string; optional)
    * `imagesize` Image size, defaults to 'x40' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`Clan(iconname, imagesize)` (function)
:   Returns the icon for a Clan tier.
:   **Parameters**:

    * `iconname` Clan tier name (string)
    * `imagesize` Image size, defaults to 'x26' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

`_Clan(iconname, imagesize)` (function)
:   Returns the icon for a Clan tier.
:   **Parameters**:

    * `iconname` Clan tier name (string)
    * `imagesize` Image size, defaults to 'x26' (string; optional)
:   **Returns**: The icon's image in wikitext (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Icon/data](/w/Module:Icon/data "Module:Icon/data")
* [Icon/data/doc](/w/Module:Icon/data/doc "Module:Icon/data/doc")
* [Icon/doc](/w/Module:Icon/doc "Module:Icon/doc")
* [Icon/testcases](/w/Module:Icon/testcases "Module:Icon/testcases")
* [Icon/testcases/doc](/w/Module:Icon/testcases/doc "Module:Icon/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • M:Icon ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
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
--- '''Icon''' returns the in-game icon of a particular item.  

--	
--	On this Wiki, Icon is used in:
--	* [[Module:DropTables]]
--	* [[Template:Icon]]
--	
--	@module	 icon
--	@alias		p
--	@author	 [[User:ChickenBar|ChickenBar]]
--	@attribution	[[User:94Connor949|94Connor949]]
--	@attribution	[[User:Hayframe|Hayframe]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Rngd444|Rngd444]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:Icon/data]]
--	@release	stable
--	

local p = {}

local IconData = mw.loadData [[Module:Icon/data]]
local Tooltips= require [[Module:Tooltips]]

-- TODO: Lots of the functions share similar code when grabbing arguments from the frame and building the icon's wikitext.
-- Refactor this functionality into a single function.

--- Returns the icon for an item.
--	@function		 Item
--	@param			{string} iconname Item name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p.Item(frame)
	local iconname = frame.args[1]
	local textexist = frame.args[2]
	local imagesize = frame.args.imgsize

	return p._Item(iconname, textexist, imagesize)
end

--- Returns the icon for an item.
--	@function		 _Item
--	@param			{string} iconname Item name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p._Item(iconname, textexist, imagesize)
	if iconname=='' or not iconname then error 'No icon name' end
	if (tonumber(imagesize) or 0) <= 32 then
		local success, ttt = pcall(Tooltips['icon'..string.lower(textexist or '')], iconname, 'Resources')
		if success and not ttt:find 'error' then
			return ttt
		end
		mw.log(ttt)
	end
	iconname = string.gsub(" "..string.lower( iconname ), "%W%l", string.upper):sub(2)
	local itemData = IconData["Items"][iconname]
	assert(itemData ~= nil, 
		'p._Item(iconname, textexist, imagesize): Invalid icon name "'..(iconname or '')
		..'" (do you need to update [[Module:Icon/data]] or [[Module:Resources/data]]?) [[Category:Icon Module error]]')
	
	local link = itemData["Link"]
    local title = itemData["Name"]
    local image = itemData["Image"]
    local cssClasses = itemData["CssClasses"]
	if (imagesize == nil or imagesize == '') then
		imagesize = 'x26'
	end

	local imgText = '[[File:'..image..'|'..imagesize..'px'
	if(link ~= nil) then
		imgText = imgText..'|link='..link
	end
	if(cssClasses ~= nil) then
		imgText = imgText..'|class=icon '..cssClasses
	end
	if(title ~= nil) then
		imgText = imgText..'|'..title
	end
	imgText = imgText..']]'

	if (textexist == 'text' or textexist == 'Text') then
		if (link ~= nil) then
			if (title ~= nil) then
				return imgText..' [['..link..'|'..title..']]'
			else
				return imgText..' [['..link..']]'
			end
		elseif (title ~= nil) then
			return imgText..' '..title
		else
			return imgText
		end
	end
	return imgText
end

--- Returns the icon for a HUD element.
--	@function		 HUD
--	@param			{string} iconname HUD element name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x20'
--	@return		 {string} The icon's image in wikitext
function p.HUD(frame)
	local iconname = frame.args[1]
	local textexist = frame.args[2]

	local imagesize = frame.args.imgsize
	local link = ''
	if IconData["Heads-Up Display"][iconname] == nil then
		return '[['..iconname..']]'
	end
	
	link = IconData["Heads-Up Display"][iconname]["Link"]
	iconname = IconData["Heads-Up Display"][iconname]["Image"]

	if (imagesize == nil or imagesize == '') then
		imagesize = 'x20'
	end
	if (textexist == 'text' or textexist == 'Text') then
		return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display|class=icon dark-invert]] [[Heads-Up Display|'..link..']]'
	end
	return '[[File:'..iconname..'|'..imagesize..'px|link=Heads-Up Display|class=icon dark-invert]]'
end

--- Returns the icon for a real-world country flag.
--	@function		 Flag
--	@param			{string} iconname HUD element name
--	@param			{string} tooltip If set to 'Text' or 'text', text is added after icon
--	@param			{string} dest Name of a destination article for linking purposes
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@return		 {string} The icon's image in wikitext
function p.Flag(frame)
	local iconname = frame.args[1]
	local tooltip = frame.args[2]
	local dest = frame.args[3]
	local textexist = frame.args[4]
	assert(IconData["Flags"][iconname] ~= nil, 
		'p.Focus(frame): Invalid icon name "'..(iconname or '')..'" [[Category:Icon Module error]]')
		
	iconname = IconData["Flags"][iconname]
	if tooltip == nil then
		tooltip = ''
	end
	if dest == nil then
		dest = ''
	end
	if (textexist == 'text' or textexist == 'Text') then
		return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']] [['..dest..'|'..tooltip..']]'
	end
	return '[[File:'..iconname..'|'..tooltip..'|16px|link='..dest..']]'
end

--- Returns the icon for a HUD buff or debuff.
--	@function		 Buff
--	@param			{string} iconname Buff name
--	@param[opt]	 {string} textexist If set to 'Text' or 'text', text is added after icon
--	@param[opt]	 {string} imagesize Image size, defaults to 'x40'
--	@return		 {string} The icon's image in wikitext
function p.Buff(frame)
	local iconname = frame.args[1]
	local imagesize = frame.args.imgsize
	local link = IconData["Buff"][iconname]["Link"]
	local iconFile = ""

	assert(IconData["Buff"][iconname] ~= nil, 
		'p.Buff(frame): Invalid icon name "'..iconname..'" [[Category:Icon Module error]]')
	

	iconFile = IconData["Buff"][iconname]["Image"]

	if (imagesize == nil or imagesize == '') then
		imagesize = 'x40'
	end
	return '[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|class=icon light-invert]]'
end

--- Returns the icon for a Clan tier.
--	@function		 Clan
--	@param			{string} iconname Clan tier name
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p.Clan(frame)
	local iconname = frame.args[1]
	local imagesize = frame.args.imgsize

	return p._Clan(iconname, imagesize)
end

--- Returns the icon for a Clan tier.
--	@function		 _Clan
--	@param			{string} iconname Clan tier name
--	@param[opt]	 {string} imagesize Image size, defaults to 'x26'
--	@return		 {string} The icon's image in wikitext
function p._Clan(iconname, imagesize)
	local link = IconData["Clan"][iconname]["Link"]
	local iconFile = ""

	assert(IconData["Clan"][iconname] ~= nil, 
		'p._Clan(iconname, imagesize): Invalid icon name "'..iconname..'" [[Category:Icon Module error]]')
		
	iconFile = IconData["Clan"][iconname]["Image"]
	if (imagesize == nil or imagesize == '') then
		imagesize = 'x26'
	end
	return '[[File:'..iconFile..'|'..imagesize..'px|link='..link..'|'..iconname..' Clan|class=icon]]'
end

return p
```

