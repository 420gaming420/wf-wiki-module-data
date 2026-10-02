---
title: "Module:Maximization"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization"
wiki_timestamp: "2026-10-02T07:14:12Z"
---

**Maximization** creates a stat maximization calculator for Warframe abilities.

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Maximization|ability|ability_name}}`

### Template

In template: `{{#invoke:Maximization|ability|ability_name}}`  
In articles: `{{MaximizationCalculator|ability_name}}`

## Documentation

### Package items

`p.main(frame)` (function)
:   Creates a maximization calculator for a specific Warframe ability based on formulas in [Module:Maximization/data](/w/Module:Maximization/data "Module:Maximization/data").
:   **Parameter**: `frame` Frame object with the ability names as the arguments (table)
:   **Returns**: Wikitable with the CSS classes and HTML data attributes for the calculator (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Maximization/data](/w/Module:Maximization/data "Module:Maximization/data")
* [Maximization/data/doc](/w/Module:Maximization/data/doc "Module:Maximization/data/doc")
* [Maximization/doc](/w/Module:Maximization/doc "Module:Maximization/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • M:Maximization ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
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
--- '''Maximization''' creates a stat maximization calculator for Warframe abilities.  

--	
--  @module		maximization
--  @alias		p
--  @author		[[User:DANser|DANser]]
--	@author		[[User:Gigamicro|Gigamicro]]
--  @image		BlindRageMod.png
--	@require	[[Module:Maximization/data]]
--	@require	[[Module:Tooltips]]
--  @release	stable
--  

local Tooltips = require([[Module:Tooltips]]);
local Delay = require([[Module:Delay]]);
local MaxData = mw.loadData([[Module:Maximization/data]]);
local WarframesData = Delay.mw.loadData([[Module:Warframes/data]]);
local p = {};

-- replaces/expands '{{#invoke:Tooltip}}' stubs from [[Module:Maximization/data]]
local function tooltipsub(stubs) return string.gsub(stubs, '{{#invoke:Tooltip|([^|]*)(|[^{}]*)}}', function(fun, argstr)
	local args = {};
	for arg in argstr:gmatch'|([^|]*)' do
		local key, value = arg:match'^([^=]*)=(.*)$';
		if key then
			local num = tonumber(key);
			table[num and (num % 1 == 0) and num or key] = value;
		else table.insert(args, arg); end
	end
	return Tooltips[fun](args);
end)end

--- make a data-* span from a table, or passthrough a string
local function normalize_out(out)
	if type(out) == 'string' then return tooltipsub(out); end
	if type(out) ~= 'table' then
		error('normalize_out(): expected string or table, got '..type(out));
	end
	for key, value in pairs(out) do
		if type(key) == 'string' and key ~= 'suff' then
			table.insert(out, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
		end
	end
	return ''..(out.suff and tooltipsub(out.suff) or '');
end

--- Creates a maximization calculator for a specific Warframe ability based on formulas in [[Module:Maximization/data]].
--  @function		p.ability
--	@alias			p.main
--  @param			{table} frame Frame object with the ability names as the arguments
--  @return			{string} Wikitable with the CSS classes and HTML data attributes for the calculator
function p.ability(...)
	local names = (...).args or {...};
	local single = not names[2]; -- if invoked >1 names, will put ability-specific ins under ability output blocks instead of the generic input block
	local colspan = single and '' or 'colspan=2 ';

	local ins_block = {};
	local blocks = {};
	local posttexts = {};
	
	local name_set = {}; -- individual counts, later `false` for already-emitted globals
	local name_count = 0; -- number of entries in the set

	for _, name in ipairs(names) do
		for _, input in ipairs(MaxData[name] and MaxData[name].ins or {}) do
			local iname = input.name
			if iname then
				local prev_entry = name_set[iname]
				if not prev_entry then
					name_count = name_count + 1
					name_set[iname] = 1
				else
					name_set[iname] = prev_entry + 1
				end
			end
		end
	end
	local threshold = 2

for _, name in ipairs(names) do
	local data = MaxData[name];
	local block = {};

	for _, output in ipairs(data and data.outs or {}) do
		local key_attrs = {}
		for k, v in pairs(output) do
			if type(k) == 'string' then
				table.insert(key_attrs, k..'="'..value:gsub('[\\"]','\\%0')..'"')
			end
		end
		key_attrs = table.concat(key_attrs, ' ')
		table.insert(block, '|- '..key_attrs..'\n|'..normalize_out(output[1])..'||'..normalize_out(output[2]));
	end

	local next_prefix = '|-\n| style="border-top:2px solid var(--wikitable-header-bg)" ';
	local next_global_prefix = next_prefix;
	for _, input in ipairs(data and data.ins or {}) do
		local prevalence = input.name and name_set[input.name]
		local globalize = prevalence and prevalence >= threshold
		if globalize then name_set[input.name] = false end
		
		local ins_receiver = (globalize or single) and ins_block or block
		
		if input.name and not prevalence then -- skip
		elseif type(input) == 'table' then
			local attrs = {}
			for key, value in pairs(input) do
				if type(key) == 'string' and key ~= 'cont' then
					table.insert(attrs, 'data-'..key..'="'..value:gsub('[\\"]','\\%0')..'"');
				end
			end
			local prefix
			if globalize then
				prefix = next_global_prefix; next_global_prefix = '|-\n|'
			else
				prefix = next_prefix; next_prefix = '|-\n|'
			end
			table.insert(ins_receiver, prefix..colspan
				..table.concat(attrs, ' ')..'|'..tooltipsub(input.cont));
		else
			table.insert(ins_receiver, next_prefix..colspan..input);
			next_prefix = '|-\n|';
		end
	end

	table.insert(blocks, '{| class="wikitable calc__block"\n|-\n!colspan=2|'
		..Tooltips.full(name, 'Ability')..'\n|-\n'..table.concat(block, '\n')..'\n|}');

	if data and data.post then
		table.insert(posttexts, '

'..data.post..'

');
	end
	if not data then
		table.insert(posttexts, '

'.."''Help create a maximization calculator for "
			..Tooltips.full(name, 'Ability').." and its augments by adding data to [[Module:Maximization/data]].''"
			..'

');
	end
end

--[[
	https://developer.mozilla.org/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context 
	adding a wrapper with "display: flow-root" to fit nicely with random elements on the page (stop it from taking 100% of the page)
]]--
	local max = ([=[

{| class="wikitable calc__block"
!Inputs
|-
|data-name="STR" data-value="100"|%s:
|-
|data-name="DUR" data-value="100"|%s:
|-
|data-name="RNG" data-value="100"|%s:
|-
|data-name="EFF" data-value="100"|%s:
|-
%s
|}
%s
%s

]=]):format(
	Tooltips.full{'Ability Strength', 'Stats', r='Strength'},
	Tooltips.full{'Ability Duration', 'Stats', r='Duration'},
	Tooltips.full{'Ability Range', 'Stats', r='Range'},
	Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'},
	table.concat(ins_block, '\n'),
	table.concat(blocks, '\n'),
	table.concat(posttexts, '\n'),
nil)

	return max
end
p.main = p.ability;

-- checks for ability sets by owner name and calls p.ability() with related abilities, otherwise returns error text
function p.ability_set(...)
	local warframe_names = (...).args or {...};
	local ability_names = {};
	ability_names.args = ability_names;
	
	for _, name in ipairs(warframe_names) do
		local data = WarframesData.Warframes[name] and WarframesData.Warframes[name].Abilities
		or MaxData.AbilitySets[name];
		if data then
			for __, ability in ipairs(data) do table.insert(ability_names, ability); end
		else 
			return '[[Module:Maximization|Maximization]] error: warframe abilities mapping for "'
			..tostring(name)..'" was not found in [[Module:Maximization#L-16|AbilitySets]].[[Category:Pages with script errors]][[Category:Pages with maximization errors]]';
		end
	end
	return p.ability(ability_names);
end
p.WarframeAbilities = p.ability_set;

-- TODO: Helminth original abilities
-- TODO: Warframe stats
-- TODO: gear like Archwings, cornbots, hoverboards
-- TODO: craftable combo gear like kitguns, amps
-- TODO: weapons and Arch-weapons
-- TODO: enemies

function p._exists(name) return MaxData[name] and true or false end

return p
```

