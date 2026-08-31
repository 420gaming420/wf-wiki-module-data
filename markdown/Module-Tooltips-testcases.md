---
title: "Module:Tooltips/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Tooltips/testcases"
wiki_timestamp: "2022-09-07T19:21:50Z"
---

**The tooltips only work on non-Module pages; see [here](/w/Module:Tooltips/testcases/doc "Module:Tooltips/testcases/doc") for such**

|  |  |
| --- | --- |
| Test suite status | Failed |
| Scribunto test cases | 1/50 |
| Code coverage | 8/11 |

**Unit test report for [Tooltips](/w/Module:Tooltips "Module:Tooltips").**

* `Execution time: 96.5 ms`
* `Test cases failing:`
  + `full`
  + `getTip`
  + `icon`
* `Test members missing:`
  + `_cleanTable`
  + `_source`
  + `icontext`

## Scribunto test cases

| `p.full`0/14 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Failing | ```lua {{#invoke:tooltips|full}} ``` | Error  p.full(): No name provided | **[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: Where is <nil>?** | error |
| Failing | ```lua {{#invoke:tooltips|full|Shuriken|Ability}} ``` | [Shuriken](/w/Shuriken "Shuriken") [Shuriken](/w/Shuriken "Shuriken") | [Shuriken](/w/Shuriken "Shuriken") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Scorch|Mods}} ``` | [Scorch (Mod)](/w/Scorch_(Mod) "Scorch (Mod)") [Scorch](/w/Scorch_(Mod) "Scorch (Mod)") | [Scorch](/w/Scorch_(Mod) "Scorch (Mod)") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Scorch|Mods|noicon=true}} ``` | [Scorch (Mod)](/w/Scorch_(Mod) "Scorch (Mod)")[Scorch](/w/Scorch_(Mod) "Scorch (Mod)") | [Scorch](/w/Scorch_(Mod) "Scorch (Mod)") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Volt|Warframes}} ``` | [Volt](/w/Volt "Volt") [Volt](/w/Volt "Volt") | [Volt](/w/Volt "Volt") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Volt}} ``` | [Volt](/w/Volt "Volt") [Volt](/w/Volt "Volt") | **[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: Where is "[Volt](/w/Volt "Volt")"?** | 3 "`p`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|full|Axi A7|Void}} ``` | [Axi A7](/w/Axi_A7 "Axi A7") [Axi A7](/w/Axi_A7 "Axi A7") | [Axi A7](/w/Axi_A7 "Axi A7") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Braton Prime|Weapons}} ``` | [Braton Prime](/w/Braton_Prime "Braton Prime") [Braton Prime](/w/Braton_Prime "Braton Prime") | [Braton Prime](/w/Braton_Prime "Braton Prime") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Arcane Warmth|Arcane}} ``` | [Arcane Warmth](/w/Arcane_Warmth "Arcane Warmth") [Arcane Warmth](/w/Arcane_Warmth "Arcane Warmth") | [Arcane Warmth](/w/Arcane_Warmth "Arcane Warmth") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Artemis Bow|}} ``` | [Artemis Bow](/w/Artemis_Bow "Artemis Bow") [Artemis Bow](/w/Artemis_Bow "Artemis Bow") | **[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: Where is "[Artemis Bow](/w/Artemis_Bow "Artemis Bow")"?** | 3 "`p`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|full|Artemis Bow|Weapons}} ``` | [Artemis Bow (Weapon)](/w/Artemis_Bow_(Weapon) "Artemis Bow (Weapon)") [Artemis Bow](/w/Artemis_Bow_(Weapon) "Artemis Bow (Weapon)") | [Artemis Bow](/w/Artemis_Bow_(Weapon) "Artemis Bow (Weapon)") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Artemis Bow|Ability}} ``` | [Artemis Bow](/w/Artemis_Bow "Artemis Bow") [Artemis Bow](/w/Artemis_Bow "Artemis Bow") | [Artemis Bow](/w/Artemis_Bow "Artemis Bow") | 7 "`s`" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|full|Warframes}} ``` | [Warframes](/w/Warframes "Warframes") | **[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: Where is "[Warframes](/w/Warframes "Warframes")"?** | 3 "`p`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|full|Railjack}} ``` | [Railjack](/w/Railjack "Railjack") | **[Tooltip](/w/Module:Tooltips "Module:Tooltips") error: Where is "[Railjack](/w/Railjack "Railjack")"?** | 3 "`p`" vs. "`t`" |

