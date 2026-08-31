---
title: "Module:DamageTypes"
wiki_url: "https://wiki.warframe.com/w/Module/DamageTypes"
wiki_timestamp: "2026-01-18T17:39:34Z"
---

**DamageTypes** contains all the damage types used in [WARFRAME](/w/WARFRAME "WARFRAME"), their health/armor class advantages, and status effects.

On this Wiki, DamageTypes is used in:

* [Module:Tooltips/data](/w/Module:Tooltips/data "Module:Tooltips/data")
* [Module:Tooltips/tip](/w/Module:Tooltips/tip "Module:Tooltips/tip")
* [Damage](/w/Damage "Damage") and its subpages

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
* [2 Icons](#Icons)
* [3 Documentation](#Documentation)
  + [3.1 Package items](#Package_items)
  + [3.2 Other items](#Other_items)
* [4 See Also](#See_Also)
* [5 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:DamageType|function|input1|input2|...}}`

### Template

`{{d|type name}}`

`{{d/img|type name}}`

`{{#invoke:DamageType|damagetable|type name}}`

`{{#invoke:DamageType|healthtable|type name}}`

## Icons

Against article background

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  
[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  
[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

Against flat light background (#ebebeb)

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  
[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  
[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

Against flat dark background (#0d1717)

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  
[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  
[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

Against flat dark monochrome background (#202020)

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  
[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  
[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

Against `navbox` table background

| Test | |
| --- | --- |
| Test | [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage") |
| Test | [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger") |
| Test | [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew") |
| Test | [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") |
| [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage") | |
| [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger") | |
| [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew") | |
| [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") | |

Against `wikitable` table background

| [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage") | |
| --- | --- |
| [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger") | |
| [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew") | |
| [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") | |
| Test | [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage") |
| Test | [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger") |
| Test | [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew") |
| Test | [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") |

Against infobox background

Test

[![](/images/thumb/Panel.png/300px-Panel.png?c8e2c)](/w/File:Panel.png)

Test

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  

[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

Test

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  

[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

Test

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  

[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

Test

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  

[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

Against T:AbilityU10.3 background

|  |  |  |  |
| --- | --- | --- | --- |
|  | [**1**](/w/Key_Bindings "Key Bindings") [**25**](/w/Ability_Efficiency "Ability Efficiency") | **[Slash Dash](/w/Slash_Dash "Slash Dash")**  Slash and dash through enemies alongside a radial specter. The powerful Exalted Blade's slashes inflict Slash Status.   ---   Introduced in [Vanilla](/w/Closed_Beta_Updates#Vanilla "Closed Beta Updates") (2012-10-25) | **[Strength](/w/Ability_Strength "Ability Strength"):**N/A |
| **[Duration](/w/Ability_Duration "Ability Duration"):**N/A |
| **[Range](/w/Ability_Range "Ability Range"):**N/A |
| **Misc**:  [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage")   [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger")  [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")  [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") |

**Weapon**

[![](/images/thumb/ExaltedBladeWeapon.png/200px-ExaltedBladeWeapon.png?654f4)](/w/File:ExaltedBladeWeapon.png)

:   *Main article: [Exalted Blade (Weapon)](/w/Exalted_Blade_(Weapon) "Exalted Blade (Weapon)")*

**Exalted Blade** is [![](/images/thumb/Excalibur_Thumb.png/32px-Excalibur_Thumb.png?97103)](/w/Excalibur "Excalibur") [Excalibur](/w/Excalibur "Excalibur"), [![](/images/thumb/ExcaliburPrime_Thumb.png/32px-ExcaliburPrime_Thumb.png?0ba1d)](/w/Excalibur/Prime "Excalibur/Prime") [Excalibur Prime](/w/Excalibur/Prime "Excalibur/Prime"), and [![](/images/thumb/ExcaliburUmbra_Thumb.png/32px-ExcaliburUmbra_Thumb.png?73c5c)](/w/Excalibur/Umbra "Excalibur/Umbra") [Excalibur Umbra](/w/Excalibur/Umbra "Excalibur/Umbra")'s signature [Exalted Weapon](/w/Exalted_Weapon "Exalted Weapon"), summoned by activating the [![](/images/thumb/ExaltedBladeIcon%28xWhite%29.png/32px-ExaltedBladeIcon%28xWhite%29.png?9b2ea)](/w/Exalted_Blade "Exalted Blade") [Exalted Blade](/w/Exalted_Blade "Exalted Blade"). The weapon exclusively uses the [![](/images/thumb/ExaltedBladeStanceMod.png/22px-ExaltedBladeStanceMod.png?3a36e)](/w/Exalted_Blade_(Stance) "Exalted Blade (Stance)") [Exalted Blade](/w/Exalted_Blade_(Stance) "Exalted Blade (Stance)") stance.

**Augment**

[![](/images/thumb/PurgingSlashMod.png/200px-PurgingSlashMod.png?f0e88)](/w/File:PurgingSlashMod.png)

:   *Main article: [Purging Slash](/w/Purging_Slash "Purging Slash")*

**Purging Slash** is a PvE and [Conclave](/w/Conclave "Conclave") [Warframe Augment Mod](/w/Warframe_Augment_Mod "Warframe Augment Mod") for [![](/images/thumb/Excalibur_Thumb.png/32px-Excalibur_Thumb.png?97103)](/w/Excalibur "Excalibur") [Excalibur](/w/Excalibur "Excalibur")'s [![](/images/thumb/SlashDashIcon%28xWhite%29.png/32px-SlashDashIcon%28xWhite%29.png?d1c9a)](/w/Slash_Dash "Slash Dash") [Slash Dash](/w/Slash_Dash "Slash Dash") that removes allies' [debuffs](/w/Status_Effect "Status Effect") and restores their [shields](/w/Shields "Shields") when Slash Dashed into.

| [Rank](/w/Mod#Mod_Rank "Mod") | Debuffs removed | % max shields restored | [Cost](/w/Mod#Attributes "Mod") |
| --- | --- | --- | --- |
| 0 | 1 | 70% | 6 |
| 1 | 2 | 70% | 7 |
| 2 | 3 | 70% | 8 |
| 3 | 4 | 70% | 9 |

---

[![](/images/thumb/SurgingDashMod.png/200px-SurgingDashMod.png?886ea)](/w/File:SurgingDashMod.png)

:   *Main article: [Surging Dash](/w/Surging_Dash "Surging Dash")*

**Surging Dash** is a [Warframe Augment Mod](/w/Warframe_Augment_Mod "Warframe Augment Mod") for [![](/images/thumb/Excalibur_Thumb.png/32px-Excalibur_Thumb.png?97103)](/w/Excalibur "Excalibur") [Excalibur](/w/Excalibur "Excalibur"), allowing each enemy hit by [![](/images/thumb/SlashDashIcon%28xWhite%29.png/32px-SlashDashIcon%28xWhite%29.png?d1c9a)](/w/Slash_Dash "Slash Dash") [Slash Dash](/w/Slash_Dash "Slash Dash") to add to the Warframe's [Melee Combo Counter](/w/Melee#Combo_Counter "Melee").

| [Rank](/w/Mod#Mod_Rank "Mod") | Combo Counter Increase | [Cost](/w/Mod#Attributes "Mod") |
| --- | --- | --- |
| 0 | 2 | 6 |
| 1 | 4 | 7 |
| 2 | 6 | 8 |
| 3 | 8 | 9 |

[![Expand/Collapse](/images/Expand%28xWhite%29.svg?c1073)](#Slash_Dash "Expand/Collapse")

Against `emodtable` table header background

| [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage")  [True](/w/Damage/True_Damage "Damage/True Damage")  [Void](/w/Damage/Void_Damage "Damage/Void Damage") |
| --- |
| [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage")  [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage")  [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")   [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage")  [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage")  [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage")  [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")   [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage")  [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage")  [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage")  [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage")  [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage")  [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")   [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage")  [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")   [Impair](/w/Impair "Impair")  [Knockdown](/w/Knockdown "Knockdown")  [Lifted](/w/Lifted "Lifted")  [Ragdoll](/w/Ragdoll "Ragdoll")  [Stagger](/w/Stagger "Stagger") |
| [Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  [Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  [Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  [Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew") |
| [Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  [Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object")  [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  [Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman") |
| Test |

Against T:Codex background

[CODEX](/w/Codex "Codex")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Impact](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Puncture](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Slash](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Cold](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Electricity](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Heat](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Toxin](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Blast](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosive](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Magnetic](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Radiation](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Viral](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Tau](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgTrueSmall64.png/32px-DmgTrueSmall64.png?e6aca)](/w/Damage/True_Damage "Damage/True Damage") [True](/w/Damage/True_Damage "Damage/True Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Void](/w/Damage/Void_Damage "Damage/Void Damage")

[![](/images/thumb/DmgImpactSmall64.png/32px-DmgImpactSmall64.png?27a4e)](/w/Damage/Impact_Damage "Damage/Impact Damage") [Knockback](/w/Damage/Impact_Damage "Damage/Impact Damage") [![](/images/thumb/DmgPunctureSmall64.png/32px-DmgPunctureSmall64.png?59103)](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [Weakened](/w/Damage/Puncture_Damage "Damage/Puncture Damage") [![](/images/thumb/DmgSlashSmall64.png/32px-DmgSlashSmall64.png?bab47)](/w/Damage/Slash_Damage "Damage/Slash Damage") [Bleed](/w/Damage/Slash_Damage "Damage/Slash Damage")  
[![](/images/thumb/DmgColdSmall64.png/32px-DmgColdSmall64.png?f2506)](/w/Damage/Cold_Damage "Damage/Cold Damage") [Freeze](/w/Damage/Cold_Damage "Damage/Cold Damage") [![](/images/thumb/DmgElectricitySmall64.png/32px-DmgElectricitySmall64.png?c23d9)](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [Tesla Chain](/w/Damage/Electricity_Damage "Damage/Electricity Damage") [![](/images/thumb/DmgHeatSmall64.png/32px-DmgHeatSmall64.png?60ae0)](/w/Damage/Heat_Damage "Damage/Heat Damage") [Ignite](/w/Damage/Heat_Damage "Damage/Heat Damage") [![](/images/thumb/DmgToxinSmall64.png/32px-DmgToxinSmall64.png?8dc5f)](/w/Damage/Toxin_Damage "Damage/Toxin Damage") [Poison](/w/Damage/Toxin_Damage "Damage/Toxin Damage")  
[![](/images/thumb/DmgBlastSmall64.png/32px-DmgBlastSmall64.png?7a683)](/w/Damage/Blast_Damage "Damage/Blast Damage") [Detonate](/w/Damage/Blast_Damage "Damage/Blast Damage") [![](/images/thumb/DmgCorrosiveSmall64.png/32px-DmgCorrosiveSmall64.png?9c1be)](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [Corrosion](/w/Damage/Corrosive_Damage "Damage/Corrosive Damage") [![](/images/thumb/DmgGasSmall64.png/32px-DmgGasSmall64.png?60ae0)](/w/Damage/Gas_Damage "Damage/Gas Damage") [Gas Cloud](/w/Damage/Gas_Damage "Damage/Gas Damage") [![](/images/thumb/DmgMagneticSmall64.png/32px-DmgMagneticSmall64.png?80be3)](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [Disrupt](/w/Damage/Magnetic_Damage "Damage/Magnetic Damage") [![](/images/thumb/DmgRadiationSmall64.png/32px-DmgRadiationSmall64.png?91a72)](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [Confusion](/w/Damage/Radiation_Damage "Damage/Radiation Damage") [![](/images/thumb/DmgViralSmall64.png/32px-DmgViralSmall64.png?8dc5f)](/w/Damage/Viral_Damage "Damage/Viral Damage") [Virus](/w/Damage/Viral_Damage "Damage/Viral Damage")  
[![](/images/thumb/DmgTauSmall64.png/32px-DmgTauSmall64.png?f7727)](/w/Damage/Tau_Damage "Damage/Tau Damage") [Status Vulnerability](/w/Damage/Tau_Damage "Damage/Tau Damage") [![](/images/thumb/DmgVoidSmall64.png/32px-DmgVoidSmall64.png?e62bb)](/w/Damage/Void_Damage "Damage/Void Damage") [Bullet Attractor](/w/Damage/Void_Damage "Damage/Void Damage")  
[![](/images/thumb/DmgImpairSmall64.png/32px-DmgImpairSmall64.png?6443b)](/w/Impair "Impair") [Impair](/w/Impair "Impair") [![](/images/thumb/Knockdown%28xBlack%29.png/32px-Knockdown%28xBlack%29.png?badc8)](/w/Knockdown "Knockdown") [Knockdown](/w/Knockdown "Knockdown") [![](/images/thumb/Lifted%28xBlack%29.png/32px-Lifted%28xBlack%29.png?6fcdf)](/w/Lifted "Lifted") [Lifted](/w/Lifted "Lifted") [![](/images/thumb/Ragdoll%28xBlack%29.png/31px-Ragdoll%28xBlack%29.png?8a87a)](/w/Ragdoll "Ragdoll") [Ragdoll](/w/Ragdoll "Ragdoll") [![](/images/MeleeStagger%28xBlack%29.png?479c4)](/w/Stagger "Stagger") [Stagger](/w/Stagger "Stagger")

[Tenno Shield](/w/Tenno_Shield "Tenno Shield") [Tenno Armor](/w/Tenno_Armor "Tenno Armor") [Tenno Flesh](/w/Tenno_Flesh "Tenno Flesh")  
[Cloned Flesh](/w/Cloned_Flesh "Cloned Flesh") [Ferrite Armor](/w/Ferrite_Armor "Ferrite Armor") [Alloy Armor](/w/Alloy_Armor "Alloy Armor") [Machinery](/w/Machinery "Machinery")  
[Shield](/w/Shield_(Health) "Shield (Health)") [Proto Shield](/w/Proto_Shield "Proto Shield") [Flesh](/w/Flesh "Flesh") [Robotic](/w/Robotic_(Health) "Robotic (Health)")  
[Infested](/w/Damage/Infested "Damage/Infested") [Infested Flesh](/w/Infested_Flesh "Infested Flesh") [Fossilized](/w/Fossilized "Fossilized") [Infested Sinew](/w/Infested_Sinew "Infested Sinew")

[Corpus](/w/Damage/Corpus "Damage/Corpus") [Corpus Amalgam](/w/Damage/Corpus_Amalgam "Damage/Corpus Amalgam") [Grineer](/w/Damage/Grineer "Damage/Grineer") [Infested](/w/Damage/Infested "Damage/Infested") [Infested Deimos](/w/Damage/Infested_Deimos "Damage/Infested Deimos")  
[Kuva Grineer](/w/Damage/Kuva_Grineer "Damage/Kuva Grineer") [Narmer](/w/Damage/Narmer "Damage/Narmer") [Object](/w/Damage/Object "Damage/Object") [![](/images/thumb/Overguard%28xWhite%29.png/32px-Overguard%28xWhite%29.png?1c220)](/w/Overguard "Overguard") [Overguard](/w/Overguard "Overguard") [Orokin](/w/Damage/Orokin "Damage/Orokin")  
[Scaldra](/w/Damage/Scaldra "Damage/Scaldra") [Sentient](/w/Damage/Sentient "Damage/Sentient") [Techrot](/w/Damage/Techrot "Damage/Techrot") [Tenno](/w/Damage/Tenno "Damage/Tenno") [The Murmur](/w/Damage/The_Murmur "Damage/The Murmur") [Zariman](/w/Damage/Zariman "Damage/Zariman")

## Documentation

### Package items

`damagetypes.iterationOrderArray` (table)
:   An array with damage elements in order to be iterated by as seen in the in-game arsenal.

`damagetypes.damageTypeModifierTable(dt)` (function)
:   Builds a damage type modifier table for a damage type. Used on [Template:DamageModifierTable](/w/Template:DamageModifierTable "Template:DamageModifierTable")
:   **Parameter**: `dt` Damage type (string)
:   **Returns**: A table of damage type modifiers of a damage type in wikitext (string)

`damagetypes.healthTable(ht)` (function)
:   Builds a damage type modifier table for a health or armor type.
:   **Parameter**: `ht` Health or armor type (string)
:   **Returns**: A table of damage type modifiers of health or armor type in wikitext (string)

`damagetypes.healthMod(ht)` (function)
:   Builds a damage type modifier list for a health or armor type.
:   **Parameter**: `ht` Health or armor type (string)
:   **Returns**: Damage type modifiers of health or armor type in wikitext (string)

### Other items

`procIcon(proc, size)` (function)
:   Returns the wikitext file link of a damage icon.
:   **Parameters**:

    * `proc` Damage type (string)
    * `size` Icon size (string; optional)
:   **Returns**: Resultant wikitext of image file (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [DamageTypes/colorContrastAdjuster](/w/Module:DamageTypes/colorContrastAdjuster "Module:DamageTypes/colorContrastAdjuster")
* [DamageTypes/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")
* [DamageTypes/data/doc](/w/Module:DamageTypes/data/doc "Module:DamageTypes/data/doc")
* [DamageTypes/doc](/w/Module:DamageTypes/doc "Module:DamageTypes/doc")
* [DamageTypes/testcases](/w/Module:DamageTypes/testcases "Module:DamageTypes/testcases")
* [DamageTypes/testcases/doc](/w/Module:DamageTypes/testcases/doc "Module:DamageTypes/testcases/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • M:DamageTypes ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
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
--- '''DamageTypes''' contains all the damage types used in [[WARFRAME]], their health/armor class advantages, and status effects.  

--  
--  On this Wiki, DamageTypes is used in:
--  * [[Module:Tooltips/data]]
--  * [[Module:Tooltips/tip]]
--  * [[Damage]] and its subpages
--  
--  @module     damagetypes
--  @alias      p
--  @author     [[User:Flaicher|Flaicher]]
--  @author     [[User:Gigamicro|Gigamicro]]
--  @image      DamageModBundleIcon.png
--  @require    [[Module:DamageTypes/data]]
--  @require    [[Module:Icon/data]]
--  @require    [[Module:Tooltips]]
--  @release    stable
--  

-- TODO: Invalid property value for background-color: hsl(). Fix or remove them entirely for a simplier
-- table format that is readable on both light and dark theme.
local p = {}

local DamageData = mw.loadData([[Module:DamageTypes/data]])
-- local Icon = mw.loadData([[Module:Icon/data]])
local Tooltips = require([[Module:Tooltips]])

--- An array with damage elements in order to be iterated by as seen in the in-game arsenal.
--  @table      p.iterationOrderArray
p.iterationOrderArray = {
    "Impact", "Puncture", "Slash",
    "Cold", "Electricity", "Heat", "Toxin",
    "Blast", "Corrosive", "Gas",
    "Magnetic", "Radiation", "Viral",
    "True", "Void", "Tau"
}

--- Returns the wikitext file link of a damage icon.
--  @function       procIcon
--  @param          {string} proc Damage type
--  @param[opt]     {string} size Icon size
--  @return         {string} Resultant wikitext of image file
function p.procIcon(proc, size)
    return string.format('[[File:Dmg%sSmall64.png|%s]]', proc, size or '16x16px')
end

--- Builds a damage type modifier table for a damage type. Used on [[Template:DamageModifierTable]]
--  @function       p.damageTypeModifierTable
--  @param          {string} dt Damage type
--  @return         {string} A table of damage type modifiers of a damage type in wikitext
function p.damageTypeModifierTable(frame)
    local dt = frame.args and (frame.args[1] or frame.args) or frame
    -- local dtb = DamageData["Types"][dt] -- apparently unused?
    local dtt = DamageData["total"][dt]
    local pc = dtt and Tooltips.full(dt, 'DamageTypes', dtt)
     or '[[File:Spacer.png|32px]] '..dt..''
    dtt=dtt or {}
    body = {
        '{| class="healthtable wikitable" style="width:100%; text-align:center; margin: 1em auto 1em auto; font-family:\'Roboto\';"\n',
        insert = table.insert
    }
    for _, v in ipairs(DamageData["dictionary"]["FactionOrder"]) do
        body:insert(([=[
! style="border-block-width: 2px; border-block-color: %s;" | %s Health
! style="border-block-width: 2px; border-block-color: %s;" | %s Modifier
]=]):format(
                DamageData["dictionary"]["Factions"][v][2][1],
                Tooltips.full(v, 'Factions'),
                DamageData["dictionary"]["Factions"][v][2][1],
                pc
            )
        )
    end--faction headers
    
    local count = 0
    for _, v in ipairs(DamageData["dictionary"]["Types"]) do
        count = count % 4 + 1
        if count == 1 then body:insert '\n|-' end
        local val = dtt[v[1]]
        body:insert('\n|')
        body:insert(Tooltips.full(v[1], 'DamageTypes'))
        body:insert('\n|')
        if val then
            body:insert(('+' or val < 0 and 'var(--negative-text-color);">' or 'var(--slight-dark-gray);" title="Bypasses">',
                    val == 0 and 'N/A' or val,
                    val == 0 and '' or '%'
                )
            )
        else
            body:insert('—')
        end
    end
    body:insert('\n|}')
    return table.concat(body)
end

--- Builds a damage type modifier table for a health or armor type.
--  @function       p.healthTable
--  @param          {string} ht Health or armor type
--  @return         {string} A table of damage type modifiers of health or armor type in wikitext
function p.healthTable(frame)
    local ht = frame.args and (frame.args[1] or frame.args) or frame
    local htb = DamageData["Health"][ht]
    local htt = DamageData["total"][ht] or {}
    local body = {
([=[{| class="healthtable wikitable" align="right" style="width:33.333%%; text-align:center; font-family:'Roboto';"
! border="1" colspan="2" style="border-style: solid; border-color: #000000; background-color: #000000;" | [[Damage/%s|%s]]
]=]):format(ht, ht),
        insert = table.insert
    }
    for _, v in ipairs(DamageData["dictionary"]["Health"]) do
        local val = htt[v[1]]
        body:insert(('\n|-\n| style="background-color: hsl(%s, %s%%);" | %s\n| style="background-color: hsl(%s, %s%%);" | ')
            :format(
                htb.Color, v[2], 
                Tooltips.full(v[1], 'DamageTypes'), 
                htb.Color, v[2]
            )
        )
        if val then
            body:insert(('%s')
                    :format(val == 0 and 'N/A' or '%+d%%')
                    :format(val > 0 and 'var(--positive-text-color)' or val == 0 and 'var(--slight-dark-gray)' or 'var(--negative-text-color)', val))
        else
            body:insert('—')
        end
    end
    body:insert '\n|}'
    return table.concat(body)
end

--- Builds a damage type modifier list for a health or armor type.
--  @function       p.healthMod
--  @param          {string} ht Health or armor type
--  @return         {string} Damage type modifiers of health or armor type in wikitext
function p.healthMod(frame)
    local ht = frame.args and (frame.args[1] or frame.args) or frame
    local htt = DamageData["total"][ht]
    if not htt then return '' end
    local body = {}
    for _, v in ipairs(DamageData["dictionary"]["Health"]) do
        local val = htt[v[1]]
        if val and val ~= 0 then
            table.insert(body, ('%s%s'):format(
                Tooltips.icon(v[1], 'DamageTypes', 'y'),
                val > 0 and 'var(--positive-text-color)' or val == 0 and 'var(--slight-dark-gray)' or 'var(--negative-text-color)',
                (val > 0 and '+' or val == 0 and 'x' or '−'):rep( math.ceil( math.abs(val) * 4e-2 ) )--  +++ ++ + x − −− −−−
            ))
        end
    end
    local rev = function(s)
        s = s:match('>[−+x]+'):sub(1, -8)--:gsub('',''):
        local sign = 0
        if s:find('+') then
            sign = 1
        elseif s:find('−') then
            sign = -1
        end
        return s:len() * sign
    end
    table.sort(body, function(a,b) return rev(a) < rev(b) end)
    return ''..table.concat(body, '  ')..''
end

return p
```

