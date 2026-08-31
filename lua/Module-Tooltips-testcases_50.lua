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
            { 'Shuriken|Ability', '<span style="display:none">[[Shuriken]]</span><span class="tooltip mobile-hidden" data-param="Shuriken" data-param2="Ability">[[File:Shuriken130xDark.png|19px|link=Shuriken]]&nbsp;[[Shuriken|<span style="border-bottom:1px dotted;">Shuriken</span>]]</span>' },
            { 'Scorch|Mods', '<span style="display:none">[[Scorch (Mod)]]</span><span class="tooltip mobile-hidden" data-param="Scorch" data-param2="Mods">[[File:Mod_TT_20px.png|12px|link=Scorch (Mod)]]&nbsp;[[Scorch (Mod)|<span style="border-bottom:1px dotted;">Scorch</span>]]</span>' },
            { 'Scorch|Mods|noicon=true', '<span style="display:none">[[Scorch (Mod)]]</span><span class="tooltip mobile-hidden" data-param="Scorch" data-param2="Mods">[[Scorch (Mod)|<span style="border-bottom:1px dotted;">Scorch</span>]]</span>' },
            { 'Volt|Warframes', '<span style="display:none">[[Volt]]</span><span class="tooltip mobile-hidden" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]&nbsp;[[Volt|<span style="border-bottom:1px dotted;">Volt</span>]]</span>' },
            { 'Volt', '<span style="display:none">[[Volt]]</span><span class="tooltip mobile-hidden" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]&nbsp;[[Volt|<span style="border-bottom:1px dotted;">Volt</span>]]</span>' },
            { 'Axi A7|Void', '<span style="display:none">[[Axi A7]]</span><span class="tooltip mobile-hidden" data-param="Axi A7" data-param2="Void">[[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]]&nbsp;[[Axi A7|<span style="border-bottom:1px dotted;">Axi&nbsp;A7</span>]]</span>' },
            { 'Braton Prime|Weapons', '<span style="display:none">[[Braton Prime]]</span><span class="tooltip mobile-hidden" data-param="Braton Prime" data-param2="Weapons">[[File:BratonPrime.png|x19px|link=Braton Prime]]&nbsp;[[Braton Prime|<span style="border-bottom:1px dotted;">Braton&nbsp;Prime</span>]]</span>' },
            { 'Arcane Warmth|Arcane', '<span style="display:none">[[Arcane Warmth]]</span><span class="tooltip mobile-hidden" data-param="Arcane Warmth" data-param2="Arcane">[[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]]&nbsp;[[Arcane Warmth|<span style="border-bottom:1px dotted;">Arcane&nbsp;Warmth</span>]]</span>' },
            { 'Artemis Bow|', '<span style="display:none">[[Artemis Bow]]</span><span class="tooltip mobile-hidden" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]&nbsp;[[Artemis Bow|<span style="border-bottom:1px dotted;">Artemis&nbsp;Bow</span>]]</span>' },
            { 'Artemis Bow|Weapons', '<span style="display:none">[[Artemis Bow (Weapon)]]</span><span class="tooltip mobile-hidden" data-param="Artemis Bow" data-param2="Weapons">[[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]]&nbsp;[[Artemis Bow (Weapon)|<span style="border-bottom:1px dotted;">Artemis&nbsp;Bow</span>]]</span>' },
            { 'Artemis Bow|Ability', '<span style="display:none">[[Artemis Bow]]</span><span class="tooltip mobile-hidden" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]&nbsp;[[Artemis Bow|<span style="border-bottom:1px dotted;">Artemis&nbsp;Bow</span>]]</span>' },
            { 'Warframes', '<span class="tooltip" data-param="Warframes" data-param2="">[[Warframes|<span style="border-bottom:1px dotted;">Warframes</span>]]</span>' },
            { 'Railjack', '<span class="tooltip" data-param="Railjack" data-param2="">[[Railjack|<span style="border-bottom:1px dotted;">Railjack</span>]]</span>' },
        },
    },
    icon = {
        options = {
            mode = 'invocation',
            nowiki = true,
        },
        tests = {
            { '',  'p.icon(): No name provided', {err = true} },
            { 'Shuriken|Ability', '<span class="tooltip" data-param="Shuriken" data-param2="Ability">[[File:Shuriken130xDark.png|19px|link=Shuriken]]</span>', },
            { 'Scorch|Mods', '<span class="tooltip" data-param="Scorch" data-param2="Mods">[[File:Mod_TT_20px.png|12px|link=Scorch (Mod)]]</span>', },
            { 'Volt|Warframes', '<span class="tooltip" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]</span>', },
            { 'Volt', '<span class="tooltip" data-param="Volt" data-param2="Warframes">[[File:VoltIcon272.png|19px|link=Volt]]</span>', },
            { 'Axi A7|Void', '<span class="tooltip" data-param="Axi A7" data-param2="Void">[[File:VoidRelicGoldIcon64.png|x19px|link=Axi A7]]</span>', },
            { 'Braton Prime|Weapons', '<span class="tooltip" data-param="Braton Prime" data-param2="Weapons">[[File:BratonPrime.png|x19px|link=Braton Prime]]</span>', },
            { 'Arcane Warmth|Arcane', '<span class="tooltip" data-param="Arcane Warmth" data-param2="Arcane">[[File:ArcaneWarmth64x.png|23px|link=Arcane Warmth]]</span>', },
            { 'Artemis Bow', '<span class="tooltip" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]</span>', },
            { 'Artemis Bow|Weapons', '<span class="tooltip" data-param="Artemis Bow" data-param2="Weapons">[[File:ArtemisBowWeapon.png|x19px|link=Artemis Bow (Weapon)]]</span>', },
            { 'Artemis Bow|Ability', '<span class="tooltip" data-param="Artemis Bow" data-param2="Ability">[[File:ArtemisBow130xDark.png|19px|link=Artemis Bow]]</span>', },
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
<div style="display:inline-block;">
{| class="Tooltip" style="font-family:'Roboto';"|-
|style="padding:0px;"|
{| class="Sub" style="width:500px;"|-
| class="Spacer" style="padding:0;"| [[File:ShurikenModx256.png|130px]]
| class="Spacer"|
| class="Data" style="line-height:20px; text-align:center; width:64px; padding:2px;"|[[File:Shuriken130xDark.png|48px]]<br/><div style="display:inline-block; margin: 4px 2px 8px 2px;"><div style="display:inline-block; position:relative; top:-2px;">[[File:EnergyIcon32x.png|18px]]</div> <span style="font-size:14px; font-weight:bold;">25</span></div><br><div style="display:inline-block;"><span style="position:relative;background-color:#272727;color:white;padding:1px 4px;border:2px solid #aaadb4;border-radius:5px;font-size:12px;">1</span></div>
| class="Spacer"|
| class="Data" style="font-size:13px; line-height:16px; padding:2px 3px 2px 3px; white-space:normal;"|<span style="font-weight:bold; font-size:15px;">Ash</span><br/>Launches a spinning blade of pain, dealing high damage and impaling enemies to walls.
|}
|}</div>]=] },
            { 'Scorch|Mods', '[[File:ScorchModU145.png|192px]]', },
            { 'Volt|Warframes', [=[
{| class="Tooltip" |-
|style="padding:0;"|
<div style="position:relative;">
{| class="Sub" |-
| class="Image" style="height:120px; padding-bottom:0;" | [[File:VoltIcon272.png|120px]]<div style="position:absolute;top:6px; left:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:MasteryAffinity64.png|28px]]<div style="position:absolute;top:4px; left:9.5px;">0</div></div>
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="TableHalf" |<span class="LinkText">Health</span>&nbsp;100 (300)
| class="TableHalf" |<span class="LinkText">Armor</span>&nbsp;100 
|-
| class="TableHalf" |<span class="LinkText">Shield</span>&nbsp;150 (450)
| class="TableHalf" |<span class="LinkText">Energy</span>&nbsp;100 (150)
|-
| style="text-align:center;" colspan=2 |<span class="LinkText">Polarities</span>&nbsp;[[File:Madurai_Pol.svg|20px|class=icon]] | [[File:Spacer.png|20px|class=icon]] | [[File:Naramon_Pol.svg|20px|class=icon]][[File:Madurai_Pol.svg|20px|class=icon]]
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;" |-
| class="Data" style="padding:4px; text-align:left;"|[[File:Discharge130xDark.png|30px]] Discharge<br/>[[File:Speed130xDark.png|30px]] Speed<br/>[[File:Shock130xDark.png|30px]] Shock<br/>[[File:ElectricShield130xDark.png|30px]] Electric Shield
|}
|}
</div>
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
<div style="display:inline-block;">
{| class="Tooltip Main"
|-
|style="padding:0px;"|<div style="position:relative;">
{| class="Sub"
|-
| class="Image" style="height:120px;" | <div style="position:relative; z-index:2;">[[File:BratonPrime.png|160px]]</div><div style="position:absolute;top:6px; left:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:MasteryAffinity64.png|28px]]<div style="position:absolute;top:3.5px;left:9.5px">8</div></div><div style="position:absolute;top:6px; right:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:RivenIcon64.png|28px]]<div style="position:absolute;top:3.5px; right:9.5px;">4</div></div>
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |<span class="LinkText">Slot</span>&nbsp;Primary
| class="TableHalf" |<span class="LinkText">Trigger</span>&nbsp;Auto
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | Normal
|-
| style="padding-right:4px;" |[[File:DmgImpactSmall64.png|16x16px]]&thinsp;1.75|| style="padding-right:4px;" |[[File:DmgPunctureSmall64.png|16x16px]]&thinsp;12.25|| style="padding-right:4px;" |[[File:DmgSlashSmall64.png|16x16px]]&thinsp;21
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
| class="TableHalf" |<span class="LinkText">Crit</span>&nbsp;12% | 2x
| class="TableHalf" |<span class="LinkText">Status</span>&nbsp;26%
|-
| class="TableHalf" |<span class="LinkText">Fire Rate</span>&nbsp;9.58/s
| class="TableHalf" |<span class="LinkText">Multishot</span>&nbsp;1
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |<span class="LinkText">Reload</span>&nbsp;2.15
| class="TableHalf" |<span class="LinkText">Ammo</span>&nbsp;75&thinsp;/&thinsp;600
|-
| style="text-align:center;" colspan=2 |<span class="LinkText">Polarities</span>&nbsp;None
|-
|}
|}
</div>
|}
</div>]=] },
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
| style="background-color: #0D1B1C; color: #eeeeee; padding: 10px; font-size:13px; line-height: 16px;"|<span style="font-weight: bold;font-size: 14px;">Rank 5:</span> Passive<br>+102% chance to resist a Cold Damage effect
|}
|-
|}]=] },
            { 'Artemis Bow|', ''},
            { 'Artemis Bow|Weapons', [=[
<div style="display:inline-block;">
{| class="Tooltip Main"
|-
|style="padding:0px;"|<div style="position:relative;">
{| class="Sub"
|-
| class="Image" style="height:120px;" | <div style="position:relative; z-index:2;">[[File:ArtemisBowWeapon.png|160px]]</div><div style="position:absolute;top:6px; left:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:MasteryAffinity64.png|28px]]<div style="position:absolute;top:3.5px;left:9.5px">0</div></div><div style="position:absolute;top:6px; right:4px; color:white; font-size:16px; font-weight:bold; text-shadow: 0 0 1px #0D1B1C, 0 0 4px #0D1B1C, 1px 1px 2px #0D1B1C, -1px 1px 2px #0D1B1C, 1px -1px 2px #0D1B1C, -1px -1px 2px #0D1B1C;">[[File:RivenIcon64.png|28px]]<div style="position:absolute;top:3.5px; right:9.5px;">×</div></div>
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |<span class="LinkText">Slot</span>&nbsp;Primary
| class="TableHalf" |<span class="LinkText">Trigger</span>&nbsp;Charge
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px; text-align:center;"
|-
| colspan=4 | Base Charged Shot
|-
| style="padding-right:4px;" |[[File:DmgImpactSmall64.png|16x16px]]&thinsp;33.6|| style="padding-right:4px;" |[[File:DmgPunctureSmall64.png|16x16px]]&thinsp;192|| style="padding-right:4px;" |[[File:DmgSlashSmall64.png|16x16px]]&thinsp;14.4
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
| class="TableHalf" |<span class="LinkText">Crit</span>&nbsp;25% | 2x
| class="TableHalf" |<span class="LinkText">Status</span>&nbsp;20%
|-
| class="TableHalf" |<span class="LinkText">Charge Time</span>&nbsp;1 s
| class="TableHalf" |<span class="LinkText">Multishot</span>&nbsp;7
|-
|}
|-
| class="Spacer" |
|-
| style="padding:0px;" |
{| class="Data" style="font-size:12px;"
|-
| class="TableHalf" |<span class="LinkText">Reload</span>&nbsp;0.9
| class="TableHalf" |<span class="LinkText">Ammo</span>&nbsp;1&thinsp;/&thinsp;inf
|-
| style="text-align:center;" colspan=2 |<span class="LinkText">Polarities</span>&nbsp;[[File:Madurai_Pol.svg|20px|class=icon]][[File:Madurai_Pol.svg|20px|class=icon]][[File:Naramon_Pol.svg|20px|class=icon]]
|-
|}
|}
</div>
|}
</div>]=] },
            { 'Artemis Bow|Ability', [=[
<div style="display:inline-block;">
{| class="Tooltip" style="font-family:'Roboto';"|-
|style="padding:0px;"|
{| class="Sub" style="width:500px;"|-
| class="Spacer" style="padding:0;"| [[File:ArtemisBowModx256.png|130px]]
| class="Spacer"|
| class="Data" style="line-height:20px; text-align:center; width:64px; padding:2px;"|[[File:ArtemisBow130xDark.png|48px]]<br/><div style="display:inline-block; margin: 4px 2px 8px 2px;"><div style="display:inline-block; position:relative; top:-2px;">[[File:EnergyIcon32x.png|18px]]</div> <span style="font-size:14px; font-weight:bold;">50</span></div><br><div style="display:inline-block;"><span style="position:relative;background-color:#272727;color:white;padding:1px 4px;border:2px solid #aaadb4;border-radius:5px;font-size:12px;">4</span></div>
| class="Spacer"|
| class="Data" style="font-size:13px; line-height:16px; padding:2px 3px 2px 3px; white-space:normal;"|<span style="font-weight:bold; font-size:15px;">Ivara</span><br/>Summon a mighty bow and unleash a volley of devastating arrows.
|}
|}</div>]=] },
            { 'Warframes',
                '<div style="display:inline-block;">\n{| class="Tooltip Main"\n|-\n|style="padding:0px;"|<div style="position:relative;">\n'
                ..'{| class="Sub"\n|-\n| class="Data" style="width:100px;white-space:inherit;padding:2px;line-height:normal;" |'
                ..'The \'\'\'Warframe\'\'\' is an advanced weapons system used exclusively by the [[Tenno]] in their missions throughout the [[Star Chart|Origin System]]. The Warframes possess [[Shield|regenerative shields]], [[Maneuvers|greatly enhanced mobility]], and the use of an array of [[Abilities|supernatural abilities]] &ndash; all of which further augment the Tenno\'s deadly use of traditional combat arts.'
                ..'\n|}\n</div>\n|}\n</div>'},
            { 'Railjack', ''},
        },
    },
}
