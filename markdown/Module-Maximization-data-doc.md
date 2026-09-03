---
title: "Module:Maximization/data/doc"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data/doc"
wiki_timestamp: "2026-09-01T03:23:06Z"
---

Database for [maximization](/w/Maximization "Maximization") of [warframe](/w/Warframes "Warframes") stats and [abilities](/w/Abilities "Abilities").

## Ability Entry Schema

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=1 "Edit section's source code: Ability Entry Schema")]

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

Each ability's data should contain calculations of innate stats (e.g. energy, damage, DoTs), and kit interactions (i.e. passive, abilities, and augments of the original warframe). Adding calculations for third-party buffs would bloat calculators. If the ability can be [infused](/w/Infused "Infused"), add toggles for calculations of original kit interactions (e.g. [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") doing less [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") without [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash")'s passive) and do **not** add potential interactions with a new warframe.

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

## See Also

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=2 "Edit section's source code: See Also")]

Module:Maximization/data/doc

