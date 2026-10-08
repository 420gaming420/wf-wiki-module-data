---
title: "Module:Maximization/data"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data"
wiki_timestamp: "2026-10-07T17:54:40Z"
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
local AbilitySets = {};

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
		ins={},
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
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 75 GASEOUS_QUAKE if COST *'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='16 DRAIN * 1.2 GASEOUS_QUAKE_DURATION ^ * 0 GASEOUS_QUAKE if'}}
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
		ins={},
		outs={
			{Tooltips.full('Tau', 'DamageTypes')..' damage:', {expr='STR 2000 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 35 %of', suff='%'}},
			{'Radius:', {expr='RNG 22 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Lethal Progeny']={
		ins={},
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
		ins={},
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
		ins={},
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
		ins={},
		outs={
			{'Duration:', {expr='DUR 15 %of', suff='s'}},
			{'Propagation delay:', {expr='0.5 DUR as% /', suff='s', fmt='2dec'}},
			{'Cast range:', {expr='RNG 30 %of', suff='m', fmt='1dec'}},
			{'Propagation radius:', {expr='RNG 10 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		},
	},
	['Venari']={
		ins={},
		outs={
			{'Passive [[Movement Speed]] bonus:', {expr='STR 15 %of', suff='%'}},
			{'Snare '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {expr='STR 350 %of'}},
			{Tooltips.full('Health', 'Stats')..' restoration:', {expr='STR 50 %of', suff='/s'}},
			{'Mark '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
			{'Maximum revive '..Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Strangledome']={
		ins={},
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
		ins={},
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
	-- Narin
	['Neote']={
		ins={},
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
		ins={},
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
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='3.5 DRAIN *'}}
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
			{'Stored damage decay:', {expr='PERCUSSION_COUNT mulin 100 *', suff='%/beat', fmt='2dec'}},
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
		ins={},
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
		ins={},
		outs={
			{'Minimum weapon damage bonus:', {expr='STR 25 %of', suff='%'}},
			{'Maximum weapon damage bonus:', {expr='STR 125 %of', suff='%'}},
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 14 %of', suff='m', fmt='1dec'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Sevagoth
	['Reap']={
		ins={
			{name='DAMAGE_VULNERABILITY', cont=Tooltips.full('Reap', 'Ability')..' debuff?', type='checkbox'},
			{name='HOLD_CAST', cont='Hold Cast?', type='checkbox'},
			{name='AIMING', cont='Aiming?', type='checkbox'}
		},
		outs={
			{'[[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%'}},
			{'Debuff duration:', {expr='DUR 10 %of', suff='s'}},
			{Tooltips.full('Radiation', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'Shadow flight duration:', {expr='DUR 6 %of', suff='s'}},
			{'Shadow debuff radius:', {expr='RNG 8 %of', suff='m'}},
			{'Shadow flight speed:', {expr='20 10 HOLD_CAST if', suff='m/s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Sow']={
		ins={
			{name='DAMAGE_VULNERABILITY', cont=Tooltips.full('Reap', 'Ability')..' debuff?', type='checkbox'},
		},
		outs={
			{Tooltips.full('True', 'DamageTypes')..' damage:', {expr='STR 250 %of', suff='/s'}},
			{'Duration:', {expr='DUR 10 %of', suff='s'}},
			{'Radius:', {expr='RNG 16 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Gloom']={
		ins={
			{name='ENEMY_COUNT', cont='Enemies:', type='range-R', min='0', max='10', default='1'}
		},
		outs={
			{Tooltips.full('Slow', 'DamageTypes')..':', {expr='STR 35 %of', suff='%'}},
			{'Max Radius:', {expr='RNG 16 %of', suff='m'}},
			{'Initial Radius:', {expr='RNG 4 %of', suff='m'}},
			{'Growth Rate:', {expr='DUR 2 %of', suff='m/s'}},
			{'Life Steal:', {expr='STR 5 %of', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='ENEMY_COUNT 0.75 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
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
		ins={},
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
		ins={},
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
};
return Data;
```