| `p.getTip`1/13 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Passing | ```lua {{#invoke:tooltips|getTip}} ``` | Error  p.getTip(): No name provided | Error  p.getTip(): No name provided |  |
| Failing | ```lua {{#invoke:tooltips|getTip|Shuriken|Ability}} ``` | |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  | | --- | --- | --- | --- | --- | |  |  | 25   1 |  | Ash Launches a spinning blade of pain, dealing high damage and impaling enemies to walls. | | | |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  | | --- | --- | --- | --- | --- | |  |  | 25    1 |  | Shuriken (Ash)  Launches a spinning blade of pain, dealing high damage and impaling enemies to walls. | | | 47 "`T`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Scorch|Mods}} ``` | [File:ScorchModU145.png](/w/Special:Upload?wpDestFile=ScorchModU145.png "File:ScorchModU145.png") |  | 17 "`U`" vs. "`.`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Volt|Warframes}} ``` | |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  | | --- | | 0 | |  | | |  |  | | --- | --- | | Health 100 (300) | Armor 100 | | Shield 150 (450) | Energy 100 (150) | | Polarities  |  | | | | |  | | |  | | --- | | Discharge  Speed  Shock  Electric Shield | | | | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  | | --- | | 0 | |  | | |  |  | | --- | --- | | Playstyle Damage | | | Health 270 (370) | Armor 105 | | Shield 455 (555) | Energy 100 (150) | | Aura Pol | Exilus Pol | | Polarities | | | |  | | |  | | --- | | Shock  Speed  Electric Shield  Discharge | | | | 11 "`T`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Volt}} ``` |  | Error  M:Tooltips.getTip(): Missing tooltip gen script for source "<nil>" | error |
| Failing | ```lua {{#invoke:tooltips|getTip|Axi A7|Void}} ``` | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  |  | | --- | --- | |  | Akstiletto Prime | | Receiver | |  | Braton Prime | | Blueprint | |  | Carrier Prime | | Systems | |  | Forma | | Blueprint | |  | Fragor Prime | | Blueprint | |  | Ash Prime | | Systems Blueprint | | | | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  |  | | --- | --- | |  | Akstiletto Prime Receiver | |  | Braton Prime Blueprint | |  | Carrier Prime Systems | |  | 2 X Forma Blueprint | |  | Fragor Prime Blueprint | |  | Ash Prime Systems Blueprint | | **Vaulted** | | | Introduced: **[Hotfix 26.0.8](/w/Update_26#Hotfix_26.0.8 "Update 26") (2019-11-19)** | | | | | 11 "`T`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Braton Prime|Weapons}} ``` | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  | | --- | | 8  4 | |  | | |  |  | | --- | --- | | Slot Primary | Trigger Auto | | |  | | |  |  |  |  | | --- | --- | --- | --- | | Normal | | | | | 1.75 | 12.25 | 21 | | 35 ( 60%) | | | | | |  | | |  |  | | --- | --- | | Crit 12% | 2x | Status 26% | | Fire Rate 9.58/s | Multishot 1 | | |  | | |  |  | | --- | --- | | Reload 2.15 | Ammo 75 / 600 | | Polarities None | | | | | Error  attempt to index local 'slot' (a nil value) | error |
| Failing | ```lua {{#invoke:tooltips|getTip|Arcane Warmth|Arcane}} ``` | |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | |  | | --- | |  | |  | | Arcane Warmth | |  | | Rank 5: Passive +102% chance to resist a Cold Damage effect | | | |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  | | --- | |  | |  | | Arcane Warmth | |  | | |  | | --- | | Type  Warframe | | Dissolution   14 | | |  | | |  | | --- | | **Rank 5:** +102% chance to resist a Cold Status effect. | | | | 3 "" vs. "`c`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Artemis Bow|}} ``` |  | Error  M:Tooltips.getTip(): Missing tooltip gen script for source "" | error |
| Failing | ```lua {{#invoke:tooltips|getTip|Artemis Bow|Weapons}} ``` | |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | | |  | | --- | | 0  × | |  | | |  |  | | --- | --- | | Slot Primary | Trigger Charge | | |  | | |  |  |  |  | | --- | --- | --- | --- | | Base Charged Shot | | | | | 33.6 | 192 | 14.4 | | 240 × 7 = 1680 ( 80%) | | | | | |  | | |  |  | | --- | --- | | Crit 25% | 2x | Status 20% | | Charge Time 1 s | Multishot 7 | | |  | | |  |  | | --- | --- | | Reload 0.9 | Ammo 1 / inf | | Polarities | | | | | Error  attempt to index local 'slot' (a nil value) | error |
| Failing | ```lua {{#invoke:tooltips|getTip|Artemis Bow|Ability}} ``` | |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  | | --- | --- | --- | --- | --- | |  |  | 50   4 |  | Ivara Summon a mighty bow and unleash a volley of devastating arrows. | | | |  |  |  |  |  |  | | --- | --- | --- | --- | --- | --- | | |  |  |  |  |  | | --- | --- | --- | --- | --- | |  |  | 50    4 |  | Artemis Bow (Ivara)  Summon a mighty bow and unleash a volley of devastating arrows. | | | 47 "`T`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|getTip|Warframes}} ``` | |  |  | | --- | --- | | |  | | --- | | The **Warframe** is an advanced weapons system used exclusively by the [Tenno](/w/Tenno "Tenno") in their missions throughout the [Origin System](/w/Star_Chart "Star Chart"). The Warframes possess [regenerative shields](/w/Shield "Shield"), [greatly enhanced mobility](/w/Maneuvers "Maneuvers"), and the use of an array of [supernatural abilities](/w/Abilities "Abilities") – all of which further augment the Tenno's deadly use of traditional combat arts. | | | Error  M:Tooltips.getTip(): Missing tooltip gen script for source "<nil>" | error |
| Failing | ```lua {{#invoke:tooltips|getTip|Railjack}} ``` |  | Error  M:Tooltips.getTip(): Missing tooltip gen script for source "<nil>" | error |

| `p.icon`0/23 | | | | |
| --- | --- | --- | --- | --- |
| Status | Code | Expected | Actual | Differs at |
| Failing | ```lua {{#invoke:tooltips|icon}} ``` | Error  p.icon(): No name provided | <strong class="error scribunto-error" title="pp(func): source is nil. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is <nil>?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | error |
| Failing | ```lua {{#invoke:tooltips|icon|Shuriken|Ability}} ``` | <span class="tooltip" data-param="Shuriken" data-param2="Ability">[[File:Shuriken130xDark.png|19px|link=Shuriken]]</span> | <span class="tooltip tooltip-full " data-param-name="Shuriken" data-param-source="Ability" aria-label="Tooltip for Shuriken">[[File:ShurikenIcon(xWhite).png|x32px|link=Shuriken|class=icon notpageimage light-invert]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Scorch|Mods}} ``` | <span class="tooltip" data-param="Scorch" data-param2="Mods">[[File:Mod\_TT\_20px.png|12px|link=Scorch (Mod)]]</span> | <span class="tooltip tooltip-full " data-param-name="Scorch" data-param-source="Mods" aria-label="Tooltip for Scorch">[[File:ScorchMod.png|x32px|link=Scorch (Mod)|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Volt|Warframes}} ``` | <span class="tooltip" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]</span> | <span class="tooltip tooltip-full " data-param-name="Volt" data-param-source="Warframes" aria-label="Tooltip for Volt">[[File:Volt\_Thumb.png|x32px|link=Volt|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Volt}} ``` | <span class="tooltip" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]</span> | <strong class="error scribunto-error" title="pp(func): source is nil. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Volt]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 3 "`p`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|icon|Axi A7|Void}} ``` | <span class="tooltip" data-param="Axi A7" data-param2="Void">[[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]]</span> | <span class="tooltip tooltip-full " data-param-name="Axi A7" data-param-source="Void" aria-label="Tooltip for Axi A7">[[File:AxiRelicIntact.png|x32px|link=Axi A7|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Braton Prime|Weapons}} ``` | <span class="tooltip" data-param="Braton Prime" data-param2="Weapons">[[File:BratonPrime.png|x19px|link=Braton Prime]]</span> | <span class="tooltip tooltip-full " data-param-name="Braton Prime" data-param-source="Weapons" aria-label="Tooltip for Braton Prime">[[File:BratonPrime.png|x32px|link=Braton Prime|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Arcane Warmth|Arcane}} ``` | <span class="tooltip" data-param="Arcane Warmth" data-param2="Arcane">[[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]]</span> | <span class="tooltip tooltip-full " data-param-name="Arcane Warmth" data-param-source="Arcane" aria-label="Tooltip for Arcane Warmth">[[File:ArcaneWarmth.png|x32px|link=Arcane Warmth|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow}} ``` | <span class="tooltip" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]</span> | <strong class="error scribunto-error" title="pp(func): source is nil. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Artemis Bow]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 3 "`p`" vs. "`t`" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow|Weapons}} ``` | <span class="tooltip" data-param="Artemis Bow" data-param2="Weapons">[[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]]</span> | <span class="tooltip tooltip-full " data-param-name="Artemis Bow" data-param-source="Weapons" aria-label="Tooltip for Artemis Bow">[[File:ArtemisBowWeapon.png|x32px|link=Artemis Bow (Weapon)|class=icon notpageimage]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow|Ability}} ``` | <span class="tooltip" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]</span> | <span class="tooltip tooltip-full " data-param-name="Artemis Bow" data-param-source="Ability" aria-label="Tooltip for Artemis Bow">[[File:ArtemisBowIcon(xWhite).png|x32px|link=Artemis Bow|class=icon notpageimage light-invert]]</span> | 21 "`"`" vs. "" |
| Failing | ```lua {{#invoke:tooltips|icon|Warframes}} ``` |  | <strong class="error scribunto-error" title="pp(func): source is nil. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Warframes]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 1 "" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Railjack}} ``` |  | <strong class="error scribunto-error" title="pp(func): source is nil. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Railjack]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 1 "" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Shuriken|Ability|false}} ``` | [[File:Shuriken130xDark.png|19px|link=Shuriken]] | <span class="tooltip tooltip-full " data-param-name="Shuriken" data-param-source="Ability" aria-label="Tooltip for Shuriken">[[File:ShurikenIcon(xWhite).png|x32px|link=Shuriken|class=icon notpageimage light-invert]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Scorch|Mods|false}} ``` | [[File:Mod\_TT\_20px.png|12px|link=Scorch (Mod)]] | <span class="tooltip tooltip-full " data-param-name="Scorch" data-param-source="Mods" aria-label="Tooltip for Scorch">[[File:ScorchMod.png|x32px|link=Scorch (Mod)|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Volt|Warframes|false}} ``` | [[File:VoltIcon272.png|19px|link=Volt]] | <span class="tooltip tooltip-full " data-param-name="Volt" data-param-source="Warframes" aria-label="Tooltip for Volt">[[File:Volt\_Thumb.png|x32px|link=Volt|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Volt||false}} ``` | [[File:VoltIcon272.png|19px|link=Volt]] | <strong class="error scribunto-error" title="pp(func): source is string. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Volt]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Axi A7|Void|false}} ``` | [[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]] | <span class="tooltip tooltip-full " data-param-name="Axi A7" data-param-source="Void" aria-label="Tooltip for Axi A7">[[File:AxiRelicIntact.png|x32px|link=Axi A7|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Braton Prime|Weapons|false}} ``` | [[File:BratonPrime.png|x19px|link=Braton Prime]] | <span class="tooltip tooltip-full " data-param-name="Braton Prime" data-param-source="Weapons" aria-label="Tooltip for Braton Prime">[[File:BratonPrime.png|x32px|link=Braton Prime|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Arcane Warmth|Arcane|false}} ``` | [[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]] | <span class="tooltip tooltip-full " data-param-name="Arcane Warmth" data-param-source="Arcane" aria-label="Tooltip for Arcane Warmth">[[File:ArcaneWarmth.png|x32px|link=Arcane Warmth|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow||false}} ``` | [[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]] | <strong class="error scribunto-error" title="pp(func): source is string. stack traceback: [C]: in function 'pcall' Module:TestHarness:449: in function '?' Module:TestHarness:867: in function Module:TestHarness:856 (tail call): ? (tail call): ? [C]: in function 'pcall' mw.lua:609: in function mw.lua:578 [C]: ?">[[Module:Tooltips|Tooltip]] error: Where is "[[Artemis Bow]]"?</strong>[[Category:Pages with script errors]][[Category:Pages with tooltip errors]] | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow|Weapons|false}} ``` | [[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]] | <span class="tooltip tooltip-full " data-param-name="Artemis Bow" data-param-source="Weapons" aria-label="Tooltip for Artemis Bow">[[File:ArtemisBowWeapon.png|x32px|link=Artemis Bow (Weapon)|class=icon notpageimage]]</span> | 1 "`[`" vs. "`<`" |
| Failing | ```lua {{#invoke:tooltips|icon|Artemis Bow|Ability|false}} ``` | <[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]] | <span class="tooltip tooltip-full " data-param-name="Artemis Bow" data-param-source="Ability" aria-label="Tooltip for Artemis Bow">[[File:ArtemisBowIcon(xWhite).png|x32px|link=Artemis Bow|class=icon notpageimage light-invert]]</span> | 2 "`[`" vs. "`s`" |

