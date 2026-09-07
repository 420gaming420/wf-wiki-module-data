---
title: "Module:Maximization/data"
wiki_url: "https://wiki.warframe.com/w/Module/Maximization/data"
wiki_timestamp: "2026-09-06T22:00:11Z"
---

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

Each ability's data should contain calculations of innate stats (e.g. energy, damage, DoTs), and kit interactions (i.e. passive, abilities, and augments of the original warframe). Adding calculations for third-party buffs would bloat calculators.

* If the ability can be [infused](/w/Infused "Infused"), add toggles for calculations of original kit interactions (e.g. [![](/images/thumb/ShurikenIcon%28xWhite%29.png/32px-ShurikenIcon%28xWhite%29.png?f2322)](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") doing less [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage") without [![](/images/thumb/Ash_Thumb.png/32px-Ash_Thumb.png?db305)](/w/Ash "Ash") [Ash](/w/Ash "Ash")'s passive) and do **not** add potential interactions with a new warframe.
* If multiple ability blocks are invoked together on a public page long-term, and some inputs represent the same thing but should not be synced - you should rename them at the source in the `INPUT_WARFRAME_KEY` format.

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

## See Also

[[edit source](/w/Module:Maximization/data/doc?action=edit&section=T-2 "Edit section's source code: See Also")]

[Module:Maximization/data/doc](/w/Module:Maximization/data/doc "Module:Maximization/data/doc")

---

```lua
local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end,};
local Data = {
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='WEAK_TO_SLASH', cont='Enemy is weak to '..Tooltips.full('Slash', 'DamageTypes')..'?', type='checkbox'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Base damage:' ,                                    {name='BASE_DMG', expr='STR 750 %of HEAD_MULT * SHURIKENS * 1.5 1 WEAK_TO_SLASH if *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats'),                   {expr='25 COST *'}},
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
			{Tooltips.full('Energy', 'Stats'), {expr='35 COST *'}},
		}
	},
	['Teleport']={
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats'), {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins={
			{name='MELEE_DMG_BONUS', cont='[[Melee damage]] modifier:', type='number', default='100'},
			{name='FINISHER_DMG_BONUS', cont='[[Finisher damage]] modifier:', type='number', default='100'},
			{name='COMBO_MULTI', cont='[[Combo multiplier]]', type='range-R', min='1', max='12', value='1'},
			{name='IS_INVISIBLE', cont='Is Ash [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {expr=[[
				MELEE_DMG_BONUS FINISHER_DMG_BONUS
				STR 1500 %of %of %of COMBO_MULTI *
			]]}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Bonus Combo:', {expr='STR 4 %of RISING_STORM *', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats'), {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	}
};
return Data;
```

