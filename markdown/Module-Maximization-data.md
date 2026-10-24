---
title: "Module:Maximization/data"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data"
wiki_timestamp: "2026-10-23T21:18:03Z"
---

## Contents

* [1 Ability Entry Schema](#Ability_Entry_Schema)
* [2 Style Guide](#Style_Guide)
* [3 Template](#Template)
* [4 See Also](#See_Also)

Database for [maximization](/w/Maximization "Maximization") of [Warframe](/w/Warframes "Warframes") stats and [Abilities](/w/Abilities "Abilities"). For all formulas we assume that values are at max Ability rank.

## Ability Entry Schema

[[edit](/w/Module:Maximization/data/doc?action=edit&section=T-1 "Edit Section using Source Editor:
Ability Entry Schema")]

```lua
	["Ability Name"] = {
		ins = {
		    { name='Input Name', max='Input Max Value', cont='Content to place around the input (dictated by data-input-place)' },
		    'Input wikitext string',
		},
		outs = {
		    { 'Left column wikitext', { name='Output Name', expr='Output Formula', suff='Text placed after the output (e.g. units)' }},
		    { { expr='Output Formula', fmt='7sig' }, 'Right column wikitext', style="background: pink" }
		},
		post = 'Any wikitext to insert after the calculator'
	},
```

[Module:Maximization](/w/Module:Maximization "Module:Maximization") constructs the overall HTML structure (using wikitext), currently it's a table with prebuilt Warframe stat inputs.

All input/output object fields turn into `data-*` attributes for [MediaWiki:Gadget-MathVM](/w/MediaWiki:Gadget-MathVM "MediaWiki:Gadget-MathVM") (click to see the spec), except `cont` and `suff`.  
`(!) Caution`: all field values must be strings (e.g. `min='0'`).

Ability Object

| Key | Description |
| --- | --- |
| `ins` | Contains **additional** inputs as objects or strings. Object form contains a special `cont` field used as descripion of the input. |
| `outs` | Contains **all** of the outputs as 2-wide arrays of outputs as objects or strings. Object form contains a special `suff` field used as units after the output. Named entries iside the `outs` object will become inline properties of the table row (e.g. `|- style="background: pink"`). |
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

[[edit](/w/Module:Maximization/data/doc?action=edit&section=T-2 "Edit Section using Source Editor:
Style Guide")]

1. Each ability's data should contain calculations of innate stats (e.g. energy, damage, [DoTs](/w/DoT "DoT")), and kit interactions (i.e. passive, abilities, and [augments](/w/Augments "Augments") of the original warframe). Adding calculations for third-party buffs would bloat calculators.
   * If the ability can be [infused](/w/Infused "Infused"), the calculator must contain toggles for original kit interactions (e.g. [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") doing less [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") without [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash")'s passive) and must **not** contain potential interactions with a new warframe.
   * Augment calculations should be present if any augment stat is affected by warframe stats or if the augment affects abilities, otherwise there is nothing to calculate.
   * Users are expected to manually apply [faction weakness](/w/Faction_weakness "Faction weakness") (shown in tooltips), enemy [damage reduction](/w/Damage_reduction "Damage reduction"), and other external factors.
2. The type of damage an ability does innately must be stated clearly (e.g. "[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") damage" for [![](/images/thumb/FreezeIcon%28xWhite%29.png/32px-FreezeIcon%28xWhite%29.png?73b01)](/w/Freeze "Freeze") [Freeze](/w/Freeze "Freeze")), same applies to procs (e.g. [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") is not the same as [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")).
   * Proc calculations should be present only under specific conditions:
     + if the proc changes duration or damage because of a kit interaction (e.g. passive, ability, augment),
     + or if the proc deals damage of a type different from the ability.
   * Proc calculations must be displayed in a `[damage] * [duration]s = [total damage]` format. This helps users apply external factors, and makes clear what scales.
3. The preferable order of outputs is similar to what is seen in ability infoboxes (for visual consistency):
   1. Ability stats (scaled by [![](/images/thumb/AbilityStrengthBuff%28xWhite%29.png/32px-AbilityStrengthBuff%28xWhite%29.png?3d71c)](/w/Ability_Strength "Ability Strength") [Ability Strength](/w/Ability_Strength "Ability Strength"), [![](/images/thumb/AbilityDurationBuff%28xWhite%29.png/32px-AbilityDurationBuff%28xWhite%29.png?d3e3b)](/w/Ability_Duration "Ability Duration") [Ability Duration](/w/Ability_Duration "Ability Duration"), [![](/images/thumb/AbilityRangeBuff%28xWhite%29.png/32px-AbilityRangeBuff%28xWhite%29.png?12f85)](/w/Ability_Range "Ability Range") [Ability Range](/w/Ability_Range "Ability Range")).
   2. Any additional stats (misc and augment stats in the same order of scalers).
   3. [![](/images/thumb/EnergyOrb.png/32px-EnergyOrb.png?bcca9)](/w/Energy_Capacity "Energy Capacity") [Energy](/w/Energy_Capacity "Energy Capacity") cost and drain.
4. Input and output text must clearly state the intent behind its value (e.g. "damage *bonus*" is additional damage %, "damage *modifier*" is total damage %, "damage" is exact damage).
5. Text for inputs with values should end in ":", text for checkbox inputs should end in "?" but written like a statement instead of a question.
6. Outputs that say "something per x" should instead have a `suff` that says "/x".
7. To avoid name conflicts between I/O, common concepts should be named following the `ABILITY_NAME``_``VARIABLE_NAME` format. This minimizes risk of conflicts both when invoking together a set of abilities of one warframe, and multiple abilities from multiple warframes.
   * For example: both [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") and [![](/images/thumb/BladeStormIcon%28xWhite%29.png/32px-BladeStormIcon%28xWhite%29.png?77430)](/w/Blade_Storm "Blade Storm") [Blade Storm](/w/Blade_Storm "Blade Storm") belong to [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash") and need base damage outputs (`BASE_DMG`). They were renamed `SHURIKEN_BASE_DMG` and `BLADE_STORM_BASE_DMG`.

## Template

[[edit](/w/Module:Maximization/data/doc?action=edit&section=T-3 "Edit Section using Source Editor:
Template")]

```lua
	['Ability Name']={
		ins={},
		outs={
			{'Damage:' , {expr='STR 1500 %of'}},
			{'Duration:', {expr='DUR 15 %of', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		},
	},
```

## See Also

[[edit](/w/Module:Maximization/data/doc?action=edit&section=T-4 "Edit Section using Source Editor:
See Also")]

[Module:Maximization/data/doc](/w/Module:Maximization/data/doc "Module:Maximization/data/doc")

---

```lua
local Tooltips = setmetatable({},{__index=function(self,fun) return function(...)
	local out = {}
	local n_i = 1
	local args; if select('#',...)==1 and type(...)=='table' then args=... else args={...} end
	for k, v in pairs(args) do
		if k == n_i then
			n_i=n_i+1
			table.insert(out, v)
		else
			table.insert(out, k..'='..v)
		end
	end
	return '{{#invoke:Tooltip|'..fun..'|'..table.concat(out, '|')..'}}'
end end})

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

-- this contains mappings for what we couldn't pull from preexisting modules
local AbilitySets = {
	Helminth={
		'Empower', 'Infested Mobility', "Master's Summons", 'Rebuild Shields', 'Perspicacity', 'Energized Munitions', 'Marked For Death',
		'Expedite Suffering', 'Parasitic Armor', 'Hideous Resistance', 'Voracious Metastasis', 'Sickening Pulse', 'Golden Instinct',
	},
};

local Data = {
	AbilitySets = AbilitySets,
	-- Ash
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:' ,                                    {name='SHURIKEN_BASE_DMG', expr='STR 750 %of HEAD_MULT * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' DoT:', {name='BLEED', expr='43.75 35 ASH if SHURIKEN_BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * SHURIKEN_BASE_DMG +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:',                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TELEPORT_RUSH', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
			{name='SMOKE_SHADOW', cont=Tooltips.full('Smoke Shadow', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] kills:', {expr='DUR 5 %of TELEPORT_RUSH *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{'Critical Chance bonus:', {expr='150 0 SMOKE_SHADOW if', suff='%'}},
			{'Smoke Shadow duration:', {expr='DUR 12 %of 0 SMOKE_SHADOW if', suff='s'}},
			{'Smoke Shadow radius:', {expr='RNG 15 %of 0 SMOKE_SHADOW if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='35 COST *'}},
		}
	},
	['Teleport']={
		ins={
			{name='TELEPORT_RUSH', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{'[[Parkour Velocity]] bonus:', {expr='30 0 TELEPORT_RUSH if', suff='%'}},
			{'Teleport Rush duration:', {expr='DUR 12 %of 0 TELEPORT_RUSH if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='IS_INVISIBLE', cont='Ash is [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'}
		}),
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {name='BLADE_STORM_BASE_DMG', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD FINISHER_DMG_MOD STR 
				1500 %of %of %of %of COMBO_MULT *
			]]}},
			{Tooltips.full('Bleed', 'DamageTypes')..' DoT:', {name='BLEED_DMG', expr='FACTION_DMG_MOD 43.75 BLADE_STORM_BASE_DMG %of %of', suff='/s'}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BLADE_STORM_BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BLADE_STORM_BASE_DMG ELEMENT_DMG + BLEED_DMG 9 * +'}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Combo:', {expr='STR 4 %of RISING_STORM * 3 +', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	},
	-- Atlas
	['Landslide']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='PUNCH_NUMBER', cont='Punch number:', type='range-R', min='1', max='3', default='1'},
			{name='RUBBLE_HEAP', cont=Tooltips.full('Rubble Heap', 'Mods').." and '''1400''' Rubble?", type='checkbox'},
			{name='PATH_OF_STATUES', cont=Tooltips.full('Path of Statues', 'Mods')..'?', type='checkbox'}
		}),
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {name='BASE_DMG', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD STR 100 0 RUBBLE_HEAP if + 350 %of %of %of COMBO_MULT *
			]]}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG ELEMENT_DMG +'}},
			{'Range:', {expr='12 24 RUBBLE_HEAP if', suff='m'}},
			{'Punch radius:', {expr='RNG 4 2 6 3 8 PUNCH_NUMBER 3 v_match:= %of', suff='m'}},
			{'Path duration:', {name='PATH_DUR', expr='DUR 12 %of 0 PATH_OF_STATUES if ', suff='s'}},
			{'Petrify duration:', {expr='PATH_DUR 2 /', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 0 { 1 2 2 3 4 PUNCH_NUMBER 3 v_match:= / COST } RUBBLE_HEAP if run *'}},
		}
	},
	['Tectonics']={
		ins={
			{name='ATLAS_ARMOR', cont="Atlas' "..Tooltips.full('Armor', 'Stats')..':', default='475', min='0'},
			{name='ABSORBED_DAMAGE', cont='Absorbed damage:', min='0', default='0'},
		},
		outs={
			{'Bulwark health:', {expr='ATLAS_ARMOR 5 * 1500 + STR %of ABSORBED_DAMAGE +'}},
			{'Bulwark inflicted'..Tooltips.full('Slash', 'DamageTypes')..' damage multiplier:', {expr='STR 1 %of', suff='%', fmt='2sig'}},
			{'Boulder rolling '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 600 %of'}},
			{'Boulder explosion '..Tooltips.full('Puncture', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Boulder explosion radius:', {expr='RNG 5 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}},
		}
	},
	['Petrify']={
		ins={
			{name='ORE_GAZE_AUGMENT', cont=Tooltips.full('Ore Gaze', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Rumbler health restored:', {expr='STR 100 %of', suff='%'}},
			{'Petrify duration:', {expr='DUR 20 %of', suff='s'}},
			{'Targeting cone range:', {expr='RNG 14 %of', suff='m'}},
			{'Chance to drop additional loot when killed:', {expr='STR 25 %of 0 ORE_GAZE_AUGMENT if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}},
		}
	},
	['Rumblers']={
		ins={
			{name='PERCENT_HEALTH_BONUS', cont='Percent health bonus:', default='0'},
			{name='FLAT_HEALTH_BONUS', cont='Flat health bonus:', default='0'},
			{name='PERCENT_SHIELD_BONUS', cont='Percent shield bonus:', default='0'},
			{name='PERCENT_ARMOR_BONUS', cont='Percent armor bonus:', default='0'},
			{name='FLAT_ARMOR_BONUS', cont='Flat armor bonus:', default='0'},
		},
		outs={
			{'Base health:', {name='RUMBLERS_BASE_HEALTH', expr='STR 1200 %of'}},
			{'Total health:', {name='RUMBLERS_TOTAL_HEALTH', expr='RUMBLERS_BASE_HEALTH 1 STR + PERCENT_HEALTH_BONUS + PERCENT_SHIELD_BONUS + * 100 1 PERCENT_HEALTH_BONUS + * + FLAT_HEALTH_BONUS + 100 1 PERCENT_SHIELD_BONUS + * +'}},
			{'Base armor:', {name='RUMBLERS_BASE_ARMOR', expr='STR 500 %of'}},
			{'Total armor:', {name='RUMBLERS_TOTAL_ARMOR', expr='RUMBLERS_BASE_ARMOR 1 STR + PERCENT_ARMOR_BONUS + * FLAT_ARMOR_BONUS +'}},
			{'Effective health:', {expr='RUMBLERS_TOTAL_ARMOR 300 + 300 / RUMBLERS_TOTAL_HEALTH *'}},
			{'Melee '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 2000 %of'}},
			{'Rock throw '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Rock radius', {expr='RNG 6 %of', suff='m'}},
			{'Self destruct '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 1250 %of'}},
			{'Self destruct radius', {expr='RNG 6 %of', suff='m'}},
			{'Duration:', {expr='DUR 45 %of', suff='s'}},
			{'Speed multiplier:', {expr='RNG 1 %of 0.5 max 1.5 min', suff='x'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}},
		}
	},
	-- Banshee
	['Sonic Boom']={
		ins={
			{name='SONIC_SIPHON', cont=Tooltips.full('Sonic Siphon', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 70 %of 100 min', suff='%'}},
			{'Push Force:', {expr='STR 5 %of'}},
			{'Range:', {expr='RNG 15 %of', suff='m'}},
			{'Sonic Siphon '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 50 %of 0 SONIC_SIPHON if 1500 min', suff='/hit'}},
			{'Hits required for 1500 '..Tooltips.full('Armor', 'Stats')..':', {expr='30 STR as% / ceil 0 SONIC_SIPHON if'}},
			{'Sonic Siphon duration:', {expr='DUR 20 %of', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Sonar']={
		outs={
			{'Damage multiplier:', {expr='STR 5 %of', fmt='2dec'}},
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {name='SONAR_RADIUS', expr='RNG 35 %of', suff='m', fmt='1dec'}},
			{'Time to fully propagate:', {expr='SONAR_RADIUS 20 /', suff='s', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Silence']={
		ins={
			{name='SAVAGE_SILENCE', cont=Tooltips.full('Savage Silence', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 20 %of', suff='m'}},
			{'[[Finisher damage]] modifier:', {expr='STR 300 %of 0 SAVAGE_SILENCE if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Sound Quake']={
		ins={
			{name='GASEOUS_QUAKE', cont=Tooltips.full('Gaseous Quake', 'Mods')..'?', type='checkbox'},
			{name='GASEOUS_QUAKE_DURATION', cont='Seconds spent channeling Gaseous Quake:', min='0', default='0'}
		},
		outs={
			{Tooltips.full('Blast', 'DamageTypes')..' or '..Tooltips.full('Gas', 'DamageTypes')..' damage:', {name='SOUND_QUAKE_BASE_DMG', expr='STR 200 %of 2.75 GASEOUS_QUAKE_DURATION 10 min ^ 1 GASEOUS_QUAKE if *'}},
			{Tooltips.full('Gas Cloud', 'DamageTypes')..' damage:', {expr='0.5 SOUND_QUAKE_BASE_DMG * 0 GASEOUS_QUAKE if'}},
			{'Zone duration:', {expr='DUR 6.25 25 GASEOUS_QUAKE if %of', suff='s'}},
			{'Radius:', {expr='RNG 20 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 75 GASEOUS_QUAKE if COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='16 DRAIN * 1.2 GASEOUS_QUAKE_DURATION ^ * 0 GASEOUS_QUAKE if', fmt='2dec'}}
		}
	},
	-- Caliban
	['Razor Gyre']={
		ins={
			{name='RAZOR_MORTAR', cont=Tooltips.full('Razor Mortar', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 500 %of', suff='/s'}},
			{Tooltips.full('Tau', 'DamageTypes')..' damage to enemies in '..Tooltips.full('Sentient Wrath', 'Ability')..':', {expr='STR 1000 %of', suff='/s'}},
			{'Healing:', {expr='STR 30 %of', suff='/enemy'}},
			{'Damage radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Lethal Progeny', 'Ability')..' Ortholyst '..Tooltips.full('Electricity', 'DamageTypes')..' and [[Fire Rate]] bonus:', {expr='STR 70 %of 0 RAZOR_MORTAR if', suff='%'}},
			{'Razor Mortar duration:', {expr='DUR 6 %of 0 RAZOR_MORTAR if', suff='s'}},
			{'Razor Mortar radius:', {expr='RNG 5 %of 0 RAZOR_MORTAR if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' restoration:', {expr='25 COST * 4 /', suff='/enemy', fmt='1dec'}}
		}
	},
	['Sentient Wrath']={
		outs={
			{Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 2000 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 35 %of', suff='%'}},
			{'Radius:', {expr='RNG 22 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Lethal Progeny']={
		outs={
			{'Level at Rank 30:', {name='LETHAL_PROGENY_LEVEL', expr='STR 30 %of floor'}},
			{'Damage multiplier:', {name='LETHAL_PROGENY_DMG_MULT', expr='STR 2.5 %of', fmt='2dec'}},
			{'Health multiplier:', {expr='STR 2 %of', fmt='2dec'}},
			{Tooltips.full('Shield', 'Stats')..' restoration:', {expr='STR 25 %of', suff='/s/Summon'}},
			{'Duration:', {expr='DUR 45 %of', suff='s'}},
			{Tooltips.full('Shield', 'Stats')..' restoration range:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		},
	},
	['Fusion Strike']={
		outs={
			{'Laser '..Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 15000 %of', suff='/s'}},
			{'Enemy detonation '..Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 5000 %of'}},
			{'Convergence '..Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 750 %of'}},
			{'Defense reduction:', {expr='STR 50 %of 100 min', suff='%'}},
			{'Duration:', {expr='DUR 15 %of', suff='s'}},
			{'Laser length:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Enemy detonation radius:', {expr='RNG 2 %of', suff='m', fmt='1dec'}},
			{'Explosion and fallout radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Citrine
	['Fractured Blast']={
		ins={
			{name='FRACTURED_BLAST_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {name='FRACTURED_BLAST_BASE_DMG', expr='STR 250 500 FRACTURED_BLAST_INFUSED if %of'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' damage:', {expr='0.35 FRACTURED_BLAST_BASE_DMG *'}},
			{'[[Health Orb]] drop chance:', {expr='STR 25 50 FRACTURED_BLAST_INFUSED if %of', suff='%'}},
			{'[[Energy Orb]] drop chance:', {expr='STR 10 20 FRACTURED_BLAST_INFUSED if %of', suff='%'}},
			{'Range:', {expr='RNG 14 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Preserving Shell']={
		outs={
			{'Initial damage reduction:', {expr='STR 40 %of 90 min', suff='%'}},
			{'Damage reduction per kill:', {expr='STR 3 %of', suff='%/kill'}},
			{'Damage reduction per assist:', {expr='STR 1 %of', suff='%/assist'}},
			{'Duration:', {expr='DUR 25 %of', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Prismatic Gem']={
		ins={
			{name='PRISMATIC_COMPANION', cont=Tooltips.full('Prismatic Companion', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..', '..Tooltips.full('Cold', 'DamageTypes')..', '..Tooltips.full('Electricity', 'DamageTypes')..' and '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {name='PRISMATIC_GEM_BASE_DMG', expr='STR 1000 %of'}},
			{Tooltips.full('Ignite', 'DamageTypes')..', '..Tooltips.full('Tesla Chain', 'DamageTypes')..' and '..Tooltips.full('Poison', 'DamageTypes')..' damage:', {expr='0.5 PRISMATIC_GEM_BASE_DMG *'}},
			{'[[Status Chance]] bonus:', {expr='STR 100 %of', suff='%'}},
			{'[[Status Duration]] bonus:', {expr='DUR 50 0 PRISMATIC_COMPANION if + 100 %of', suff='%'}},
			{'Duration:', {expr='DUR 50 0 PRISMATIC_COMPANION if + 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 15 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Crystallize']={
		ins={
			{name='RECRYSTALIZE', cont=Tooltips.full('Recrystalize', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Duration:', {expr='DUR 8 %of', suff='s'}},
			{'Range:', {expr='RNG 30 %of', suff='m'}},
			{'Recrystalize radius:', {expr='RNG 16 %of 0 RECRYSTALIZE if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Ember
	['Fireball']={
		ins={
			{name='FIREBALL_COMBO', cont='Combo meter:', type='range-R', min='1', max='12', value='1'},
			{name='FIREBALL_FRENZY', cont=Tooltips.full('Fireball Frenzy', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Direct '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 400 FIREBALL_COMBO 1 + * %of'}},
			{'Radial '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 150 FIREBALL_COMBO 1 + * %of'}},
			{'Combo window:', {expr='DUR 1.5 %of', suff='s', fmt='2dec'}},
			{'Damage radius:', {expr='RNG 3 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Heat', 'DamageTypes')..' damage bonus:', {expr='STR 100 %of 0 FIREBALL_FRENZY if', suff='%'}},
			{Tooltips.full('Heat', 'DamageTypes')..' damage bonus duration:', {expr='DUR 40 %of 0 FIREBALL_FRENZY if', suff='s', fmt='2dec'}},
			{Tooltips.full('Heat', 'DamageTypes')..' damage bonus radius:', {expr='RNG 15 %of 0 FIREBALL_FRENZY if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Immolation']={
		ins={
			{name='IMMOLATION_LEVEL', cont='Immolation level:', type='range-R', min='0', max='100', value='0'},
			{name='IMMOLATION_TIME', cont='Seconds spent at maximum Immolation:', min='0', value='0'},
			{name='IMMOLATED_RADIANCE', cont=Tooltips.full('Immolated Radiance', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Minimum [[Damage Reduction]]:', {name='IMMOLATION_MIN_DR', expr='STR 40 %of 50 min', suff='%'}},
			{'Maximum Damage Reduction:', {name='IMMOLATION_MAX_DR', expr='STR 85 %of 90 min', suff='%'}},
			{'Current Damage Reduction:',
				{name='IMMOLATION_CURR_DR', expr='IMMOLATION_LEVEL IMMOLATION_MAX_DR * 100 IMMOLATION_LEVEL - IMMOLATION_MIN_DR * + as%', suff='%'}
			},
			{'Shared Damage Reduction:', {expr='50 IMMOLATION_CURR_DR %of 0 IMMOLATED_RADIANCE if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='IMMOLATION_TIME 0.4 DRAIN * *', fmt='2dec'}}
		}
	},
	['Fire Blast']={
		ins={
			{name='IMMOLATION_LEVEL', cont=Tooltips.full('Immolation', 'Ability')..' level:', type='range-R', min='0', max='100', value='0'},
			{name='FIRE_BLAST_INFUSED', cont='[[Infused]]?', type='checkbox'},
			{name='HEALING_FLAME', cont=Tooltips.full('Healing Flame', 'Mods')..'?', type='checkbox'},
			{name='PURIFYING_FLAMES', cont=Tooltips.full('Purifying Flames', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 200 %of'}},
			{'Minimum '..Tooltips.full('Armor', 'Stats')..' reduction:',
				{name='FIRE_BLAST_MIN_STRIP', expr='STR 75 %of 75 min STR 50 %of 50 min FIRE_BLAST_INFUSED if', suff='%'}
			},
			{'Maximum '..Tooltips.full('Armor', 'Stats')..' reduction:',
				{name='FIRE_BLAST_MAX_STRIP', expr='FIRE_BLAST_MIN_STRIP STR 100 %of 100 min FIRE_BLAST_INFUSED if', suff='%'}
			},
			{'Current '..Tooltips.full('Armor', 'Stats')..' reduction:',
				{expr='FIRE_BLAST_MIN_STRIP IMMOLATION_LEVEL 100 + FIRE_BLAST_MIN_STRIP %of FIRE_BLAST_INFUSED if', suff='%'}
			},
			{'Radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Health', 'Stats')..' restored:', {expr='50 IMMOLATION_LEVEL FIRE_BLAST_INFUSED if 100 + 25 %of 0 HEALING_FLAME if', suff='/hit'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' cap:', {expr='STR 10000 %of 0 HEALING_FLAME FIRE_BLAST_INFUSED not and if'}},
			{'[[Status Effect]] immunity duration:', {expr='DUR 4 %of 0 PURIFYING_FLAMES if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Inferno']={
		ins={
			{name='IMMOLATION_LEVEL', cont=Tooltips.full('Immolation', 'Ability')..' level:', type='range-R', min='0', max='100', value='0'},
			{name='INFERNO_TARGETS', cont='Number of targets:', min='0', value='1'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' and '..Tooltips.full('Heat', 'DamageTypes')..' contact damage:',
				{expr='STR 2500 %of'}
			},
			{Tooltips.full('Heat', 'DamageTypes')..' ring damage:', {expr='IMMOLATION_LEVEL 100 + STR 350 %of %of'}},
			{'Duration:', {expr='DUR 15 %of', suff='s', fmt='2dec'}},
			{'Targeting radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='10 COST * INFERNO_TARGETS 10 min *', fmt='2dec'}}
		}
	},
	-- Equinox
	['Metamorphosis']={
		ins={
			{name='DUALITY', cont=Tooltips.full('Duality', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Day to Night maximum '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 250 %of'}},
			{'Day to Night maximum '..Tooltips.full('Shield', 'Stats')..' bonus:', {expr='STR 150 %of'}},
			{'Night to Day maximum [[Weapon Damage]] bonus:', {expr='STR 25 %of', suff='%'}},
			{'Night to Day maximum [[Movement Speed]] bonus:', {expr='STR 15 %of', suff='%'}},
			{'Buff duration:', {name='METAMORPHOSIS_DURATION', expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Buff decay rate:', {expr='100 METAMORPHOSIS_DURATION /', suff='%/s', fmt='2dec'}},
			{'Duality duration:', {expr='DUR 10 %of 0 DUALITY if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Rest & Rage']={
		ins={
			{name='CALM_AND_FRENZY', cont=Tooltips.full('Calm & Frenzy', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Rage [[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%'}},
			{'Rage speed bonus:', {expr='STR 20 %of', suff='%'}},
			{'Duration:', {expr='DUR 22 %of', suff='s', fmt='2dec'}},
			{'Cast range:', {expr='RNG 50 %of', suff='m', fmt='1dec'}},
			{'Effect radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Spread radius:', {expr='RNG 5 %of 0 CALM_AND_FRENZY if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Pacify & Provoke']={
		ins={
			{name='PEACEFUL_PROVOCATION', cont=Tooltips.full('Peaceful Provocation', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Pacify maximum damage multiplier:', {expr='0.5 STR as% /', fmt='2dec'}},
			{'Provoke maximum '..Tooltips.full('Ability Strength', 'Stats')..' bonus:', {expr='STR 20 %of 50 min STR 15 %of 30 min 0 PEACEFUL_PROVOCATION if +', suff='%'}},
			{'Pacify maximum '..Tooltips.full('Slow', 'DamageTypes')..':', {expr='STR 40 %of 80 min 0 PEACEFUL_PROVOCATION if', suff='%'}},
			{'Outer radius:', {name='PACIFY_AND_PROVOKE_RNG', expr='RNG 16 %of', suff='m', fmt='1dec'}},
			{'3rd inner radius:', {expr='PACIFY_AND_PROVOKE_RNG 3 * 4 /', suff='m', fmt='1dec'}},
			{'2nd inner radius:', {expr='PACIFY_AND_PROVOKE_RNG 2 /', suff='m', fmt='1dec'}},
			{'1st inner radius:', {expr='PACIFY_AND_PROVOKE_RNG 4 /', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='10 COST *', fmt='2dec'}},
			{'Pacify '..Tooltips.full('Energy', 'Stats')..' drain:', {expr='0.5 COST *', suff='/s/enemy', fmt='2dec'}},
			{'Provoke '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='3 COST *', suff='/ability', fmt='2dec'}}
		}
	},
	['Mend & Maim']={
		outs={
			{'Mend '..Tooltips.full('Shield', 'Stats')..' restoration:', {expr='STR 25 %of', suff='/kill'}},
			{'Maim '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 150 %of'}},
			{'Radius:', {expr='RNG 18 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='3.5 DRAIN *', fmt='2dec'}}
		}
	},
	-- Follie
	['Forced Perspective']={
		outs={
			{Tooltips.full('Corrosive', 'DamageTypes')..' damage:', {expr='STR 750 %of'}},
			{'Splash radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='15 COST *', fmt='2dec'}}
		}
	},
	['Shadowgraph']={
		outs={
			{Tooltips.full('Corrosive', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Item lifetime:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Splash radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Self Portrait']={
		ins={
			{name='SELF_PORTRAIT_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Corrosive', 'DamageTypes')..' damage:', {expr='STR 550 %of'}},
			{'Maximum [[Damage Reduction]]:', {name='SELF_PORTRAIT_DR', expr='STR 0.5 %of 0.75 0.9 SELF_PORTRAIT_INFUSED if min', fmt='%'}},
			{'Damage Reduction increase:', {expr='SELF_PORTRAIT_DR 0.1 - 15 /', suff='/kill', fmt='%'}},
			{'Base duration:', {expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Maximum duration:', {expr='DUR 60 %of', suff='s', fmt='2dec'}},
			{'Duration increase:', {expr='DUR 3 %of', suff='s/kill', fmt='2dec'}},
			{'Base radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Maximum radius:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'Radius increase:', {expr='RNG 0.8 %of', suff='m/kill', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Plein Air']={
		outs={
			{'Minimum '..Tooltips.full('Corrosive', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Maximum '..Tooltips.full('Corrosive', 'DamageTypes')..' damage:', {expr='STR 25000 %of'}},
			{'Defense reduction:', {expr='STR 0.5 %of 1 min', fmt='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Targeting radius:', {expr='RNG 18 %of', suff='m', fmt='1dec'}},
			{'Splash radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	-- Frost
	['Freeze']={
		ins={
			{name='FREEZE_FORCE', cont=Tooltips.full('Freeze Force', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Direct '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 350 %of'}},
			{'Radial '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 150 %of'}},
			{Tooltips.full('Freeze', 'DamageTypes')..' duration:', {expr='DUR 15 %of', fmt='2dec'}},
			{'Radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Cold', 'DamageTypes')..' damage bonus:', {expr='STR 1 %of 0 FREEZE_FORCE if', fmt='%'}},
			{'Freeze Force duration:', {expr='DUR 40 %of 0 FREEZE_FORCE if', suff='s', fmt='2dec'}},
			{'Freeze Force radius:', {expr='RNG 15 %of 0 FREEZE_FORCE if', suff='m', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Ice Wave']={
		ins={
			{name='ICE_WAVE_IMPEDANCE', cont=Tooltips.full('Ice Wave Impedance', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 700 %of'}},
			{Tooltips.full('Freeze', 'DamageTypes')..' duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Initial width:', {expr='RNG 3 %of', suff='m', fmt='1dec'}},
			{'Length:', {name='ICE_WAVE_LENGTH', expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'Angle:', {name='ICE_WAVE_ANGLE', expr='RNG 45 %of 60 min', suff='°', fmt='2dec'}},
			{'Frozen trail duration:', {expr='DUR 12 %of 0 ICE_WAVE_IMPEDANCE if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Snow Globe']={
		ins={
			{name='FROST_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='310'},
			{name='COLD_FRONT', cont=Tooltips.full('Cold Front', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Health added by Armor:', {name='SNOW_GLOBE_ARMOR', expr='STR 5 %of FROST_ARMOR *'}},
			{'Health before damage absorption:', {expr='STR 3500 %of SNOW_GLOBE_ARMOR +'}},
			{Tooltips.full('Cold', 'DamageTypes')..' damage on break:', {expr='STR 150 %of'}},
			{Tooltips.full('Freeze', 'DamageTypes')..' duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 2.25 5 COLD_FRONT if %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Avalanche']={
		ins={
			{name='FROST_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='310'},
			{name='ICY_AVALANCHE', cont=Tooltips.full('Icy Avalanche', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Initial '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 1500 %of'}},
			{'Shatter '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 400 %of'}},
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 0.6 %of 1 min', fmt='%'}},
			{Tooltips.full('Freeze', 'DamageTypes')..' duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{'Casting radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Shatter radius:', {expr='RNG 4.5 %of', suff='m', fmt='1dec'}},
			{'Armor to Overguard conversion rate:', {name='ICY_AVALANCHE_CONVERSION', expr='STR 0.2 %of 0 ICY_AVALANCHE if', fmt='%'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' from new targets:', {expr='ICY_AVALANCHE_CONVERSION FROST_ARMOR * ICY_AVALANCHE_BASE +', suff='/new enemy', fmt='1dec'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' from repeat targets:', {name='ICY_AVALANCHE_BASE', expr='STR 60 %of 0 ICY_AVALANCHE if', suff='/repeat enemy', fmt='1dec'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' cap:', {expr='STR 15000 %of 0 ICY_AVALANCHE if'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Gara
	['Shattered Lash']={
		ins={
			{name='MELEE_DMG_MOD', cont='[[Melee damage]] modifier:', type='number', default='100'},
			{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
			{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
			{name='MELEE_RANGE_MOD', cont='[[Melee range]] modifier:', type='number', default='0'},
			{name='COMBO_MULT', cont='[[Combo multiplier]]:', type='range-R', min='1', max='12', value='1'},
		},
		outs={
			{Tooltips.full('Puncture', 'DamageTypes')..' or '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{name='BASE_DMG', expr='FACTION_DMG_MOD MELEE_DMG_MOD STR 400 %of %of %of COMBO_MULT *'}
			},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG ELEMENT_DMG +'}},
			{'Range:', {expr='RNG 12 %of MELEE_RANGE_MOD +', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Splinter Storm']={
		ins={
			{name='MENDING_SPLINTERS', cont=Tooltips.full('Mending Splinters', 'Mods')..'?', type='checkbox'},
			{name='SPLINTER_STORM_TARGETS', cont='Number of targets:', min='0', value='1'}
		},
		outs={
			{'Base '..Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{expr='STR 200 %of'}
			},
			{'[[Damage Reduction]]:', {expr='STR 70 %of 90 min', suff='%'}},
			{'[[Damage Vulnerability]]:', {expr='STR 35 %of', suff='%'}},
			{'Duration:', {expr='DUR 22 %of', suff='s', fmt='2dec'}},
			{'Cast range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Storm radius:', {expr='RNG 2.5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 15 %of SPLINTER_STORM_TARGETS * 0 MENDING_SPLINTERS if', suff='/s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Spectrorage']={
		outs={
			{'Mirror break '..Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{name='SPECTRORAGE_MIRROR_DMG', expr='STR 800 %of'}
			},
			{'Damage added to '..Tooltips.full('Splinter Storm', 'Ability')..':',
				{expr='SPECTRORAGE_MIRROR_DMG 2 /'}
			},
			{'Carousel collapse '..Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{expr='STR 1500 %of'}
			},
			{'Duration:', {expr='DUR 22 %of', suff='s', fmt='2dec'}},
			{'Maximum mirror count:', {name='SPECTRORAGE_MIRROR_COUNT', expr='RNG 12 %of floor'}},
			{'Minimum mirror count:', {expr='SPECTRORAGE_MIRROR_COUNT 2 //'}},
			{'Charm radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Mass Vitrify']={
		ins={
			{name='SHATTERED_LASH_TOTAL_DMG', cont=Tooltips.full('Shattered Lash', 'Ability')..' total damage:', min='0', value='400'},
			{name='GARA_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='160'}
		},
		outs={
			{'[[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%'}},
			{'Health added by Armor:', {name='MASS_VITRIFY_ARMOR', expr='STR 5 %of GARA_ARMOR *'}},
			{'Segment health:', {expr='STR 1600 %of MASS_VITRIFY_ARMOR +'}},
			{'Minimum segment health gained:', {expr='STR 320 %of MASS_VITRIFY_ARMOR +', suff='/enemy'}},
			{'Segment explosion damage:', {expr='STR 400 %of'}},
			{'Ring explosion damage:', {name='MASS_VITRIFY_RING_DMG', expr='STR 800 %of SHATTERED_LASH_TOTAL_DMG +'}},
			{'Damage added to '..Tooltips.full('Splinter Storm', 'Ability')..':', {expr='MASS_VITRIFY_RING_DMG 2 /'}},
			{'Expansion duration:', {name='MASS_VITRIFY_EXPANSION_DUR', expr='DUR 3 %of', suff='s', fmt='2dec'}},
			{'Crystalization duration:', {expr='DUR 16 %of', suff='s', fmt='2dec'}},
			{'Minimum ring radius:', {name='MASS_VITRIFY_MIN_RNG', expr='RNG 2 %of', suff='m', fmt='1dec'}},
			{'Maximum ring radius:', {expr='MASS_VITRIFY_MIN_RNG MASS_VITRIFY_SPEED MASS_VITRIFY_EXPANSION_DUR * +', suff='m', fmt='1dec'}},
			{'Ring expansion rate:', {name='MASS_VITRIFY_SPEED', expr='RNG 3 %of', suff='m/s', fmt='1dec'}},
			{'Explosion radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}},
			{'Minimum '..Tooltips.full('Energy', 'Stats')..' drain:', {expr='3 DRAIN *', fmt='2dec'}},
			{'Maximum '..Tooltips.full('Energy', 'Stats')..' drain:', {expr='5 DRAIN *', fmt='2dec'}}
		}
	},
	-- Garuda
	['Dread Mirror']={
		ins={
			{name='DREAD_WARD', cont=Tooltips.full('Dread Ward', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Captured damage multiplier:', {expr='STR 2 %of', fmt='2dec'}},
			{'Shield duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Targeting range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Explosion radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{'Dread Ward duration:', {expr='DUR 8 %of 0 DREAD_WARD if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Blood Altar']={
		outs={
			{'Missing '..Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 25 %of', suff='%/s'}},
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Targeting range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Altar radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}},
		}
	},
	['Bloodletting']={
		ins={
			{name='BLOODLETTING_CURRENT_HP', cont='Current '..Tooltips.full('Health', 'Stats')..' percentage:', type='range-R', min='0', max='100', value='100'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' cost:', {name='BLOODLETTING_COST', expr='BLOODLETTING_CURRENT_HP 50 min', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' restoration:', {expr='BLOODLETTING_COST 2 * 40 2 EFF as% - / %of 100 min', suff='%'}}
		}
	},
	['Seeking Talons']={
		ins={
			{name='BLENDING_TALONS', cont=Tooltips.full('Blending Talons', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 300 %of'}},
			{'Chance of forcing '..Tooltips.full('Bleed', 'DamageTypes')..':', {expr='STR 75 %of 100 min', suff='%'}},
			{'Mark duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Blending Talons radius:', {expr='RNG 9 %of 0 BLENDING_TALONS if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Grendel
	['Feast']={
		ins={
			{name='FEAST_LEVEL', cont='Sum of eaten enemy levels:', min='0', value='1'},
			{name='GOURMAND', cont=Tooltips.full('Gourmand', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Vomit '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 500 %of FEAST_LEVEL 1 - 15 / 1 + * floor'}},
			{'Swallow range:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='0 25 COST * GOURMAND if', fmt='2dec'}},
			{Tooltips.full('Health', 'Stats')..' cost:', {expr='200 COST * 0 GOURMAND if', fmt='2dec'}}
		}
	},
	['Nourish']={
		ins={
			{name='HEARTY_NOURISHMENT', cont=Tooltips.full('Hearty Nourishment', 'Mods')..'?', type='checkbox'},
			{name='NOURISH_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='0 STR 1000 %of NOURISH_INFUSED if'}},
			{Tooltips.full('Viral', 'DamageTypes')..' [[Weapon Damage]] bonus:', {expr='STR 0.45 0.75 NOURISH_INFUSED if %of', fmt='%'}},
			{Tooltips.full('Energy', 'Stats')..' multiplier:', {expr='STR 0.6 1 NOURISH_INFUSED if %of 1 +', fmt='2dec'}},
			{'Digestion damage:', {expr='0 STR 0.2 %of NOURISH_INFUSED if', fmt='%'}},
			{'Explosion '..Tooltips.full('Viral', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Buff radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Explosion radius:', {expr='RNG 12 %of', suff='m', fmt='1dec'}},
			{'Explosion '..Tooltips.full('Virus', 'DamageTypes')..' stacks:', {expr='1 10 NOURISH_INFUSED if'}},
			{'[[Status Effect]] immunity duration:', {expr='DUR 5 %of 0 HEARTY_NOURISHMENT if', suff='s/enemy', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Pulverize']={
		ins={
			{name='GRENDEL_STOMACH', cont='Enemies in stomach:', type='range-R', min='0', max='5', value='0'},
			{name='CATAPULT', cont=Tooltips.full('Catapult', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 25 %of'}},
			{'Collision '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 500 %of 1 0.6 GRENDEL_STOMACH * + *'}},
			{'Slam '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 150 70 GRENDEL_STOMACH * + %of'}},
			{'Maximum '..Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 200 %of', suff='/s'}},
			{'Minimum '..Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 100 %of', suff='/s'}},
			{'Collision radius:', {expr='2.5 0.5 GRENDEL_STOMACH * +', suff='m', fmt='1dec'}},
			{'Slam radius:', {expr='RNG 5 2 GRENDEL_STOMACH * + %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Armor', 'Stats')..' Reduction:', {expr='STR 0.5 %of 1 min', fmt='%'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='3 DRAIN * 0 GRENDEL_STOMACH 0 = if', fmt='2dec'}},
			{'Catapult '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='5 COST * 0 CATAPULT if', fmt='2dec'}}
		}
	},
	['Regurgitate']={
		ins={
			{name='GASTRO', cont=Tooltips.full('Gastro', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Base '..Tooltips.full('Toxin', 'DamageTypes')..' or '..Tooltips.full('Gas', 'DamageTypes')..' damage:', {expr='STR 2000 %of'}},
			{Tooltips.full('Armor', 'Stats')..' Reduction:', {expr='STR 0.75 %of 1 min', fmt='%'}},
			{'Radius:', {expr='RNG 6 %of', suff='m', fmt='2dec'}},
			{Tooltips.full('Gas', 'DamageTypes')..' cloud damage:', {expr='STR 250 %of 0 GASTRO if'}},
			{Tooltips.full('Gas', 'DamageTypes')..' cloud duration:', {expr='DUR 8 %of 0 GASTRO if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	-- Harrow
	['Condemn']={
		outs={
			{Tooltips.full('Shield', 'Stats')..' restoration:', {expr='STR 150 %of', suff='/enemy'}},
			{'Duration:', {expr='DUR 6 %of', suff='s', fmt='2dec'}},
			{'Wave travel distance:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'Wave width:', {expr='RNG 2.5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Penance']={
		outs={
			{Tooltips.full('Health', 'Stats')..' restoration on cast:', {expr='STR 0.5 %of 1 min', fmt='%'}},
			{'Damage to '..Tooltips.full('Health', 'Stats')..' conversion:', {expr='STR 0.05 %of', fmt='%'}},
			{'Fire Rate and Attack Speed bonus:', {expr='STR 0.35 %of', fmt='%'}},
			{'Reload Speed bonus:', {expr='STR 0.7 %of', fmt='%'}},
			{'Base duration:', {expr='DUR 4 %of', suff='s', fmt='2dec'}},
			{'Duration added by sacrificed '..Tooltips.full('Shield', 'Stats')..':', {expr='DUR 1.54 %of', suff='s/100 Shield', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Thurible']={
		ins={
			{name='THURIBLE_ENERGY', cont='Amount of Energy channeled:', min='0', value='125'},
			{name='WARDING_THURIBLE', cont=Tooltips.full('Warding Thurible', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Energy conversion:', {name='THURIBLE_CONVERSION', expr='STR 0.15 2 EFF as% - / %of', fmt='%'}},
			{'Energy restoration on normal kill:', {name='THURIBLE_RESTORE', expr='1 THURIBLE_ENERGY THURIBLE_CONVERSION * +', suff='/kill', fmt='2dec'}},
			{'Energy restoration on Weak Point kill:', {expr='THURIBLE_RESTORE 4 *', suff='/Weak Point kill', fmt='2dec'}},
			{'Buff duration:', {expr='DUR 35 %of', suff='s', fmt='2dec'}},
			{'Buff radius:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'[[Damage Reduction]]:', {expr='STR 0.5 %of 0.9 min 0 WARDING_THURIBLE if', fmt='%'}},
			{'Additional Energy charge when damaged:', {expr='STR 1 %of 0 WARDING_THURIBLE if', suff='/hit', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Covenant']={
		ins={
			{name='LASTING_COVENANT', cont=Tooltips.full('Lasting Covenant', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Initial Critical Chance bonus:', {name='COVENANT_BASE', expr='STR 0.05 %of 0.5 min', fmt='%'}},
			{'Absorbed damage to Critical Chance conversion:', {name='COVENANT_CONVERSION', expr='STR 0.015 %of', suff='/100 damage', fmt='%'}},
			{'Damage for 50% Critical Chance:', {expr='0.5 COVENANT_BASE - COVENANT_CONVERSION 100 / /'}},
			{'[[Invulnerability]] duration:', {expr='DUR 6 %of', suff='s', fmt='2dec'}},
			{'Critical Chance bonus duration:', {expr='DUR 12 %of', suff='s', fmt='2dec'}},
			{'Critical Chance bonus duration extension:', {expr='DUR 3 %of 0 LASTING_COVENANT if', suff='s/Weak Point kill', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Jade
	["Light's Judgment"]={
		ins={
			{name='JUDGMENT_DEBUFF', cont='Enemy has [[Jade/Abilities/Passive|Judgment]]?', type='checkbox', value='checked'},
			{name='JADES_JUDGMENT', cont=Tooltips.full("Jade's Judgment", 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 500 %of 1.5 1 JUDGMENT_DEBUFF if *'}},
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 8 %of', suff='%/s', fmt='2dec'}},
			{'Well duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Buff duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Well radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Chance of Jade Light beam:', {expr='STR 5 %of 0 JADES_JUDGMENT if', suff='%', fmt='2dec'}},
			{'Jade Light beam duration:', {name='LIGHTS_JUDGMENT_BEAM_DUR', expr='DUR 3 %of 0 JADES_JUDGMENT if', suff='s', fmt='2dec'}},
			-- Epsilon represents the 1 frame delay
			{'Total beam hits:', {name='LIGHTS_JUDGMENT_BEAM_HITS', expr='LIGHTS_JUDGMENT_BEAM_DUR 0.5 EPSILON + // 1 + 0 JADES_JUDGMENT if'}},
			{'Total beam '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='2 LIGHTS_JUDGMENT_BEAM_HITS ^ 1 - 100 * 1.5 1 JUDGMENT_DEBUFF if *'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Symphony of Mercy']={
		outs={
			{'Base duration:', {name='SYMPHONY_OF_MERCY_DUR', expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Maximum duration:', {expr='SYMPHONY_OF_MERCY_DUR 2 *', suff='s', fmt='2dec'}},
			{'Power of the Seven '..Tooltips.full('Ability Strength', 'Stats')..' bonus:', {expr='STR 25 %of 150 min', suff='%'}},
			{'Deathbringer [[Weapon Damage]] bonus:', {expr='STR 100 %of', suff='%'}},
			{'Spirit of Resilience '..Tooltips.full('Shield', 'Stats')..' restoration:', {expr='STR 10 %of', suff='%/s'}},
			{'Spirit of Resilience [[Shield Recharge Delay]] decrease:', {expr='STR 10 %of 80 min', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Ophanim Eyes']={
		ins={
			{name='JUDGMENT_DEBUFF', cont='Enemy has [[Jade/Abilities/Passive|Judgment]]?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 50 %of 1.5 1 JUDGMENT_DEBUFF if *'}},
			{'Defense reduction:', {name='OPHANIM_EYES_STRIP', expr='STR 5 %of', suff='%/hit'}},
			{'Base duration:', {expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Time until full defense strip:', {expr='50 OPHANIM_EYES_STRIP /', suff='s', fmt='2dec'}},
			{'Range:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Glory on High']={
		ins={
			{name='WEAPON_DMG_MOD', cont='[[Weapon Damage]] modifier:', type='number', default='100'},
			{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
			{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
			{name='BLAST_RADIUS_MOD', cont='[[Blast Radius]] modifier:', default='0'},
			{name='JUDGMENT_DEBUFF', cont='Enemy has [[Jade/Abilities/Passive|Judgment]]?', type='checkbox'},
		},
		outs={
			{'Primary fire base '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='GLORY_BASE_DMG', expr='FACTION_DMG_MOD WEAPON_DMG_MOD STR 150 %of %of %of'}},
			{'Primary fire elemental damage:', {name='GLORY_ELEMENT_DMG', expr='ELEMENT_DMG_MOD GLORY_BASE_DMG %of'}},
			{'Primary fire total damage:', {expr='GLORY_BASE_DMG GLORY_ELEMENT_DMG + 1.5 1 JUDGMENT_DEBUFF if *'}},
			{'Detonation base '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='GLORY_DETONATION_BASE_DMG', expr='FACTION_DMG_MOD STR 1500 %of %of'}},
			{'Detonation elemental damage:', {name='GLORY_DETONATION_ELEMENT_DMG', expr='ELEMENT_DMG_MOD GLORY_DETONATION_BASE_DMG %of'}},
			{'Detonation total damage:', {expr='GLORY_DETONATION_BASE_DMG GLORY_DETONATION_ELEMENT_DMG + 1.5 1 JUDGMENT_DEBUFF if *'}},
			{'[[Damage Reduction]]:', {expr='STR 35 %of 50 min', suff='%'}},
			{'Glory blast radius:', {expr='RNG BLAST_RADIUS_MOD + 2 %of', suff='m', fmt='1dec'}},
			{'Detonation radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{'Empowered detonation radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Cast '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{'Detonation '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='5 DRAIN *', fmt='2dec'}}
		}
	},
	-- Khora
	['Whipclaw']={
		ins={
			{name='MELEE_DMG_MOD', cont='[[Melee damage]] modifier:', type='number', default='100'},
			{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
			{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
			{name='MELEE_RANGE_MOD', cont='[[Melee range]] modifier:', type='number', default='0'},
			{name='COMBO_MULT', cont='[[Combo multiplier]]:', type='range-R', min='1', max='12', value='1'},
			{name='ACCUMULATING_WHIPCLAW_BONUS', cont=Tooltips.full('Accumulating Whipclaw', 'Mods')..' bonus:', min='0', default='0', max='350'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{name='BASE_DMG', expr='FACTION_DMG_MOD MELEE_DMG_MOD STR ACCUMULATING_WHIPCLAW_BONUS + 150 %of %of %of COMBO_MULT *'}
			},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG ELEMENT_DMG +'}},
			{'Whip length:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{'Whipcrack radius:', {expr='RNG 5 %of 10 min MELEE_RANGE_MOD +', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Ensnare']={
		outs={
			{'Duration:', {expr='DUR 15 %of', suff='s'}},
			{'Propagation delay:', {expr='0.5 DUR as% /', suff='s', fmt='2dec'}},
			{'Cast range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Propagation radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		},
	},
	['Venari']={
		outs={
			{'Passive [[Movement Speed]] bonus:', {expr='STR 15 %of', suff='%'}},
			{'Snare '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 350 %of'}},
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 50 %of', suff='/s'}},
			{'Mark '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
			{'Maximum revive '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Strangledome']={
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{expr='STR 250 %of'}
			},
			{'Duration:', {expr='DUR 20 %of', suff='s'}},
			{'Dome radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Grab radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Koumei
	['Kumihimo']={
		ins={
			{name='KOUMEI_DICE', cont='Dice roll:', type='range-R', min='5', max='30', value='5'},
			{name='KOUMEI_SIXES', cont='Triple sixes?', type='checkbox'}
		},
		outs={
			{'Star elemental damage:', {expr='STR 2750 25 KOUMEI_SIXES if %of KOUMEI_DICE *'}},
			{'Thread elemental damage:', {expr='STR 25 %of KOUMEI_DICE *'}},
			{'Thread duration:', {expr='DUR 12 %of', suff='s', fmt='2dec'}},
			{'Star travel distance:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Thread length:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Threads formed:', {expr='RNG 15 %of floor 30 min'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Omikuji']={
		outs={
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Omamori']={
		outs={
			{'Damage to healing conversion multiplier:', {expr='STR 1 %of', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Bunraku']={
		outs={
			{Tooltips.full('Puncture', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Lavos
	['Ophidian Bite']={
		ins={
			{name='SWIFT_BITE', cont=Tooltips.full('Swift Bite', 'Mods')..' and hit 4 enemies?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 1000 %of'}},
			{'Imbued elemental damage:', {expr='STR 1000 %of'}},
			{'Damage to '..Tooltips.full('Health', 'Stats')..' conversion:', {expr='STR 15 %of', suff='%'}},
			{'Range:', {expr='RNG 30 0 SWIFT_BITE if + 10 %of', suff='m', fmt='1dec'}},
			{'Cooldown reduction:', {expr='EFF 4 %of 0 SWIFT_BITE if', suff='s', fmt='2dec'}}
		}
	},
	['Vial Rush']={
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Imbued elemental damage:', {expr='STR 250 %of'}},
			{'Trail duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{'Charge distance:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Number of vials:', {expr='RNG 24 %of floor'}},
			{'Vial explosion radius:', {expr='RNG 9 %of', suff='m', fmt='1dec'}}
		}
	},
	['Transmutation Probe']={
		ins={
			{name='LINGERING_TRANSMUTATION', cont=Tooltips.full('Lingering Transmutation', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Electricity', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Imbued elemental damage:', {expr='STR 250 %of'}},
			{'Radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Cooldown reduction:', {expr='EFF 1.5 %of', suff='s/enemy', fmt='2dec'}},
			{'Lingering Probe duration:', {expr='DUR 15 %of 0 LINGERING_TRANSMUTATION if', suff='s', fmt='2dec'}}
		}
	},
	['Catalyze']={
		ins={
			{name='CATALYZE_PROC_COUNT', cont='Number of [[Status Effect]]s on target:', min='0', value='0'},
			{name='CATALYZE_IMBUED', cont='Imbued?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 2000 %of'}},
			{'Imbued elemental damage:', {expr='STR 2000 %of'}},
			{'Damage multiplier:', {expr='2 CATALYZE_PROC_COUNT ^'}},
			{'Total damage:', {expr='STR 2000 %of 2 1 CATALYZE_IMBUED if * 2 CATALYZE_PROC_COUNT ^ *'}},
			{'Probe travel distance:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Probe travel speed:', {expr='RNG 8.33 %of', suff='m/s', fmt='2dec'}},
		}
	},
	-- Limbo
	['Banish']={
		ins={
			{name='RIFT_HAVEN', cont=Tooltips.full('Rift Haven', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Duration:', {expr='DUR 25 %of', suff='s'}},
			{'Range:', {expr='RNG 35 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Health', 'Stats')..' restored:', {expr='STR 25 %of 0 RIFT_HAVEN if', suff='%/s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Stasis']={
		outs={
			{'Duration:', {expr='DUR 15 %of', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Rift Surge']={
		ins={
			{name='RIFT_TORRENT', cont=Tooltips.full('Rift Torrent', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Surge duration:', {expr='DUR 25 %of', suff='s'}},
			{'Banish duration:', {expr='DUR 18 %of', suff='s'}},
			{'Cast radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Surge transfer radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Banish radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Rift Torrent damage bonus:', {expr='STR 30 %of 0 RIFT_TORRENT if', suff='%/enemy'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Cataclysm']={
		ins={
			{name='CATACLYSMIC_CONTINUUM_DURATION', cont='Duration added by '..Tooltips.full('Cataclysmic Continuum', 'Mods')..':', min='0', default='0'}
		},
		outs={
			{'Base '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Base duration:', {name='CATACLYSM_BASE_DURATION', expr='DUR 30 %of', suff='s'}},
			{'Initial radius:', {name='CATACLYSM_INITIAL_RADIUS', expr='RNG 16 %of', suff='m', fmt='1dec'}},
			{'Minimum radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Shrinking rate:', {expr='2 CATACLYSM_INITIAL_RADIUS * 3 CATACLYSM_BASE_DURATION * CATACLYSMIC_CONTINUUM_DURATION + /', suff='m/s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Mirage
	['Hall of Mirrors']={
		ins={
			{name='HALL_OF_MALEVOLENCE', cont=Tooltips.full('Hall of Malevolence', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Maximum doppelganger damage multiplier:', {expr='STR 20 %of 1.5 1 HALL_OF_MALEVOLENCE if *', suff='%'}},
			{'Doppelganger Critical and Status Chance multiplier:', {expr='STR 40 %of', suff='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Sleight of Hand']={
		ins={
			{name='EXPLOSIVE_LEGERDEMAIN', cont=Tooltips.full('Explosive Legerdemain', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Light jewel '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 200 %of'}},
			{'Pickup explosion damage:', {expr='STR 1000 200 EXPLOSIVE_LEGERDEMAIN if %of'}},
			{'Booby trap duration:', {expr='DUR 18 %of', suff='s', fmt='2dec'}},
			{'Dark jewel '..Tooltips.full('Blind', 'DamageTypes')..' duration:', {expr='DUR 5 %of', suff='s', fmt='2dec'}},
			{'Booby trap radius:', {expr='RNG 40 %of', suff='m', fmt='1dec'}},
			{'Jewel charm radius:', {expr='RNG 12 %of', suff='m', fmt='1dec'}},
			{'Jewel explosion radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Pickup explosion radius:', {expr='RNG 20 8 EXPLOSIVE_LEGERDEMAIN if %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Eclipse']={
		ins={
			{name='TOTAL_ECLIPSE', cont=Tooltips.full('Total Eclipse', 'Mods')..'?', type='checkbox'},
			{name='ECLIPSE_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'[[Weapon Damage]] multiplier:', {expr='STR 30 200 ECLIPSE_INFUSED if %of', suff='%'}},
			{'[[Damage Reduction]]:', {expr='STR 75 %of 75 90 ECLIPSE_INFUSED if min', suff='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Buff radius:', {expr='RNG 15 %of 0 TOTAL_ECLIPSE if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Prism']={
		ins={
			{name='PRISM_GUARD', cont=Tooltips.full('Prism Guard', 'Mods')..'?', type='checkbox'},
			{name='PRISM_SOLAR', cont='Solar '..Tooltips.full('Eclipse', 'Ability')..'?', type='checkbox'},
			{name='PRISM_LUNAR', cont='Lunar '..Tooltips.full('Eclipse', 'Ability')..'?', type='checkbox'},
			{name='PRISM_HITS', cont='Number of hits:', min='0', value='0'}
		},
		outs={
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 250 %of 50 25 PRISM_SOLAR if PRISM_HITS * 100 + %of'}},
			{'Prism duration:', {expr='DUR 4 12 PRISM_GUARD if %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Blind', 'DamageTypes')..' duration:', {expr='DUR 15 %of', suff='s', fmt='2dec'}},
			{'Laser targeting range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Blind', 'DamageTypes')..' radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 50 PRISM_LUNAR if COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='5 10 PRISM_LUNAR if DRAIN *', fmt='2dec'}}
		}
	},
	-- Narin
	['Neote']={
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' damage:' , {name='BASE_NEOTE_DMG', expr='STR 400 %of', suff='/hit'}},
			{'Total '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='BASE_NEOTE_DMG 5 *'}},
			{'Range:', {expr='RNG 12 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		}
	},
	['Naraemagi']={
		ins={
			{name='NUM_COLD_STATUS_ABSORBED', cont=Tooltips.full('Cold', 'DamageTypes')..' procs absorbed:', default='1', min='0'},
		},
		outs={
			{Tooltips.full('Shield', 'Stats')..' or '..Tooltips.full('Overguard', 'DamageTypes')..':', {expr='STR 75 %of NUM_COLD_STATUS_ABSORBED *', suff='/'..Tooltips.full('Cold', 'DamageTypes')..' proc'}},
			{'Radius:', {expr='RNG 14 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}},
		}
	},
	['Hakchum']={
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' Landing damage:' , {expr='STR 1000 %of'}},
			{Tooltips.full('Cold', 'DamageTypes')..' DoT:' , {expr='STR 100 %of', suff='/s'}},
			{Tooltips.full('Cold', 'DamageTypes')..' Damage Vulnerability:' , {expr='STR 150 %of', suff='%'}},
			{'Ice storm duration:', {expr='DUR 10 %of', suff='s'}},
			{'Ice storm radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}},
		}
	},
	['Nurinarim']={
		ins={
			{name='COLD_STATUS_COUNT', cont='Number of '..Tooltips.full('Cold', 'DamageTypes')..' procs on enemy: ', type='range-R', min='1', max='10', default='1'},
			{name='ENEMY_IS_MARKED', cont='Enemy is marked?', type='checkbox'},
		},
		outs={
			{'Ice aura '..Tooltips.full('Cold', 'DamageTypes')..' damage:' , {expr='STR 500 %of', suff='/s'}},
			{'Icy Slash'..Tooltips.full('Cold', 'DamageTypes')..'  damage:' , {expr='STR 20000 %of 2 1 ENEMY_IS_MARKED if *'}},
			{'Frozen enemy explosion '..Tooltips.full('Cold', 'DamageTypes')..' damage:' , {expr='STR 10000 %of 2 1 ENEMY_IS_MARKED if *'}},
			{'Max duration:', {expr='DUR 15 %of', suff='s'}},
			{'Ice aura radius:', {expr='RNG 8 %of', suff='m'}},
			{'Frozen enemy explosion radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Shield', 'Stats')..' stripped:', {expr='5 COLD_STATUS_COUNT *', suff='%'}},
			{Tooltips.full('Armor', 'Stats')..' stripped:', {expr='5 COLD_STATUS_COUNT *', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		}
	},
	-- Nekros
	['Soul Punch']={
		ins={
			{name='SOUL_PUNCH_HITS', cont='Number of enemies hit by projectile:', min='0', value='0'},
			{name='SOUL_SURVIVOR', cont=Tooltips.full('Soul Survivor', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Cast '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Projectile direct '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='50 2 SOUL_PUNCH_HITS ^ *'}},
			{'Targeting range:', {expr='RNG 50 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Health', 'Stats')..' restored to revived target:', {expr='STR 30 %of 100 min 0 SOUL_SURVIVOR if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
		}
	},
	['Terrify']={
		ins={
			{name='CREEPING_TERRIFY', cont=Tooltips.full('Creeping Terrify', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Affected enemies:', {expr='STR 20 %of floor'}},
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 60 %of 100 min', suff='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Slow', 'DamageTypes')..':', {expr='STR 60 %of 80 min 0 CREEPING_TERRIFY if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Desecrate']={
		ins={
			{name='DESPOIL', cont=Tooltips.full('Despoil', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Casting '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='0 10 COST * DESPOIL if', fmt='2dec'}},
			{'Desecration '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='0 10 COST * DESPOIL if', fmt='2dec'}},
			{'Desecration '..Tooltips.full('Health', 'Stats')..' cost:', {expr='10 COST * 0 DESPOIL if', fmt='2dec'}}
		}
	},
	['Shadows of the Dead']={
		ins={
			{name='SHIELD_OF_SHADOWS', cont=Tooltips.full('Shield of Shadows', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Damage bonus:', {expr='STR 150 %of', suff='%'}},
			{Tooltips.full('Shield', 'Stats')..' bonus:', {expr='STR 100 %of', suff='%'}},
			{Tooltips.full('Health', 'Stats')..' bonus:', {expr='STR 100 %of', suff='%'}},
			{Tooltips.full('Health', 'Stats')..' decay:', {expr='3 DUR as% /', suff='%/s', fmt='2dec'}},
			{'[[Damage Redirection]]:', {name='SHADOWS_OF_THE_DEAD_DR', expr='STR 6 %of 0 SHIELD_OF_SHADOWS if', suff='%/linked Shadow'}},
			{'Damage Redirection at 7 links:', {expr='SHADOWS_OF_THE_DEAD_DR 7 * 90 min', suff='%'}},
			{'Linking radius:', {expr='RNG 50 %of 0 SHIELD_OF_SHADOWS if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}},
		}
	},
	-- Nezha
	['Fire Walker']={
		ins={
			{name='PYROCLASTIC_FLOW', cont=Tooltips.full('Pyroclastic Flow', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' trail damage:', {expr='STR 100 %of'}},
			{Tooltips.full('Heat', 'DamageTypes')..' explosion damage:', {expr='STR 1250 %of'}},
			{'Duration:', {expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Trail duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Explosion radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Pyroclastic Flow duration:', {expr='DUR 10 %of 0 PYROCLASTIC_FLOW if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Blazing Chakram']={
		ins={
			{name='REAPING_CHAKRAM', cont=Tooltips.full('Reaping Chakram', 'Mods')..'?', type='checkbox'},
			{name='BLAZING_CHAKRAM_HITS', cont='Number of hits:', min='0', value='0'}
		},
		outs={
			{'Base '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 250 %of 2 BLAZING_CHAKRAM_HITS ^ 1 REAPING_CHAKRAM if *'}},
			{'Maximum '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 1000 %of 2 BLAZING_CHAKRAM_HITS ^ 1 REAPING_CHAKRAM if *'}},
			{'[[Damage Vulnerability]]:', {expr='STR 100 %of', suff='%'}},
			{'Damage Vulnerability duration:', {expr='DUR 15 %of', suff='s', fmt='2dec'}},
			{'Expected [[Health Orb]]s on death:', {expr='1 0.25 BLAZING_CHAKRAM_HITS * 0 REAPING_CHAKRAM if +', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Warding Halo']={
		ins={
			{name='NEZHA_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='200'},
			{name='SAFEGUARD', cont='Casting '..Tooltips.full('Safeguard', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Health added by Armor:', {name='WARDING_HALO_ARMOR', expr='STR 2.5 %of NEZHA_ARMOR *'}},
			{'Health before damage absorption:', {expr='STR 1000 %of WARDING_HALO_ARMOR + 2 1 SAFEGUARD if /'}},
			{'Absorbed damage multiplier:', {expr='STR 2.5 %of 2 1 SAFEGUARD if /', fmt='2dec'}},
			{Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 125 %of'}},
			{'Damage radius:', {expr='RNG 2 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Divine Spears']={
		ins={
			{name='DIVINE_RETRIBUTION', cont=Tooltips.full('Divine Retribution', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Puncture', 'DamageTypes')..' damage:', {expr='STR 600 %of'}},
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 600 %of'}},
			{'Duration:', {expr='DUR 12 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 14 19 DIVINE_RETRIBUTION if %of', suff='m', fmt='1dec'}},
			{'[[Status Effect]] damage multiplier:', {expr='STR 1.5 %of 0 DIVINE_RETRIBUTION if', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Nidus
	['Virulence']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='TEEMING_VIRULENCE', cont=Tooltips.full('Teeming Virulence', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Puncture', 'DamageTypes')..' contact damage:', {expr='STR 200 %of 1 MUTATION_STACKS + *'}},
			{Tooltips.full('Viral', 'DamageTypes')..' lingering damage:', {expr='STR 100 %of 1 MUTATION_STACKS + *'}},
			{'Lingering field duration:', {expr='DUR 5 %of', suff='s'}},
			{'Length:', {expr='RNG 16 %of', suff='m', fmt='1dec'}},
			{'Primary Weapon Critical Chance bonus:', {expr='STR 200 %of 0 TEEMING_VIRULENCE if', suff='%'}},
			{'Teeming Virulence duration:', {expr='DUR 15 %of 0 TEEMING_VIRULENCE if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {name='VIRULENCE_COST', expr='40 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' restored:', {expr='VIRULENCE_COST 4 /', suff='/hit'}}
		}
	},
	['Larva']={
		ins={
			{name='LARVA_BURST', cont=Tooltips.full('Larva Burst', 'Mods')..'?', type='checkbox'},
			{name='LARVA_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'Mutation Stack chance:', {expr='0 STR 50 %of LARVA_INFUSED if 100 min', suff='%'}},
			{'Duration:', {expr='DUR 7 %of', suff='s'}},
			{'Grab radius:', {expr='RNG 8 12 LARVA_INFUSED if %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {name='LARVA_BURST_BASE_DMG', expr='STR 600 %of 0 LARVA_BURST if', suff='/enemy'}},
			{Tooltips.full('Poison', 'DamageTypes')..' damage:', {expr='0.5 LARVA_BURST_BASE_DMG *', suff='/enemy'}},
			{'Larva Burst radius:', {expr='RNG 8 %of 0 LARVA_BURST if', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Parasitic Link']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='PARASITIC_VITALITY', cont=Tooltips.full('Parasitic Vitality', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Ability Strength', 'Stats')..' multiplier:', {expr='STR 0.25 %of 1 +', fmt='2dec'}},
			{'Damage multiplier:', {expr='STR 0.25 %of 1 +', fmt='2dec'}},
			{'Damage redirection:', {expr='STR 50 %of 90 min', suff='%'}},
			{'Duration:', {expr='DUR 60 %of', suff='s'}},
			{'Ally maximum range:', {expr='RNG 40 %of', suff='m', fmt='1dec'}},
			{'Enemy maximum range:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'Health bonus:', {expr='STR 4 MUTATION_STACKS * %of 0 PARASITIC_VITALITY if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Ravenous']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='INSATIABLE', cont=Tooltips.full('Insatiable', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' regeneration:', {expr='STR 75 %of', suff='/s'}},
			{'Duration:', {expr='DUR 40 %of', suff='s'}},
			{'Field radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Maggot '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 150 %of 1 MUTATION_STACKS + *'}},
			{'Maggot '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='10 1 MUTATION_STACKS + *'}},
			{'Maggot explosion radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{'Bonus Mutation Stack chance:', {expr='STR 60 %of 0 INSATIABLE if', suff='%'}}
		}
	},
	-- Nokko
	['Stinkbrain']={
		ins={
			{name='STINKBRAIN_EMPOWERED', cont='Empowered?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Viral', 'DamageTypes')..' damage:', {expr='STR 250 %of', suff='/pulse'}},
			{'Base duration:', {name='STINKBRAIN_DUR', expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Pulse radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Minimum pulse count:', {expr='STINKBRAIN_DUR 1.5 3 STINKBRAIN_EMPOWERED if //'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Brightbonnet']={
		ins={
			{name='BRIGHTBONNET_EMPOWERED', cont='Empowered?', type='checkbox'},
			{name='BRIGHTBONNET_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Energy', 'Stats')..' restoration:', {expr='STR 10 15 BRIGHTBONNET_INFUSED if %of', suff='/pulse'}},
			{Tooltips.full('Ability Strength', 'Stats')..' bonus:',
				{expr='STR 20 %of 100 min STR 30 %of 150 min BRIGHTBONNET_INFUSED if 2 1 BRIGHTBONNET_EMPOWERED if *', suff='%'}
			},
			{'Mushroom duration:', {name='BRIGHTBONNET_DUR', expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Ability Strength', 'Stats')..' bonus duration:', {expr='DUR 5 %of', suff='s', fmt='2dec'}},
			{'Pulse radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Minimum pulse count:', {expr='BRIGHTBONNET_DUR 1.5 3 BRIGHTBONNET_EMPOWERED if //'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Reroot']={
		ins={
			{name='REROOT_RAMPAGE', cont=Tooltips.full('Reroot Rampage', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' or '..Tooltips.full('Shield', 'Stats')..' restoration over time:', {expr='STR 10 %of', suff='/s'}},
			{Tooltips.full('Health', 'Stats')..' or '..Tooltips.full('Shield', 'Stats')..' restoration from orbs:', {expr='STR 80 %of'}},
			{'Duration:', {expr='DUR 10 %of', suff='s', fmt='2dec'}},
			{'Sprodling '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 250 %of 0 REROOT_RAMPAGE if'}},
			{'Sprodling damage radius:', {expr='RNG 8 %of 0 REROOT_RAMPAGE if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Sporespring']={
		ins={
			{name='SPORESPRING_BOUNCES', cont='Bounce number:', type='range-R', min='1', max='10', value='1'}
		},
		outs={
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 2500 %of 1.5 SPORESPRING_BOUNCES 1 - ^ *'}},
			{'[[Critical Chance]]:', {expr='75 25 SPORESPRING_BOUNCES 1 - * +', suff='%'}},
			{'Explosion radius:', {expr='RNG 3 %of', suff='m', fmt='1dec'}},
			{'Bounce range:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	-- Nova
	['Null Star']={
		ins={
			{name='NEUTRON_STAR', cont=Tooltips.full('Neutron Star', 'Mods')..'?', type='checkbox'},
			{name='NULL_STAR_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 300 %of'}},
			{'Particle count:', {name='NULL_STAR_COUNT', expr='DUR 12 %of floor'}},
			{'Damage reduction:', {name='NULL_STAR_DR', expr='STR 5 %of', suff='%/particle'}},
			{'Maximum damage reduction:', {expr='NULL_STAR_COUNT NULL_STAR_DR * 75 90 NULL_STAR_INFUSED if min', suff='%'}},
			{'Targeting radius', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 240 %of 0 NEUTRON_STAR if'}},
			{Tooltips.full('Heat', 'DamageTypes')..' damage radius:', {expr='RNG 8 %of 0 NEUTRON_STAR if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Antimatter Drop']={
		ins={
			{name='ANTIMATTER_ABSORB', cont=Tooltips.full('Antimatter Absorb', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Base explosion '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {name='ANTIMATTER_DROP_BASE_DMG', expr='STR 200 %of'}},
			{'Absorb damage multiplier:', {name='ANTIMATTER_DROP_MULT', expr='STR 8 %of', fmt='2dec'}},
			{'Maximum explosion '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='ANTIMATTER_DROP_MULT 25000 * ANTIMATTER_DROP_BASE_DMG +'}},
			{'Contact '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 10 %of'}},
			{'Explosion radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Antimatter Absorb radius:', {expr='RNG 5 %of 0 ANTIMATTER_ABSORB if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Wormhole']={
		ins={
			{name='ESCAPE_VELOCITY', cont=Tooltips.full('Escape Velocity', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Range:', {expr='RNG 50 %of', suff='m', fmt='1dec'}},
			{'[[Movement Speed]] bonus duration:', {expr='DUR 7 %of 0 ESCAPE_VELOCITY if', suff='s', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Molecular Prime']={
		outs={
			{'Slow or speed:', {expr='STR 50 %of 75 min', suff='%', fmt='1dec'}},
			{Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 800 %of'}},
			{'Wave duration:', {name='MOLECULAR_PRIME_WAVE_DUR', expr='DUR 6 %of', suff='s'}},
			{'Priming duration:', {expr='DUR 30 %of', suff='s'}},
			{'Explosion radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{'Maximum wave range:', {expr='MOLECULAR_PRIME_WAVE_DUR 5 * 5 +', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Nyx
	['Mind Control']={
		ins={
			{name='MIND_FREAK', cont=Tooltips.full('Mind Freak', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Initial damage bonus:', {expr='STR 10 %of 0 MIND_FREAK if 7.5 +', fmt='%'}},
			{'Duration:', {expr='DUR 60 %of', suff='s', fmt='2dec'}},
			{'Targeting range:', {expr='RNG 60 %of', suff='m', fmt='1dec'}},
			{'Movement Speed and Attack Speed bonus:', {expr='STR 0.25 %of 0 MIND_FREAK if', fmt='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Psychic Bolts']={
		ins={
			{name='PACIFYING_BOLTS', cont=Tooltips.full('Pacifying Bolts', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Defense Reduction:', {expr='STR 0.8 %of 1 min', fmt='%'}},
			{Tooltips.full('Slow', 'DamageTypes')..' to '..Tooltips.full('Infested', 'Factions')..':',
				{expr='STR 0.2 %of', fmt='%'}
			},
			{Tooltips.full('Armor', 'Stats')..' stolen:', {expr='STR 25 %of', suff='/armored enemy'}},
			{Tooltips.full('Shield', 'Stats')..' stolen:', {expr='STR 75 %of', suff='/shielded enemy'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' stolen:', {expr='STR 500 %of', suff='/Overguarded enemy'}},
			{Tooltips.full('Armor', 'Stats')..' cap:', {expr='STR 1000 %of'}},
			{Tooltips.full('Overguard', 'DamageTypes')..' cap:', {expr='STR 7500 %of'}},
			{'Defense Reduction duration:', {expr='DUR 11 %of', suff='s', fmt='2dec'}},
			{'Stolen '..Tooltips.full('Armor', 'Stats')..' duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Confusion', 'DamageTypes')..' duration:', {expr='DUR 10 %of 0 PACIFYING_BOLTS if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Chaos']={
		ins={
			{name='CHAOS_SHPERE', cont=Tooltips.full('Chaos Sphere', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Confusion', 'DamageTypes')..' duration:', {name='CHAOS_DUR', expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Chaos Sphere duration:', {expr='50 CHAOS_DUR %of 0 CHAOS_SHPERE if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Absorb']={
		ins={
			{name='ASSIMILATE', cont=Tooltips.full('Assimilate', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Minimum '..Tooltips.full('Magnetic', 'DamageTypes')..' damage:', {expr='STR 1500 %of'}},
			{'Absorbed damage to [[Weapon Damage]] bonus conversion:', {name='ABSORB_CONVERSION', expr='STR 0.00025 %of', fmt='3%'}},
			{'Duration:', {expr='Inf DUR 5 %of ASSIMILATE if', suff='s', fmt='2dec'}},
			{'Weapon Damage bonus duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{'Minimum radius:', {name='ABSORB_RNG', expr='RNG 7.5 15 ASSIMILATE if %of 50 min', suff='m', fmt='1dec'}},
			{'Damage for 400% Weapon Damage bonus:', {expr='4 ABSORB_CONVERSION sqrt / 2 ^'}},
			{'Damage for 50m radius:', {expr='50 ABSORB_RNG - 50 * 5 sqrt / 2 ^'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='6.5 DRAIN * 0 ASSIMILATE if', fmt='2dec'}}
		}
	},
	-- Oberon
	['Smite']={
		ins={
			{name='SMITE_INFUSION', cont=Tooltips.full('Smite Infusion', 'Mods')..'?', type='checkbox'},
			{name='SMITE_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Percentage damage to target:', {expr='STR 35 %of 50 75 SMITE_INFUSED if min', suff='%'}},
			{'AoE damage:', {expr='STR 10 %of 20 30 SMITE_INFUSED if min', suff='% of target\'s Health'}},
			{'Cast range:', {expr='RNG 50 %of', suff='m', fmt='1dec'}},
			{'AoE radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Smite Infusion '..Tooltips.full('Radiation', 'DamageTypes')..' damage bonus:', {expr='STR 100 %of 0 SMITE_INFUSION if', suff='%'}},
			{'Smite Infusion duration:', {expr='DUR 40 %of 0 SMITE_INFUSION if', suff='s'}},
			{'Smite Infusion radius:', {expr='RNG 15 %of 0 SMITE_INFUSION if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Hallowed Ground']={
		ins={
			{name='HALLOWED_ERUPTION', cont=Tooltips.full('Hallowed Eruption', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {name='HALLOWED_GROUND_BASE_DMG', expr='STR 100 %of'}},
			{'Duration:', {name='HALLOWED_GROUND_DURATION', expr='DUR 200 0 HALLOWED_ERUPTION if + 20 %of', suff='s'}},
			{'Radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Maximum Hallowed Eruption '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='HALLOWED_GROUND_BASE_DMG HALLOWED_GROUND_DURATION * 0 HALLOWED_ERUPTION if'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Renewal']={
		ins={
			{name='PHOENIX_RENEWAL', cont=Tooltips.full('Phoenix Renewal', 'Mods')..'?', type='checkbox'},
			{name='CURRENT_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='385'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' restored on cast:', {expr='STR 125 %of'}},
			{Tooltips.full('Health', 'Stats')..' restored over time:', {expr='STR 40 %of', suff='/s'}},
			{Tooltips.full('Armor', 'Stats')..' bonus to self:', {name='RENEWAL_ARMOR', expr='STR 50 %of 100 min', suff='%'}},
			{Tooltips.full('Armor', 'Stats')..' bonus to allies:', {expr='CURRENT_ARMOR RENEWAL_ARMOR as% 1 + * CURRENT_ARMOR - 2 *'}},
			{'[[Bleedout]] reduction:', {expr='DUR 45 %of 90 min', suff='%'}},
			{Tooltips.full('Health', 'Stats')..' restored on Phoenix Renewal:', {expr='STR 50 %of 100 min 0 PHOENIX_RENEWAL if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='3.5 DRAIN *', fmt='2dec'}}
		}
	},
	['Reckoning']={
		ins={
			{name='HALLOWED_RECKONING', cont=Tooltips.full('Hallowed Reckoning', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 60 %of 100 min', suff='%'}},
			{'Base '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 7500 %of'}},
			{'Added '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 750 %of', suff='/'..Tooltips.full('Confusion', 'DamageTypes')..' stack'}},
			{'Base '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 10 %of', suff='/enemy'}},
			{'Added '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 5 %of', suff='/'..Tooltips.full('Confusion', 'DamageTypes')..' stack'}},
			{Tooltips.full('Armor', 'Stats')..' bonus duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 40 0 HALLOWED_RECKONING if + 15 %of', suff='m', fmt='1dec'}},
			{'Hallowed Reckoning '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 300 %of 0 HALLOWED_RECKONING if', suff='/tick'}},
			{'Hallowed Reckoning '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 250 %of 0 HALLOWED_RECKONING if'}},
			{'Hallowed Reckoning radius:', {expr='RNG 40 + 3 %of 0 HALLOWED_RECKONING if', suff='m', fmt='1dec'}},
			{'Hallowed Reckoning area duration:', {expr='DUR 10 %of 0 HALLOWED_RECKONING if', suff='s'}},
			{'Hallowed Reckoning '..Tooltips.full('Armor', 'Stats')..' bonus duration:', {expr='DUR 3 %of 0 HALLOWED_RECKONING if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Octavia
	['Mallet']={
		ins={
			{name='PERCUSSION_COUNT', cont='Number of Percussive beats:', min='1', max='64', value='26'},
			{name='PARTITIONED_MALLET', cont=Tooltips.full('Partitioned Mallet', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Damage multiplier:', {expr='STR 2.5 %of', fmt='2dec'}},
			{'Stored damage decay:', {expr='PERCUSSION_COUNT mulin', suff='/beat', fmt='2%'}},
			{'Duration:', {expr='DUR 20 %of', suff='s'}},
			{'Base radius:', {name='MALLET_BASE_RADIUS', expr='80 100 PARTITIONED_MALLET if RNG 10 %of %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Amp', 'Ability')..' radius:', {expr='2 MALLET_BASE_RADIUS *', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Resonator']={
		ins={
			{name='BASS_COUNT', cont='Number of Bass beats:', min='1', max='64', value='18'}
		},
		outs={
			{Tooltips.full('Blast', 'DamageTypes')..' damage per loop:', {name='RESONATOR_FULL_DMG', expr='STR 125 %of', suff='/loop/enemy'}},
			{Tooltips.full('Blast', 'DamageTypes')..' damage per beat:', {expr='RESONATOR_FULL_DMG BASS_COUNT /', suff='/beat/enemy'}},
			{'Duration:', {expr='DUR 20 %of', suff='s'}},
			{'Minimum range:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'Maximum range:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Metronome']={
		outs={
			{Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 35 %of', suff='%'}},
			{'Vivace [[Movement Speed]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Opera [[Multishot]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Forte [[Melee Damage]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Metronome duration:', {expr='DUR 20 %of', suff='s'}},
			{'Vivace, Opera, Forte and Nocturne duration:', {expr='DUR 15 %of', suff='s'}},
			{'Radius:', {expr='RNG 12 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Amp']={
		outs={
			{'Minimum weapon damage bonus:', {expr='STR 25 %of', suff='%'}},
			{'Maximum weapon damage bonus:', {expr='STR 125 %of', suff='%'}},
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 14 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Oraxia
	["Mercy's Kiss"]={
		outs={
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 4000 %of'}},
			{'[[Health Orb]] chance on kill:', {expr='STR 2 %of', fmt='%'}},
			{'[[Energy Orb]] chance on kill:', {expr='STR 0.5 %of', fmt='%'}},
			{'Targeting range:', {expr='RNG 40 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Webbed Embrace']={
		ins={
			{name='WEBBED_EMBRACE_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 0.5 %of', fmt='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 6.67 10 WEBBED_EMBRACE_INFUSED if %of', suff='m', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	["Widow's Brood"]={
		ins={
			{name='SCUTTLER_LEVEL', cont='Scuttler level:', min='1', value='30'},
			{name='BROODS_OVERSURGE', cont=Tooltips.full("Brood's Oversurge", 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Dart '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Scuttler '..Tooltips.full('Toxin', 'DamageTypes')..' or '..Tooltips.full('Electricity', 'DamageTypes')..' damage:',
				{expr='SCUTTLER_LEVEL 1 - 1.55 ^ 0.015 * 1 + 50 *'}
			},
			{'Mark duration:', {expr='DUR 15 %of', suff='s', fmt='2dec'}},
			{'Scuttler Health drain:', {expr='1 SCUTTLER_DUR /', suff='/s', fmt='%'}},
			{'Maximum Scuttler lifetime:', {name='SCUTTLER_DUR', expr='DUR 45 %of', suff='s', fmt='2dec'}},
			{'Dart targeting range:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Oversurge '..Tooltips.full('Electricity', 'DamageTypes')..' damage:', {expr='STR 2000 %of 0 BROODS_OVERSURGE if'}},
			{'Oversurge radius:', {expr='RNG 5 %of 0 BROODS_OVERSURGE if', suff='m', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Silken Stride']={
		ins={
			{name='WALL_LATCHING', cont='[[Wall Latch]]ing?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' multiplier:', {expr='STR 2 %of', fmt='2dec'}},
			{Tooltips.full('Toxin', 'DamageTypes')..' [[Extra Hit]]:', {expr='STR 0.4 %of 2 1 WALL_LATCHING if *', fmt='%'}},
			{Tooltips.full('Toxin', 'DamageTypes')..' burst damage:', {expr='STR 500 %of'}},
			{'Burst radius:', {expr='RNG 5 %of', suff='m', fmt='2dec'}},
			{'Silken Thread range:', {expr='RNG 75 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='5 DRAIN *', fmt='2dec'}}
		}
	},
	-- Protea
	['Grenade Fan']={
		ins={
			{name='PROTEA_PASSIVE', cont='[[Protea/Abilities/Passive|Passive]] active?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 100 0 PROTEA_PASSIVE if + 500 %of', fmt='1dec'}},
			{Tooltips.full('Shield', 'Stats')..' restoration on attach:', {expr='STR 100 0 PROTEA_PASSIVE if + 500 %of', fmt='1dec'}},
			{Tooltips.full('Shield', 'Stats')..' restoration over time:', {expr='STR 100 0 PROTEA_PASSIVE if + 50 %of', suff='/s', fmt='1dec'}},
			{'Duration:', {expr='DUR 13 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		},
	},
	['Blaze Artillery']={
		ins={
			{name='PROTEA_PASSIVE', cont='[[Protea/Abilities/Passive|Passive]] active?', type='checkbox'},
			{name='TEMPORAL_ARTILLERY', cont='Turret attached by '..Tooltips.full('Temporal Artillery', 'Mods')..'?', type='checkbox'},
			{name='BLAZE_ARTILLERY_COMBO', cont='Current turret combo count:', min='1', value='1'}
		},
		outs={
			{'Base '..Tooltips.full('Heat', 'DamageTypes')..' damage:',
				{name='BLAZE_ARTILLERY_BASE_DMG', expr='STR 100 0 PROTEA_PASSIVE if + 500 %of', fmt='1dec'}
			},
			{Tooltips.full('Heat', 'DamageTypes')..' damage after multiplier:',
				{expr='20 BLAZE_ARTILLERY_COMBO BLAZE_ARTILLERY_COMBO 20 > TEMPORAL_ARTILLERY and if BLAZE_ARTILLERY_BASE_DMG *', fmt='1dec'}
			},
			{'Duration:', {expr='DUR 3 %of', suff='s', fmt='2dec'}},
			{'Targeting radius:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		},
	},
	['Dispensary']={
		ins={
			{name='REPAIR_DISPENSARY', cont=Tooltips.full('Repair Dispensary', 'Mods')..'?', type='checkbox'},
			{name='PROTEA_PASSIVE', cont=Tooltips.full('Protea', 'Warframes')..'\'s [[Protea/Abilities/Passive|passive]] active?', type='checkbox'},
			{name='DISPENSARY_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'Extra pickup chance:',
				{name='DISPENSARY_EXTRA_CHANCE', expr='STR 100 0 PROTEA_PASSIVE DISPENSARY_INFUSED not and if + 25 %of', suff='%'}
			},
			{'Duration:', {name='DISPENSARY_DURATION', expr='DUR 12.5 25 DISPENSARY_INFUSED if %of', suff='s', fmt='2dec'}},
			{'Expected number of empowered [[Health Orb]]s:',
				{expr='DISPENSARY_DURATION 2 - 8 6 REPAIR_DISPENSARY if / ceil DISPENSARY_EXTRA_CHANCE as% 1 + * 0 max', fmt='2dec'}
			},
			{'Expected number of [[Universal Ammo Pack]]s:',
				{expr='DISPENSARY_DURATION 4 - 8 6 REPAIR_DISPENSARY if / ceil DISPENSARY_EXTRA_CHANCE as% 1 + * 0 max', fmt='2dec'}
			},
			{'Expected number of [[Energy Orb]]s:',
				{expr='DISPENSARY_DURATION 6 - 8 6 REPAIR_DISPENSARY if / ceil DISPENSARY_EXTRA_CHANCE as% 1 + * 0 max', fmt='2dec'}
			},
			{'Expected number of Repair Dispensary pickups:',
				{expr='DISPENSARY_DURATION 8 - 8 / ceil DISPENSARY_EXTRA_CHANCE as% 1 + * 0 max 0 REPAIR_DISPENSARY if', fmt='2dec'}
			},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Temporal Anchor']={
		ins={
			{name='PROTEA_PASSIVE', cont='[[Protea/Abilities/Passive|Passive]] active?', type='checkbox'},
			{name='TEMPORAL_EROSION', cont=Tooltips.full('Temporal Erosion', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Percentage of damage recorded:', {expr='STR 100 0 PROTEA_PASSIVE if + 25 %of', suff='%'}},
			{'Duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{'Implosion radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{'Temporal Erosion '..Tooltips.full('Armor', 'Stats')..' reduction:',
				{expr='STR 100 0 PROTEA_PASSIVE if + 10 %of 0 TEMPORAL_EROSION if', suff='%'}
			},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Qorvex
	['Chyrinka Pillar']={
		outs={
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 1000 %of', suff='/pulse'}},
			{'Duration:', {expr='DUR 35 %of', suff='s', fmt='2dec'}},
			{'Empowerment duration:', {expr='DUR 5 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Containment Wall']={
		ins={
			{name='WRECKING_WALL', cont=Tooltips.full('Wrecking Wall', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Total '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 200 %of 7 *'}},
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 3500 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 25 %of', suff='%'}},
			{'Wall length:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'Defense reduction:', {expr='STR 50 %of 100 min 0 WRECKING_WALL if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Disometric Guard']={
		outs={
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Stacks gained on cast:', {expr='STR 5 %of floor'}},
			{'Maximum stack count:', {expr='STR 10 %of floor'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Crucible Blast']={
		ins={
			{name='FUSED_CRUCIBLE', cont=Tooltips.full('Fused Crucible', 'Mods')..'?', type='checkbox'},
			{name='FUSED_CRUCIBLE_DURATION', cont='Seconds spent channeling Fused Crucible:', min='0', value='0'}
		},
		outs={
			{'Beam '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 10000 %of', suff='/s'}},
			{'Explosion '..Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Explosion '..Tooltips.full('Radiation', 'DamageTypes')..' damage bonus:', {expr='STR 250 %of', suff='/'..Tooltips.full('Confusion', 'DamageTypes')..' stack'}},
			{'Beam length:', {expr='RNG 40 %of', suff='m', fmt='1dec'}},
			{'Explosion radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 100 FUSED_CRUCIBLE if COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='20 FUSED_CRUCIBLE_DURATION 0.5 * + DRAIN * 0 FUSED_CRUCIBLE if', fmt='2dec'}}
		}
	},
	-- Rhino
	['Rhino Charge']={
		ins={
			{name='RHINO_CHARGE_NUMBER', cont='Charge number:', type='range-R', min='1', max='3', value='1'},
			{name='IRONCLAD_CHARGE', cont=Tooltips.full('Ironclad Charge', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {name='RHINO_CHARGE_BASE_DMG', expr='STR 650 %of 2 RHINO_CHARGE_NUMBER 1 - ^ *'}},
			{Tooltips.full('Impact', 'DamageTypes')..' damage to enemies in'..Tooltips.full('Rhino Stomp', 'Ability')..':', {expr='RHINO_CHARGE_BASE_DMG 2 *'}},
			{'Combo window duration:', {expr='DUR 1 %of', suff='s', fmt='2dec'}},
			{'Charge distance:', {expr='RNG 12 %of RHINO_CHARGE_NUMBER 1 - 0.25 * 1 + *', suff='m', fmt='1dec'}},
			{'Impact radius:', {expr='RNG 2 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 50 %of 0 IRONCLAD_CHARGE if', suff='%/hit'}},
			{Tooltips.full('Armor', 'Stats')..' bonus duration:', {expr='DUR 10 %of 0 IRONCLAD_CHARGE if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST * 2 RHINO_CHARGE_NUMBER 1 - addin ^ *', fmt='2dec'}}
		}
	},
	['Iron Skin']={
		ins={
			{name='RHINO_ARMOR', cont='Current '..Tooltips.full('Armor', 'Stats')..':', min='0', value='240'},
			{name='IRON_SHRAPNEL', cont=Tooltips.full('Iron Shrapnel', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Base '..Tooltips.full('Overguard', 'DamageTypes')..':', {expr='STR 1200 2.5 RHINO_ARMOR * + %of'}},
			{'Iron Shrapnel radius:', {expr='RNG 8 %of 0 IRON_SHRAPNEL if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Roar']={
		ins={
			{name='PIERCING_ROAR', cont=Tooltips.full('Piercing Roar', 'Mods')..'?', type='checkbox'},
			{name='ROAR_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'[[Faction Damage Bonus]]:', {expr='STR 30 50 ROAR_INFUSED if %of', suff='%', fmt='1dec'}},
			{'Duration:', {expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 40 0 PIERCING_ROAR if + 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Weakened', 'DamageTypes')..' duration:', {expr='DUR 1 %of 10 * 0 PIERCING_ROAR if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Rhino Stomp']={
		outs={
			{Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 800 %of'}},
			{'Duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Sevagoth
	['Reap']={
		ins={
			{name='REAP_DMG_VULN', cont=Tooltips.full('Reap', 'Ability')..'\'s debuff?', type='checkbox'},
			{name='SOW_AND_REAP', cont='Sow&Reap?', type='checkbox'},
			{name='HOLD_CAST', cont='Hold Cast?', type='checkbox'},
			{name='AIMING', cont='Aiming?', type='checkbox'}
		},
		outs={
			{'[[Damage Vulnerability]]:', {name='DMG_VULN', expr='STR 50 %of', suff='%', fmt='1dec'}},
			{'Debuff duration:', {expr='DUR 10 %of', suff='s', fmt='1dec'}},
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 250 %of DMG_VULN 100 / 1 + 1 REAP_DMG_VULN if *'}},
			{Tooltips.full('True', 'DamageTypes')..' / '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='25 DMG_VULN 100 / 1 + 1 REAP_DMG_VULN if * 0 SOW_AND_REAP if', suff='% of current health'}},
			{'Shadow flight duration:', {expr='DUR 6 %of', suff='s', fmt='1dec'}},
			{'Shadow debuff radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Shadow flight speed:', {expr='10 2 1 HOLD_CAST if * 1.5 1 AIMING if *', suff='m/s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Sow']={
		ins={
			{name='REAP_DMG_VULN', cont=Tooltips.full('Reap', 'Ability')..'\'s debuff?', type='checkbox'},
			{name='SOW_AND_REAP', cont='Sow&Reap?', type='checkbox'},
			{name='DARK_PROPAGATION', cont=Tooltips.full('Dark Propagation', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('True', 'DamageTypes')..' damage:', {expr='STR 250 %of STR 50 %of 100 / 1 + 1 REAP_DMG_VULN if *', suff='/s'}},
			{Tooltips.full('True', 'DamageTypes')..' / '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='25 STR 50 %of 100 / 1 + 1 REAP_DMG_VULN if * 0 SOW_AND_REAP if', suff='% of current health'}},
			{'Duration:', {expr='DUR 10 %of', suff='s'}},
			{'Radius:', {expr='RNG 16 %of', suff='m', fmt='1dec'}},
			{'Spread radius', {expr='RNG 15 %of 0 DARK_PROPAGATION if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Gloom']={
		ins={
			{name='ENEMY_COUNT', cont='Enemies Inside Gloom:', type='range-R', min='0', max='10', default='1', value='1'}
		},
		outs={
			{Tooltips.full('Slow', 'DamageTypes')..':', {name='SLOW', expr='STR 35 %of 95 min', suff='%', fmt='2dec'}},
			{'Effective Slow:', {expr='100 100 SLOW - /', suff='x', fmt='2'}},
			{'Initial Radius:', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{'Max Radius:', {expr='RNG 16 %of', suff='m', fmt='1dec'}},
			{'Growth Rate:', {expr='DUR 2 %of RNG 1 %of *', suff='m/s', fmt='1dec'}},
			{'Time to reach Max Radius', {expr='6 1 DUR %of /', suff='s', fmt='1dec'}},
			{'Life Steal:', {expr='STR 5 %of', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='0.75 DRAIN * ENEMY_COUNT *', suff='/s', fmt='2dec'}}
		}
	},
	['Exalted Shadow']={
		ins={
			{name='MELEE_DMG_MOD', cont='[[Melee damage]] modifier:', type='number', default='100'},
			{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
			{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
			{name='MELEE_RANGE_MOD', cont='[[Melee range]] modifier:', type='number', default='0'},
			{name='COMBO_MULT', cont='[[Combo multiplier]]:', type='range-R', min='1', max='12', value='1'},
			{name='HEAVY_ATTACK', cont='Ground [[Melee#Heavy attack|Heavy Attack]]?', type='checkbox', default='false'},
			{name='REAP_DMG_VULN', cont=Tooltips.full('Reap', 'Ability')..'\'s debuff?', type='checkbox', default='false'},
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{name='BASE_DMG', expr='FACTION_DMG_MOD MELEE_DMG_MOD STR 250 %of %of %of COMBO_MULT * 9 1 HEAVY_ATTACK if *'}
			},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG ELEMENT_DMG + STR 50 %of 100 / 1 + 1 REAP_DMG_VULN if *'}},
			{'Range:', {expr='RNG 1.5 %of MELEE_RANGE_MOD +', suff='m', fmt='1dec'}},
		}
	},
	-- Sevagoth's Shadow
	['Embrace']={
		outs={
			{'Grab Duration:', {expr='DUR 8 %of', suff='s'}},
			{'Grab Radius:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Consume']={
		outs={
			{Tooltips.full('Health', 'Stats').. ' restored:', {expr='STR 0.25 %of STR 2500 %of *'}},
			{'Targeting distance:', {expr='RNG 14 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Death\'s Harvest']={
		outs={
			{'[[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%', fmt='2dec'}},
			{'Debuff duration:', {expr='DUR 10 %of', suff='s'}},
			{'Debuff radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	-- Sirius & Orion
	['Coronal Ejection']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 1500 %of'}},
			{'Status chance:', {expr='STR 100 %of', suff='%'}},
			{'Radius', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 15 *'}}
		}
	},
	['Gravitic Slash']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 1500 %of'}},
			{Tooltips.full('Armor', 'Stats')..'/'..Tooltips.full('Shield', 'Stats')..' reduction:', {expr='STR 50 %of', suff='%'}},
			{'Status chance:', {expr='STR 100 %of', suff='%'}},
			{'Radius', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 15 *'}}
		}
	},
	['Jade Stars']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Status chance:', {expr='STR 100 %of', suff='%'}},
			{'Buff duration', {expr='DUR 35 %of', suff='s'}},
			{'Explosion radius', {expr='RNG 4 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 50 *'}}
		}
	},
	['Astral Shell']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{'Decoy\'s '..Tooltips.full('Blast', 'DamageTypes')..':', {expr='STR 200 %of'}},
			{'Buff Duration:', {expr='DUR 35 %of', suff='s'}},
			{'Decoy Duration:', {expr='DUR 5 %of', suff='s'}},
			{'Explosion radius:', {expr='RNG 5 %of'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 50 *'}}
		}
	},
	['Light\'s Sanctuary']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{'Initial '..Tooltips.full('Health', 'Stats')..' restored:', {expr='STR 25 %of', suff='/s'}},
			{'Final '..Tooltips.full('Health', 'Stats')..' restored:', {expr='STR 55 %of', suff='/s'}},
			{'Initial '..[[Damage Reduction]]..':', {expr='STR 15 %of', suff='%'}},
			{'Final '..[[Damage Reduction]]..':', {expr='STR 45 %of 75 min', suff='%'}},
			{'Duration:', {expr='DUR 30 %of'}},
			{'Initial radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Final radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 50 *'}}
		}
	},
	['Event Horizon']={
		ins={
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 750 %of'}},
			{'Duration:', {expr='DUR 18 %of', suff='s', fmt='1dec'}},
			{'Bonus duration:', {expr='DUR 5 %of', suff='s', fmt='1dec'}},
			{'Radius:', {expr='RNG 8 %of', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 50 *'}}
		}
	},
	['Celestial Clash']={
		ins={
			{name='CONSTELLATION', cont='[[Sirius_%26_Orion/Abilities/Passive#Constellation Stars|Constellation Stars]] combo:', 
				type='range-R', min='0', max='7', default='0'},
			{name='SWITCH', cont='[[Sirius_%26_Orion/Abilities/Passive#Switching|Switching]] passive?', type='checkbox'},
		},
		outs={
			{'Average '..Tooltips.full('Heat', 'DamageTypes')..' or '.. Tooltips.full('Slash', 'DamageTypes')..' damage:', 
				{expr='STR 10000 %of CONSTELLATION 1.5 * 1 + * 0.5 CONSTELLATION * 1 + *'}},
			{'[[Critical Chance]]:', {expr='50 CONSTELLATION *', suff='%'}},
			{'Radius:', {expr='RNG 26 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='2 EFF 45 0 SWITCH if + 175 min 100 / - 100 *'}}
		}
	},
	-- Trinity
	['Well of Life']={
		ins={
			{name='POOL_OF_LIFE', cont=Tooltips.full('Pool of Life', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' recovered passively:', {expr='STR 100 %of', suff='/s'}},
			{'Damage to '..Tooltips.full('Health', 'Stats')..' conversion:', {expr='STR 1 %of', suff='%', fmt='2dec'}},
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Targeting range:', {expr='RNG 100 %of', suff='m', fmt='1dec'}},
			{'Well radius:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{'[[Energy Orb]] drop chance:', {expr='STR 100 %of 0 POOL_OF_LIFE if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Energy Vampire']={
		ins={
			{name='VAMPIRE_LEECH', cont=Tooltips.full('Vampire Leech', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Energy', 'Stats')..' restoration:', {name='ENERGY_VAMPIRE_PULSE', expr='STR 25 %of', suff='/pulse', fmt='2dec'}},
			{'Total '..Tooltips.full('Energy', 'Stats')..' restoration:', {expr='ENERGY_VAMPIRE_PULSE ENERGY_VAMPIRE_PULSE_NUMBER *', fmt='2dec'}},
			{Tooltips.full('True', 'DamageTypes')..' damage:', {expr='STR 6.25 %of', suff='% of current Health/pulse', fmt='2dec'}},
			{'Minimum Health threshold:', {expr='STR 25 %of', suff='% of maximum health', fmt='2dec'}},
			{'Duration:', {name='ENERGY_VAMPIRE_DUR', expr='DUR 9 %of', suff='s', fmt='2dec'}},
			{'Pulse interval:', {name='ENERGY_VAMPIRE_INTERVAL', expr='DUR 2.25 %of 2.25 min', suff='s', fmt='2dec'}},
			{'Number of pulses:', {name='ENERGY_VAMPIRE_PULSE_NUMBER', expr='ENERGY_VAMPIRE_DUR ENERGY_VAMPIRE_INTERVAL //'}},
			{'Targeting range:', {expr='RNG 100 %of', suff='m', fmt='1dec'}},
			{'Pulse radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{'Maximum '..Tooltips.full('Shield', 'Stats')..' restoration:', {expr='225 ENERGY_VAMPIRE_PULSE %of 0 VAMPIRE_LEECH if', suff='/pulse'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Link']={
		ins={
			{name='ABATING_LINK', cont=Tooltips.full('Abating Link', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Affected enemies:', {expr='STR 3 %of floor'}},
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 20 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 60 %of 100 min 0 ABATING_LINK if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Blessing']={
		ins={
			{name='CHAMPIONS_BLESSING', cont=Tooltips.full('Champion\'s Blessing', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' and '..Tooltips.full('Shield', 'Stats')..' restoration:', {expr='STR 80 %of 100 min', suff='%'}},
			{'[[Damage Reduction]]:', {expr='STR 50 %of 75 min', suff='%'}},
			{'Damage Reduction duration:', {expr='DUR 15 %of', suff='s', fmt='2dec'}},
			{'[[Critical Chance]] bonus duration:', {expr='DUR 30 %of 0 CHAMPIONS_BLESSING if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Uriel
	['Infernalis']={
		ins={
			{name='INFERNUM', cont=Tooltips.full('Infernum', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage on cast:', {name='INFERNALIS_CAST_BASE_DMG', expr='STR 1500 %of'}},
			{'Cast '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_CAST_BASE_DMG *'}},
			{Tooltips.full('Heat', 'DamageTypes')..' aura damage:', {name='INFERNALIS_AURA_BASE_DMG', expr='STR 250 %of', suff='/s'}},
			{'Aura '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_AURA_BASE_DMG *'}},
			{'Duration:', {expr='DUR 35 %of', suff='s'}},
			{'Aura radius:', {expr='RNG 2 %of', suff='m'}},
			{'Catenach chain damage:', {expr='STR 100 %of', suff='/s'}},
			{'Catenach chain '..Tooltips.full('Slow', 'DamageTypes')..':', {expr='STR 50 %of 95 min', suff='%'}},
			{'Catenach chain duration:', {expr='DUR 10 %of', suff='s'}},
			{'Catenach chain range:', {expr='RNG 6 %of', suff='m'}},
			{'Infernum '..Tooltips.full('Heat', 'DamageTypes')..' contact damage:', {expr='STR 1500 %of 0 INFERNUM if'}},
			{'Infernum '..Tooltips.full('Heat', 'DamageTypes')..' radial damage:', {name='INFERNALIS_INFERNUM_RADIAL_DMG', expr='STR 1500 %of 0 INFERNUM if'}},
			{'Infernum '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_INFERNUM_RADIAL_DMG *'}},
			{'Infernum empowerment duration:', {expr='DUR 5 %of 0 INFERNUM if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Remedium']={
		ins={
			{name='REMEDIUM_MAX_HEALTH', cont='Maximum '..Tooltips.full('Health', 'Stats'), default='666'},
			{name='REMEDIUM_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'Self healing percentage:', {name='REMEDIUM_HEALING', expr='STR 35 50 REMEDIUM_INFUSED if %of', suff='%'}},
			{'Self healing total:', {expr='REMEDIUM_HEALING REMEDIUM_MAX_HEALTH %of'}},
			{'Gulphagor latch damage:', {expr='0 STR 750 %of REMEDIUM_INFUSED if', suff='/tick'}},
			{'Latched target [[Health Orb]] drop chance:', {expr='0 STR 300 %of REMEDIUM_INFUSED if', suff='%'}},
			{'Latched target [[Energy Orb]] drop chance:', {expr='0 STR 100 %of REMEDIUM_INFUSED if', suff='%'}},
			{'Gulphagor '..Tooltips.full('Heat', 'DamageTypes')..' field damage:', {name='GULPHAGOR_FIELD_DMG', expr='0 STR 200 %of REMEDIUM_INFUSED if', suff='/tick'}},
			{'Gulphagor '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 GULPHAGOR_FIELD_DMG *'}},
			{'Gulphagor field duration:', {expr='0 DUR 10 %of REMEDIUM_INFUSED if', suff='s'}},
			{'Gulphagor field radius:', {expr='0 RNG 4 %of REMEDIUM_INFUSED if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Demonium']={
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%'}},
			{'Duration:', {expr='DUR 5 %of', suff='s'}},
			{'Explosion radius:', {expr='RNG 6 %of', suff='m'}},
			{'Vythelas Rune [[Fire Rate]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Vythelas Rune '..Tooltips.full('Heat', 'DamageTypes')..' damage bonus:', {expr='STR 30 %of', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Brimstone']={
		outs={
			{'Initial '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='BRIMSTONE_BASE_DMG', expr='STR 750 %of', suff='/tick'}},
			{'Initial '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 BRIMSTONE_BASE_DMG *'}},
			{'Maximum '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='BRIMSTONE_MAX_DMG', expr='10 BRIMSTONE_BASE_DMG *', suff='/tick'}},
			{'Maximum '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 BRIMSTONE_MAX_DMG *'}},
			{'Duration:', {expr='DUR 10 %of', suff='s'}},
			{'Radius:', {expr='RNG 15 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	-- Wisp
	['Reservoirs']={
		ins={
			{name='FUSED_RESERVOIR', cont=Tooltips.full('Fused Reservoir', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Mote buff duration:', {expr='DUR 30 %of', suff='s', fmt='2dec'}},
			{'Reservoir radius:', {expr='RNG 5 %of', suff='m', fmt='1dec'}},
			{'Vitality Mote maxmimum '..Tooltips.full('Health', 'Stats')..' bonus:', {expr='STR 300 %of'}},
			{'Vitality Mote '..Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 30 %of', suff='/s'}},
			{'Haste Mote [[Movement Speed]] bonus:', {expr='STR 0.2 %of', fmt='%'}},
			{'Haste Mote [[Attack Speed]] bonus:', {expr='STR 0.2 %of', fmt='%'}},
			{'Haste Mote [[Fire Rate]] bonus:', {expr='STR 0.3 %of', fmt='%'}},
			{'Shock Mote '..Tooltips.full('Electricity', 'DamageTypes')..' damage:', {expr='STR 10 %of'}},
			{'Shock Mote radius:', {expr='RNG 15 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {name='RESERVOIRS_COST', expr='25 COST *', fmt='2dec'}},
			{'Fused Reservoir '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='200 RESERVOIRS_COST %of 0 FUSED_RESERVOIR if', fmt='2dec'}}
		}
	},
	['Wil-O-Wisp']={
		outs={
			{'Duration:', {expr='DUR 4 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='35 COST *', fmt='2dec'}}
		}
	},
	['Breach Surge']={
		ins={
			{name='BREACH_SURGE_RESERVOIRS', cont='Cast on '..Tooltips.full('Reservoirs', 'Ability')..'?', type='checkbox'},
			{name='CRITICAL_SURGE', cont=Tooltips.full('Critical Surge', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Damage multiplier:', {expr='STR 2 %of', fmt='2dec'}},
			{Tooltips.full('Confusion', 'DamageTypes')..' Status Chance:', {expr='STR 0.2 %of', fmt='%'}},
			{Tooltips.full('Blind', 'DamageTypes')..' duration:', {expr='DUR 16 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 18 %of 2 1 BREACH_SURGE_RESERVOIRS if *', suff='m', fmt='1dec'}},
			{'Primary [[Critical Chance]] bonus:', {expr='STR 0.1 %of 0 BREACH_SURGE_RESERVOIRS CRITICAL_SURGE and if', suff='/m', fmt='%'}},
			{'Primary Critical Chance bonus duration:', {expr='DUR 9 %of 0 BREACH_SURGE_RESERVOIRS CRITICAL_SURGE and if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST * 0.5 1 BREACH_SURGE_RESERVOIRS CRITICAL_SURGE and if *', fmt='2dec'}}
		}
	},
	['Sol Gate']={
		ins={
			{name='SOL_GATE_BOOSTED', cont='Boosted?', type='checkbox'},
			{name='SOL_GATE_VITALITY', cont='Has Vitality Mote?', type='checkbox'},
			{name='SOL_GATE_SHOCK', cont='Has Shock Mote?', type='checkbox'},
			{name='CATACLYSMIC_GATE', cont=Tooltips.full('Cataclysmic Gate', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Beam base '..Tooltips.full('Heat', 'DamageTypes')..' or '..Tooltips.full('Radiation', 'DamageTypes')..' damage:',
				{
					name='SOL_GATE_BASE_DMG',
					expr=[[STR 1500 750 SOL_GATE_BOOSTED if %of
					1 0.25 0 SOL_GATE_VITALITY if
					0.25 0 SOL_GATE_SHOCK if + + *]],
					suff='/0.5s'
				}
			},
			{'Beam maxmimum damage:', {expr='1000 SOL_GATE_BASE_DMG %of', suff='/0.5s'}},
			{'Cataclysmic Gate blast '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 5000 %of 0 CATACLYSMIC_GATE if'}},
			{'Cataclysmic Gate lingering damage:', {expr='STR 500 %of 1 0.25 0 SOL_GATE_VITALITY SOL_GATE_SHOCK or if + * 0 CATACLYSMIC_GATE if', suff='/0.5s'}},
			{'Cataclysmic Gate duration:', {expr='DUR 10 %of 0 CATACLYSMIC_GATE if', suff='s', fmt='2dec'}},
			{'Cataclysmic Gate radius:', {expr='RNG 10 %of 0 CATACLYSMIC_GATE if', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='0 24 12 SOL_GATE_BOOSTED if DRAIN * CATACLYSMIC_GATE if', fmt='2dec'}}
		}
	},
	-- Zephyr
	['Tail Wind']={
		ins={
			{name='ZEPHYR_AIRBORNE', cont='Airborne?', type='checkbox'},
			{name='TAIL_WIND_HEIGHT', cont='Dive bomb height (meters):', min='0', value='0'},
			{name='TARGET_FIXATION_BONUS', cont=Tooltips.full('Target Fixation', 'Mods')..' damage bonus:', min='0', value='0', step='100'},
		},
		outs={
			{'Dash '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='TARGET_FIXATION_BONUS 100 + STR 750 %of %of'}},
			{'Dive bomb '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='TARGET_FIXATION_BONUS 100 + STR 4500 %of 0.2 TAIL_WIND_HEIGHT * 1 max * %of'}},
			{'Dash speed:', {expr='DUR 30 %of', suff='m/s', fmt='1dec'}},
			{'Initial dive bomb speed:', {expr='DUR 5 %of', suff='m/s', fmt='1dec'}},
			{'Dash contact radius:', {expr='RNG 2 %of', suff='m', fmt='1dec'}},
			{'Dive bomb radius:', {expr='RNG 7 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='12.5 25 ZEPHYR_AIRBORNE if COST *', fmt='2dec'}},
			{'Hover '..Tooltips.full('Energy', 'Stats')..' drain:', {expr='5 COST *', fmt='2dec'}}
		}
	},
	['Airburst']={
		ins={
			{name='ZEPHYR_AIRBORNE', cont='Airborne?', type='checkbox'},
			{name='AIRBURST_HITS', cont='Number of hits:', min='0', value='0'},
			{name='AIRBURST_ROUNDS', cont=Tooltips.full('Airburst Rounds', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..', '..Tooltips.full('Puncture', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:',
				{expr='100 35 AIRBURST_HITS * + STR 500 %of %of'}
			},
			{'Radius:', {expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Secondary weapon damage bonus:', {expr='AIRBURST_HITS STR 40 %of * 500 min 0 AIRBURST_ROUNDS if', suff='%'}},
			{'Secondary weapon damage bonus duration:', {expr='DUR 14 %of 0 AIRBURST_ROUNDS if', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 50 ZEPHYR_AIRBORNE if COST *', fmt='2dec'}}
		}
	},
	['Turbulence']={
		ins={
			{name='JET_STREAM', cont=Tooltips.full('Jet Stream', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Radius:', {expr='RNG 6 %of', suff='m', fmt='1dec'}},
			{'[[Movement Speed]] bonus:', {expr='STR 40 %of 0 JET_STREAM if', suff='%'}},
			{'[[Projectile Speed]] bonus:', {expr='STR 100 %of 0 JET_STREAM if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *', fmt='2dec'}}
		}
	},
	['Tornado']={
		outs={
			{'Damage:', {expr='STR 160 %of'}},
			{'Duration:', {expr='DUR 20 %of', suff='s', fmt='2dec'}},
			{'Spawn radius:', {expr='RNG 25 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *', fmt='2dec'}}
		}
	},
	-- Helminth
	['Empower']={
		outs={
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Infested Mobility']={
		outs={
			{'[[Sprint Speed]] bonus:', {expr='STR 60 %of', suff='%'}},
			{'[[Parkour Velocity]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Duration:', {expr='DUR 8 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	["Master's Summons"]={
		outs={
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Rebuild Shields']={
		outs={
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Perspicacity']={
		outs={
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Energized Munitions']={
		outs={
			{'Duration:', {expr='DUR 5 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Marked For Death']={
		outs={
			{'Damage percentage:', {expr='STR 75 %of 150 min', suff='%'}},
			{'Cast range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Explosion range:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Expedite Suffering']={
		outs={
			{'Damage multiplier:', {expr='STR 1 %of', fmt='2dec'}},
			{'Radius:', {expr='RNG 12 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Parasitic Armor']={
		outs={
			{Tooltips.full('Shield', 'Stats')..' to '..Tooltips.full('Armor', 'Stats')..' conversion:', {expr='STR 100 %of', suff='%'}},
			{'Duration:', {expr='DUR 25 %of', suff='s', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *', fmt='2dec'}}
		}
	},
	['Hideous Resistance']={
		outs={
			{'[[Status Effect]] immunity charges:', {expr='STR 10 %of', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Voracious Metastasis']={
		outs={
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 500 %of'}},
			{Tooltips.full('Energy', 'Stats')..' restoration to allies:', {expr='VORACIOUS_METASTASIS_COST', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {name='VORACIOUS_METASTASIS_COST', expr='50 COST *', fmt='2dec'}}
		}
	},
	['Sickening Pulse']={
		outs={
			{'Pulse duration:', {name='SICKENING_PULSE_DUR', expr='DUR 2 %of', suff='s', fmt='2dec'}},
			{'Initial pulse radius:', {name='SICKENING_PULSE_RNG', expr='RNG 8 %of', suff='m', fmt='1dec'}},
			{'Total pulse radius:', {expr='SICKENING_PULSE_RNG 20 SICKENING_PULSE_DUR * +', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
	['Golden Instinct']={
		outs={
			{'Radius:', {expr='RNG 200 %of', suff='m', fmt='2dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *', fmt='2dec'}}
		}
	},
};
return Data;
```

