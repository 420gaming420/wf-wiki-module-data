---
title: "Module:Maximization/data"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data"
wiki_timestamp: "2026-09-10T22:23:50Z"
---

## Contents

* [1 Ability Entry Schema](#Ability_Entry_Schema)
* [2 Style Guide](#Style_Guide)
* [3 See Also](#See_Also)

Database for [maximization](/w/Maximization "Maximization") of [warframe](/w/Warframes "Warframes") stats and [abilities](/w/Abilities "Abilities").

## Ability Entry Schema

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=T-1 "Edit section's source code: Ability Entry Schema")]

```lua
	["Ability Name"] = {
		ins = {
		    { name='Input Name', max='Input Max Value', cont='Content to place around the input (dictated by data-input-place)' },
		    'Input wikitext string',
		},
		outs = {
		    { 'Right column wikitext', { name='Output Name', expr='Output Formula', suff='Text placed after the output (e.g. units)' }},
		    { { expr='Output Formula', fmt='7sig' }, 'Left column wikitext' }
		},
		post = 'Any wikitext to insert after the calculator'
	},
```

[Module:Maximization](/w/Module:Maximization "Module:Maximization") constructs the overall HTML structure (using wikitext), currently it's a table with prebuilt Warframe stat inputs.

All input/output object fields turn into `data-*` attributes for [MediaWiki:Gadget-MathVM](/w/MediaWiki:Gadget-MathVM "MediaWiki:Gadget-MathVM") (click to see the spec), except `cont` and `suff`.

Ability Object

| Key | Description |
| --- | --- |
| `ins` | Contains **additional** inputs as objects or strings. Object form contains a special `cont` field used as descripion of the input. |
| `outs` | Contains **all** of the outputs as 2-wide arrays of outputs as objects or strings. Object form contains a special `suff` field used as units after the output. |
| `post` | Contains content inserted after the calculator. |

Prebuilt Variables

| Name | Description |
| --- | --- |
| `STR` | Value of  [Ability Strength](/w/Ability_Strength "Ability Strength") |
| `RNG` | Value of  [Ability Range](/w/Ability_Range "Ability Range") |
| `EFF` | Value of  [Ability Efficiency](/w/Ability_Efficiency "Ability Efficiency") |
| `DUR` | Value of  [Ability Duration](/w/Ability_Duration "Ability Duration") |
| `COST` | Scaling factor for [Ability Cost](/w/Ability_Efficiency#Mechanics "Ability Efficiency") |
| `DRAIN` | Scaling factor for [Ability Drain](/w/Ability_Efficiency#Mechanics "Ability Efficiency") |
| `GenericIns.ModdableMelee` | A set of generic ins for fully moddable [Exalted Weapon](/w/Exalted_Weapon "Exalted Weapon") melee  * Can be combined with other ins using `merge()`. |

Standard Units

| Unit | Description |
| --- | --- |
| Time | |
| `ms` | millisecond |
| `s` | second |
| `min` | minute |
| `h` | hour |
| Distance | |
| `m` | metre |
| `km` | kilometre |

## Style Guide

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=T-2 "Edit section's source code: Style Guide")]

1. Each ability's data should contain calculations of innate stats (e.g. energy, damage, [DoTs](/w/DoT "DoT")), and kit interactions (i.e. passive, abilities, and augments of the original warframe). Adding calculations for third-party buffs would bloat calculators.
   * If the ability can be [infused](/w/Infused "Infused"), the calculator must contain toggles for original kit interactions (e.g. [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") doing less [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") without [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash")'s passive) and must **not** contain potential interactions with a new warframe.
   * For conciseness, users are expected to know their [damage type](/w/Damage_type "Damage type"), and to manually apply [faction weakness](/w/Faction_weakness "Faction weakness") (shown in tooltips) and enemy [damage reduction](/w/Damage_reduction "Damage reduction").
2. The type of damage an ability does innately must be stated clearly (e.g. "[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") damage" for [![](/images/thumb/FreezeIcon%28xWhite%29.png/32px-FreezeIcon%28xWhite%29.png?73b01)](/w/Freeze "Freeze") [Freeze](/w/Freeze "Freeze")), same applies to procs (e.g. [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") is not the same as [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")).
3. Input and output text must clearly state the intent behind its value (e.g. "damage *bonus*" is additional damage %, "damage *modifier*" is total damage %, "damage" is exact damage).
4. Text for inputs with values should end in ":", text for checkbox inputs should end in "?" but written like a statement instead of a question.
5. If multiple ability blocks are invoked together, and some inputs or outputs represent the same concept but should not be synced or shadowed - you should rename them at the source, following the `NAME_WARFRAME_KEY` format.
   * For example: both [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") and [![](/images/thumb/BladeStormIcon%28xWhite%29.png/32px-BladeStormIcon%28xWhite%29.png?77430)](/w/Blade_Storm "Blade Storm") [Blade Storm](/w/Blade_Storm "Blade Storm") belong to [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash") and have base damage outputs (`BASE_DMG`). They were renamed `BASE_DMG_ASH_1` and `BASE_DMG_ASH_4`.

## See Also

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=T-3 "Edit section's source code: See Also")]

[Module:Maximization/data/doc](/w/Module:Maximization/data/doc "Module:Maximization/data/doc")

---

```lua
local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end};

--- takes multiple tables and returns a combined one, used to merge GenericIns with specific ability ins
local function merge(...) 
	local res = {};
	for _, ins in ipairs({...}) do
		for __, v in ipairs(ins) do
			table.insert(res, v);
		end
	end
	return res;
end 

local GenericIns = {
	ModdableMelee = {
		{name='MELEE_DMG_MOD', cont='[[Melee damage]] modifier:', type='number', default='100'},
		{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
		{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
		{name='FINISHER_DMG_MOD', cont='[[Finisher damage]] modifier:', type='number', default='100'},
		{name='COMBO_MULT', cont='[[Combo multiplier]]:', type='range-R', min='1', max='12', value='1'},
	},
};

local Data = {
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:' ,                                    {name='BASE_DMG_ASH_1', expr='STR 750 %of HEAD_MULT * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG_ASH_1 %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG_ASH_1 +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:',                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TP_AUG', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] kills:', {expr='DUR 5 %of TP_AUG *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='35 COST *'}},
		}
	},
	['Teleport']={
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='IS_INVISIBLE', cont='Ash is [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'}}
		),
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {name='BASE_DMG_ASH_4', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD FINISHER_DMG_MOD STR 
				1500 %of %of %of %of COMBO_MULT *
			]]}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED_DMG', expr='FACTION_DMG_MOD 43.75 BASE_DMG_ASH_4 %of %of', suff='/s'}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG_ASH_4 %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG_ASH_4 ELEMENT_DMG + BLEED_DMG 9 * +'}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Combo:', {expr='STR 4 %of RISING_STORM * 3 +', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	}
};
return Data;
```

