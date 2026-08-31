--Database for Module:Avionics --
--All other data at [[Module:Avionics/data]]
--[=[
    ["Avionic Name"] = {
        Description (implementing) = "long description, copied from game, with (max + 3) stats and all"
    },
]=]--
--Add Breach Adrenaline and Ordnance Velocity

return {
    ["Blackout Pulse"] = {
        Description = [=[Deploy an Electro-Magnetic Pulse dealing 500 Damage to enemies within 200m and disabling them temporarily. Manually detonate to increase the Blast Radius to 300m.]=],
    },
    ["Countermeasures"] = {
        Description = [=[Deploy 32 flares that will distract enemy guided projectiles.]=],
        Flux = [=[5.
Each subsequent use within 4 seconds doubles the cost (Max 40).]=],
    },
    ["Munitions Vortex"] = {
        Description = [=[Deploy a bubble that absorbs fire for 15s. Detonates for all accumulated damage over 150m.]=],
    },
    ["Particle Ram"] = {
        Description = [=[Deploy a Particle Ram dealing 1500 Damage per second when moving forward, 2250 during a Vector Maneuver. Deactivate to launch the Ram outwards for 4s, dealing 3000 Damage.]=],
    },
    ["Shatter Burst"] = {
        Description = [=[Creates a barrage of 7 explosions per second over 20 seconds, dealing 1000 Damage in 80m.]=],
    },
    ["Tether"] = {
        Description = [=[Emits a field that restricts the movement of 8 enemy targets within 120m for 15s. Enemies are 50% more vulnerable to Railjack weapons, and those destroyed while tethered Detonate for 2000 Damage over 80m.]=],
    },
    ["Fiery Phoenix"] = {
        Description = [=[Leave a trail of fire dealing 300 Damage per second to enemies. Gain 20% Speed and 30% Damage Reduction while active. Accumulates 100 Damage per second that unleashes upon deactivation over 275m.]=],
        Flux = [=[50 on use. 2.5 per second while active]=],
    },
    ["Seeker Volley"] = {
        Description = [=[Fires 50 homing missiles.]=],
    },
    ["Void Hole"] = {
        Description = [=[Creates a 150m black hole that sucks in enemies, dealing 300 Damage per second over 12s.]=],
    },

    ["Battle Forge"] = {
        Description = [=[Reduce Forge Cooldown by 120s]=],
        Cooldown = "384s"
    },
    ["Breach Quanta"] = {
        Description = [=[Temporarily stall Hull Breach for 55s]=],
        Cooldown = "300s"
    },
    ["Fire Suppression"] = {
        Description = [=[Extinguish 1 fire]=],
        Cooldown = "160s"
    },
    ["Flow Burn"] = {
        Description = [=[Increase Speed and Boost Speed by 38% for 13s]=],
        Cooldown = "240s"
    },
    ["Void Cloak"] = {
        Description = [=[Cloak from Enemies for 50s
Engine Speed reduced to 50%]=],
        Cooldown = "96s"
    },
    ["Battle Stations"] = {
        Description = [=[Boost Turret Damage by 75% for 30s]=],
        Cooldown = "240s"
    },
    ["Death Blossom"] = {
        Description = [=[Turret Cooldowns removed for 30s]=],
        Cooldown = "300s"
    },
    ["Form Up"] = {
        Description = [=[Recall all Crew Members to the Railjack and Heal them for 100%]=],
        Cooldown = "240s"
    },
    ["Squad Renew"] = {
        Description = [=[Heal all Railjack squad members by 100%.]=],
        Cooldown = "300s"
    },
    ["Intruder Stasis"] = {
        Description = [=[Freeze al Enemy Boarding Parties for 45s]=],
        Cooldown = "300s"
    },


    ["Bulkhead"] = {
        Description = [=[Increase Hull by +506%]=],
    },
    ["Hull Weave"] = {
        Description = [=[Increase Max Armor by +253%]=],
    },
    ["Hardened Casing"] = {
        Description = [=[Reduce Breach Chance by +38.5%]=],
    },
    ["Anode Cell"] = {
        Description = [=[Increase Shield Recharge by +80%]=],
    },
    ["Maxima"] = {
        Description = [=[Increase Max Shields by +72%]=],
    },
    ["Sentient Fortitude"] = {
        Description = [=[Decrease Shield Damage from Sentients by +25.3%]=],
    },
    ["Breach Adrenaline"] = {
        Description = [=[Increase Shield Regen during Breach by +38%]=],
    },
    ["Ablative Shell"] = {
        Description = [=[Reduces Chem Damage by +44%]=],
    },
    ["Heat Sink"] = {
        Description = [=[Reduce Incendiary damage by +56%]=],
    },
    ["Phasic Weave"] = {
        Description = [=[Reduce Ionic Damage by +49.6%]=],
    },
    ["Thermatic"] = {
        Description = [=[Reduce Frost Damage by +44%]=],
    },
    ["Conic Nozzle"] = {
        Description = [=[Increase Speed by +25.6%]=],
    },
    ["Cruising Speed"] = {
        Description = [=[Increase Speed by 80% when no enemies within 3000m]=],
    },
    ["Ion Burn"] = {
        Description = [=[Increase Boost Speed by +40%]=],
    },
    ["Hyperstrike"] = {
        Description = [=[Increase Turret Damage by +121%]=],
    },
    ["Last Stand"] = {
        Description = [=[Increase All Turret Damage by 128% when Hull is below 20%]=],
    },
    ["Polar Coil"] = {
        Description = [=[Increase Turret Heat Capacity by +66%]=],
    },
    ["Predator"] = {
        Description = [=[Increase all Turret Critical Chance by +80%]=],
    },
    ["Section Density"] = {
        Description = [=[Increase all Turret Critical Damage by +78.4%]=],
    },
    ["Sentient Scalpel"] = {
        Description = [=[Increase Gunnery Damage vs Sentients by +25.3%]=],
    },
    ["Turret Velocity"] = {
        Description = [=[Increase Turret Range by +25.3%
Increase Turret Projectile Speed by +55%]=],
    },
    ["Ordnance Cheap Shot"] = {
        Description = [=[Ordnance weapons have a +50% chance to not consume Munitions]=],
    },
    ["Ordnance Velocity"] = {
        Description = [=[Increase Ordnance Projectile Speed by +37.5%]=],
    },
    ["Overloader"] = {
        Description = [=[Increase Maximum Ordnance Munitions by 50%]=],
    },
    ["Quicklock"] = {
        Description = [=[Decrease Ordnance Lock-On time by +75%]=],
    },
    ["Ripload"] = {
        Description = [=[Decrease Ordnance Reload time by +40.7%]=],
    },
    ["Warhead"] = {
        Description = [=[Increase Ordnance damage by +71.5%]=],
    },
    ["Artillery Cheap Shot"] = {
        Description = [=[Forward Artillery has a +50% chance to not consume Dome Charges]=],
    },
    ["Forward Artillery"] = {
        Description = [=[Increase Forward Artillery Damage by +93.5%]=],
    },
    ["Deep Hold"] = {
        Description = [=[Increase Forge Capacity by +60%]=],
    },
    ["Hyperflux"] = {
        Description = [=[Increase Flux Energy by +99%]=],
    },
    ["Revo Reducer"] = {
        Description = [=[Omni Revolite consumption reduced by +40%]=],
    },
    ["Winged Cyclone"] = {
        Description = [=[Increase Archwing Speed by 30% within 1000m]=],
    },
    ["Winged Force"] = {
        Description = [=[Increase Archwing Shields by 25% within 1000m]=],
    },
    ["Winged Steel"] = {
        Description = [=[Increase nearby ally Archwing Armor by 360% within 1000m]=],
    },
    ["Winged Storm"] = {
        Description = [=[Increase nearby ally Archwing Damage by 20% within 1000m]=],
    },
}
