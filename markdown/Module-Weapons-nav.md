---
title: "Module:Weapons/nav"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/nav"
wiki_timestamp: "2026-09-01T10:31:38Z"
---

Submodule for generating weapon navigation box at bottom of weapon articles. See [Template:WeaponNav](/w/Template:WeaponNav "Template:WeaponNav") for the template that invokes this module.

## Contents

* [1 Documentation](#Documentation)
  + [1.1 Package items](#Package_items)
  + [1.2 Other items](#Other_items)
* [2 See Also](#See_Also)
* [3 Code](#Code)

## Documentation

### Package items

### Other items

`buildWeaponNav(frame)` ([function](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#function "w:c:dev:Lua reference manual"))
:   Builds a weapon navigation box.
:   **Parameter**: `frame` Frame object ([table](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#table "w:c:dev:Lua reference manual"))
:   **Returns**: Resultant wikitext of navbox ([string](https://en.wikipedia.org/wiki/c:dev:Lua_reference_manual#string "w:c:dev:Lua reference manual"))

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Weapons/nav/doc](/w/Module:Weapons/nav/doc "Module:Weapons/nav/doc")

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
| Cosmetics | [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [Module:Honorias](/w/Module:Honorias "Module:Honorias") ([/data](/w/Module:Honorias/data "Module:Honorias/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
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
---	Submodule for generating weapon navigation box at bottom of weapon articles.
--	See [[Template:WeaponNav]] for the template that invokes this module.
--	
--	@module			weapons/nav
--	@alias			p
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:N90|N90]]
--	@require	[[Module:Table]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Weapons/data]]
--	@release	stable
--	

local Table = require([[Module:Table]])
local Tooltips = require [[Module:Tooltips]] 
local WeaponData = require([[Module:Weapons/data]])

local CATEGORY_LINK_OVERRIDE_MAP = {
	Claws = "Claws (Melee)",
	Glaive = "Glaive (Weapon Type)",
	Machete = "Machete (Weapon Type)",
	Nikana = "Nikana (Weapon Type)",
}

local function getCategoryLink(category)
	if category:find'^Zaw ' then
		return '[[Zaw|'..category..']]'
	end
	if CATEGORY_LINK_OVERRIDE_MAP[category] ~= nil then
		return '[['..CATEGORY_LINK_OVERRIDE_MAP[category]..']]'
	end
	return '[['..category..']]'
end

-- Initialize database of all weapon names to validate bases
local allWeapons = {}
for _, tbl in pairs(WeaponData) do
	if type(tbl) == "table" then
		for _, weap in pairs(tbl) do
			if type(weap) == "table" and weap.Name then
				allWeapons[weap.Name] = true
			end
		end
	end
end

-- Get variant display name by finding words in name that are not in family name
-- This also accounts for localization differences between variants (e.g. Pangolin Sword and Pangolin Prime)
local function getVariantName(name, family)
	if name == family then
		return nil
	end
	local familyWords = {}
	for word in family:gmatch("[A-Za-z0-9]+") do
		familyWords[word:lower()] = true
	end
	
	local variantWords = {}
	for word in name:gmatch("[A-Za-z0-9]+") do
		local isVariant = true
		if familyWords[word:lower()] then
			isVariant = false
		end
		
		-- Check substrings both ways for any further localization discrepancies,
		-- e.g. Afuris -> Dex Furis, Dual Decurion -> Prisma Dual Decurions
		if string.find(family:lower(), word:lower()) then
			isVariant = false
		end
		for fWord in family:gmatch("[A-Za-z0-9]+") do
			if string.find(word:lower(), fWord:lower()) then
				isVariant = false
				break
			end
		end
		
		if isVariant then
			table.insert(variantWords, word)
		end
	end
	
	if #variantWords == 0 then
		return nil
	end
	return table.concat(variantWords, " ")
end

---	Builds a wikitable row.
--	@function		row
--	@param			{string} cat Weapon class name
--	@param			{table} weaps
--	@return			{string} Resultant wikitext of wikitable row
local function row(cat, weaps)
	local str = {}
	
	local groups = {}
	local groupOrder = {}
	for name, weap in Table.skpairs(weaps) do
		local base = weap.Family or name
		local variant = getVariantName(name, base)
		if not groups[base] then
			groups[base] = {}
			table.insert(groupOrder, base)
		end
		table.insert(groups[base], {
			name = name,
			variant = variant,
			weap = weap
		})
	end
	
	for _, base in ipairs(groupOrder) do
		local list = groups[base]
		if #list == 1 then
			local item = list[1]
			table.insert(str, Tooltips.full{{
				'Weapons',
				item.name,
				item.weap.Link,
				name = item.weap.Name,
				icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(item.weap.Image or 'UnidentifiedItem.png', item.weap.Link or ''),
				overridden = true,
				_data = item.weap,
			}})
		else
			-- Sorting variant names by alphabetical order in group, keeps base name first
			table.sort(list, function(a, b)
				if not a.variant and not b.variant then return false end
				if not a.variant then return true end
				if not b.variant then return false end
				return a.variant < b.variant
			end)
			
			local baseItem = nil
			local variantItems = {}
			for _, item in ipairs(list) do
				if not item.variant then
					baseItem = item
				else
					table.insert(variantItems, item)
				end
			end
			
			local baseLink
			if baseItem then
				baseLink = Tooltips.full{{
					'Weapons',
					baseItem.name,
					baseItem.weap.Link,
					name = baseItem.weap.Name,
					icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(baseItem.weap.Image or 'UnidentifiedItem.png', baseItem.weap.Link or ''),
					overridden = true,
					_data = baseItem.weap,
				}}
			else
				baseLink = base
			end
			
			local variantLinks = {}
			for _, item in ipairs(variantItems) do
				table.insert(variantLinks, Tooltips.full{{
					'Weapons',
					item.name,
					item.weap.Link,
					name = item.variant,
					icon = ('[[File:%s|98px|link=%s|class=icon]]'):format(item.weap.Image or 'UnidentifiedItem.png', item.weap.Link or ''),
					overridden = true,
					_data = item.weap,
				}})
			end
			
			table.insert(str, baseLink .. ' (' .. table.concat(variantLinks, ', ') .. ')')
		end
	end

	local self = mw.html.create('tr')
	if cat == '--' then
		self:tag('td')
			:attr('colspan', '2')
			:css('font-size', 'small')
			:css('font-weight', 'normal')
			:css('text-align', 'center')
			:wikitext(table.concat(str, '  • '))
	else
		self:tag('td')
				:addClass('navboxgroup')
				:wikitext(cat)
			:done()
			:tag('td')
				:css('font-size', 'small')
				:css('font-weight', 'normal')
				:css('text-align', 'left')
				:wikitext(table.concat(str, '  • '))
	end
	return self:allDone()
end

---	Builds wikitable of weapons in a particular weapon slot (e.g. primary weapons).
--	@function		makeTable
--	@param			{table} data Weapon data
--	@return			{string} Resultant wikitext of wikitable
local function makeTable(data)
	local subTable = mw.html.create('table')
		:addClass('navbox')
		:css('width', '100%')
		:css('font-size', 'small')
		
	local datum = {}
	for _, weaponEntry in pairs(data) do
		local header = weaponEntry['Class'] or 'Unknown Class'
		local section = weaponEntry['Trigger'] or header
		-- If melee nav, add melee category links for first column
		if header == section then
			header = 'Melee'
			section = getCategoryLink(section)
		end

		if datum[header] == nil then
			datum[header] = {}
		end
		if datum[header][section] == nil then
			datum[header][section] = {}
		end

		datum[header][section][weaponEntry.Name] = weaponEntry
	end

	for header, sections in Table.skpairs(datum) do
		subTable:tag('tr')
			:tag('th')
				:addClass('navboxhead')
				:attr('colspan', '2')
				:wikitext('[['..header..']]')
			:done()
		:done()
		for section, weaps in Table.skpairs(sections) do
			subTable:node(row(section, weaps))
		end
	end
	
	return subTable
end

---	Filters table.
--	@function		filterData
--	@param			{string} t Table data
--	@return			{table} New table that only contains weapon entries with _IgnoreEntry == false
local function filterData(t)
	local nt = {}
	for k, v in pairs(t) do
		if not v._IgnoreEntry then
			nt[k] = v
		end
	end
	return nt
end

return {
---	Builds a weapon navigation box.
--	@function		buildWeaponNav
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of navbox
buildWeaponNav = function(frame)
	return tostring(mw.html.create('table')
		:addClass('navbox mw-collapsible mobile-hidden')
		:tag('tr')
			:tag('th')
				:css('text-align', 'center')
				:wikitext('[[Weapons]] • [[Damage]] • [[Incarnon]] • [[Weapon Comparison'
					..(mw.title.getCurrentTitle().nsText=='Conclave' and '/Conclave' or '')
					..'|Compare All]] • [[Weapon Cosmetics|Cosmetics]]')
			:done()
		:done()
		:tag('tr')
			:tag('th')
				:css('padding', '0')
				:tag('div')
					:addClass('tabber-borderless')
					:wikitext(frame:extensionTag('Tabber', tostring(mw.html.create()
						:wikitext('|-|Primary= '):node(makeTable(WeaponData.Primary))
						:wikitext('|-|Secondary= '):node(makeTable(WeaponData.Secondary))
						:wikitext('|-|Melee= '):node(makeTable(WeaponData.Melee))
						:wikitext('|-|Archwing= '):node(makeTable(WeaponData.Archwing))
						:wikitext('|-|Companion= '):node(makeTable(filterData(WeaponData.Robotic))) -- Not 100% Robotic, includes Beast Claws too for some reason
						:wikitext('|-|Modular= '):node(makeTable(filterData(WeaponData.Modular)))
						:wikitext('|-|Railjack= '):node(makeTable(filterData(WeaponData.Railjack)))
					)))
	:allDone())
end
}
```

