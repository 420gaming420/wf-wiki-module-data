---
title: "Module:Weapons/csv"
wiki_url: "https://wiki.warframe.com/w/Module/Weapons/csv"
wiki_timestamp: "2026-07-04T05:26:16Z"
---

Outputs a CSV text based on data in Module:Weapons/data. See [Weapon\_Comparison/CSV](/w/Weapon_Comparison/CSV "Weapon Comparison/CSV") for sample output.

## Contents

* [1 Fetch Output using MediaWiki Action API](#Fetch_Output_using_MediaWiki_Action_API)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Fetch Output using MediaWiki Action API

[![](/images/thumb/CephalonSimaris.jpg/60px-CephalonSimaris.jpg?4a8c5)](/w/Cephalon_Simaris "Cephalon Simaris")

*"Hunter, I have temporarily disabled that ability."*

This article contains JavaScript scripts that users can run locally in their browser's console or machine. As a warning, which goes for any scripts you copy/run from the Internet, *MAKE SURE YOU UNDERSTAND THE CODE BEFORE RUNNING IT LOCALLY FOR YOUR OWN SECURITY!* Contact an [admin](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators") if you have any concerns or questions about a script.

To access CSV contents programmatically, you can use [MediaWiki's Action API](https://www.mediawiki.org/wiki/API:Main_page "mw:API:Main page") to run Module:Weapons/csv's `_csvGunComparisonTable()` or `_csvGunComparisonTable()` function.

For `_csvGunComparisonTable()`, you need to also pass in "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", or "Amp" as the argument:

* <https://wiki.warframe.com/w/Special:ApiSandbox#action=scribunto-console&format=json&title=CSV%20Output%20of%20Gun%20Data&content=&session=&question=%3Drequire('Module%3AWeapons%2Fcsv')._csvGunComparisonTable('Primary')&clear=1&utf8=1>

Sample JS script:

```lua
// Saves a file to local machine
var saveData = (function() {
	// Creating a temporary DOM element so we can 'click' on an element to download the file.
	// For obvious security reasons, JS running in browser environment does not have direct access to read/writes
	// to local storage. Browser is sandboxed to prevent arbitrary scripts causing damage to clients.
	var a = document.createElement("a");
	// document.body.appendChild(a);
	// a.style = "display: none";
	return function (data, fileName) {
		var json = JSON.stringify(data);
		// Unescaping escape characters
		json = json.replace(/\\n/gm, "\n").replace(/\\t/gm, "\t").replace(/\\"/gm, "\"")
		blob = new Blob([json], {type: "octet/stream"});
		blob = blob.slice(1, blob.size - 1); // Removing first and last quotation mark that designate json as a string
		url = window.URL.createObjectURL(blob);

		a.href = url;
		a.download = fileName;
		a.click();
		window.URL.revokeObjectURL(url);
	};
}() );

// Uses fetch API to interface with MediaWiki's Action API to get gun weapon data
// from the wiki's Module:Weapons/data subpages in a CSV format
function fetchGunData(slot) {
	let origin = "https://wiki.warframe.com";
	let path = "/api.php";
	let params = {
		action: "scribunto-console",
		format: "json",
		title: "Module:Weapons/csv",
		content: "",
		question: `
	local CSV = require('Module:Weapons/csv')
	print(CSV._csvGunComparisonTable('${slot}'))`,
		clear: 1
	};

	// [ ["action", "scribunto-console"], ["format","json"], ... ] to "action=scribunto-console&format=json&..."
	let queryString = new URLSearchParams([ ...Object.entries(params) ]).toString();

	let url = new URL(`${origin}${path}?${queryString}`);

	fetch(url)
		.then((data) => data.json())
		.then((json) => {
			if (json.print !== undefined) {
				saveData(json.print, `${slot} Weapon Comparison.csv`);
			} else {
				throw json.html;	// Lua script error has occured
			}
		})
		.catch((error) => console.log(error));
}

let weaponSlots = ['Primary', 'Secondary', 'Robotic', 'Arch-Gun', 'Arch-Gun (Atmosphere)', 'Amp'];
// Making multiple fetch calls for each primary weapon slot b/c of performance limitations with Lua scripts
weaponSlots.forEach((slot) => fetchGunData(slot));
```

## Documentation

### Package items

`weapons/csv._csvWeaponComparisonTable(columnDefinition, weaponSlot)` (function)
:   Generic CSV builder for weapon stat comparison.
:   **Parameters**:

    * `columnDefinition` Table of column keys that directly map to getter function names in [Module:Weapons](/w/Module:Weapons "Module:Weapons") (table)
    * `weaponSlot` Name of weapon slot to include in CSV output (string)
:   **Returns**: Preformatted text of CSV text (string)

`weapons/csv._csvGunComparisonTable(slot)` (function)
:   Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
:   **Parameter**: `slot` Gun slot name (e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", "Amp", "Railjack Turret", "Railjack Ordnance") (string)
:   **Returns**: Preformatted text of CSV text (string)

`weapons/csv.csvGunComparisonTable(frame)` (function)
:   Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
:   **Parameter**: `frame` Frame object w/ first argument being gun slot name (e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", or "Amp") (table)
:   **Returns**: Preformatted text of CSV text (string)

`weapons/csv._csvMeleeComparisonTable()` (function)
:   Builds a CSV table of all WARFRAME's melees.
:   **Returns**: Preformatted text of CSV text (string)

`weapons/csv._csvMeleeComparisonTable(frame)` (function)
:   Builds a CSV table of all WARFRAME's melees.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Preformatted text of CSV text (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Weapons/csv/doc](/w/Module:Weapons/csv/doc "Module:Weapons/csv/doc")

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
---	Outputs a CSV text based on data in Module:Weapons/data. See [[Weapon_Comparison/CSV]]
--	for sample output.
--	
--	@module		weapons/csv
--	@alias		p
--	@author		[[User:Cephalon Scientia]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@release	stable
--	

local p = {}

local Weapon = require('Module:Weapons')
local WeaponData = require('Module:Weapons/data')

getmetatable(WeaponData)._partitions = { }

-- Updating how to loop over data to optimize getting all the desired attack data
-- from all the desired weapons.
getmetatable(WeaponData).__pairs = function(self)
		local temp = {}
		for i, slot in ipairs(getmetatable(self)._partitions) do
			temp[i] = mw.loadData(getmetatable(self)._pageTitle..'/'..slot)
		end
		
		function next(t, key)
			return pairs(t)(t, key)
		end

		function __next(t, key)
			if not key then
				return next(t[1])
			else
				for i = 1, #t - 1 do
					if t[i][key] then
						if next(t[i], key) then
							return next(t[i], key)
						else
							return next(t[i + 1])
						end
					end
				end
				return next(t[#t], key)
			end
		end

		return __next, temp, nil
	end

---	Generic CSV builder for weapon stat comparison.
--	@function		p._csvWeaponComparisonTable
--	@param			{table} columnDefinition Table of column keys that directly map to getter function names in [[Module:Weapons]]
--	@param			{string} weaponSlot Name of weapon slot to include in CSV output
--	@return			{string} Preformatted text of CSV text
function p._csvWeaponComparisonTable(columnDefinition, weaponSlot)
	local tableEntryTemplate = {}	-- Would look like '%s,%s,%s'
	
	for i, _ in ipairs(columnDefinition) do table.insert(tableEntryTemplate, '%s,') end
	tableEntryTemplate[#tableEntryTemplate] = '%s'	-- Last column
	tableEntryTemplate = table.concat(tableEntryTemplate)
	
	local csvResult = {}
	table.insert(csvResult, string.format(tableEntryTemplate, unpack(columnDefinition)))
	
	for _, weaponEntry in pairs(WeaponData) do
		if (weaponEntry['Slot'] == weaponSlot and not weaponEntry['_IgnoreInCSV']) then
			-- Going through all the possible Attack keys and adding them to CSV
			for i, attackEntry in ipairs(weaponEntry['Attacks']) do
				local tableEntryValues = {}
				
				for _, keyName in ipairs(columnDefinition) do
					local v = Weapon._statRead(weaponEntry, i, keyName)
					-- Serializing table to a string
					if (type(v) == 'table') then
						v = Weapon._statFormat(weaponEntry, i, keyName)
					end
					table.insert(tableEntryValues, tostring(v))
				end
				
				local tableEntry = string.format(tableEntryTemplate, unpack(tableEntryValues))
				table.insert(csvResult, tableEntry)
			end
		end
	end
	
	return table.concat(csvResult, '\n')
end
	
---	Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
--	@function		p._csvGunComparisonTable
--	@param			{string} slot Gun slot name
--							(e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", "Amp", "Railjack Turret", "Railjack Ordnance")
--	@returns		{string} Preformatted text of CSV text
function p._csvGunComparisonTable(slot)
	-- Weapon slots allowed in resultant table, mapped to the database subpage name
	local weaponSlotFilter = {
		['Primary'] = 'primary',
		['Secondary'] = 'secondary',
		['Robotic'] = 'companion',
		['Arch-Gun'] = 'archwing',
		['Arch-Gun (Atmosphere)'] = 'archwing',
		['Amp'] = 'modular',
		['Railjack Turret'] = 'railjack',
		['Railjack Ordnance'] = 'railjack' 
	}
	
	assert(weaponSlotFilter[slot] ~= nil, 
			'p.csvGunComparisonTable(frame): Invalid slot name, must be "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", "Amp", "Railjack Turret", or "Railjack Ordnance"')
	
	-- Limiting to only loading one database partition at a time for performance
	getmetatable(WeaponData)._partitions = { weaponSlotFilter[slot] }
	
	-- Header names will also be key names to getter function maps in Module:Weapons
	-- Update this if you want more CSV columns
	local tableHeader = { 
		'Name',
		'Trigger',
		'AttackName',
		'Impact',
		'Puncture',
		'Slash',
		'Cold',
		'Electricity',
		'Heat',
		'Toxin',
		'Blast',
		'Corrosive',
		'Gas',
		'Magnetic',
		'Radiation',
		'Viral',
		'Void',
		'BaseDamage',
		'BaseDps',
		'TotalDamage',
		'CritChance',
		'CritMultiplier',
		'AvgShotDmg',
		'BurstDps',
		'SustainedDps',
		'LifetimeDmg',
		'StatusChance',
		'ForcedProcs',
		'AvgProcCount',
		'AvgProcPerSec',
		'Multishot',
		'FireRate',
		'EffectiveFireRate',
		'BurstCount',
		'BurstDelay',
		'BurstReloadDelay',
		'ChargeTime',
		'Disposition',
		'Mastery',
		'Magazine',
		'AmmoPickup',
		'AmmoMax',
		'AmmoCost',
		'Reload',
		'IncarnonCharges',
		'IncarnonChargeGain',
		'ShotType',
		'ShotSpeed',
		'PunchThrough',
		'Accuracy',
		'Introduced',
		'IntroducedDate',
		'Slot',
		'Class',
		'AmmoType',
		'Range',
		'InternalName',
		'Family',
		'FalloffStart',
		'FalloffEnd',
		'FalloffReduction',
		'AvgSpread',
		'MinSpread',
		'MaxSpread',
		'IsSilent',
		'CodexSecret'
	}
	
	return p._csvWeaponComparisonTable(tableHeader, slot)
end

---	Builds a CSV table of all WARFRAME's guns with the exception of Kitguns.
--	@function		p.csvGunComparisonTable
--	@param			{table} frame Frame object w/ first argument being gun slot name
--							(e.g. "Primary", "Secondary", "Robotic", "Arch-Gun", "Arch-Gun (Atmosphere)", or "Amp")
--	@returns		{string} Preformatted text of CSV text
function p.csvGunComparisonTable(frame)
	return '

```lua
'..p._csvGunComparisonTable(frame.args[1])..'
```

'
end

---	Builds a CSV table of all WARFRAME's melees.
--	@function		p._csvMeleeComparisonTable
--	@returns		{string} Preformatted text of CSV text
function p._csvMeleeComparisonTable()
	local dbPartitions = { 'melee', 'modular' }
	getmetatable(WeaponData)._partitions = dbPartitions
	
	-- Header names will also be key names to getter function maps in Module:Weapons
	-- Update this if you want more CSV columns
	local tableHeader = { 
		'Name',
		'AttackName',
		'Impact',
		'Puncture',
		'Slash',
		'Cold',
		'Electricity',
		'Heat',
		'Toxin',
		'Blast',
		'Corrosive',
		'Gas',
		'Magnetic',
		'Radiation',
		'Viral',
		'Void',
		'BaseDamage',
		'TotalDamage',
		'CritChance',
		'CritMultiplier',
		'AvgShotDmg',
		'StatusChance',
		'ForcedProcs',
		'AvgProcCount',
		'FireRate',
		'Disposition',
		'Mastery',
		'Introduced',
		'IntroducedDate',
		'Slot',
		'Class',
		'MeleeRange',
		'SweepRadius',
		'ComboDur',
		'InternalName',
		'Family',
	}
	
	return p._csvWeaponComparisonTable(tableHeader, 'Melee')
end

---	Builds a CSV table of all WARFRAME's melees.
--	@function		p._csvMeleeComparisonTable
--	@param			{table} frame Frame object
--	@returns		{string} Preformatted text of CSV text
function p.csvMeleeComparisonTable(frame)
	return '

```lua
'..p._csvMeleeComparisonTable()..'
```

'
end

return p
```