---

```lua
--  
-- use =p.getTip('',''):gsub('\n',"\\n'..\n\t\t\t\t'") in the console
return {
    full = {
        options = {
            mode = 'invocation',
            nowiki = false,
        },
        tests = {
            { '',  'p.full(): No name provided', {err = true} },
            { 'Shuriken|Ability', '[[Shuriken]][[File:Shuriken130xDark.png|19px|link=Shuriken]] [[Shuriken|Shuriken]]' },
            { 'Scorch|Mods', '[[Scorch (Mod)]][[File:Mod_TT_20px.png|12px|link=Scorch (Mod)]] [[Scorch (Mod)|Scorch]]' },
            { 'Scorch|Mods|noicon=true', '[[Scorch (Mod)]][[Scorch (Mod)|Scorch]]' },
            { 'Volt|Warframes', '[[Volt]][[File:VoltIcon272.png|19px|link=Volt]] [[Volt|Volt]]' },
            { 'Volt', '[[Volt]][[File:VoltIcon272.png|19px|link=Volt]] [[Volt|Volt]]' },
            { 'Axi A7|Void', '[[Axi A7]][[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]] [[Axi A7|Axi A7]]' },
            { 'Braton Prime|Weapons', '[[Braton Prime]][[File:BratonPrime.png|x19px|link=Braton Prime]] [[Braton Prime|Braton Prime]]' },
            { 'Arcane Warmth|Arcane', '[[Arcane Warmth]][[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]] [[Arcane Warmth|Arcane Warmth]]' },
            { 'Artemis Bow|', '[[Artemis Bow]][[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]] [[Artemis Bow|Artemis Bow]]' },
            { 'Artemis Bow|Weapons', '[[Artemis Bow (Weapon)]][[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]] [[Artemis Bow (Weapon)|Artemis Bow]]' },
            { 'Artemis Bow|Ability', '[[Artemis Bow]][[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]] [[Artemis Bow|Artemis Bow]]' },
            { 'Warframes', '[[Warframes|Warframes]]' },
            { 'Railjack', '[[Railjack|Railjack]]' },
        },
    },
    icon = {
        options = {
            mode = 'invocation',
            nowiki = true,
        },
        tests = {
            { '',  'p.icon(): No name provided', {err = true} },
            { 'Shuriken|Ability', '[[File:Shuriken130xDark.png|19px|link=Shuriken]]', },
            { 'Scorch|Mods', '[[File:Mod_TT_20px.png|12px|link=Scorch (Mod)]]', },
            { 'Volt|Warframes', '[[File:VoltIcon272.png|19px|link=Volt]]', },
            { 'Volt', '[[File:VoltIcon272.png|19px|link=Volt]]', },
            { 'Axi A7|Void', '[[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]]', },
            { 'Braton Prime|Weapons', '[[File:BratonPrime.png|x19px|link=Braton Prime]]', },
            { 'Arcane Warmth|Arcane', '[[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]]', },
            { 'Artemis Bow', '[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]', },
            { 'Artemis Bow|Weapons', '[[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]]', },
            { 'Artemis Bow|Ability', '[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]', },
            { 'Warframes', '', },
            { 'Railjack', '', },

            { 'Shuriken|Ability|false', '[[File:Shuriken130xDark.png|19px|link=Shuriken]]', },
            { 'Scorch|Mods|false', '[[File:Mod_TT_20px.png|12px|link=Scorch (Mod)]]', },
            { 'Volt|Warframes|false', '[[File:VoltIcon272.png|19px|link=Volt]]', },
            { 'Volt||false', '[[File:VoltIcon272.png|19px|link=Volt]]', },
            { 'Axi A7|Void|false', '[[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]]', },
            { 'Braton Prime|Weapons|false', '[[File:BratonPrime.png|x19px|link=Braton Prime]]', },
            { 'Arcane Warmth|Arcane|false', '[[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]]', },
            { 'Artemis Bow||false', '[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]', },
            { 'Artemis Bow|Weapons|false', '[[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]]', },
            { 'Artemis Bow|Ability|false', '<[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]', },
        },
    },
    getTip = {
        options = {
            mode = 'invocation',
            nowiki = false,
        },
        tests = {
            { '', 'p.getTip(): No name provided', {err = true} },
            { 'Shuriken|Ability', [=[

{| class="Tooltip" style="font-family:'Roboto';"|-
|style="padding:0px;"|
{| class="Sub" style="width:500px;"|-
| class="Spacer" style="padding:0;"| [[File:ShurikenModx256.png|130px]]
| class="Spacer"|
| class="Data" style="line-height:20px; text-align:center; width:64px; padding:2px;"|[[File:Shuriken130xDark.png|48px]]  

[[File:EnergyIcon32x.png|18px]]

25

  

1

| class="Spacer"|
| class="Data" style="font-size:13px; line-height:16px; padding:2px 3px 2px 3px; white-space:normal;"|Ash  
Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.
|}
|}

]=] },
            { 'Scorch|Mods', '[[File:ScorchModU145.png|192px]]', },
            { 'Volt|Warframes', [=[
{| class="Tooltip" |-
|style="padding:0;"|

{| class="Sub" |-
| class="Image" style="height:120px; padding-bottom:0;" | [[File:VoltIcon272.png|120px]]

[[File:MasteryAffinity64.png|28px]]

0

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="TableHalf" |Health 100 (300)
| class="TableHalf" |Armor 100 
|-
| class="TableHalf" |Shield 150 (450)
| class="TableHalf" |Energy 100 (150)
|-
| style="text-align:center;" colspan=2 |Polarities [[File:Madurai_Pol.svg|20px|class=icon]] | [[File:Spacer.png|20px|class=icon]] | [[File:Naramon_Pol.svg|20px|class=icon]][[File:Madurai_Pol.svg|20px|class=icon]]
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="Data" style="padding:4px; text-align:left;"|[[File:Discharge130xDark.png|30px]] Discharge  
[[File:Speed130xDark.png|30px]] Speed  
[[File:Shock130xDark.png|30px]] Shock  
[[File:ElectricShield130xDark.png|30px]] Electric Shield
|}
|}

|}]=] },
            { 'Volt', ''},
            { 'Axi A7|Void', [=[
{| class="Tooltip"
|-
|style="padding:0px;"|
{| class="Relic Sub"
|-
|class="Data"|
{|
| rowspan=2 class="Image" | [[File:GenericGunPrimeReceiver.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | Akstiletto Prime
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | Receiver
|-
| rowspan=2 class="Image" | [[File:BratonPrime.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | Braton Prime
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | Blueprint
|-
| rowspan=2 class="Image" | [[File:systems.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#9C7344;" | Carrier Prime
|-
| class = "gradientText" style = "vertical-align:top; color:#9C7344;" | Systems
|-
| rowspan=2 class="Image" | [[File:Forma2.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D3D3D3;" | Forma
|-
| class = "gradientText" style = "vertical-align:top; color:#D3D3D3;" | Blueprint
|-
| rowspan=2 class="Image" | [[File:FragorPrime.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D3D3D3;" | Fragor Prime
|-
| class = "gradientText" style = "vertical-align:top; color:#D3D3D3;" | Blueprint
|-
| rowspan=2 class="Image" | [[File:PrimeSystems.png|81px]]
| class = "gradientText" style = "vertical-align:bottom; color:#D1B962;" | Ash Prime
|-
| class = "gradientText" style = "vertical-align:top; color:#D1B962;" | Systems Blueprint
|}
|}
|}]=] },
            { 'Braton Prime|Weapons', [=[

{| class="Tooltip Main"
|-
|style="padding:0px;"|

{| class="Sub"
|-
| class="Image" style="height:120px;" |

[[File:BratonPrime.png|160px]]

[[File:MasteryAffinity64.png|28px]]

8

[[File:RivenIcon64.png|28px]]

4

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Slot Primary
| class="TableHalf" |Trigger Auto
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | Normal
|-
| style="padding-right:4px;" |[[File:DmgImpactSmall64.png|16x16px]] 1.75|| style="padding-right:4px;" |[[File:DmgPunctureSmall64.png|16x16px]] 12.25|| style="padding-right:4px;" |[[File:DmgSlashSmall64.png|16x16px]] 21
|-
| colspan=4 |35 ([[File:DmgSlashSmall64.png|16x16px]] 60%)
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Crit 12% | 2x
| class="TableHalf" |Status 26%
|-
| class="TableHalf" |Fire Rate 9.58/s
| class="TableHalf" |Multishot 1
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Reload 2.15
| class="TableHalf" |Ammo 75 / 600
|-
| style="text-align:center;" colspan=2 |Polarities None
|-
|}
|}

|}

]=] },
            { 'Arcane Warmth|Arcane', [=[
{| class="Tooltip"
|-
| style="padding:0px;"|
{| class="Sub"
|-
| class="Image"| [[File:ArcaneWarmth.png|160px]]
|-
| class="Spacer"|
|-
! class="Title"|Arcane Warmth
|-
| class="Spacer"|
|-
| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"|Rank 5: Passive  
+102% chance to resist a Cold Damage effect
|}
|-
|}]=] },
            { 'Artemis Bow|', ''},
            { 'Artemis Bow|Weapons', [=[

{| class="Tooltip Main"
|-
|style="padding:0px;"|

{| class="Sub"
|-
| class="Image" style="height:120px;" |

[[File:ArtemisBowWeapon.png|160px]]

[[File:MasteryAffinity64.png|28px]]

0

[[File:RivenIcon64.png|28px]]

×

|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Slot Primary
| class="TableHalf" |Trigger Charge
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | Base Charged Shot
|-
| style="padding-right:4px;" |[[File:DmgImpactSmall64.png|16x16px]] 33.6|| style="padding-right:4px;" |[[File:DmgPunctureSmall64.png|16x16px]] 192|| style="padding-right:4px;" |[[File:DmgSlashSmall64.png|16x16px]] 14.4
|-
| colspan=4 |240 × 7 = 1680 ([[File:DmgPunctureSmall64.png|16x16px]] 80%)
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Crit 25% | 2x
| class="TableHalf" |Status 20%
|-
| class="TableHalf" |Charge Time 1 s
| class="TableHalf" |Multishot 7
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |Reload 0.9
| class="TableHalf" |Ammo 1 / inf
|-
| style="text-align:center;" colspan=2 |Polarities [[File:Madurai_Pol.svg|20px|class=icon]][[File:Madurai_Pol.svg|20px|class=icon]][[File:Naramon_Pol.svg|20px|class=icon]]
|-
|}
|}

|}

]=] },
            { 'Artemis Bow|Ability', [=[

{| class="Tooltip" style="font-family:'Roboto';"|-
|style="padding:0px;"|
{| class="Sub" style="width:500px;"|-
| class="Spacer" style="padding:0;"| [[File:ArtemisBowModx256.png|130px]]
| class="Spacer"|
| class="Data" style="line-height:20px; text-align:center; width:64px; padding:2px;"|[[File:ArtemisBow130xDark.png|48px]]  

[[File:EnergyIcon32x.png|18px]]

50

  

4

| class="Spacer"|
| class="Data" style="font-size:13px; line-height:16px; padding:2px 3px 2px 3px; white-space:normal;"|Ivara  
Summon a mighty bow and unleash a volley of devastating arrows.
|}
|}

]=] },
            { 'Warframes',
                '

\n{| class="Tooltip Main"\n|-\n|style="padding:0px;"|

\n'
                ..'{| class="Sub"\n|-\n| class="Data" style="width:100px;white-space:inherit;padding:2px;line-height:normal;" |'
                ..'The \'\'\'Warframe\'\'\' is an advanced weapons system used exclusively by the [[Tenno]] in their missions throughout the [[Star Chart|Origin System]]. The Warframes possess [[Shield|regenerative shields]], [[Maneuvers|greatly enhanced mobility]], and the use of an array of [[Abilities|supernatural abilities]] – all of which further augment the Tenno\'s deadly use of traditional combat arts.'
                ..'\n|}\n

\n|}\n

'},
            { 'Railjack', ''},
        },
    },
}
```

