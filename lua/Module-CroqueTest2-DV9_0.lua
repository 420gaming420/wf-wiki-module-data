local PatchData =
{
{
["update number"]={"9.8.5"},
["type"]={"fix"},
["date"]={"September 9, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/104304-hotfix-985/"},
["fixes"]={
        {tags={"Frost",},text={"*Fixed deadlock (freeze) that occurred when hosting on dual core CPUs*."}},
        {tags={"Foundry",},text={"*Fixed persistent issue with being unable to claim items from Foundry."}},
        {tags={},text={"*Fixed master volume resetting to 100% when launching game."}},
        {tags={"Defense",},text={"*Fixed corrupted textures on Corpus Defense map."}},
        {tags={},text={"*Potential fix for consumables being lost from inventory."}},
        {tags={"Frost",},text={"*Note: A big thank-you for everyone who helped us out with information with this particularly nasty dual-core freeze bug. Between the incredibly helpful threads and support tickets, we could not have done this without you folks. We%'re sorry for the frustration this caused and are standing by for results based on this fix."}},
},--fixes end

},--update end
{
["update number"]={"9.8.4"},
["type"]={"fix"},
["date"]={"September 9, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/104222-hotfix-984/"},
["fixes"]={
        {tags={},text={"*Fixed frequent crashes encountered throughout the weekend"}},
        {tags={"Foundry",},text={"*Fixed inability to claim items from Foundry even though empty slots are available"}},
        {tags={"Ember",},text={"*Fixed Ember%'s Fire Blast dealing damage to teammates and leaving permanent visual FX"}},
        {tags={"Ember",},text={"*Fixed Ember%'s World on Fire dealing inconsistent damage on host and client"}},
        {tags={"Ogris",},text={"*Toned down Ogris charge effect"}},
        {tags={"Defense",},text={"*Fixed AI not advancing from upper levels of Corpus Defense map"}},
        {tags={},text={"*Fixed AI not reacting to weapon-firing sounds"}},
        {tags={"Vay Hek",},text={"*Fixed broken text appearing in main menu after defeating Vay Hek"}},
        {tags={},text={"*Fixed descriptions of Neurodes and Neural Sensors"}},
},--fixes end

},--update end
{
["update number"]={"9.8.3"},
["type"]={"fix"},
["date"]={"September 7, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/103384-hotfix-983/"},
["fixes"]={
        {tags={},text={"*Fixed intermittent gameplay crashes"}},
        {tags={},text={"*Fixed inability to start missions due to %'The game session is no longer available%' message appearing"}},
        {tags={},text={"*Fixed crash that occur immediately after logging in"}},
        {tags={},text={"*Fixed scenario where mission selection UI would become unusable after returning from a mission"}},
        {tags={},text={"*Fixed players exiting lobby completely when attempting to cancel mission selection"}},
},--fixes end

},--update end
{
["update number"]={"9.8.2"},
["type"]={"fix"},
["date"]={"September 3, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/102999-hotfix-982/"},
["fixes"]={
        {tags={},text={"*Fixed issue for freezes on single-core machines."}},
},--fixes end

},--update end
{
["update number"]={"9.8.1"},
["type"]={"fix"},
["date"]={"September 3, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/102978-hotfix-981/"},
["fixes"]={
        {tags={"Void",},text={"*Adjusted Orokin Void door triggers and timing"}},
        {tags={"Void",},text={"*Fixed objects disappearing when looking through certain doorways in Orokin Void"}},
        {tags={},text={"*Fixed overlapping Beta label text on login screen"}},
        {tags={"Defense","Grineer Galleon",},text={"*Fixed Grineer Galleon defense mode breaking after host migration"}},
        {tags={"Ash","Vor","Lech Kril",},text={"*Fixed being able to bypass the Vor + Krill boss fight by using Bladestorm and other specific powers"}},
        {tags={},text={"*Fixed physics crashes"}},
        {tags={},text={"*Fixed inability to launch missions when playing in Turkish, also added missing Launcher text"}},
        {tags={},text={"*Fixed random cinematics not appearing at login screen"}},
        {tags={},text={"*Fixed %'installed%' tab showing all installed mods rather than the mods installed on the currently selected weapon"}},
        {tags={},text={"*Fixed %'Y%' key opening Contacts menu"}},
},--fixes end

},--update end
{
["update number"]={"9.8"},
["date"]={"September 3, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/102835-update-98/"},
["changes"]={
        {tags={"Ember",},text={"*%[%[Ember%]%]: %[%https://forums.warframe.com/index.php?/topic/102831-ember-98-feedback-thread/ forum post%]"}},
        {tags={"Ember",},text={"**%[%[Fireball%]%]: Fixed the damage-over-time (DOT) attaching to the target. Increased the damage amount and damage over time."}},
        {tags={"Ember",},text={"**%[%[Overheat%]%]: It%'s now an offensive power rather than a defensive power. Reduced damage resistance and increased the damage output. Warframe strength mods now modify the damage amount."}},
        {tags={"Ember",},text={"**%[%[Fire Blast%]%]: Fixed scaling problem, mesh scaled but the damage wall never did. Range mods no longer affect Fire blast, Duration and strength mods do."}},
        {tags={},text={" "}},
        {tags={"Mag",},text={"*%[%[Mag%]%]: %[%https://forums.warframe.com/index.php?/topic/102829-mag-98-feedback-thread/ forum post%]"}},
        {tags={"Mag",},text={"**%[%[Pull%]%]: Change damage type to use ragdolls for the pulling instead of sliding. Increased amount of damage dealt. Should be more in-line with other Warframe powers now."}},
        {tags={"Mag",},text={"**%[%[Shield Polarize%]%]: Radial damage that is dealt when shields are removed is now scaled based on fusion level."}},
        {tags={"Mag",},text={"**%[%[Bullet Attractor%]%]: Added damage multiplier on the targeted enemy, making ability much more deadly."}},
        {tags={"Mag",},text={"**%[%[Crush%]%]: Damage timing changes."}},
        {tags={},text={" "}},
        {tags={"Trinity",},text={"*%[%[Trinity%]%]: %[%https://forums.warframe.com/index.php?/topic/102830-trinity-98-feedback-thread/ forum post%]"}},
        {tags={"Trinity",},text={"**%[%[Well Of Life%]%]: Now plays reaction animation, Life is 10x multiplied allowing players to leech enough health out."}},
        {tags={"Trinity",},text={"**%[%[Energy Vampire%]%]: Now plays reaction animation and doesn%'t require damage to get energy. Instead target radiates a set amount of energy every couple of seconds. Also does damage to the target (Damage scales with strength mod)."}},
        {tags={"Trinity",},text={"**%[%[Link%]%]: No longer damage immunity--changed to damage reduction, now links to several targets at once amplifying the incoming damage. Increased radius search for link targets."}},
        {tags={"Trinity",},text={"**%[%[Blessing%]%]: Anim speed changes and timing. No longer wait until end of casting animation to get power effects."}},
        {tags={},text={" "}},
        {tags={"Vauban",},text={"*%[%[Vauban%]%]: %[%https://forums.warframe.com/index.php?/topic/102832-vauban-98-feedback-thread/ forum post%]"}},
        {tags={"Vauban",},text={"**%[%[Bastille%]%]: Ability now has a set number of targets. 6-8-10-12"}},
        {tags={"Vauban",},text={"**%[%[Vortex%]%]: No longer affects other players. (will tug the moment it is placed, and players next to vortex will not get a speed boost from slide attacks %[Bug%])"}},
        {tags={},text={" "}},
        {tags={"Nyx",},text={"*%[%[Nyx%]%]: %[%https://forums.warframe.com/index.php?/topic/102833-nyx-98-feedback-thread/ forum post%]"}},
        {tags={"Nyx",},text={"**%[%[Psychic Bolts%]%]: Projectiles now seek and fly faster, more in line with other Warframes."}},
        {tags={"Nyx",},text={"**%[%[Absorb%]%]: Ability now has higher base damage and should attract more attention."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'General:%'%'%'"}},
        {tags={"Vauban",},text={"*Energy color tinting for Vauban’s Tesla and Vortex abilities."}},
        {tags={"Nova",},text={"*Energy color tinting for Nova Antimatter Drop ability."}},
        {tags={"Torid",},text={"*%[%[Torid%]%] now uses energy color."}},
        {tags={"Paris Prime","Prime",},text={"*%[%[Paris Prime%]%] texture improvements."}},
        {tags={"Mag",},text={"*New death animation for Mag’s Crush ability."}},
        {tags={"Volt",},text={"*Volt’s Speed ability trail FX now last the duration of the power."}},
        {tags={"Grineer Settlement",},text={"*Added some new ambient sounds to %[%[Grineer Settlement%]%] levels."}},
        {tags={"Mag",},text={"*Updated sounds for Mag’s abilities."}},
        {tags={"Trinity",},text={"*Updated sound for Trinity’s Well of Life ability."}},
        {tags={"Vauban",},text={"*Vauban’s Tesla ability now has reduced FX on projectiles attached to players."}},
        {tags={"Excalibur","Vauban","Trinity","Duel","Conclave",},text={"*PvP %[%[Duel|Dueling%]%]"}},
        {tags={"Trinity","Duel","Conclave",},text={"**Trinity can now effectively target opponents with all abilities."}},
        {tags={"Vauban","Duel","Conclave",},text={"**Vauban’s Bounce ability now does damage."}},
        {tags={"Excalibur","Duel","Conclave",},text={"**Added cooldown to Excalibur Radial Blind ability to avoid exploits."}},
        {tags={},text={"*%[%[Ancient Healer|Healing Ancient%]%] heal radius reduced to 30m range (was infinite)."}},
        {tags={},text={"*Tool tips now appear for Alt %[%[:Category:Helmet|Helmets%]%]."}},
        {tags={},text={"*Misc. items section of inventory no longer adds empty slots (unnecessary)"}},
        {tags={},text={"*Sound ducking from mix effects is now attenuated by distance as well as the volume ratio (user set volume levels, for example)"}},
        {tags={},text={"*Added embedded damage radius to projectiles."}},
        {tags={},text={"*Changed damage done by embedded projectiles to be affected by armor."}},
        {tags={},text={"*Animation and Audio tweaks to some Warframe Agile and Noble animations."}},
        {tags={"Market",},text={"*Indicated items in the Gear area of the Market are being retired in a later update - Last Chance!"}},
        {tags={},text={"*You may notice that %[%[mods%]%] you have equipped in a weapon are in your options for customization in other weapons. You no longer need to remove the mod from weapon X to equip in weapon Y, it will appear in the UI for you now."}},
},--changes end
["fixes"]={
        {tags={},text={"*Made a large number of optimizations to improve host frame-rate (especially when fighting many NPCs)."}},
        {tags={"Clan",},text={"*Fixed issue in %[%[Clan Dojo%]%] where rotating decorations while holding shift will cause them to pop in some locations."}},
        {tags={"Clan",},text={"*Fixed Dojo Rooms not accepting prerequisites from the old art set when trying to build rooms from the new art set."}},
        {tags={},text={"*Fixed issue where leaving a game after using a buff aura power causes the power to stay infinitely for all other players."}},
        {tags={"Thunderbolt",},text={"*Fixed %[%[Thunderbolt%]%] explosive damage trumping impact damage. Projectile damage now applies first, and then the chance to explode is checked."}},
        {tags={"Trinity",},text={"*Fixed FX being applied incorrectly while Trinity’s Blessing ability is active, and FX lingering on clients."}},
        {tags={"Rhino",},text={"*Fixed %[%[Rhino%]%] Stomp being in use on the client even though it didn%'t affect any enemies."}},
        {tags={},text={"*Fixed some cases where projectiles that deal radial damage wouldn%'t hit all valid entities."}},
        {tags={},text={"*Fixed another edge case where “Cannot use in air” error occurred."}},
        {tags={"Raptors",},text={"*Fixed %[%[Raptor%]%] missiles following invisible targets."}},
        {tags={},text={"*Fixed issues that had AI running in circles."}},
        {tags={},text={"*Fixed some cases where damage numbers were not showing up properly."}},
        {tags={"Nova",},text={"*Fixed %[%[Nova%]%] Antimatter Drop ability disappearing on clients."}},
        {tags={"Trinity",},text={"*Fixed Trinity%'s Link tendrils not going away when all targets are dead or out of range."}},
        {tags={"Saryn",},text={"*Fixed Saryn%'s Venom globes being impossible to shoot in certain situations."}},
        {tags={"Mag",},text={"*Fixed AI affected by Mag’s Bullet Attractor ability from shooting once then stopping for several seconds."}},
        {tags={},text={"*Fixed abilities with cooldown timers suffering from %'power in use%' bug after used once on clients."}},
        {tags={},text={"*Fixed issue where player could lose weapon functionality if swapping weapons during an auto-reload."}},
        {tags={},text={"*Fixed issue where flashlights would remain on while weapon is holstered."}},
        {tags={"Saryn",},text={"*Fixed performance issues relating to %[%[Saryn%]%]’s Venom ability."}},
        {tags={"Corpus Outpost",},text={"*Fixed blocking volumes in %[%[Corpus Outpost%]%] Hanger so the ship doesn’t land on players."}},
        {tags={"Trinity","Conclave",},text={"*Fix a number of issues with Trinity%'s powers in PVP. Blessing / EnergyVampire / Well of Life should all work correctly for valid targets in PvP."}},
        {tags={"Dethcube",},text={"*Fixed incorrect emblem decorations on %[%[Dethcube%]%]"}},
        {tags={},text={"*Fixed (again) issue with loot falling through respawn barrier and becoming unreachable."}},
        {tags={"Jackal",},text={"*Fixed issues with %[%[Jackal%]%]%'s leg shield mechanic."}},
        {tags={},text={"*Fixed missing texture on Fin sword. Waiting for notes on what is meant by Fin sword."}},
        {tags={},text={"*Fixed issue where Ammo converted by Host was not available for clients."}},
        {tags={},text={"*Fixed %[%[Aura%]%]s not returning after player dies and then revives."}},
        {tags={"Fang Prime","Prime",},text={"*Fixed broken %[%[Fang Prime%]%] elemental FX."}},
        {tags={"Clan",},text={"*Fixed issue where players couldn’t join a Dojo session in progress if the obstacle course had previously been triggered."}},
        {tags={},text={"*Fixed issue where skipping the Tutorial, it would continue into the Warframe selection screen."}},
        {tags={},text={"*Fixed issue where players couldn’t enter Terminus immediately after completing tutorial."}},
        {tags={},text={"*Fixed stats not being properly counted upon mission complete due to host migration."}},
        {tags={},text={"*Fixed some teleporting issues to avoid specific areas where players fall through maps."}},
        {tags={},text={"*Fixed issues that resulted in clients being stuck on the loading screen after a match."}},
        {tags={},text={"*Fixed multiple areas reported as exploits or problematic for navigation across all tile sets."}},
        {tags={},text={"*Fixed various reported nav mesh, clipping, and collision problems across all tile sets."}},
},--fixes end

},--update end
{
["update number"]={"9.7.3"},
["type"]={"fix"},
["date"]={"September 3, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/101864-hotfix-973/"},
["misc"]={
        {tags={"Strun Wraith","Wraith",},text={"*Changed Strun Wraith Crit Chance from the incorrect 50% to the correct 20%."}},
        {tags={"Equilibrium",},text={"*Scaled Equilibrium mod results to reflect amount of health or energy picked up."}},
        {tags={},text={"*Improved handle for corrupted download caches."}},
},--misc end

},--update end
{
["update number"]={"9.7.2"},
["type"]={"fix"},
["date"]={"September 3, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/101769-hotfix-972-the-reward-ening/"},
["title"]={"The Reward-Ening."},
["misc"]={
        {tags={"Survival",},text={"*Added content and rewards for the completion of the Survival Weekend Event."}},
},--misc end

},--update end
{
["update number"]={"9.7.1"},
["type"]={"fix"},
["date"]={"August 30, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/100556-hotfix-971/"},
["misc"]={
        {tags={},text={"*Fixed crash when activating Life Support Capsule."}},
        {tags={"Survival",},text={"*Fixed enemies not spawning for extended periods of time during Survival missions."}},
        {tags={"Braton Vandal","Vandal",},text={"*Fixed missing texture on Braton Vandal."}},
},--misc end

},--update end
{
["update number"]={"9.7"},
["date"]={"August 30, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/100482-update-97"},
["image"]={"COYC1mV.jpg"},
["additions"]={
        {tags={"Survival",},text={"*Survive or die time Tenno, %[%[Survival Weekend Event|Survival Weekend%]%] is here!"}},
        {tags={"Equilibrium",},text={"*New Mod: %[%[Equilibrium%]%]"}},
        {tags={"Akvasto","Market",},text={"*Time to double up with the new %[%[Akvasto|DUAL VASTOS%]%], now available in the Market."}},
        {tags={},text={"*Added Warframe idle animation customization: “Agile” and “Noble”."}},
        {tags={"Nightmare Mode","Lethal Torrent","Shred","Vigor",},text={"*Mod Rewards from “Arid Fear” event (%[%[Shred%]%], %[%[Vigor%]%], %[%[Lethal Torrent%]%]) now available in Nightmare Mode"}},
        {tags={},text={"*Founders Badges have gone live!"}},
},--additions end
["changes"]={
        {tags={"Trinity",},text={"*Improved Trinity’s cast animation for Blessing ability."}},
        {tags={"Miter",},text={"*Miter – increased fire rate, higher charge damage. Charged shots fire through targets."}},
        {tags={},text={"*Improvements to ragdolls."}},
        {tags={"Defense",},text={"*Removed railings leading to defense pod on Corpus cargo bay defense tileset, and enabled enemies to come around behind the pod from the shipping railbox."}},
        {tags={"Defense",},text={"*New AI function where enemies can jump onto boxes and ledges, including previous %'safe zones%' in defense missions."}},
        {tags={"Vauban",},text={"*changed sound effect of Vauban%'s Bounce ability."}},
},--changes end
["fixes"]={
        {tags={"Dethcube",},text={"*Fixed incorrect emblem decorations on Dethcube."}},
        {tags={"Ember",},text={"*Fixed Ember’s Overheat ability that was creating extra fire FX on clients."}},
        {tags={"Saryn",},text={"*Fixed performance issues relating to Saryn’s Venom orbs."}},
        {tags={"Void",},text={"*Fixed bug where you could navigate between regions after playing Void keys."}},
        {tags={"Market",},text={"*Fixed text field for Market sale items in Russian language."}},
        {tags={},text={"*Fixed Puncture Mods not working as intended on projectile weapons."}},
        {tags={},text={"*Fixed various reported crashes."}},
        {tags={},text={"%'%'%'Undocumented%'%'%'"}},
        {tags={"Shock Absorbers",},text={"*%[%[Shock Absorbers%]%] has a new image."}},
},--fixes end

},--update end
{
["update number"]={"9.6.1"},
["type"]={"fix"},
["date"]={"August 23, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/98468-hotfix-961"},
["additions"]={
        {tags={"Titania","Clan",},text={"*Arid Fear Dojo Trophy Recipes have now been distributed to the top clans from the past event! Congrats!"}},
        {tags={"Trinity",},text={"*Added new visual effect while Blessing is active"}},
        {tags={},text={"*Added visual effects to several idle animations"}},
        {tags={},text={"*Integrated text translations for various languages"}},
},--additions end
["changes"]={
        {tags={"Snipetron","Snipetron Vandal","Torid","Vandal",},text={"*Updated reload sound effects for Snipetron, Snipetron Vandal, and Torid"}},
        {tags={"Dera",},text={"*Updated visual effects for Dera muzzle flash"}},
        {tags={"Flux Rifle",},text={"*Improved visual effects for Flux beam"}},
        {tags={"Excalibur",},text={"*Switched Radial Blind%'s color back to white with some tinges of energy color"}},
        {tags={"Lech Kril",},text={"*Removed inconveniently-placed loot crates that were thwarting Kril%'s plans for Tenno domination"}},
        {tags={"Nyx",},text={"*Nyx%'s Chaos now only stuns bosses, not make them murder their subordinates"}},
},--changes end
["fixes"]={
        {tags={"Trinity",},text={"*Fixed energy colors not being applied to Trinity%'s Link"}},
        {tags={"Trinity",},text={"*Fixed Link beam occasionally attaching itself to nothing in particular"}},
        {tags={"Volt",},text={"*Fixed Volt Speed not being affected by power duration mods for clients"}},
        {tags={"Rhino",},text={"*Fixed Rhino Stomp being %'In Use%' on the client even though it didn%'t affect any enemies"}},
        {tags={"Vauban",},text={"*Fixed energy colors not being applied to Tesla"}},
        {tags={"Sentinel",},text={"*Fixed sentinels sometimes dropping items on death"}},
        {tags={},text={"*Fixed %'Cannot use in Air%' message appearing indefinitely if player jumped and used a power right away"}},
        {tags={"Raptors",},text={"*Fixed Raptor missiles following invisible targets"}},
        {tags={"Vauban",},text={"*Fixed energy colors not being applied to Vortex"}},
        {tags={"Nova",},text={"*Fixed Nova being launched into orbit if she casts Molecular Prime right as she jumps"}},
        {tags={"Nova",},text={"*Fixed Drop disappearing on clients after fusing it past level 1"}},
        {tags={"Nova",},text={"*Fixed energy colors not being applied to Drop"}},
},--fixes end

},--update end
{
["update number"]={"9.6"},
["date"]={"August 16, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/96343-update-96/"},
["image"]={"WHzBfng.jpg"},
["additions"]={
        {tags={"Hind",},text={"*A new Grineer weapon appears: the %[%[Hind%]%]!"}},
        {tags={"Clan","Alliance"},text={"*The first Alliances have emerged, and our 1001+ %[%[clan%]%]s have been split."}},
},--additions end
["changes"]={
        {tags={"Flux Rifle",},text={"*%[%[Flux Rifle%]%] energy beam is now affected by Energy Colour!"}},
        {tags={"Dera",},text={"*%[%[Dera%]%] muzzle flash is now affected by Energy Colour!"}},
        {tags={"Excalibur",},text={"*%[%[Excalibur%]%] Radial Blind now uses Energy Colours!"}},
        {tags={"Void","Market",},text={"*Removed the %[%[Corpus%]%] Void Key %[%[Blueprint%]%] from the Store - owned copies can be sold for the same purchase price"}},
        {tags={"Ciphers",},text={"*Enabled selling of Corpus Ciphers and Data Masses."}},
        {tags={"Transmutation"},text={"*Improvements to the %[%[Mods#Transmutation|Transmutation%]%] system: you can no longer transmute your final power card of a given type."}},
        {tags={"Defense","Grineer Settlement",},text={"*Improvements to Enemy AI on Settlement defense, they are not as cowardly and won’t huddle in their Spawn location."}},
        {tags={"Sobek",},text={"*Added %[%[Sobek%]%] reload animation tweaks."}},
        {tags={},text={"*Audio updates to the %[%[Desert Skate%]%] and %[%[Hellion|Grineer Jetpack Troops%]%]"}},
        {tags={"Twin Vipers",},text={"*Tweaks to %[%[Twin Vipers%]%] sounds"}},
        {tags={"Orthos",},text={"*Tweaks to %[%[Orthos%]%] hit sounds"}},
        {tags={"Miter",},text={"*Tweaks to Grineer %[%[Miter%]%] sounds."}},
        {tags={"Rhino",},text={"*Tweaks to %[%[Rhino%]%]’s Iron Skin lighting."}},
        {tags={"Grineer Settlement",},text={"*Tweaks to settlement enemy navigation."}},
        {tags={},text={"*Added fancy footwork to Grineer Jetpack landing animations."}},
        {tags={},text={"*%[%[Mods%]%] and %[%[Blueprints%]%] will never expire as drops."}},
        {tags={"Hind",},text={"*%[%[Elite Lancer%]%]s now use the Hind!"}},
},--changes end
["fixes"]={
        {tags={},text={"*Added multiple localization Fixes"}},
        {tags={"Grineer Settlement",},text={"*Multiple Fixes for the %[%[Grineer Settlement%]%] levels."}},
        {tags={"Transmutation"},text={"*Fixed the fact that players can consume their final power cards with Transmute"}},
        {tags={"Defense","Grineer Settlement",},text={"*Fixed enemies not leaving the spawn rooms in Settlement Defense"}},
        {tags={"Clan",},text={"*Fixed the Contact List breaking after sending a clan invite while in the Dojo"}},
        {tags={"Stalker",},text={"*Fixed the %[%[Stalker%]%] dropping blueprints 100% of the time"}},
        {tags={},text={"*Fixed not being able to perform stealth take-downs on any idle Grineer"}},
        {tags={"Clan",},text={"*Fixed the Stamina Orbs appearing as blue instead of green after building the Dojo Obstacle Course"}},
        {tags={"Sabotage",},text={"*Fixed the %[%[Sabotage%]%] Target not appearing on client after a host migration"}},
        {tags={"Spy","Grineer Settlement",},text={"*Fixed enemies being inaccessible in the Settlement %[%[Spy%]%] missions"}},
        {tags={"Banshee",},text={"*Fix for %[%[Banshee%]%] Silence effect not using correct energy colours"}},
        {tags={"Corpus Ship",},text={"*Fix for unlit textures in %[%[Corpus Ship%]%] room."}},
        {tags={"Phobos",},text={"*Fixing enemy levels on %[%[Phobos%]%] , Stickney (max level increased by 2 instead of being same as min level)"}},
        {tags={},text={"*Fix for Warframe power cast animations replaying if they are knocked down during animation."}},
        {tags={"Volt",},text={"*Fix %[%[Volt%]%] Overload creating two effects on clients."}},
        {tags={},text={"*Fix for animations being cancelled due to pain flinch."}},
        {tags={"Volt",},text={"*Fix for crashes when using continuous fire weapons through Electric Shield."}},
},--fixes end

},--update end
{
["update number"]={"9.5.3"},
["type"]={"fix"},
["date"]={"August 14, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/95311-hotfix-953/"},
["additions"]={
        {tags={"Void",},text={"*Corpus Void Keys are sellable for {{Icon|Item|Credits}} 1,500."}},
        {tags={"Grineer Settlement",},text={"*Added hacking consoles to locations in Settlement tileset that users could be locked in."}},
},--additions end
["changes"]={
        {tags={"Phobos",},text={"*Improved blueprint drop rates for Phobos boss fight."}},
        {tags={"Fusion Core",},text={"*More loot table changes! All enemies now have a chance to drop Fusion Cores."}},
        {tags={},text={"*Chat window tweaks to assist in readability of chat on bright levels (White text on Sand was problematic)."}},
        {tags={},text={"*Tweaks to Grineer Hellion animations and movement."}},
        {tags={"Grineer Settlement",},text={"*Rollers have been removed from Grineer Settlements. The Grineer need to make up their mind!"}},
        {tags={},text={"*Hand Positions on several weapons have been tweaked."}},
        {tags={"Vor","Lech Kril",},text={"*Kril And Vor have gone through endurance training and no longer attack and fear Sand Skates."}},
        {tags={"Capture","Grineer Settlement",},text={"*Reduced spawn rate of enemies on prison for Settlement Capture mission."}},
        {tags={},text={"*Buff to pistol Armor Piercing mod."}},
        {tags={"Shocking Touch",},text={"*Buff to melee electrical damage mod: up to 10% from 5%."}},
},--changes end
["fixes"]={
        {tags={"Spy","Corpus Outpost",},text={"*Fix for objective marker sometimes not appearing for Spy missions in Corpus Outpost."}},
        {tags={"Trinity",},text={"*Fixed Trinity blueprints dropping from Grineer Commanders."}},
        {tags={"Lech Kril",},text={"*Fix for Lech Kril sometimes becoming invincible when fighting him."}},
        {tags={},text={"*Fix for Sand Skate repeating his taunt animation."}},
        {tags={},text={"*Fix for credit booster not applying to end-of-match reward."}},
        {tags={},text={"*Fix for missing ceiling texture in settlement."}},
        {tags={},text={"*Fix for floating container in settlements."}},
        {tags={},text={"*Fix for Color Picker UI menu becoming unstable after “double clicking”"}},
        {tags={"Miter",},text={"*Fix for the Miter’s holster position."}},
        {tags={"Defense",},text={"*Fix for “Reputation” UI appearing in defense missions.. more on that later!"}},
        {tags={"Grineer Settlement",},text={"*Various settlement map bug fixes."}},
        {tags={},text={"*Crash fixes."}},
},--fixes end

},--update end
{
["update number"]={"9.5.2"},
["type"]={"fix"},
["date"]={"August 12, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/94214-hotfix-952/"},
["misc"]={
        {tags={},text={"*Fixed UI becoming non-functional when attempting to view Solar Landmark."}},
        {tags={"Twin Gremlins",},text={"*Fixed inability to reload Twin Gremlins while sprinting."}},
        {tags={},text={"*Fixed boss drop tables. A blueprint will no longer drop 100% of the time being a “Chassis”. Every Blueprint has a chance to drop, but you may not get a blueprint every time."}},
        {tags={"Fusion Core",},text={"*Please see DE_Steve’s %[%https://forums.warframe.com/index.php?/topic/94177-drop-tables-20/ post%] regarding Drop Tables 2.0, issues we are working on, and how Fusion Cores and Mods fit into this."}},
        {tags={"Transmutation",},text={"*Fixed issues with the Transmutation feature. Users were unable to see or use mods resulting from Transmutation. Inventories also became unstable if a Transmuted mod resided within. A script will be run to correct the inventories of players who had been affected."}},
        {tags={"Ogris",},text={"*Fixed Ogris charge sound effect playing randomly when it wasn%'t being charged."}},
        {tags={},text={"*Fixed being able to parry while ziplining."}},
        {tags={"Ether Daggers","Dual Ethers","Ether Sword",},text={"*Fixed appearance of Ether weapons. Our weapons manufacturer apologizes for the defective translucency in the 9.5 model."}},
        {tags={},text={"*Fixed rare loss of functionality that could occur when leaving/being disconnected from a session while in the main menu."}},
        {tags={"Orthos Prime","Prime",},text={"*Buffs to Orthos Prime, Slightly faster, bit higher base damage. Longer reach."}},
        {tags={},text={"*Fixes for gameplay crashes."}},
        {tags={"Miter",},text={"*Fixed custom colours not applying to Miter saw blades or boomerang."}},
},--misc end

},--update end
{
["update number"]={"9.5.1"},
["type"]={"fix"},
["date"]={"August 10, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/92756-hotfix-951/"},
["misc"]={
        {tags={"Ash",},text={"*Tweak to %[%[Ash%]%]’s new custom idle."}},
        {tags={},text={"*Updated Grandmaster Solar Landmarks (seeing reports of bug after click, noted)!"}},
        {tags={"Exterminate","Alert",},text={"*Disabled %[%[Exterminate%]%] wrinkles in alert missions for event."}},
        {tags={},text={"*Fixed custom idles sometimes resulting in bad pose when carrying datamasses."}},
        {tags={},text={"*Fixed mods not showing icons."}},
        {tags={"Loki","Supra",},text={"*Fixed %[%[Loki%]%]s’ arm clipping,breaking,fusing,merging, etc. with %[%[Supra%]%]."}},
        {tags={"Transmutation"},text={"*Fixed problem with Transmuted mods not appearing in inventory until relogin."}},
        {tags={},text={"*Proper event badge now shows when you complete %[%[Arid Fear Event|Capture in the Void%]%] (was showing sling-stone badge)"}},
        {tags={},text={"*Fixed unable to sell %[%[blueprints%]%] if you only had one."}},
        {tags={"Foundry",},text={"*Fix for %[%[Foundry%]%] blueprints that require items not be craftable."}},
        {tags={"Foundry",},text={"*Fix for Foundry UI breaking if it was open when an item completed."}},
},--misc end

},--update end
{
["update number"]={"9.5"},
["date"]={"August 9, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/92568-update-95-operation-arid-fear/"},
["title"]={"Operation Arid Fear"},
["image"]={"AridFearTarget.png"},
["additions"]={
        {tags={"Grineer Settlement",},text={"*New %[%[Grineer Settlement%]%]. Hiding here are new enemy types waiting to be battled, blueprints for weapons, and more… Complete Operation Arid Storm to unlock its secrets!"}},
        {tags={},text={"*New %[%[Weapons%]%]:"}},
        {tags={"Miter","Grineer Settlement",},text={"**%[%[Miter%]%], a sawblade gun of death! Blueprint available on the hidden Grineer Settlements…"}},
        {tags={"Twin Gremlins","Grineer Settlement",},text={"**Grineer-issued %[%[Twin Gremlins%]%]! Blueprint available on the hidden Grineer Settlements…"}},
        {tags={"Ash",},text={"*New Bladestorm animations for %[%[Infested%]%] %[%[Ancient Disruptor%]%]s, %[%[Ancient Healer%]%]s, %[%[Toxic Ancient%]%]s and %[%[Charger%]%]s."}},
        {tags={},text={"*Stealth Finishers for Infested Ancients."}},
        {tags={},text={"*New weapon skins bundle: Desert Camouflage patterns for Grineer firearms"}},
        {tags={"Transmutation"},text={"*%[%[Mods#Mod Transmutator|Mod Transmutator%]%] – Combine 4 mods to produce 1 random mod. Combining mods of similar polarity, rarity, or compatibility will influence the result."}},
        {tags={},text={"*New custom Warframe idle animations."}},
        {tags={},text={"*New RNG fixes – Enemy and Level specific drops for more efficient hunting!"}},
        {tags={},text={"*Added “Remove all” button to Mods screen."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan",},text={"%'%'%'Clan Dojo%'%'%'"}},
        {tags={"Clan",},text={"*%[%[Clan Dojo%]%] Construction Upgrade Phase 1: %'%'On the Grid%'%'"}},
        {tags={"Clan",},text={"**5 Halls, Power Room, and all connector pieces updated to fit new grid system for improved layout options."}},
        {tags={"Clan",},text={"**Older versions of these rooms are no longer available for creation but remain if you own them."}},
        {tags={"Clan",},text={"**Older versions of these rooms will not fit the new grid system."}},
        {tags={"Clan",},text={"**Older versions can be destroyed for a full 100% refund allowing you to reconstruct with the new versions. All Platinum used to rush rooms is included in the Clan Vault."}},
        {tags={"Clan",},text={"**New versions fit a grid system that will eventually allow you to loop pieces with more than one entryway."}},
        {tags={"Clan",},text={"**New versions look better!"}},
        {tags={"Clan",},text={"**All other room pieces not listed have updates in progress to fit the grid where necessary."}},
        {tags={"Clan",},text={"**Rooms that have not been updated retain their functionality,"}},
        {tags={"Clan",},text={"**Rooms that have only one entrance are largely unaffected by the grid change (because they can’t be looped anyway)"}},
        {tags={"Clan",},text={"**Older version of the Clan Hall can be converted to the new Clan Hall instantly with no cost, if it is the only room in the Dojo (destroy all other rooms first). You must remove all Decorations in the Hall before converting."}},
},--additions end
["changes"]={
        {tags={},text={"*Mods are now the same for entire squad. If you get %[%[Fast Hands%]%] from a mod drop, so does everyone else."}},
        {tags={},text={"*Add charging state feedback on HUD."}},
        {tags={"Thief's Wit"},text={"*%[%[Thief%'s Wit%]%] mod upgraded! With a high enough fusion, you will be able to see mods on the minimap."}},
        {tags={},text={"*By request, chance of diorama background on login."}},
        {tags={},text={"*Corruptors can now be sold: Alpha/Beta for 100 credits each, Stable for 50 credits each."}},
        {tags={},text={"*Infested and Ancients no longer drop Corruptors."}},
        {tags={},text={"*Aura card UI changed to a grid system."}},
        {tags={"Dera","Lanka","Ogris","Supra","Kraken","Lex",},text={"*Added custom reload animations for Dera, Supra, Lanka, Ogris, Lex, and Kraken."}},
        {tags={"Latron Prime","Lato","Prime",},text={"*Added custom recoil animations for Latron Prime, and Lato."}},
        {tags={"Dera","Gorgon","Grakata","Hek","Ignis","Strun","Supra","Acrid","Kraken","Lex",},text={"*Added custom reload sounds for Strun, Dera, Supra, Gorgon, Ignis, Grakata, Acrid, Kraken, Hek, and Lex."}},
        {tags={},text={"*Updated stealth finisher sounds for Axe, Dual Sword, Sword, and Staff weapon types."}},
        {tags={"Nyx","Capture",},text={"*Prevent being able to revive enemy capture target while he is being affected by Nyx%'s mind control."}},
        {tags={"Rhino",},text={"*Revised Rhino’s Iron Skin texture as requested."}},
        {tags={"Hikou",},text={"*Hikou fx trail now uses energy color."}},
        {tags={"Ignis",},text={"*FX tweaks to Ignis"}},
        {tags={"Clan",},text={"*Ongoing Art and sound improvements on some Clan Dojo connector pieces and halls."}},
        {tags={"Raptors",},text={"*Raptor projectile explosion FX toned down."}},
        {tags={},text={"*Replaced existing Japanese font with new font in effort to clean up positioning and size of characters."}},
        {tags={"Clan",},text={"*Cleaned up some Clan Dojo obstacle course audio."}},
        {tags={"Ash",},text={"*Added animation and sounds for Ash’s Bladestorm ability vs. Ancients"}},
        {tags={"Clan",},text={"*Clan Stats are hidden in Profile unless you are in a clan or have a clan invite."}},
        {tags={"Frost","Defense",},text={"*All Objectives in Endless Defense now scale to the mission%'s enemy level - higher end defense should now be slightly more tolerable for solo play or squads without Frost. Does not scale with additional enemy scaling per wave."}},
        {tags={"Dera",},text={"*Dera rifle now shoots projectiles based on energy color."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed Reactor FX not replicating on client."}},
        {tags={"Grineer Galleon",},text={"*Fixed missing skybox issues in Grineer Galleon."}},
        {tags={"Nyx","Capture",},text={"*Fixed HUD breaking when reviving capture target affected with Nyx%'s mind control."}},
        {tags={"Rescue",},text={"*Fixed HUD breaking when reviving rescue hostage."}},
        {tags={},text={"*Fixed streaming settings on some gun textures."}},
        {tags={"Grineer Galleon",},text={"*Fixed some missing art issues in Grineer Galleon."}},
        {tags={},text={"*Fixed some object collision in Grineer Caves"}},
        {tags={"Ash",},text={"*Fixed issue with Ash Bladestorm where the Ash’s arm may be stuck in his shoulder."}},
        {tags={"Ash",},text={"*Fixed issue where Ash would become invincible after using Bladestorm on clients."}},
        {tags={"Frost","Vauban",},text={"*Fixed Vauban%'s powers not working when stuck onto Frost%'s Snowglobe."}},
        {tags={"Vauban",},text={"*Fixed bad cases with Vauban’s Tesla, Bounce, and Bastille that would occur when the instigator player would die/respawn/leave the game."}},
        {tags={},text={"*Fixed issue where mini map moves incorrectly depending on player%'s direction."}},
        {tags={"Clan",},text={"*Fixed potential problems that may arise if a player is visiting another clan%'s Dojo."}},
        {tags={},text={"*Fixed shield hit FX not appearing on certain weapons."}},
        {tags={"Clan",},text={"*Fixed Alt helmets that were applying visual FX twice when a clan emblem projector is equipped."}},
        {tags={"Saryn",},text={"*Fixed Saryn’s Moult ability FX not showing on client."}},
        {tags={},text={"*Fixed Akimbo pistols to act like akimbo pistols when carrying datamass."}},
        {tags={},text={"*Fixed enemies severing when they shouldn’t."}},
        {tags={},text={"*Fixed enemy AI throwing grenades in strange directions when players are moving."}},
        {tags={},text={"*Fixed most issues relating to “cannot use power in air” bug."}},
        {tags={"Hikou",},text={"*Fixed the Hikou throwings stars so that they only have 1 flashlight beam pointing in the correct direction."}},
        {tags={"Heavy Impact",},text={"*Fixed heavy impact mod from activating after being teleported."}},
        {tags={},text={"*Fixed Camera controls melee direction setting will always default to On when logging in."}},
        {tags={"Clan",},text={"*Fixed non-Warlords being unable to kick clan members"}},
        {tags={"Lotus",},text={"*Fixed Lotus transmissions incorrectly calling out ships when on planets"}},
        {tags={},text={"*Fixed Osprey explosion sounds"}},
        {tags={"Nova",},text={"*Fix for Nova%'s Wormhole being used on enemies and sending them to a far away place"}},
        {tags={"Dera",},text={"*Fix for Dera not updating with custom colours in the arsenal."}},
        {tags={"Dual Cleavers","Dual Zoren",},text={"*Fix for not being able to attack immediately after a jump attack or slide slash with Cleavers/Zoren weapon."}},
},--fixes end

},--update end
{
["update number"]={"9.4.1"},
["type"]={"fix"},
["date"]={"August 2, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/90015-hotfix-941-double-affinity-weekend/"},
["misc"]={
        {tags={},text={"*Fix for selecting wrong friend when right-clicking in friends list (Context menu now pops up on right click release instead of right click down)"}},
        {tags={"Nova",},text={"*Nova Helmet customization colour fixes."}},
        {tags={"Constitution","Fortitude",},text={"*Fixes for %[%[Constitution%]%] mod and %[%[Fortitude%]%] mod not working as intended."}},
        {tags={"Flux Rifle","Split Chamber",},text={"*Flux rifle with %[%[Split Chamber|Multishot%]%] crash fixes and over-the-top corpse destruction (phrases I never thought I’d type)."}},
        {tags={},text={"*False HUD affinity fixed: Was saying “100” when truly giving double or Quad."}},
        {tags={"Defense","Void",},text={"*Fix for %[%[Orokin Void%]%] %[%[Defense%]%] enemy levels – they are now back to their original difficulty. They obviously felt the new recruits could take on Tenno, how foolish."}},
},--misc end

},--update end
{
["update number"]={"9.4"},
["date"]={"August 2, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/89853-hotfix-94-double-affinity-weekend/"},
["title"]={"Double Affinity Weekend!"},
["image"]={"1nhUTZ4.jpg"},
["misc"]={
        {tags={"Afuris","Dual Ether","Market",},text={"%'%'Double Affinity Weekend is live now until Tuesday @ 12 noon EDT!%'%'"}},
        {tags={"Afuris","Dual Ether","Market",},text={"%[%[Dual Ether%]%], %[%[Afuris%]%], and %[%[Affinity Booster%]%] package is in the %[%[Market%]%]. Any Affinity Boosters this weekend will result in… QUAD AFFINITY!"}},
},--misc end
["changes"]={
        {tags={"Clan",},text={"*Changes to calculate Clan Tier based on number of confirmed members, not pending. We have run a script to downgrade Clans affected by this “Pending” members occupancy."}},
        {tags={"Excalibur",},text={"*Slash-Dash visual brightness tweaks."}},
        {tags={},text={"*Squad info will now be kept on screen regardless of matchmaking mode."}},
        {tags={"Nova",},text={"*%[%[Nova%]%]’s Molecular Prime is less blinding on explosions."}},
        {tags={"Dera",},text={"*The %[%[Dera%]%] Energy Rifle now uses both barrels."}},
        {tags={"Defense",},text={"*%[%[Defense%]%] missions now begin when the pod/core is reached, meaning idlers do not determine when mission begins. One player must reach the defense target for the first Wave to start"}},
        {tags={},text={"*Players who are AFK will drop mission critical items that they are carrying."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Alert",},text={"%'%'%'Warframe Nexus Android App Updated to 1.9.1%'%'%'"}},
        {tags={},text={"*Fixed Warframe Nexus stealing focus from other running apps (finally!)"}},
        {tags={},text={"*Added new %'Resources%' section to item filter list"}},
        {tags={},text={"*Should consume less battery power when running now"}},
        {tags={},text={"*Improved auto-retry responsiveness after detecting loss of network connection"}},
        {tags={},text={"*Fixed notification filter not applying correctly to certain helmet blueprints"}},
        {tags={"Alert",},text={"*Fixed expired alerts not being sorted to bottom of list in all cases"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Nightmare Mode",},text={"%'%'%'Nightmare mode tuning:%'%'%'"}},
        {tags={"Nightmare Mode",},text={"*Don’t allow 0 shields in nightmare mode if Vampire mode is in effect."}},
        {tags={},text={"*Energy Drain mode now gives zero shields in addition to draining energy. Reduced chance of Energy -Drain mode (33% instead of 50%)."}},
        {tags={"Mobile Defense",},text={"*Mobile Defense is now exempt from No-HUD mode."}},
        {tags={"Nightmare Mode",},text={"*No-Mini Map mode removed as it was universally despised (but if you really liked it, a post-it note will do the trick)."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fix for case when offline players enter a lobby and then join a friend during the countdown are unable to play."}},
        {tags={},text={"*Fix for animation glitch in Grineer melee enemy units when walking."}},
        {tags={"Flux Rifle",},text={"*Fix for Flux Rifle not being able to damage ragdolled enemies on client."}},
        {tags={"Nyx","Capture",},text={"*Fix for HUD breaking when reviving capture target affected with Nyx’s “Mind Control”."}},
        {tags={},text={"*Fixed continuous fire weapons not swapping out until you stop sprinting."}},
        {tags={"Dethcube","Wyrm",},text={"*Fixes for badges on %[%[Wyrm%]%] and %[%[Dethcube%]%] being offset."}},
        {tags={"Ash",},text={"*Fix for weapons not returning after using Ash’s Bladestorm"}},
        {tags={"Saryn",},text={"*Fix for Clients receiving the Power In Use error when casting Saryn%'s Venom ability"}},
        {tags={"Vauban",},text={"*Fixed bad cases with Tesla, Bounce, and Bastille that would occur when the instigator player would die/respawn/leave the game."}},
        {tags={},text={"*Fix for players is unable to gain credits if they have a negative credit balance"}},
        {tags={"Clan",},text={"*Fix for potential problems that may arrise if a player is visiting another clan%'s Dojo."}},
        {tags={"Machete",},text={"*Fix for %[%[Machete%]%] first Strike missing a lot"}},
        {tags={},text={"*Fixed character walking up on top of crates when trying to destroy them with melee attacks"}},
        {tags={},text={"*Fixed alt helmets applying their effects twice when you have a clan emblem projector equipped."}},
        {tags={"Dera",},text={"*Fix for Dera%'s laser bolts will always hit to the let of the crosshairs"}},
        {tags={},text={"*Fixed being able to immediately reload bow weapons every time the sprint key is"}},
        {tags={"Saryn",},text={"*Fixed Saryn%'s Molt not showing vfx on clients."}},
        {tags={"Lech Kril",},text={"*Fix for Lech Kril being stuch in invincible mode on some encounters."}},
        {tags={"Ogris","Torid","Killing Blow",},text={"*Fix for killing blows with %[%[Ogris%]%] or %[%[Torid%]%] affecting resource drops for client."}},
        {tags={"Ogris","Torid","Killing Blow",},text={"**Further stability to replicated drops has been added."}},
        {tags={},text={"*Fixed APEX crash."}},
        {tags={"Clan",},text={"*Fix for Clan Emblems not appearing for Clients."}},
},--fixes end

},--update end
{
["update number"]={"9.3.4"},
["type"]={"fix"},
["date"]={"July 29, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/88013-hotfix-934/"},
["misc"]={
        {tags={"Clan","Research"},text={"* fixed new Ammo Mutation Mods not being compatible with Clan Tech weapons."}},
        {tags={"Clan","Forma",},text={"* fixed blueprints for weekend event Dojo Trophies requiring 16 %[%[Forma%]%] to build instead of 16 %[%[Gallium%]%]."}},
},--misc end

},--update end
{
["update number"]={"9.3.3"},
["type"]={"fix"},
["date"]={"July 29, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/87914-hotfix-933/"},
["misc"]={
        {tags={},text={"* %[%[Sling-Stone Event|Sling Stone%]%] Victory entry added to Lore section of Player Profile"}},
        {tags={},text={"* Leftover %[%[corruptor%]%]s can now be sold from the Inventory section of the Arsenal"}},
        {tags={},text={"* Increased brightness of Warframe %'energy%' color"}},
        {tags={},text={"* Fixed mods awarded from Steam packs not appearing in player inventory. Accounts affected will be retroactively fixed today."}},
},--misc end

},--update end
{
["update number"]={"9.3.2"},
["type"]={"fix"},
["date"]={"July 26, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/86723-hotfix-932/"},
["misc"]={
        {tags={},text={"*fixed host player shields taking damage when attacked by teammates"}},
        {tags={},text={"*fixed enemy shields being bypassed when taking large damage amounts"}},
        {tags={},text={"*fixed %[%[Shield Osprey%]%] not applying shield buffs to his allies"}},
},--misc end

},--update end
{
["update number"]={"9.3.1"},
["type"]={"fix"},
["date"]={"July 26, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/86627-hotfix-931/"},
["misc"]={
        {tags={"Star Chart",},text={"*fixed active squad counts not appearing in star chart"}},
        {tags={"Clan",},text={"*fixed top of Clan leaderboard not being limited to Clan tier"}},
        {tags={},text={"*added missing weekend event localizations for various languages"}},
        {tags={},text={"*fixed %'-1d%' appearing next to destroyed Fomorian ship descriptions"}},
        {tags={},text={"*improved sharpness of chat font"}},
        {tags={"Nova","Market","Saryn","Banshee","Nyx",},text={"*fixed market descriptions for Femme Fatale and Go Nova! features"}},
},--misc end

},--update end
{
["update number"]={"9.3"},
["date"]={"July 26, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/86462-hotfix-93/"},
["image"]={"SlingStone Banner.jpg"},
["additions"]={
        {tags={},text={"*Calling all Tenno! Your help is needed July 26 until July 29 @ 12 PM EDT!"}},
        {tags={"Vasto",},text={"*New Weapon: The %[%[Vasto|VASTO%]%] Tenno revolver!"}},
        {tags={"Market","Fusion Core",},text={"*Fusion Core Bundles: 3 tiers to choose from in the Market."}},
        {tags={"Rifle Ammo Mutation","Sniper Ammo Mutation","Shotgun Ammo Mutation","Pistol Ammo Mutation","Arrow Mutation",},text={"*New Ammo Mutator mods: converts unused ammo to select ammo type (Pistol, Shotgun, Rifle, Sniper, Bow)."}},
        {tags={},text={"*Event Reward for Individuals: holographic badge in Warframe customization options."}},
        {tags={"Clan",},text={"*Event Reward for Clans: Fomorian ship statue for clan dojo."}},
        {tags={},text={"*Beware! A new enemy type is patrolling the Famorian ships. The Grineer %[%[Eviscerator%]%]."}},
        {tags={"Market",},text={"*Ongoing Marketplace revisions"}},
        {tags={"Market",},text={"*Main page now displays 6x Featured items and 6x Most Popular items."}},
        {tags={},text={"*Added experimental new %'Camera Controls Melee Direction%' toggle to Settings screen (ON by default). When toggled off all melee attacks will be made in the direction your character is actually facing rather than using the reticle%'s aiming point. Toggling OFF may be preferable for players using gamepads."}},
        {tags={"Clan",},text={"*Added Leaderboards for personal and clan stats (including event stats) to Profile screen."}},
        {tags={"Alert",},text={"*Added mouse wheel scrolling for news/alerts/operations."}},
},--additions end
["changes"]={
        {tags={"Foundry","Market",},text={"*Continued UI re-skinning: new fonts, popups, Login UI, Market UI (now includes Popular list and separate GEAR section), Foundry UI now uses 4-row layout instead of grid."}},
        {tags={"Mastery Rank",},text={"*Online matchmaking now favors hosts within 3 mastery ranks of player when joining a mission where multiple hosts are available."}},
        {tags={"Exterminate",},text={"*Can no longer join public in-progress extermination missions once half the enemies have been eliminated."}},
        {tags={},text={"*Enable ground hit on enemies who have ragdolled (as opposed to only working on enemies who are %'knocked down%')."}},
        {tags={},text={"*Cleaned up tutorial level with proper pathing on stairs, missing collision on meshes, and blocking volumes."}},
        {tags={"Void",},text={"*Orokin Loot Runs: Adjusted timings on the loot run doors to provide appropriate challenge."}},
        {tags={"Clan",},text={"*Obstacle course: Time limit shortened, and when it expires the player is teleported to the beginning with a fail message."}},
        {tags={"Clan",},text={"*Obstacle course: Added %'cancel%' pads."}},
        {tags={},text={"*Added access to landing area in Large Corpus Cargo room (as requested)."}},
        {tags={"Nightmare Mode",},text={"*Increased difficulty (just a little) of %[%[Nightmare Mode%]%]."}},
        {tags={"Nightmare Mode",},text={"*Nightmare mode storage lockers don%'t give ammo."}},
        {tags={"Ash",},text={"*%[%[Ash%]%] Bladestorm ability deals increasing damage as it levels up."}},
        {tags={},text={"*Grineer Animations for triggering consoles with more urgency."}},
        {tags={"Loki","Mag",},text={"*Infested Ancient %[%[Loki%]%] Switch Teleport reaction animations, %[%[Mag%]%] Crush react animations, and stealth attacks."}},
        {tags={},text={"*Corpus Biped animation improvements (feet, toes, ankles, firing pose)."}},
        {tags={},text={"*Arrows now use energy colors of the Bows."}},
        {tags={},text={"*Energy color clamped between 25%-65% luminance, sunglasses no longer required."}},
        {tags={"Torid",},text={"*Reduced particle fx on %[%[Torid%]%]."}},
        {tags={},text={"*Ensured all powersuit fx have a proper default color set, for when we add that option."}},
        {tags={"Orthos Prime","Prime",},text={"*%[%[Orthos Prime%]%] elemental FX update."}},
        {tags={"Grineer Galleon",},text={"*Visual FX improvements in %[%[Grineer Galleon%]%]."}},
        {tags={"Supra",},text={"*%[%[Supra%]%] emissive fade on reload."}},
        {tags={"Lanka","Ogris",},text={"*%[%[Lanka%]%], %[%[Ogris%]%] updated charged sounds."}},
        {tags={"Latron Prime","Snipetron Vandal","Sobek","Lato Prime","Lato Vandal","Prime","Vandal",},text={"*%[%[Lato Vandal%]%], %[%[Latron Prime%]%], %[%[Lato Prime%]%], %[%[Snipetron Vandal%]%], %[%[Sobek%]%] updated fire sounds."}},
        {tags={"Nightmare Mode",},text={"*Better timer sound for Nightmare mode."}},
        {tags={},text={"*Added vocals to Infested %[%[charger%]%]."}},
        {tags={"Volt",},text={"*%[%[Volt%]%] audio revisions on abilities."}},
        {tags={},text={"*General Audio revisions: stereo loops cut down to mono, low compression settings."}},
        {tags={},text={"*Shortened the laser impact sounds that Corpus weapons use."}},
        {tags={"Flux Rifle",},text={"*Smaller radius on impact sounds for the %[%[Flux Rifle%]%]."}},
        {tags={"Mag","Nova","Market",},text={"*%[%[Mag%]%], %[%[Nova%]%] revisions to descriptions in Marketplace. Shorter."}},
        {tags={"Market",},text={"*Removed French holiday color picker from Market."}},
},--changes end
["fixes"]={
        {tags={"Exterminate","Star Chart",},text={"*Fixed missing exterminate level in Corpus missiondeck, affected 4 missions on star chart."}},
        {tags={},text={"*Fixed incorrect value in Spanish for credit bundle."}},
        {tags={"Void"},text={"*Fixed elevator bug in Orokin engine room."}},
        {tags={"Grineer Galleon",},text={"*Fixed Galleon connector piece that had missing gameplay."}},
        {tags={"Grineer Galleon",},text={"*Fixed Galleon %[%[Raid%]%] level reduced problem areas where players could get stuck"}},
        {tags={"Nightmare Mode",},text={"*Fixed weapon restrictions not being applied in nightmare mode."}},
        {tags={"Corpus Outpost",},text={"*Fixed AI navigation issues in Corpus Outpost"}},
        {tags={},text={"*Fixed (again) secondary objectives not enabling if a host migration takes place before the first objective is completed."}},
        {tags={"Sentinel",},text={"*Fixed %[%[Sentinels%]%] using powers/targeting enemies during rank up challenges."}},
        {tags={},text={"*Fixed a potential bug where two secondary objective scripts running simultaneously could stop the other from running."}},
        {tags={"Nightmare Mode",},text={"*Fixed weapon restrictions not being applied in Nightmare mode."}},
        {tags={"Glaive",},text={"*Fixed %[%[Stealth%]%] Attack animation %[%[Glaive%]%] on Quadruped"}},
        {tags={"Grineer Galleon",},text={"*Fixed reported issues with Galleon doors that pushed or moved players."}},
        {tags={"Ember",},text={"*Fixed %[%[Ember%]%]%'s %[%[Backdraft_Ember_Helmet|Backdraft helmet%]%] tinting options."}},
        {tags={},text={"*Fixed various collision issues in all levels."}},
        {tags={},text={"*Fixed stamina pickups not working on client in Obstacle Course."}},
        {tags={"Clan",},text={"*Fixed depth bias of clan emblems so they don%'t interfer."}},
        {tags={"Clan",},text={"*Fixed speed run exploit in Obstacle Course."}},
        {tags={},text={"*Fixed some holster positions on most Warframes."}},
        {tags={},text={"*Fixed reload animation blends (blend with aim idle instead of passive idle)"}},
        {tags={"Ash",},text={"*Fixed Ash Smoke Screen VFX to last as long as the ability."}},
        {tags={},text={"*Fixed AI weapon melee hit effect sounds."}},
        {tags={},text={"*Fixed broken descriptions for both melee %'dual stat%' mods."}},
        {tags={},text={"*Fixed/removed the unnecessary sounds attached to the Rolling Drones."}},
        {tags={"Ash","Clan",},text={"*Fixed Ash%'s smoke screen from applying effect to clan emblem icon. Emblem now just goes invisible."}},
        {tags={"Clan","Lotus",},text={"*Fixed Lotus symbol being overlaid on the clan emblem icon from certain effects."}},
        {tags={},text={"*Fixed Broken item resources that were unavailable when playing in Polish."}},
        {tags={"Clan",},text={"*Fixed stamina pickups not applying to clients when running Dojo obstacle course"}},
        {tags={"Vauban",},text={"*Fixed Vortex damaging teammates if a player using Vauban casts it then disconnects"}},
        {tags={},text={"*Fixed Infested Ancient electricity & fire death animations"}},
        {tags={},text={"*Fixed default graphics settings not being detected/applied correctly for lower-end PCs"}},
        {tags={},text={"*Fixed UI becoming unresponsive in the event that hosting a mission fails"}},
        {tags={"Kunai",},text={"*Fixed incorrect default colors appearing after choosing to reset colors for specific weapons (e.g. %[%[Kunai%]%])"}},
        {tags={"Alert",},text={"*Fixed number of %'alert%' enemies not being retained after host migration."}},
        {tags={},text={"*Fixed charged-melee input being ignored if held after making several normal melee attacks"}},
        {tags={"Nightmare Mode",},text={"*Fixed host migrating during nightmare mode causing the mode to change"}},
        {tags={"Rhino",},text={"*Fixed %[%[Rhino%]%]%'s iron skin effects not being removed on client"}},
        {tags={"Defense",},text={"*Fixed duplicate mods being added to player inventory after reaching 10+ waves of Defense"}},
        {tags={"Lech Kril",},text={"*Fixed %[%[Lieutenant Lech Kril|Lech Kril%]%]%'s hammer continuing to damage players after swing animation ends"}},
        {tags={},text={"*Fixed Contacts List selecting wrong player if the user list refreshed after bringing up the right-click context menu"}},
        {tags={"Vauban",},text={"*Fixed Bastille not affecting Grineer %[%[Seeker%]%]s and %[%[Ballista|Snipers%]%]"}},
        {tags={"Vauban",},text={"*Fixed damage not registering against %[%[Crewman%]%] affected by Bastille"}},
        {tags={"Loki",},text={"*Fixed Radial Disarm harming instead of disarming Grineer %[%[Elite Lancer%]%]s"}},
        {tags={},text={"*Fixed chat window disappearing after completing a mission when Global Chat option is disabled"}},
        {tags={"Ash",},text={"*Fixed issue of random loss of functionality when using Ash%'s Bladestorm ability."}},
        {tags={"Mastery Rank",},text={"*Fixed being able to gain mastery rank without completing test by replaying the tutorial"}},
        {tags={"Alert",},text={"*Fixed various items not being awarded after completing alerts when language is set to Polish"}},
        {tags={"Market",},text={"*Fixed mods purchased from the store via booster packs not displaying their fusion level on the %'results%' screen."}},
        {tags={},text={"*Fixed multiple reported crashes."}},
        {tags={"Ash",},text={"*Fixed some %'stuck%' issues relating to Ash%'s Bladestorm ability."}},
        {tags={"Clan",},text={"*Fixed issue where new clans can%'t invite new members until the clan leader logs out and back in again."}},
        {tags={"Defense",},text={"*Fixed various powers unintentionally affecting new Orokin Defense Avatar."}},
        {tags={},text={"*Fixed Infested Ancients t-posing and not ragdolling."}},
        {tags={},text={"*Fixed bug in Obstacle course where time limit ends while the player is falling out of bounds. Player would be teleported to the beginning by the failure condition, but teleported back to the checkpoint in the course by the out of bounds trigger."}},
},--fixes end

},--update end
{
["update number"]={"9.2.2"},
["type"]={"fix"},
["date"]={"July 24, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/85484-hotfix-922/"},
["misc"]={
        {tags={},text={"*Relocated a number of our servers from the playwarframe.com domain to warframe.com where they will have new updated SSL certificates. This should assist with self-help method we have in place if things don%'t function properly."}},
},--misc end

},--update end
{
["update number"]={"9.2.1"},
["type"]={"fix"},
["date"]={"July 20, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/83179-hotfix-921/"},
["misc"]={
        {tags={"Seer",},text={"* Fixed %[%[Seer%]%] colour customization issues."}},
},--misc end

},--update end
{
["update number"]={"9.2"},
["date"]={"July 19, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/83114-hotfix-920/"},
["changes"]={
        {tags={"Nightmare Mode",},text={"*Vampire mode degeneration cannot kill the player -- lowest health can be is 1%. Must die to enemy fire or other environmental disasters."}},
        {tags={"Vor",},text={"*Adjusted Vor’s scaling with tweaks to MultiPlayer matches. He should not get higher than rank 54 vs 4 rank 30 players."}},
        {tags={"Vor",},text={"*Several more tweaks to Vor’s difficulty."}},
        {tags={"Nightmare Mode","Mercury",},text={"*Removed Nightmare mode as an option for Mercury missions."}},
        {tags={},text={"*%'/ignore%' now stops invites from friends, ignored players will no longer be able to add you as a friend."}},
        {tags={"Vor",},text={"*Captain Vor’s damage intake is now locked to stages, prevent massive damage from taking him down too fast."}},
},--changes end
["fixes"]={
        {tags={"Sobek","Torid",},text={"*Fixed the Sobek and Torid weapons so that they can be fired when coming out of a sprint."}},
        {tags={"Clan",},text={"*Fix for account issues if user aborts dojo component having contributed with vault materials."}},
        {tags={"Nova",},text={"*Fix Nova Drop disappearing for clients."}},
        {tags={"Volt",},text={"*Fix Volt Shock chains not using correct energy colour."}},
        {tags={"Volt",},text={"*Fix Volt Speed FX not using correct energy colour."}},
        {tags={"Nova",},text={"*Fix Null Star not using correct energy colour"}},
        {tags={"Nova",},text={"*Fix for Corrupted Shield Drones not being targeted by Null Star."}},
        {tags={"Glaive","Kestrel",},text={"*Fixed the Glaive and Kestrels charged attacks so that they take into account any power stored in the weapon from mods such as Melee Channel."}},
        {tags={"Nova",},text={"*Fix to Wormhole%'s destination offset."}},
        {tags={"Seeker","Seeking Force",},text={"*Fixed the Seeker and Seeking Force mods so that their puncture amount increases with each level, instead of every other level."}},
        {tags={"Sentinel","Clan",},text={"*Fixed clan emblems not appearing properly on Sentinels."}},
        {tags={},text={"*Fixed Corpus laser doors no longer activating after host migration."}},
        {tags={"Clan",},text={"*<%strike>Show the ClanHall recipe in UI, so clans can build more than one of these and increase capacity without increasing tier.<%/strike> The intent will be to allow all hall types for all tiers, this is a coming fix, disregard this note for now."}},
        {tags={"Sentinel","Duel",},text={"*Fix for Sentinels getting into spammy state of ability use after a duel ends."}},
        {tags={"Sentinel",},text={"*Fix for Sentinels getting spammy with their abilities as a result of faction changes."}},
        {tags={},text={"*Fix for objective indicator sometimes not appearing in correct location in some levels."}},
        {tags={},text={"*Fix missing up/down stat arrows when you purchase mod packs."}},
},--fixes end

},--update end
{
["update number"]={"9.1.5"},
["type"]={"fix"},
["date"]={"July 17, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/81860-hotfix-915/"},
["title"]={"wee Hotfix!"},
["misc"]={
        {tags={"Fang Prime","Orthos Prime","Foundry","Prime",},text={"*Fix for not being able to build %[%[Fang Prime%]%] or %[%[Orthos Prime%]%] in %[%[Foundry%]%]."}},
        {tags={},text={"*Fix for 10 different crash issues players were having."}},
        {tags={"Raptors",},text={"*Fix for %[%[Raptor%]%] Drop Rate issues."}},
        {tags={},text={"*Fix for %[%[Elite Lancer%]%] enemy type being too difficult."}},
},--misc end

},--update end
{
["update number"]={"9.1.4"},
["type"]={"fix"},
["date"]={"July 16, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/80449-hotfix-914/"},
["changes"]={
        {tags={"Aura"},text={"*%[%[Aura%]%] mods now *boost* your mod capacity rather than drain it."}},
        {tags={"Foundry",},text={"*%[%[Foundry%]%] changes: Components that you have 0 of don’t show, transition time between panels cut in half, sort by %'type%' added, screen transition and panel transition concurrent."}},
        {tags={"Clan",},text={"*Added clear labels to Dojo Halls to denote that if you build a bigger hall, you move up a Clan Tier and resources will scale accordingly."}},
},--changes end
["fixes"]={
        {tags={"Clan",},text={"*Fix for clan emblems to render better in game (switched to alpha compression)."}},
        {tags={"Dethcube",},text={"*Fix for %[%[Dethcube%]%] issues with attacks."}},
        {tags={"Nightmare Mode",},text={"*Fix for Nightmare mode timer sound not being high enough stakes."}},
        {tags={"Lotus",},text={"*Fix for inaudible %[%[Lotus%]%] VO for some users. She’s baaaaaaaaaaaaaaaaaaaack!"}},
        {tags={"Clan",},text={"*Fix for bug where inviting new guild members fails."}},
        {tags={"Exterminate","Corpus Ship",},text={"*Fix for boss rooms and gates being included in %[%[Corpus Ship%]%] Exterminate missions."}},
        {tags={"Exterminate","Corpus Ship",},text={"*Fix for Corpus Ship Exterminate missions having closed doors block progress."}},
        {tags={"Grineer Galleon",},text={"*Further improvements to hack panel issues in the %[%[Grineer Galleon%]%] ."}},
        {tags={},text={"*Fix for last active date displaying “unknown”"}},
        {tags={},text={"*Fix for key-based missions freezing Solar Chart after aborting."}},
        {tags={"Clan",},text={"*Potential fix for first-time contributions failing if a new guild is created."}},
        {tags={"Nova",},text={"*Fix for %[%[Worm Hole%]%] not leveling properly."}},
        {tags={},text={"*Fix for fourth player in a lobby not being able to vote."}},
        {tags={"Void",},text={"*Fix for timed Orokin Void runs being inaccessible."}},
        {tags={"Fang Prime","Prime",},text={"*%[%[Fang Prime%]%] speed buff."}},
        {tags={"Sobek",},text={"*Further %[%[Sobek%]%] changes: more damage, longer reload."}},
        {tags={},text={"*Various crash fixes."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Notes:%'%'%'"}},
        {tags={"Aura"},text={"For those that polarized the Aura slot to match an Aura mod, its not wasted - it doubles the benefit!"}},
},--fixes end

},--update end
{
["update number"]={"9.1.3"},
["type"]={"fix"},
["date"]={"July 15, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/80449-hotfix-913/"},
["misc"]={
        {tags={"Raptors",},text={"*Further improvements to preventing the Raptor fleeing the map(*)"}},
        {tags={"Nightmare Mode",},text={"*Further tweaks to Nightmare Mode Vampire missions to be challenging but playable."}},
        {tags={},text={"*Potential crash fixes."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Raptors",},text={"*Note: Seeing a lot of posts about Raptor drop date. What may be happening is drops are occurring out of bounds (or getting knocked out of bounds) and being teleported back to the center of the %'Boss Arena%'. We will further investigate this."}},
},--misc end

},--update end
{
["update number"]={"9.1.2"},
["type"]={"fix"},
["date"]={"July 15, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/80366-hotfix-912/"},
["misc"]={
        {tags={},text={"Gotta hotfix the hotfix!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan",},text={"*Fix for Clan Contact list UI becoming perma-highlighted and unresponsive on hover of offline members."}},
        {tags={"Nightmare Mode",},text={"*<%s>Fix for Vampire Mode health degenerating too quickly to complete missions.<%/s> Not working as intended."}},
        {tags={"Clan",},text={"*Potential fix for those seeing negative resource values in their Clan dojo."}},
},--misc end

},--update end
{
["update number"]={"9.1.1"},
["type"]={"fix"},
["date"]={"July 15, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/80292-hotfix-911/"},
["changes"]={
        {tags={"Sobek",},text={"*Damage buff for %[%[Sobek%]%], the new Shotgun."}},
        {tags={},text={"*%[%[Resources|Resource%]%] labels restored in UI mission screen."}},
        {tags={},text={"*Resource Drops now follow regular rarity logic."}},
        {tags={"Foundry",},text={"*New UI back in %[%[Foundry%]%]."}},
        {tags={"Clan",},text={"*%[%[Clan%]%] contact list now displays “last sign in” over Alias for offline and pending contacts."}},
        {tags={},text={"*Squad information now again displays on the mission map."}},
        {tags={"Nightmare Mode",},text={"*Increased difficulty of %[%[Nightmare Mode%]%]. Vampire drain rate is higher, <%s>and weapon restrictions are now enabled<%/s>... coming soon. MUHAHA!"}},
        {tags={"Mercury",},text={"*%[%[Mercury%]%] difficulty tweaks, now more new player friendly."}},
},--changes end
["fixes"]={
        {tags={"Nightmare Mode",},text={"*Fix for Nightmare mode appearing on nodes before entire planet had been completed."}},
        {tags={"Exterminate",},text={"*Fix for issues completing %[%[Corpus%]%] %[%[Exterminate%]%] missions."}},
        {tags={"Vauban",},text={"*Fix for %[%[Vauban%]%] Vortex preventing revives in squad."}},
        {tags={"Raptors",},text={"*Fix for %[%[Raptor%]%] boss drops not being in reachable place."}},
        {tags={"Paris Prime","Prime",},text={"*Fix for %[%[Paris Prime%]%] blueprint not having icon or saving to inventory."}},
        {tags={"Raptors",},text={"*Raptor boss will no longer flee to the surrounding mountains."}},
        {tags={},text={"*Fix for %[%[Infested%]%] Ancients replaying taunt animation if shot while playing."}},
        {tags={},text={"*Fix for players getting stuck in lobby after host leaves."}},
        {tags={"Banshee",},text={"*Fix for crash with %[%[Banshee%]%] “Soundquake” if gore was disabled."}},
        {tags={"Nova",},text={"*Fix for %[%[Nova%]%] Molecular Prime not damaging nearby enemies after explosion."}},
        {tags={"Loki","Vor",},text={"*Fix for %[%[Loki%]%] Decoy putting %[%[Captain Vor%]%] in an inactive state."}},
        {tags={"Exterminate",},text={"*Fix for doors not opening in Exterminate missions."}},
        {tags={"Grineer Galleon",},text={"*Fix for some tilesets not having hack panels in %[%[Grineer Galleon%]%]."}},
        {tags={},text={"*Fix for contact list involuntarily scrolling when contacts status changed."}},
        {tags={"Rifle Amp",},text={"*Fix for %[%[Rifle Amp%]%] Aura stacking. A word from the designer: Rifle Amp, 45% damage buff stacking was too much, reduced to 27% (4.5% base). This was a typo on my part."}},
        {tags={"Clan","Research",},text={"*Fix for NOT being able to contribute to tech projects from the %[%[Clan%]%] Vault."}},
},--fixes end

},--update end
{
["update number"]={"9.1"},
["date"]={"July 14, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/78040-hotfix-91/"},
["misc"]={
        {tags={"Vor",},text={"*Simplified the vengeful %[%[Captain Vor|Vor%]%]%'s scaling - he will no longer be quite as tough as he thought he was (less than level 100)."}},
        {tags={"Foundry",},text={"*Swapped the old %[%[Foundry%]%] back in until we fix the recipe issues with the new version."}},
        {tags={},text={"*Fix for starchart camera moving around when dragging window chat."}},
        {tags={},text={"*Fix for %[%[Resources%]%] material drops throughout solar system."}},
        {tags={"Sabotage","Lotus",},text={"*Fix for problem in tutorial where enemies were trying to sabotage the %[%[Lotus%]%]%'s guidance."}},
        {tags={"Clan",},text={"*Fix for %[%[Dojo%]%]s who had overcontributed and were in a locked state after scaling prices took effect."}},
        {tags={"Defense","Survival","Nightmare Mode",},text={"*Fix and swap for %[%[Nightmare Mode|Nightmare%]%] %[%[Defense%]%] mode: mission is now 15 wave countdown aka Nightmare Survival Defense."}},
},--misc end

},--update end
{
["update number"]={"9.0"},
["date"]={"July 13, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/77575-update-9-vors-revenge/"},
["title"]={"Vors Revenge"},
["image"]={"SSlsDP1.jpg"},
["misc"]={
        {tags={},text={"%[%[File:Update_9.0_Highlights|500px|center|Teaser of U9, %'we%'re hours away from Update 9.%'%]%]"}},
},--misc end
["additions"]={
        {tags={"Nova",},text={"*%'%'%'Design Council Warframe – %[%[Nova%]%]%'%'%'"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%[%[file:oXw3H3U.png|200px|left%]%]"}},
        {tags={"Braton","Braton Prime","Paris","Paris Prime","Bronco","Bronco Prime","Fang","Fang Prime","Orthos","Orthos Prime","Capture","Defense","Mobile Defense","Void","Prime",},text={"%'%'%'Orokin Void Map expansion (with Mobile Defense, Defense, and Capture!) with 5 new Prime weapons to be found (%[%[Bronco Prime|Bronco%]%], %[%[Fang Prime|Fang%]%], %[%[Paris Prime|Paris%]%], %[%[Braton Prime|Braton%]%], %[%[Orthos Prime|Orthos%]%])%'%'%'"}},
        {tags={},text={"{{clr}}"}},
        {tags={},text={"%[%[file:WjLkPHh.png|200px|left%]%]"}},
        {tags={"Seer","Vor",},text={"%'%'%'%[%[Captain Vor%]%] Boss Battle (drops rare %[%[Seer%]%] scoped pistol blueprints)%'%'%'"}},
        {tags={},text={"{{clr}}"}},
        {tags={},text={"%[%[file:jeATaut.png|200px|left%]%]"}},
        {tags={"Sentinel",},text={"%'%'%'New %[%[Sentinel_Cosmetics#Attachments|Sentinel Attachments%]%] – Jet Wings, Koi Tail, Mech Head Mask%'%'%'"}},
        {tags={},text={"{{clr}}"}},
        {tags={},text={"%[%[file:llcBaCT.png|200px|left%]%]"}},
        {tags={"Snipetron","Clan",},text={"%'%'%'%[%[Dojo%]%] Statues have Arrived! Explore 12 new placeable decorations for your dojo (Plus, coming soon, +2 more decos for top ranked clans from %[%[Fusion Moa Event|Fusion MOA%]%] and %[%[Informant Event|Snipetron event%]%])%'%'%'"}},
        {tags={},text={"{{clr}}"}},
        {tags={},text={"%[%[file:L7Lh1al.png|200px|left%]%]"}},
        {tags={"Sobek",},text={"%'%'%'New Weapon – Grineer Shotgun %[%[Sobek%]%]%'%'%'"}},
        {tags={},text={"{{clr}}"}},
        {tags={"Hikou",},text={"*New Weapon – Tenno Throwing stars %[%[Hikou%]%]"}},
        {tags={"Spectra","Clan","Research",},text={"*New Clan Research Weapon – Corpus Pistol %[%[Spectra%]%]"}},
        {tags={},text={"*Added first phases of Lore UI (click your in-game profile and look for the tab!)"}},
        {tags={"Capture","Mobile Defense","Deception","Spy","Grineer Galleon",},text={"*%[%[Grineer Galleon%]%] Map Expansion (now supporting %[%[Mobile Defense%]%], %[%[Spy%]%], %[%[Deception%]%], %[%[Capture%]%])"}},
        {tags={"Nova",},text={"*Series II Warframe %[%[:Category:Helmet|Alt Helmets%]%]: 14 new Warframe Helmets (1 for each Warframe including NOVA)"}},
        {tags={},text={"*Avatar packs for all Season II helmets."}},
        {tags={"Clan",},text={"*Clan & Dojo Management Improvements (MotD, Clan size restrictions)"}},
        {tags={},text={"*New star map functionality with Cinematic dioramas."}},
        {tags={"Aura"},text={"*%[%[Aura%]%] mod system is here! The %[%[Artifact%]%]s system has transformed into a new system and has merged with the Arsenal UI. The new “Auras” can be fused just like mods, and they have their own slot! Auras are powerful, but also come at a cost to equip."}},
        {tags={"Bane of Corpus","Bane of Grineer","Bane of Infested","Expel Corpus","Expel Grineer","Expel Infested","Cleanse Corpus","Cleanse Grineer","Cleanse Infested","Smite Corpus","Smite Grineer","Smite Infested"},text={"*12x new Mods: %[%[Faction Damage Mods|Faction %'Bane%'%]%] (melee, pistol, shotgun, rifle)"}},
        {tags={"Nightmare Mode",},text={"*%[%[Nightmare Mode|Nightmare Game Mode%]%]. Are you tough enough to survive Nightmare mode?"}},
        {tags={"Nightmare Mode",},text={"*10x Dual Stat Mods rewards (awarded in “Nightmare” game mode challenges only)"}},
        {tags={"Foundry",},text={"*Sneak preview of new UI in the Foundry!"}},
        {tags={"Raptors","Europa",},text={"*New Boss on %[%[Europa%]%]! Look out for the Corpus %[%[Raptor%]%]!"}},
        {tags={"Vor",},text={"*New Tutorial added, look out for Captain Vor!"}},
        {tags={"Alert",},text={"*New Infested %[%[Infested#Ancients|Ancient%]%] enemy has appeared in the solar system, be alert."}},
        {tags={},text={"*New color picker for the French Holiday!"}},
        {tags={"Clan",},text={"*Clan Emblems have been added as an option to the game. Warlords, check the www.warframe.com/user/page!"}},
        {tags={"Market",},text={"*New Resource and Credit bundle options added to the %[%[Market%]%]."}},
},--additions end
["changes"]={
        {tags={"Clan",},text={"*Enabled Clan size caps. This cap is Phase One of making the shift to the new Alliance System. With this change also comes the new scaled resourced per Clan Tier. Please see this post to see where you and your clan fit in: %[%https://forums.warframe.com/index.php?/topic/77361-clan-caps-coming/ Forum post%]"}},
        {tags={},text={"*Added toggle for “gore” in Options Menu. Gore enabled by default."}},
        {tags={},text={"*Added friendly system message in EU Region Global chat reminding players to “take a break” every hour they play."}},
        {tags={"Market",},text={"*Changed a variety of blueprint recipes in the Marketplace."}},
        {tags={"Boltor","Burston","Dera","Afuris","Furis","Viper","Furax","Gram",},text={"*Refined the tint options on the %[%[Burston%]%], %[%[Viper%]%], %[%[Gram%]%], %[%[Furis%]%], %[%[Afuris%]%], %[%[Dera%]%], %[%[Furax%]%], and %[%[Boltor%]%]."}},
        {tags={"Snipetron Vandal","Vandal",},text={"*Revisions to %[%[Snipetron Vandal%]%] sounds."}},
        {tags={"Mobile Defense",},text={"*%[%[Mobile Defense%]%]: Adjusted number of active enemies allowed during defense stages - more for solo & increase numbers slightly in stage 2 & 3 to make them more epic."}},
        {tags={"Mobile Defense",},text={"*Enemies will storm the defense targets, which makes them much more aggressive towards it."}},
        {tags={},text={"*Improved sprint animations for throwing weapons movement set."}},
        {tags={},text={"*Prevent players from entering missions once a build update has been detected."}},
        {tags={"Ash",},text={"*Improved color tinting on %[%[Ash%]%]’s smoke armband—more subtle."}},
        {tags={"Mobile Defense",},text={"*Mobile Defense – Release lockdown when going into a defense wave. NPC’s abort running to panic button during defense wave."}},
        {tags={},text={"*Weapon skins selector now supports displaying more than 7 skins."}},
        {tags={"Dread",},text={"*Added arrow trail to %[%[Dread%]%] projectiles."}},
        {tags={},text={"*Show Squad count when hovering over nodes."}},
        {tags={"Maneuvers",},text={"*Disabled mantle/wall run on decorative trees to prevent players from getting stuck in them."}},
        {tags={"Burston",},text={"*Burston - damage and fire rate buff."}},
        {tags={"Dera",},text={"*Dera - projectile speed increased (doubled flight speed)."}},
        {tags={"Flux Rifle",},text={"*%[%[Flux Rifle%]%] – damage and fire rate buff."}},
        {tags={"Lanka",},text={"*%[%[Lanka%]%] – damage and damage type (serrated) buff."}},
        {tags={"True Steel",},text={"*%[%[True Steel%]%] mod buff (doubled)."}},
        {tags={"Pressure Point",},text={"*%[%[Pressure Point%]%] mod buff (20% base)."}},
        {tags={"Reaper Prime","Prime",},text={"*%[%[Reaper Prime%]%] buff – a bit more speed, damage, and charge damage."}},
        {tags={"Viper",},text={"*%[%[Shield Lancer%]%]s now use Grineer %[%[Viper%]%] instead of Tenno weapon."}},
        {tags={"Lanka",},text={"*Sniper Mods can now be applied to Lanka"}},
        {tags={},text={"*Increased the drop rate for %[%[Control Module%]%]s, %[%[Alloy Plate%]%], %[%[Neural Sensors%]%], and %[%[Gallium%]%]."}},
},--changes end
["fixes"]={
        {tags={"Acrid","Capture",},text={"*Fixed %[%[Acrid%]%] DOT numbers not showing up on capture target, and death affect not replicating."}},
        {tags={"Exterminate",},text={"*Fixed a case where exterminate missions could be left with non-zero enemy remaining count, but no enemies would spawn."}},
        {tags={"Rhino",},text={"*Fixed %[%[Rhino%]%]%'s Iron Skin being removed by other players causing damage to it."}},
        {tags={"Nyx",},text={"*Fixed ability effects for Nyx to be consistent on host/client both in terms of what is created and what colour it is."}},
        {tags={"Rescue",},text={"*Fixed %[%[Rescue%]%] mission from being completed without freeing the prisoner."}},
        {tags={"Defense",},text={"*Fixed some reported navigation and cover issues AI were having in Grineer Defense."}},
        {tags={"Volt",},text={"*Fixed %[%[Volt%]%]’s Speed ability not making you jog faster."}},
        {tags={},text={"*Fixed player sliding issues."}},
        {tags={"Sabotage","Grineer Galleon",},text={"*Fixed host migration issue in Grineer Galleon %[%[Sabotage%]%] where the target would be missing after migration."}},
        {tags={"Duel","Conclave",},text={"*Fixed health regeneration in PvP dueling."}},
        {tags={},text={"*Fixes to prevent objective related triggers being re-enabled after host migration."}},
        {tags={"Volt",},text={"*Fixed Volt’s Shock ability to chain properly off turrets and cameras."}},
        {tags={"Supra",},text={"*Fixed %[%[Supra%]%] - shots from the Supra will now correctly line up with the target reticule."}},
        {tags={"Despair","Kunai",},text={"*Fixed weapon attachments (%[%[Kunai%]%]/%[%[Despair%]%] holsters) that would detach from player while using a sniper rifle."}},
        {tags={"Despair",},text={"*Fixed/removed off-hand flashlight when using %[%[Despair%]%]."}},
        {tags={"Capture",},text={"*Fixed Capture target hostage AI not following player after host migration."}},
        {tags={"Frost",},text={"*Fixed icon for default %[%[Frost%]%] helmet."}},
        {tags={"Ash",},text={"*Fixed issue where Bladestorm would get “stuck” on clients."}},
        {tags={},text={"*Fixed various reported level issues (clipping, AI nav, level holes)."}},
        {tags={},text={"*Various crash fixes."}},
},--fixes end

},--update end

}
return PatchData
