---
title: "Module:Maximization/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data/doc"
wiki_timestamp: "2026-09-19T00:27:03Z"
---

## Contents

* [1 Ability Entry Schema](#Ability_Entry_Schema)
* [2 Style Guide](#Style_Guide)
* [3 See Also](#See_Also)

Database for [maximization](/w/Maximization "Maximization") of [warframe](/w/Warframes "Warframes") stats and [abilities](/w/Abilities "Abilities").

## Ability Entry Schema

[[edit page](/w/Module:Maximization/data/doc?action=edit&section=1 "Edit section's source code: Ability Entry Schema")]

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

[[edit page](/w/Module:Maximization/data/doc?action=edit&section=2 "Edit section's source code: Style Guide")]

1. Each ability's data should contain calculations of innate stats (e.g. energy, damage, [DoTs](/w/DoT "DoT")), and kit interactions (i.e. passive, abilities, and [augments](/w/Augments "Augments") of the original warframe). Adding calculations for third-party buffs would bloat calculators.
   * If the ability can be [infused](/w/Infused "Infused"), the calculator must contain toggles for original kit interactions (e.g. [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") doing less [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") without [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash")'s passive) and must **not** contain potential interactions with a new warframe.
   * Augment calculations should be present if any augment stat is affected by warframe stats or if the augment affects abilities, otherwise there is nothing to calculate.
   * Users are expected to manually apply [faction weakness](/w/Faction_weakness "Faction weakness") (shown in tooltips), enemy [damage reduction](/w/Damage_reduction "Damage reduction"), and other external factors.
2. The type of damage an ability does innately must be stated clearly (e.g. "[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") damage" for [![](/images/thumb/FreezeIcon%28xWhite%29.png/32px-FreezeIcon%28xWhite%29.png?73b01)](/w/Freeze "Freeze") [Freeze](/w/Freeze "Freeze")), same applies to procs (e.g. [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") is not the same as [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")).
3. Input and output text must clearly state the intent behind its value (e.g. "damage *bonus*" is additional damage %, "damage *modifier*" is total damage %, "damage" is exact damage).
4. Text for inputs with values should end in ":", text for checkbox inputs should end in "?" but written like a statement instead of a question.
5. If multiple ability blocks are invoked together, and some inputs or outputs represent the same concept but should not be synced or shadowed - you should rename them at the source, following the `NAME_WARFRAME_KEY` format.
   * For example: both [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") and [![](/images/thumb/BladeStormIcon%28xWhite%29.png/32px-BladeStormIcon%28xWhite%29.png?77430)](/w/Blade_Storm "Blade Storm") [Blade Storm](/w/Blade_Storm "Blade Storm") belong to [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash") and have base damage outputs (`BASE_DMG`). They were renamed `BASE_DMG_ASH_1` and `BASE_DMG_ASH_4`.

## See Also

[[edit page](/w/Module:Maximization/data/doc?action=edit&section=3 "Edit section's source code: See Also")]

Module:Maximization/data/doc

