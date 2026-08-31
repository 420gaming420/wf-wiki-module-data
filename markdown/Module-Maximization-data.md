---
title: "Module:Maximization/data"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data"
wiki_timestamp: "2026-08-31T09:06:54Z"
---

Database for [maximization](/w/Maximization "Maximization") of [Warframe](/w/Warframes "Warframes") stats and [abilities](/w/Abilities "Abilities").

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

## See Also

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=T-2 "Edit section's source code: See Also")]

[Module:Maximization/data/doc](/w/Module:Maximization/data/doc "Module:Maximization/data/doc")

---

```lua
local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end,};
local Data = {
	['Shuriken']={
		ins={
			{name='HEAD', type='checkbox', cont='Headshot?'},
			{name='ASH', type='checkbox', value='checked', cont="Ash's [[Ash/Abilities#Passive|passive]]?"},
			{cont='Shurikens:', name='SHURIKENS', type='range-R', min='1', max='5', value='1'},
		},
		outs={
			{'Base damage:' ,                                    {name='BASE_DMG', expr='ASH STR 750 %of 3 1 HEAD if * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG +'}},
			{Tooltips.full('Energy', 'Stats'),                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={},
		outs={
			{'Duration:', {expr='12 DUR *', suff='seconds'}},
			{'Radius:', {expr='10 RNG *', suff='meters'}},
			{Tooltips.full('Energy', 'Stats'), {expr='35 COST *'}},
		}
	}
};
return Data;
```

