---
title: "Module:Avionics"
wiki_url: "https://wiki.warframe.com/w/Module/Avionics"
wiki_timestamp: "2025-06-14T09:05:01Z"
---

[![](/images/Lotusiconsmall.png?17208)](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators")

**This template is [archived](/w/Category:Archived "Category:Archived"). The content was relevant to a previous formatting of WARFRAME Wiki. Please do not use or delete this template. It is being saved for later potential use.**

Description
:   This template will make a link to the [Avionic](/w/Avionic "Avionic") with a tooltip showing the avionic. It will only accept the exact name of the avionic.

    :   Note: Some avionic articles have an "(Avionic)" suffix which shouldn't be included.

Uses Module:Avionics and its [database](/w/Module:Avionics/data "Module:Avionics/data")

Tooltip is [Template:Tooltip/Avionic](/w/Template:Tooltip/Avionic?action=edit&redlink=1 "Template:Tooltip/Avionic (page does not exist)")
:   See also {{[Avi/GetValue](/w/Template:Avi/GetValue "Template:Avi/GetValue")}}

Syntax
:   Type {{[Avi](/w/Template:Avi "Template:Avi")|*<Avionic>*|*<Custom Name>*|*<image=Image only?>*|*<size=(size?)px>*|*<icon=Icon type: none, icon>*}} as a replacement for avionic link.

Input examples

`{{Avi|Hyperstrike}}`

* [![](/images/thumb/HouseVidar%28xWhite%29.png/20px-HouseVidar%28xWhite%29.png?30878)](/w/Hyperstrike "Hyperstrike") [Hyperstrike](/w/Hyperstrike "Hyperstrike")

`{{Avi|Seeker Volley|Super Avionic}}`

* [![](/images/thumb/Avionics%28xBlack%29.png/20px-Avionics%28xBlack%29.png?953e6)](/w/Seeker_Volley "Seeker Volley") [Super Avionic](/w/Seeker_Volley "Seeker Volley")

`{{Avi|Seeker Volley|Super Avionic|image=qwe|size=30px}}`

* [![](/images/thumb/SeekerVolleyAvi.png/30px-SeekerVolleyAvi.png?ccf05)](/w/Seeker_Volley "Seeker Volley")

`{{Avi||Hyperstrike}}`

* [Hyperstrike](/w/Hyperstrike "Hyperstrike")

`<span class="avionic-tooltip" data-param="Hyperstrike">Hyperstrike</span>`

* Hyperstrike

```lua
{{Avi|Hyperstrike}}
{{Avi|Hyperstrike|icon=none}}
{{Avi|Hyperstrike|icon=qwe}}
{{Avi|Hyperstrike|icon=icon}}
```

[![](/images/thumb/HouseVidar%28xWhite%29.png/20px-HouseVidar%28xWhite%29.png?30878)](/w/Hyperstrike "Hyperstrike") [Hyperstrike](/w/Hyperstrike "Hyperstrike")
[Hyperstrike](/w/Hyperstrike "Hyperstrike")
[![](/images/thumb/Avionics%28xBlack%29.png/20px-Avionics%28xBlack%29.png?953e6)](/w/Hyperstrike "Hyperstrike") [Hyperstrike](/w/Hyperstrike "Hyperstrike")
[![](/images/thumb/HyperstrikeAvi.png/20px-HyperstrikeAvi.png?9d84e)](/w/Hyperstrike "Hyperstrike") [Hyperstrike](/w/Hyperstrike "Hyperstrike")

`{{Avi|The One Ring}}` Incorrect avionic name gives an error.

* ​{{[Avionic](/w/Template:Avi "Template:Avi")}} "The One Ring" not found

You should always use the avionic's name without (Avionic) suffix.

* ​`{{Avi|Warhead}}` **=>** [![](/images/thumb/HouseLavan%28xWhite%29.png/20px-HouseLavan%28xWhite%29.png?08ecd)](/w/Warhead_(Avionic) "Warhead (Avionic)") [Warhead](/w/Warhead_(Avionic) "Warhead (Avionic)")
* `{{Avi|Warhead (Avionic)}}` **=>** [![](/images/thumb/HouseLavan%28xWhite%29.png/20px-HouseLavan%28xWhite%29.png?08ecd)](/w/Warhead_(Avionic) "Warhead (Avionic)") [Warhead (Avionic)](/w/Warhead_(Avionic) "Warhead (Avionic)")

## Other Templates

[[edit source](/w/Template:Avi/doc?action=edit&section=T-1 "Edit section's source code: Other Templates")]

```lua
{{#invoke:Avionics|AvionicTable|SortBy|Find|Image?}}
```

View Selected Type List▾▾

`{{#invoke:Avionics|AvionicTable|Type|Integrated}}`

| Icon | Name | Description |
| --- | --- | --- |
|  | [Ablative Shell](/w/Ablative_Shell "Ablative Shell") | Reduces Chem damage taken by Railjack |
|  | [Anode Cell](/w/Anode_Cell "Anode Cell") | Increases Railjack shield recharge rate |
|  | [Artillery Cheap Shot](/w/Artillery_Cheap_Shot "Artillery Cheap Shot") | Gives Forward Artillery a chance not to consume Dome Charges |
|  | [Breach Adrenaline](/w/Breach_Adrenaline "Breach Adrenaline") | Increases Railjack shield recharge rate during a hull breach |
|  | [Bulkhead](/w/Bulkhead "Bulkhead") | Increases Railjack health |
|  | [Conic Nozzle](/w/Conic_Nozzle "Conic Nozzle") | Increases Railjack base speed |
|  | [Cruising Speed](/w/Cruising_Speed "Cruising Speed") | Increases Railjack base speed when no enemies are nearby |
|  | [Deep Hold](/w/Deep_Hold "Deep Hold") | Increases Resource Forge maximum capacity |
|  | [Forward Artillery](/w/Forward_Artillery "Forward Artillery") | Increases Forward Artillery damage |
|  | [Hardened Casing](/w/Hardened_Casing "Hardened Casing") | Reduces the chance of a hull breach |
|  | [Heat Sink](/w/Heat_Sink "Heat Sink") | Reduces Incendiary damage taken by Railjack |
|  | [Hull Weave](/w/Hull_Weave "Hull Weave") | Increases Railjack armor |
|  | [Hyperflux](/w/Hyperflux "Hyperflux") | Increases Railjack Flux Energy capacity |
|  | [Hyperstrike](/w/Hyperstrike "Hyperstrike") | Increases turret damage |
|  | [Ion Burn](/w/Ion_Burn "Ion Burn") | Increases Railjack boost speed |
|  | [Last Stand](/w/Last_Stand "Last Stand") | Increases turret damage when Railjack health is low |
|  | [Maxima](/w/Maxima "Maxima") | Increases Railjack shield |
|  | [Ordnance Cheap Shot](/w/Ordnance_Cheap_Shot "Ordnance Cheap Shot") | Gives Ordnance a chance not to consume Munitions when used |
|  | [Ordnance Velocity](/w/Ordnance_Velocity "Ordnance Velocity") | Increases Ordnance projectile speed |
|  | [Overloader](/w/Overloader "Overloader") | Increases maximum Munitions capacity |
|  | [Phasic Weave](/w/Phasic_Weave "Phasic Weave") | Reduces Ionic damage taken by Railjack |
|  | [Polar Coil](/w/Polar_Coil "Polar Coil") | Increases turret heat capacity |
|  | [Predator](/w/Predator "Predator") | Increases turret critical chance |
|  | [Quicklock](/w/Quicklock "Quicklock") | Decreases Ordnance lock-on time |
|  | [Revo Reducer](/w/Revo_Reducer "Revo Reducer") | Reduces Revolite usage |
|  | [Ripload](/w/Ripload "Ripload") | Decreases Ordnance reload time |
|  | [Section Density](/w/Section_Density "Section Density") | Increases turret critical damage |
|  | [Sentient Fortitude](/w/Sentient_Fortitude "Sentient Fortitude") | Reduces damage done to Railjack shields by Sentient enemies |
|  | [Sentient Scalpel](/w/Sentient_Scalpel "Sentient Scalpel") | Increases turret damage against Sentient enemies |
|  | [Thermatic](/w/Thermatic "Thermatic") | Reduces Frost damage taken by Railjack |
|  | [Turret Velocity](/w/Turret_Velocity "Turret Velocity") | Increases turret range and projectile speed |
|  | [Warhead](/w/Warhead_(Avionic) "Warhead (Avionic)") | Increases Ordnance damage |
|  | [Winged Cyclone](/w/Winged_Cyclone "Winged Cyclone") | Increases nearby Archwings' speed |
|  | [Winged Force](/w/Winged_Force "Winged Force") | Increases nearby Archwings' shields |
|  | [Winged Steel](/w/Winged_Steel "Winged Steel") | Increases nearby Archwings' armor |
|  | [Winged Storm](/w/Winged_Storm "Winged Storm") | Increases nearby Archwings' damage |

View Sorted Category List▾▾

`{{#invoke:Avionics|AvionicTable|Type}}`

| Type | Icon | Name | Description |
| --- | --- | --- | --- |
| Tactical |
|  | [Battle Forge](/w/Battle_Forge "Battle Forge") | Reduces Resource Forge cooldown time |
|  | [Battle Stations](/w/Battle_Stations "Battle Stations") | Temporarily boosts turret damage |
|  | [Breach Quanta](/w/Breach_Quanta "Breach Quanta") | Temporarily stalls a hull breach |
|  | [Death Blossom](/w/Death_Blossom "Death Blossom") | Temporarily prevents turrets from overheating |
|  | [Fire Suppression](/w/Fire_Suppression "Fire Suppression") | Fixes a single fire hazard |
|  | [Flow Burn](/w/Flow_Burn "Flow Burn") | Temporarily increases Railjack speed and boost speed |
|  | [Form Up](/w/Form_Up "Form Up") | Recalls all teammates to the Railjack and heals them |
|  | [Intruder Stasis](/w/Intruder_Stasis "Intruder Stasis") | Temporarily freezes all enemy boarding parties |
|  | [Squad Renew](/w/Squad_Renew "Squad Renew") | Heals all Railjack squad members |
|  | [Void Cloak](/w/Void_Cloak "Void Cloak") | Makes the Railjack invisible at the expense of engine speed |
| Integrated |
|  | [Ablative Shell](/w/Ablative_Shell "Ablative Shell") | Reduces Chem damage taken by Railjack |
|  | [Anode Cell](/w/Anode_Cell "Anode Cell") | Increases Railjack shield recharge rate |
|  | [Artillery Cheap Shot](/w/Artillery_Cheap_Shot "Artillery Cheap Shot") | Gives Forward Artillery a chance not to consume Dome Charges |
|  | [Breach Adrenaline](/w/Breach_Adrenaline "Breach Adrenaline") | Increases Railjack shield recharge rate during a hull breach |
|  | [Bulkhead](/w/Bulkhead "Bulkhead") | Increases Railjack health |
|  | [Conic Nozzle](/w/Conic_Nozzle "Conic Nozzle") | Increases Railjack base speed |
|  | [Cruising Speed](/w/Cruising_Speed "Cruising Speed") | Increases Railjack base speed when no enemies are nearby |
|  | [Deep Hold](/w/Deep_Hold "Deep Hold") | Increases Resource Forge maximum capacity |
|  | [Forward Artillery](/w/Forward_Artillery "Forward Artillery") | Increases Forward Artillery damage |
|  | [Hardened Casing](/w/Hardened_Casing "Hardened Casing") | Reduces the chance of a hull breach |
|  | [Heat Sink](/w/Heat_Sink "Heat Sink") | Reduces Incendiary damage taken by Railjack |
|  | [Hull Weave](/w/Hull_Weave "Hull Weave") | Increases Railjack armor |
|  | [Hyperflux](/w/Hyperflux "Hyperflux") | Increases Railjack Flux Energy capacity |
|  | [Hyperstrike](/w/Hyperstrike "Hyperstrike") | Increases turret damage |
|  | [Ion Burn](/w/Ion_Burn "Ion Burn") | Increases Railjack boost speed |
|  | [Last Stand](/w/Last_Stand "Last Stand") | Increases turret damage when Railjack health is low |
|  | [Maxima](/w/Maxima "Maxima") | Increases Railjack shield |
|  | [Ordnance Cheap Shot](/w/Ordnance_Cheap_Shot "Ordnance Cheap Shot") | Gives Ordnance a chance not to consume Munitions when used |
|  | [Ordnance Velocity](/w/Ordnance_Velocity "Ordnance Velocity") | Increases Ordnance projectile speed |
|  | [Overloader](/w/Overloader "Overloader") | Increases maximum Munitions capacity |
|  | [Phasic Weave](/w/Phasic_Weave "Phasic Weave") | Reduces Ionic damage taken by Railjack |
|  | [Polar Coil](/w/Polar_Coil "Polar Coil") | Increases turret heat capacity |
|  | [Predator](/w/Predator "Predator") | Increases turret critical chance |
|  | [Quicklock](/w/Quicklock "Quicklock") | Decreases Ordnance lock-on time |
|  | [Revo Reducer](/w/Revo_Reducer "Revo Reducer") | Reduces Revolite usage |
|  | [Ripload](/w/Ripload "Ripload") | Decreases Ordnance reload time |
|  | [Section Density](/w/Section_Density "Section Density") | Increases turret critical damage |
|  | [Sentient Fortitude](/w/Sentient_Fortitude "Sentient Fortitude") | Reduces damage done to Railjack shields by Sentient enemies |
|  | [Sentient Scalpel](/w/Sentient_Scalpel "Sentient Scalpel") | Increases turret damage against Sentient enemies |
|  | [Thermatic](/w/Thermatic "Thermatic") | Reduces Frost damage taken by Railjack |
|  | [Turret Velocity](/w/Turret_Velocity "Turret Velocity") | Increases turret range and projectile speed |
|  | [Warhead](/w/Warhead_(Avionic) "Warhead (Avionic)") | Increases Ordnance damage |
|  | [Winged Cyclone](/w/Winged_Cyclone "Winged Cyclone") | Increases nearby Archwings' speed |
|  | [Winged Force](/w/Winged_Force "Winged Force") | Increases nearby Archwings' shields |
|  | [Winged Steel](/w/Winged_Steel "Winged Steel") | Increases nearby Archwings' armor |
|  | [Winged Storm](/w/Winged_Storm "Winged Storm") | Increases nearby Archwings' damage |
| Battle |
|  | [Blackout Pulse](/w/Blackout_Pulse "Blackout Pulse") | Emit a pulse that disables and damages ships |
|  | [Countermeasures](/w/Countermeasures "Countermeasures") | Deploys flares to destract enemy projectiles |
|  | [Fiery Phoenix](/w/Fiery_Phoenix "Fiery Phoenix") | Enhances the Railjack, leaving a trail of damaging fire |
|  | [Munitions Vortex](/w/Munitions_Vortex "Munitions Vortex") | Deploys a bubble that absorbs damage and projectiles |
|  | [Particle Ram](/w/Particle_Ram "Particle Ram") | Creates a damaging shield-like projection |
|  | [Seeker Volley](/w/Seeker_Volley "Seeker Volley") | Deploys a volley of homing missiles |
|  | [Shatter Burst](/w/Shatter_Burst "Shatter Burst") | Deploys an explosive area of effect |
|  | [Tether](/w/Tether "Tether") | Ensnares enemies, increasing vulnerability to Railjack weaponry |
|  | [Void Hole](/w/Void_Hole "Void Hole") | Creates a field that draws enemies to its center |

View No Category List▾▾

`{{#invoke:Avionics|AvionicTable}}`

| Icon | Name | Description |
| --- | --- | --- |
|  | [Ablative Shell](/w/Ablative_Shell "Ablative Shell") | Reduces Chem damage taken by Railjack |
|  | [Anode Cell](/w/Anode_Cell "Anode Cell") | Increases Railjack shield recharge rate |
|  | [Artillery Cheap Shot](/w/Artillery_Cheap_Shot "Artillery Cheap Shot") | Gives Forward Artillery a chance not to consume Dome Charges |
|  | [Battle Forge](/w/Battle_Forge "Battle Forge") | Reduces Resource Forge cooldown time |
|  | [Battle Stations](/w/Battle_Stations "Battle Stations") | Temporarily boosts turret damage |
|  | [Blackout Pulse](/w/Blackout_Pulse "Blackout Pulse") | Emit a pulse that disables and damages ships |
|  | [Breach Adrenaline](/w/Breach_Adrenaline "Breach Adrenaline") | Increases Railjack shield recharge rate during a hull breach |
|  | [Breach Quanta](/w/Breach_Quanta "Breach Quanta") | Temporarily stalls a hull breach |
|  | [Bulkhead](/w/Bulkhead "Bulkhead") | Increases Railjack health |
|  | [Conic Nozzle](/w/Conic_Nozzle "Conic Nozzle") | Increases Railjack base speed |
|  | [Countermeasures](/w/Countermeasures "Countermeasures") | Deploys flares to destract enemy projectiles |
|  | [Cruising Speed](/w/Cruising_Speed "Cruising Speed") | Increases Railjack base speed when no enemies are nearby |
|  | [Death Blossom](/w/Death_Blossom "Death Blossom") | Temporarily prevents turrets from overheating |
|  | [Deep Hold](/w/Deep_Hold "Deep Hold") | Increases Resource Forge maximum capacity |
|  | [Fiery Phoenix](/w/Fiery_Phoenix "Fiery Phoenix") | Enhances the Railjack, leaving a trail of damaging fire |
|  | [Fire Suppression](/w/Fire_Suppression "Fire Suppression") | Fixes a single fire hazard |
|  | [Flow Burn](/w/Flow_Burn "Flow Burn") | Temporarily increases Railjack speed and boost speed |
|  | [Form Up](/w/Form_Up "Form Up") | Recalls all teammates to the Railjack and heals them |
|  | [Forward Artillery](/w/Forward_Artillery "Forward Artillery") | Increases Forward Artillery damage |
|  | [Hardened Casing](/w/Hardened_Casing "Hardened Casing") | Reduces the chance of a hull breach |
|  | [Heat Sink](/w/Heat_Sink "Heat Sink") | Reduces Incendiary damage taken by Railjack |
|  | [Hull Weave](/w/Hull_Weave "Hull Weave") | Increases Railjack armor |
|  | [Hyperflux](/w/Hyperflux "Hyperflux") | Increases Railjack Flux Energy capacity |
|  | [Hyperstrike](/w/Hyperstrike "Hyperstrike") | Increases turret damage |
|  | [Intruder Stasis](/w/Intruder_Stasis "Intruder Stasis") | Temporarily freezes all enemy boarding parties |
|  | [Ion Burn](/w/Ion_Burn "Ion Burn") | Increases Railjack boost speed |
|  | [Last Stand](/w/Last_Stand "Last Stand") | Increases turret damage when Railjack health is low |
|  | [Maxima](/w/Maxima "Maxima") | Increases Railjack shield |
|  | [Munitions Vortex](/w/Munitions_Vortex "Munitions Vortex") | Deploys a bubble that absorbs damage and projectiles |
|  | [Ordnance Cheap Shot](/w/Ordnance_Cheap_Shot "Ordnance Cheap Shot") | Gives Ordnance a chance not to consume Munitions when used |
|  | [Ordnance Velocity](/w/Ordnance_Velocity "Ordnance Velocity") | Increases Ordnance projectile speed |
|  | [Overloader](/w/Overloader "Overloader") | Increases maximum Munitions capacity |
|  | [Particle Ram](/w/Particle_Ram "Particle Ram") | Creates a damaging shield-like projection |
|  | [Phasic Weave](/w/Phasic_Weave "Phasic Weave") | Reduces Ionic damage taken by Railjack |
|  | [Polar Coil](/w/Polar_Coil "Polar Coil") | Increases turret heat capacity |
|  | [Predator](/w/Predator "Predator") | Increases turret critical chance |
|  | [Quicklock](/w/Quicklock "Quicklock") | Decreases Ordnance lock-on time |
|  | [Revo Reducer](/w/Revo_Reducer "Revo Reducer") | Reduces Revolite usage |
|  | [Ripload](/w/Ripload "Ripload") | Decreases Ordnance reload time |
|  | [Section Density](/w/Section_Density "Section Density") | Increases turret critical damage |
|  | [Seeker Volley](/w/Seeker_Volley "Seeker Volley") | Deploys a volley of homing missiles |
|  | [Sentient Fortitude](/w/Sentient_Fortitude "Sentient Fortitude") | Reduces damage done to Railjack shields by Sentient enemies |
|  | [Sentient Scalpel](/w/Sentient_Scalpel "Sentient Scalpel") | Increases turret damage against Sentient enemies |
|  | [Shatter Burst](/w/Shatter_Burst "Shatter Burst") | Deploys an explosive area of effect |
|  | [Squad Renew](/w/Squad_Renew "Squad Renew") | Heals all Railjack squad members |
|  | [Tether](/w/Tether "Tether") | Ensnares enemies, increasing vulnerability to Railjack weaponry |
|  | [Thermatic](/w/Thermatic "Thermatic") | Reduces Frost damage taken by Railjack |
|  | [Turret Velocity](/w/Turret_Velocity "Turret Velocity") | Increases turret range and projectile speed |
|  | [Void Cloak](/w/Void_Cloak "Void Cloak") | Makes the Railjack invisible at the expense of engine speed |
|  | [Void Hole](/w/Void_Hole "Void Hole") | Creates a field that draws enemies to its center |
|  | [Warhead](/w/Warhead_(Avionic) "Warhead (Avionic)") | Increases Ordnance damage |
|  | [Winged Cyclone](/w/Winged_Cyclone "Winged Cyclone") | Increases nearby Archwings' speed |
|  | [Winged Force](/w/Winged_Force "Winged Force") | Increases nearby Archwings' shields |
|  | [Winged Steel](/w/Winged_Steel "Winged Steel") | Increases nearby Archwings' armor |
|  | [Winged Storm](/w/Winged_Storm "Winged Storm") | Increases nearby Archwings' damage |

View Selected Type, with Images List▾▾

```lua
{{#invoke:Avionics|AvionicTable|Type|Integrated|img}}
```

|  |
| --- |
|  |

View Sorted Category, with Images List▾▾

```lua
{{#invoke:Avionics|AvionicTable|Type||img}}
```

| House | Avionic |
| --- | --- |
|  |  |
|  |  |
|  |  |
|  |  |

View No Category, with Images List▾▾

```lua
{{#invoke:Avionics|AvionicTable|||img}}
```

|  |
| --- |
|  |

Technical stuff ▾▾

[Database](/w/Module:Avionics/data "Module:Avionics/data")

Codebase

Copied:

Mostly the same as in the text below, but now the work is done by [Module:Mods](/w/Module:Mods "Module:Mods").  
Old notes below:  
~~The template checks if first argument matches the name of the mod in [Module:Mods/data](/w/Module:Mods/data "Module:Mods/data"). This is to check if a mod with that name actually exists. Another possibility would've been to check if an article with that name exists but it's limited to 250 calls per article and is not ideal as it would break on [Mods 2.0](/w/Mods_2.0 "Mods 2.0").~~

~~* If the mod exists, *class="mod-tooltip" data-param="{{#var:Name}}"* tells javascript that this text wants a tooltip, which is made by {{[Tooltip/Mod](/w/Template:Tooltip/Mod?action=edit&redlink=1 "Template:Tooltip/Mod (page does not exist)")}}.
* If the mod doesn't exist, the error is shown instead of a redlink along with [Category:Mod Tooltip error](/w/Category:Mod_Tooltip_error "Category:Mod Tooltip error") added on that page.~~

~~If second argument is used -> [Category:Mod Tooltip rename](/w/Category:Mod_Tooltip_rename "Category:Mod Tooltip rename") is added on the page as to list pages with second argument, as they are harder to edit automatically if there's a need for that. **Note: commented out until needed**~~

---

```lua
local AvionicData = mw.loadData([[Module:Avionics/data]])
local Table = require([[Module:Table]])
local String = require([[Module:String]])
--local Icon = require([[Module:Icon]])
--local Version = require([[Module:Version]])

local function getAvionic(name)
    local data = AvionicData.Avionics
    
    local _av = data[name] or data[String.titleCase(name)]
    if _av ~= nil then return _av end
    
    for avionicName, Avionic in pairs(data) do
        if Avionic.Link == name then return Avionic end
    end--if page address is named
end

--local function Introduction(Update) return Version.getVersionLink({args={Update}}) end

p = {

Value = function(frame)
    local AvionicName, ValName = frame.args[1], frame.args[2]
    
    if not AvionicName then error("No avionic specified") end
    local Avionic = getAvionic(AvionicName)
    if not Avionic then error("No such avionic '"..AvionicName.."' found") end
    
    if(Avionic == nil or type(Avionic) ~= 'table') then
        error("No avionic")
    elseif(ValName == nil or ValName == '') then
        error("No value specified")
    end--nilcheck
    
    ValName = String.titleCase(ValName)
    return Avionic[({--dictionary:
        ['Trade Tax']='Tradetax',
        ['House Icon']='Houseicon',
        --['Description']='Desc',
        ['Update']='Intro',
        ['Introduction']='Intro',
    })[ValName] or ValName]
end,

AvionicTable = function(frame)
    local Parameter,searchParameter,imgOnly = frame.args[1],frame.args[2],frame.args[3]
    --    Var       Val             Image Only
    --Without Val, display all avionics, sorted by var
    
    if Parameter == '' then Parameter = nil end
    if searchParameter == '' then searchParameter = nil end
    if imgOnly == nil or imgOnly == '' then imgOnly = false end
    
    local buildTable = {'{| border="1" cellpadding="1" cellspacing="1" class="article-table"\n', insert=table.insert,--[[ consert=function(self,tab)self:insert(table.concat(tab))end ]]}
    local tablePart, indexes = {House={None=''}},{}
    
    -- for k, v in pairs {'|', (imgOnly and '' or '-\n!'),
    --     (searchParameter or not Parameter
    --         and (imgOnly and '' or Parameter..' !!')
    --         or table.concat {'-\n!', Parameter, ' !!', ' Avionic\n'} ),
    -- (imgOnly and ' Icon !! Name !! Description\n|-' or '' )} do buildTable:insert(v) end
    -- --header
    if not imgOnly then 
        if searchParameter or not Parameter then
            buildTable:insert('|-\n! Icon !! Name !! Description\n')
        else
            buildTable:insert('|-\n!'..Parameter..' !! Icon !! Name !! Description\n|-')
        end
    else 
        if searchParameter or not Parameter then 
            buildTable:insert('|')
        else
            buildTable:insert('|-\n!'..Parameter..' !! Avionic\n')
        end
    end--header
    
    --local isFirst = true
    for Name, Avionic in Table.skpairs(AvionicData["Avionics"]) do
        
        local avpart
        if imgOnly then
            avpart =
            p.tooltipImage({ args = {Avionic.Name or Name,'135px'} })
        else
            avpart =
            '| ' .. p.tooltipImage({ args = {Avionic.Name or Name,'40px'} }) ..'\n'..
            '| ' .. p.tooltipText({ args={Avionic.Name or Name} }) ..'\n'..
            '| ' .. Avionic.Desc ..'\n'
        end--make part
        
        if searchParameter then
            --one param
            if Avionic[String.titleCase(Parameter)] == searchParameter then
                if not imgOnly then
                    buildTable:insert '|-\n'
                end
                buildTable:insert(avpart)
            end
        elseif not Parameter then
            if not imgOnly then
                buildTable:insert '|-\n'
            end
            buildTable:insert(avpart)
        else
            --multiple params
            local param = Avionic[String.titleCase(Parameter)]
            if param then
                if not tablePart[Parameter] then tablePart[Parameter]={} end
                if imgOnly then
                    tablePart[Parameter][param] = (tablePart[Parameter][param] or '') .. avpart .. '\n'
                else
                    tablePart[Parameter][param] = (tablePart[Parameter][param] or '') .. '|-\n' .. avpart
                end
                if not indexes[Parameter] then indexes[Parameter]={} end
                indexes[Parameter][param] = (indexes[Parameter][param] or 0) + 1
            end
        end--join part
        
        --if isFirst then isFirst = false end
    end
    if searchParameter or not Parameter then 
        if imgOnly then
            buildTable:insert '\n'
        end
    else
        for key, _part in pairs(tablePart[Parameter]) do
            if imgOnly then
                buildTable:insert('|-\n! '..
                (
                    Parameter=='House' and 
                        (
                            '[[File:'..(key=='None' and 'Avionics_dark' or 'House'..key)
                            --..({Sigma='HouseSigma.png', Lavan='HouseLavan.png', Vidar='HouseVidar.png', Zetki='HouseZetki.png', None='Avionics_dark.png'})[key]
                            ..'.png|60px|link=House '..key..']]'
                        )
                        or key
                )
                ..'\n|\n')
                buildTable:insert(_part)
            else
                buildTable:insert(table.concat{'\n|-\n! rowspan = ',(indexes[Parameter][key]+1),' |',key,'\n',_part})
            end
        end
    end
    buildTable:insert "|}"
    return table.concat(buildTable)
end,

tooltipText = function(frame)
    local Name = frame.args ~= nil and frame.args[1] or nil
    if Name == nil then
        --error('No avionic name')
        return '{{[[Template:Avi]]}} Insert an avionic name.['..'[Category:Avionic Tooltip error]]'
    end
    
    local Avionic = getAvionic(Name)
    if Avionic == nil then
        --error(Name..' not found')
        return '{{[[Template:Avi|Avionic]]}} "'..Name..'" not found['..'[Category:Avionic Tooltip error]]'
    end
    
    local newName = frame.args ~= nil and frame.args[2]
    if newName == '' then newName = nil end
    
    local Link = Avionic.Link
    local linkText = ''
    if Link == nil then
        Link = Name
    end
    
    local showIcon = ((frame.args[3] ~= '') and frame.args[3]) or nil
    
    local dataname
    if newName ~= nil then
        linkText = Link..'|'..newName
        dataname = newName
    else
        if Name == Link then
            linkText = Link
        else
            linkText = Link..'|'..Name
        end
        dataname = ''
    end--link
    
    local tAvionic ={}
    table.insert(tAvionic,'')
    --20px thumb, 200px hover
    
    if Avionic.House ~= nil then
        if showIcon == nil then
            table.insert(tAvionic,'[[File:'..Avionic.Houseicon..'|20px|link='..Avionic.Link..']] ')
        elseif showIcon == "none" then
            --table.insert(tAvionic, '')
        elseif showIcon == "icon" then
            table.insert(tAvionic, '[[File:'..Avionic.Image..'|20px|link='..Avionic.Link..']] ')
        else
            table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic.Link..']] ')
        end
    else
        table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic.Link..']] ')
    end
    
    table.insert(tAvionic,'[['..linkText..']]')--link
    
    return table.concat(tAvionic)
end,
tooltipImage = function(frame)
    local Name = frame.args ~= nil and frame.args[1]
    if Name == nil then
        return '{{[[Template:Avi]]}} Insert an avionic name. [[Category:'..'Avionic Tooltip error]]'
    end
    local Avionic = getAvionic(Name)
    local size = frame.args[2]
    if size == nil then size = '130px' end
    
    
    if Avionic == nil then
        return '{{[[Template:Avi|Avionic]]}} "'..Name..'" not found [[Category:'..'Avionic Tooltip error]]'
    end
    
    local tAvionic ={}
    table.insert(tAvionic,'')--hover
    
    -- if Avionic.House ~= nil then
    --         table.insert(tAvionic,'[[File:House'..Avionic['House']..'.png|20px|link='..Avionic['LINK']..']] ')
    -- else
    --     table.insert(tAvionic, '[[File:Avionics_dark.png|20px|link='..Avionic['LINK']..']] ')
    -- end--20px thumb
    
    table.insert(tAvionic,'[[file:'..Avionic.Image..'|'..size..'|link='..Avionic.Link..']]')--text, end hover
    
    return table.concat(tAvionic)
end,

tooltip = function(frame)
    local AvionicName = frame.args ~= nil and frame.args[1] or nil
    local renamed = frame.args ~= nil and frame.args[2] or nil
    if renamed == '' then renamed = nil end
    
    local Avionic = getAvionic(AvionicName, "Name");
    if Avionic == nil then
        --error("no avionic "..AvionicName.."")
        return "Something went wrong with Module:Avionics (p.tooltip: no avionic "..AvionicName..")"
    end
    
    
    return '{| class="Tooltip"\n|-\n| style="padding:0px;"|\n{| class="Sub"\n|-\n| class="Image"| ['..'[File:'..Avionic.Image..'|180px]]\n|-\n| class="Spacer"|'--Main image
    
    ..(renamed and ('\n|-\n! class="Title"|'..AvionicName..'\n|-\n| class="Spacer"|') or '')--Name
    
    ..'\n|-\n| style="background-color: var(--tt-bg-color); color: var(--almost-white); padding: 10px; font-size:13px; line-height: 16px;"|'
    ..(renamed == 'imageonly' and Avionic.House..' ' or '')--House
    ..Avionic.Rarity..'  
'
    ..(Avionic.Description ~= "''No description''" and Avionic.Description or Avionic.Desc)
    ..'\n|}\n|-\n|}'
end,

}

return p
```

