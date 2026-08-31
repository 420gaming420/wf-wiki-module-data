---
title: "Module:InfoboxBuilder"
wiki_url: "https://wiki.warframe.com/w/Module/InfoboxBuilder"
wiki_timestamp: "2026-08-17T03:40:24Z"
---

Extension of Extension:Scribunto's HTML library for building infoboxes.

* <https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#HTML_library>
* <https://github.com/wikimedia/mediawiki-extensions-Scribunto/blob/master/includes/engines/LuaCommon/lualib/mw.html.lua>

## Contents

* [1 Usage](#Usage)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
  + [2.2 InfoboxBuilder](#InfoboxBuilder)
  + [2.3 Other items](#Other_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

This module is meant to be used in other modules for constructing wikitext related to infoboxes. CSS rules for formatting infoboxes are located on [MediaWiki:Common.css](/w/MediaWiki:Common.css "MediaWiki:Common.css").

A series of chaining functions will mimic the XML-like format of infoboxes:

```lua
local InfoboxBuilder = require('Module:InfoboxBuilder')
--...
local sampleInfobox = Infobox('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title('Item Name')
	:image('Panel.png')
    :group()
    	:header('General Information')
			:row('type', 'Type', 'Resource')
			:row('rarity', 'Rarity', 'Rare')
		:done()
	:done()

mw.log(sampleInfobox)
--[=[
The above prints:

Item Name

[[File:Panel.png|300px|class=main-image]]

General Information

Type

Resource

Rarity

Rare

Prettified:

Item Name

[[File:Panel.png|300px|class=main-image]]

General Information

Type

Resource

Rarity

Rare

--]=]
```

## Documentation

### Package items

### `InfoboxBuilder`

Infobox builder class that extends HTMLBuilder (alias mw. html). Takes in one to multiple string arguments, each representing the page where i18n messages are stored.

`InfoboxBuilder.TInfobox(frame)` (function)
:   **Parameter**: `frame` accepts class, title, image, caption, header, 1..2n for n=rows (frame)

`InfoboxBuilder:group(collapse, id)` (function)
:   Builds an infobox group.
:   **Parameters**:

    * `collapse` Whether to collapse the section by default (boolean; optional)
    * `id` Collapse element id (string; optional)
:   **Returns**: InfoboxBuilder object reference (InfoboxBuilder)

`InfoboxBuilder:header(header, i18nMsgKey)` (function)
:   Builds an infobox header row.
:   **Parameters**:

    * `header` Wikitext of header label (string)
    * `i18nMsgKey` I18n key of label message (string; optional)
:   **Returns**: InfoboxBuilder object reference (InfoboxBuilder)

`InfoboxBuilder:row(source, label, default, i18nMsgKey, category)` (function)
:   Builds an normal infobox row.
:   **Parameters**:

    * `source` Source attribute for infobox row (string)
    * `label` Infobox row label (string; optional)
    * `default` Infobox row wikitext content (string)
    * `i18nMsgKey` I18n key of label message (string; optional)
    * `category` Wikitext of category link(s) (e.g. `"[[Category:Weapons]]"`) (string; optional)
:   **Returns**: InfoboxBuilder object reference (InfoboxBuilder)

`InfoboxBuilder:srow(source, label, id, default, i18nMsgKey, category)` (function)
:   Builds an infobox span row with a span element wrapping around content, containing a unique id attribute for targeting.
:   **Parameters**:

    * `source` Source attribute for infobox row (string)
    * `label` Infobox row label (string)
    * `id` Id attribute (string)
    * `default` Infobox row wikitext content (string)
    * `i18nMsgKey` I18n key of label message (string; optional)
    * `category` Wikitext of category link (e.g. `"[[Category:Weapons]]"`) (string; optional)
:   **Returns**: InfoboxBuilder object reference (InfoboxBuilder)

`InfoboxBuilder:caption(source, default, i18nMsgKey)` (function)
:   Builds an infobox caption row with centered content and no label.
:   **Parameters**:

    * `source` Source attribute for infobox row (string)
    * `default` Infobox row wikitext content (string; optional)
    * `i18nMsgKey` I18n key of content message (string; optional)
:   **Returns**: InfoboxBuilder object reference (InfoboxBuilder)

`InfoboxBuilder:column()` (function)
:   [Experimental] Starts building in a column. If we are already in a column, it adds a new column to the current column container. If not, it creates a new columns container first.
:   **Returns**: The new column builder reference (InfoboxBuilder)

`InfoboxBuilder:_dump(buf)` (function)
:   Stringifies and hide-dumps given extra data
:   **Parameter**: `buf` the extra data (any)
:   **Returns**: stringified box & dumped hidden data (string)

### Other items

(variable)

(variable)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [InfoboxBuilder/dev](/w/Module:InfoboxBuilder/dev "Module:InfoboxBuilder/dev")
* [InfoboxBuilder/doc](/w/Module:InfoboxBuilder/doc "Module:InfoboxBuilder/doc")

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
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • M:InfoboxBuilder • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	Extension of Extension:Scribunto's HTML library for building infoboxes.
--	* https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#HTML_library
--	* https://github.com/wikimedia/mediawiki-extensions-Scribunto/blob/master/includes/engines/LuaCommon/lualib/mw.html.lua
--	
--	@classmod		InfoboxBuilder
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:String]] .newLinesToBreaks
--	@require	[[Module:I18n]]
--	@release	stable
--	

-- TODO: Since some arguments are optional, for extendability we should redefine all
-- function definitions to use named arguments (or at the very least have all the optional
-- arguments be stored in an optional 'options' table)

-- TODO: galleries, tabbers, horzontal groups

---	Infobox builder class that extends HTMLBuilder (alias mw.html).
--	Takes in one to multiple string arguments, each representing the page
--	where i18n messages are stored.
--	@type		InfoboxBuilder
--	@usage		require('Module:InfoboxBuilder')('MediaWiki:Custom-General/i18n.json')
local InfoboxBuilder = {}

local newLinesToBreaks = require([[Module:String]]).newLinesToBreaks
-- Will be set to a I18n datastore instance instead once InfoboxBuilder is constructed
local i18n, frame, frameparent

-- Allows adding additional functions to imported InfoboxBuilder module
-- local InfoboxBuilder = require('Module:InfoboxBuilder')
-- InfoboxBuilder.obj.newFunc = function(self, param1) return self end
-- local Infobox = InfoboxBuilder('MediaWiki:Custom-General/i18n.json')
-- Infobox:newFunc() -- Infobox.newFunc is nil

do
-- Original metatable
	local htmlmt = getmetatable(mw.html.create())
	for k,v in pairs(htmlmt.__index) do
		InfoboxBuilder[k]=v
	end
	InfoboxBuilder._metatable={
		__index=InfoboxBuilder,
		__tostring=htmlmt.__tostring
	}
end

-- Mimicking Object-oriented programming by extending HTMLBuilder 'class'
setmetatable(InfoboxBuilder, {
	-- Constructor for a new InfoboxBuilder object.
	__call = function(self, ...)
		assert(select('#', ...) > 0,
		 'InfoboxBuilder(...): Must have at least one string argument representing the page name for i18n messages')
		i18n = require([[Module:I18n]]).loadMessages(...):useUserLang()
		-- TODO: args for frame and frameparent {args}? M:IB({i18n},{args},{pargs}) ?
		frame = mw.getCurrentFrame()
		frameparent = frame:getParent() or mw.log('M:InfoboxBuilder: No frameparent') or {args={}}
		local box = mw.html.create('div')
		setmetatable(box, InfoboxBuilder._metatable)
		return box:addClass('infobox')
	end
})
InfoboxBuilder.tostring = tostring
InfoboxBuilder._tag = InfoboxBuilder.tag
InfoboxBuilder.tag = function(self,...)
	local v = self:_tag(...)
	setmetatable(v,getmetatable(self))
	return v
end

local function translate(str, i18nMsgKey)
	-- Assume that if i18nMsgKey is not nil, then label must have a "%s" for replacement of i18n message
	return i18nMsgKey and (str or '%s'):format(i18n:msg{key=i18nMsgKey}) or str
end

---	Builds an infobox group.
--	@function		InfoboxBuilder:group
--	@param[opt]		{boolean} collapse Whether to collapse the section by default
--	@param[opt]		{string} id Collapse element id
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.group = function(self, collapse, id)
	id = id or ('PH_INFOBOX %x'):format(math.random()*0xffff)
	return self
	:tag('div'):addClass('button-c-pre mw-customtoggle-'..id:gsub('[ "]','_'))
		:wikitext('[[File:Expand.svg|30px|link=|Expand/Collapse '..id..'|class=rotate-c light-invert]]')
	:done()
	:tag('div'):addClass('group')
	:attr('id','mw-customcollapsible-'..id:gsub('[ "]','_')):addClass('mw-collapsible'):addClass(collapse and 'mw-collapsed' or nil)
end

InfoboxBuilder.hgroup = function(self, collapse)
	return self:tag('div'):addClass('hgroup')
end

---	Builds an infobox header row.
--	@function		InfoboxBuilder:header
--	@param			{string} header Wikitext of header label
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.header = function(self, header, i18nMsgKey)
	return self:tag('div'):addClass('header'):wikitext(translate(header,i18nMsgKey)):done() -- h2
end

InfoboxBuilder.title = function(self, title, i18nMsgKey)
	return self:tag('div'):addClass('title'):wikitext(translate(title,i18nMsgKey)):done() -- h2
end

InfoboxBuilder.label = function(self, label, i18nMsgKey)
	return self:tag('div'):addClass('label'):addClass('left'):wikitext(translate(label,i18nMsgKey)):done() -- h3
end

local function getvalue(default, source)
	local v = source and frame.args and frame.args[source]
	if not v or v == '' then v = source and frameparent.args and frameparent.args[source] end
	if not v or v == '' then v = default end
	return v~='' and v or nil
end

-- pass id to wrap in span, pass id=true to instead center & bold
InfoboxBuilder.value = function(self, default, source, id, append)
	self= self:tag('div'):addClass('value'):addClass('right')
	if id==true then self=self
		:attr('class','value caption')
	elseif type(id)=='table' then self=self
		:tag('span'):attr(id)
	elseif id then self=self
		:tag('span'):attr('id',id)
	end self=self
		:wikitext(getvalue(default,source))
	if id and id~=true then self=self
		:done():wikitext(append)
	end self=self
	:done()
	return self
end

InfoboxBuilder.image = function(self, default, source, class)
	if type(default) == 'table' and not getvalue(nil,source) then
		self=self:addClass('tabber-borderless')
		local t = {wikitext=function(self,...)
			for _,v in ipairs{...} do
				table.insert(self,v)
			end
			return self
		end,image=InfoboxBuilder.image}
		for i, v in ipairs(default) do
			t:wikitext('|-|'):wikitext(v.label):wikitext('='):image(v.image)
		end
		return self:wikitext( frame:callParserFunction('#tag:tabber', table.concat(t)) )
	end
	local v = getvalue(default,source);
	if v:find('UNIQ%-%-gallery') then return self:wikitext(v..'['..'[Category:Unconverted Infobox Gallery]]') end
	if v:find('^[ \t]*%-[ \t]*[\n|]') then -- gallery-as-string syntax is -(\nlabel=image)* and |s work as \ns
		-- TODO: move to TInfobox()
		-- some places were using s in image args to external ib adapters like m:enemy/infobox
		local t = {}
		for label, image in v:gmatch '[\n|][ \t]*([^=\t\n|]-)[ \t]*=[ \t]*([^\n|]*)' do
			if image ~= '' then
				table.insert(t, {label=label,image=image})
			end
		end
		return self:image(t)
	end
	-- only prepend File: if the parameter doesn't have a namespace
	if not v:find('^%w+:') then
		v = 'File:' .. v
	end
	return self:wikitext('[[',v,'|300px|class=main-image ',class or '',']]')
end

---	Builds an normal infobox row.
--	@function		InfoboxBuilder:row
--	@param			{string} source Source attribute for infobox row
--	@param[opt]		{string} label Infobox row label
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@param[opt]		{string} category Wikitext of category link(s) (e.g. `"[[Category:Weapons]]"`)
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder._row = function(self)
	return self:tag('div'):addClass('row')
end
InfoboxBuilder.row = function(self, source, label, default, i18nMsgKey, category)
	return self:srow(source, label, nil, default, nil, i18nMsgKey, category)
end

---	Builds an infobox span row with a span element wrapping around content, containing
--	a unique id attribute for targeting.
--	@function		InfoboxBuilder:srow
--	@param			{string} source Source attribute for infobox row
--	@param			{string} label Infobox row label
--	@param			{string} id Id attribute
--	@param			{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of label message
--	@param[opt]		{string} category Wikitext of category link (e.g. `"[[Category:Weapons]]"`)
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.srow = function(self, source, label, id, default, append, i18nMsgKey, category)
	if not getvalue(default,source) then return self end
	return self:_row()
		:label(label, i18nMsgKey)
		:value(default, source, id, append)
		:wikitext(category)
	:done()
end

---	Builds an infobox caption row with centered content and no label.
--	@function		InfoboxBuilder:caption
--	@param			{string} source Source attribute for infobox row
--	@param[opt]		{string} default Infobox row wikitext content
--	@param[opt]		{string} i18nMsgKey I18n key of content message
--	@return			{InfoboxBuilder} InfoboxBuilder object reference
InfoboxBuilder.caption = function(self, source, default, i18nMsgKey)
	if (default == nil or default == '') then return self end
	return self:_row()
		:value(newLinesToBreaks(translate(default,i18nMsgKey)), source, true)
	:done()
end

--- [Experimental] Starts building in a column. If we are already in a column, it adds a new column to the current column container.
-- If not, it creates a new columns container first.
-- @function		InfoboxBuilder:column
-- @return			{InfoboxBuilder} The new column builder reference
InfoboxBuilder.column = function(self)
	local parent = self._columnsContainer
	if parent then
		local col = parent:tag('div'):addClass('column')
		col._columnsContainer = parent
		return col
	else
		local columnsContainer = self:tag('div'):addClass('columns')
		local col = columnsContainer:tag('div'):addClass('column')
		col._columnsContainer = columnsContainer
		return col
	end
end

--- Stringifies and hide-dumps given extra data
-- @function InfoboxBuilder:_dump
-- @param {any} buf the extra data
-- @return {string} stringified box & dumped hidden data
InfoboxBuilder._dump = function(self, buf)
	return tostring(self)
	..''..(function(s,v)
		return s and v or "[".."[Category:Missing Hidden Data]]"
	end)(pcall(mw.text.jsonEncode,buf))..''
end

--- Builds an infobox from an {{#invoke:}}-- @function InfoboxBuilder.TInfobox
-- @param {frame} frame accepts class, title, image, caption, header, 1..2n for n=rows
function InfoboxBuilder.TInfobox(frame)
	local args = {}
	for k,v in pairs(frame.args) do
		if not v:match('^%s*$') then
			args[k]=v
		end
	end
	
    --------------------------------------------------------------------
	-- TABBER SUPPORT
	--------------------------------------------------------------------
	-- {{#invoke:InfoboxBuilder|TInfobox
	--  |tab-1 = Stats
	--  |tab-1-content =
	--   class = foo
	--   title = Weapon Stats
	--   1 = Damage
	--   2 = 100
	--  |tab-2 = Drops
	--  |tab-2-content =
	--   class = foo
	--   title = Drop Locations
	--   1 = Boss
	--   2 = Lech Kril
	-- }}
	-- local tabs = {}
	-- for k, v in pairs(args) do
	-- 	if type(k) == "string" then
	-- 	    -- Match only: tab-1, tab-2, tab-3, etc.
	-- 		local base = k:match('^tab%-(%d+)$')
	-- 	    if base then
	-- 	        local label = v
	-- 	        local content = args['tab-'..base..'-content']
	
	-- 	        if content then
	-- 	            table.insert(tabs, {label = label, content = content})
	
	-- 	            -- Remove tab args so they don't interfere with normal rows
	-- 	            args[k] = nil
	-- 	            args['tab-'..base..'-content'] = nil
	-- 	        end
	-- 	    end
	-- 	end
	-- end

	-- -- If tabs exist, build a tabber instead of a single infobox
	-- if #tabs > 0 then
	--     local tabberParts = {}

	--     for _, tab in ipairs(tabs) do
	--         -- Build each tab as its own infobox
	--         local box = InfoboxBuilder('WARFRAME Wiki:L10n/general.json')

	--         -- Treat tab content as a mini-infobox definition
	--         local subframe = mw.getCurrentFrame():newChild{
	--             args = mw.text.split(tab.content, '\n')
	--         }

	--         local html = InfoboxBuilder.TInfobox(subframe)
	--         table.insert(tabberParts, '|-' .. tab.label .. '=' .. html)
	--     end

	--     return frame:callParserFunction('#tag:tabber', table.concat(tabberParts))
	-- end
	-- --------------------------------------------------------------------

	local box = InfoboxBuilder('WARFRAME Wiki:L10n/general.json')
	if args.class then box=box:addClass(args.class) end
	if args.title then box=box:title(args.title) end
	if args.image then box=box:image(args.image) end
	if args.caption then box=box:caption('caption',args.caption) end
	if args.header then box=box:header(args.header) end
	local i = 1
	while args[i] do
		if (args[i] or ''):find'^%s*%-%s*$' then
			box=box:caption(nil,args[i+1])
		elseif (args[i+1] or ''):find'^%s*%-%s*$' then
			box=box:header(args[i])
		else
			box=box:row(nil, args[i], args[i+1])
		end
		i = i + 2
	end
	return box:tostring()
end

return InfoboxBuilder
```

