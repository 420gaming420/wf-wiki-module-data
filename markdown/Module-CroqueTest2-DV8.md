---
title: "Module:CroqueTest2/DV8"
wiki_url: "https://wiki.warframe.com/w/Module/CroqueTest2/DV8"
wiki_timestamp: "2018-04-19T09:16:23Z"
---

*Documentation for this module may be created at [Module:CroqueTest2/DV8/doc](/w/Module:CroqueTest2/DV8/doc?action=edit&redlink=1 "Module:CroqueTest2/DV8/doc (page does not exist)")*

```lua
local PatchData =
{
{
["update number"]={"8.3.3"},
["type"]={"fix"},
["date"]={"July 9, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/76141-hotfix-833/"},
["misc"]={
        {tags={"Rhino",},text={"* Fix for %[%[Rhino%]%] Roar only lasting for 4 seconds."}},
        {tags={"Exterminate",},text={"* Fixed %[%[Exterminate%]%] missions indicating enemies remaining when none are left."}},
        {tags={"Snipetron","Snipetron Vandal","Vandal",},text={"* Updated %[%[Snipetron%]%] & %[%[Snipetron Vandal%]%] sound FX"}},
        {tags={"Volt",},text={"* Fix for %[%[Volt%]%] Speed not making you jog faster"}},
},--misc end

},--update end
{
["update number"]={"8.3.2"},
["type"]={"fix"},
["date"]={"July 8, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/75604-hotfix-832/"},
["misc"]={
        {tags={"Volt",},text={"* Fix for %[%[Volt%]%]%'s Shock %'Power in Use%' bug."}},
        {tags={"Clan",},text={"* Fix for %[%[Dojo%]%]s being unaccessible for new clans."}},
        {tags={"Rhino",},text={"* Fix %[%[Rhino%]%] Roar effects not appearing on client"}},
        {tags={},text={"* Damage modifiers such as armor and headshots no longer unintentionally apply to shields."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"* No further %[%[Informer%]%] drones detected!"}},
},--misc end

},--update end
{
["update number"]={"8.3.1"},
["type"]={"fix"},
["date"]={"July 5, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/74108-hotfix-831/"},
["image"]={"SpyDrone Banner.jpg"},
["additions"]={
        {tags={"Vulkar",},text={"*Vulkar Pack is now live! Get your snipin’ on in Grineer Style!"}},
        {tags={},text={"*The Grineer %[%[Informer%]%]s have arrived. Take ‘em out all weekend long!"}},
},--additions end
["changes"]={
        {tags={"Mag",},text={"*%[%[Mag%]%]%'s Shield Polarize is now percentage-based instead of flat power (10/15/25/50)%"}},
        {tags={"Volt",},text={"*%[%[Volt%]%]%'s Overload DPS increased and casting time reduced."}},
        {tags={"Clan",},text={"*Optimized network code for contact list to better handle large numbers of friends or clan-mates."}},
        {tags={},text={"*Improved handling of online status updates in congested network conditions (often related to contact-list size)."}},
        {tags={},text={"*Tweaks to opacity of MiniMap."}},
        {tags={"Rhino",},text={"*Added FX to %[%[Rhino%]%] Roar."}},
        {tags={"Bronco",},text={"*Sound tweak to %[%[Bronco%]%]."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed for Grandmaster icon showing for all players if you backout of lobby."}},
        {tags={"Volt",},text={"*Fixed Volt%'s shield – it now functions as intended which is to allow shots to fire through from %[%[Warframes%]%] with increased damage."}},
        {tags={"Clan",},text={"*Fixed a number of general performance issues affecting very large clans."}},
        {tags={},text={"*Fix for cipher being unplayable with controller."}},
        {tags={},text={"*Fix for players being staggered in air, instead they are knocked down."}},
        {tags={"Mag",},text={"*Various tweaks to Mag’s Pull."}},
        {tags={"Aklato",},text={"*A few sound ambiance tweaks, plus Aklato tweaks."}},
        {tags={"Defense","Fusion Core",},text={"*Fixed rank 0 fusion cores being a defense reward."}},
        {tags={"Ember",},text={"*Fix for %[%[Ember%]%]%'s FX on clients."}},
        {tags={"Vauban",},text={"*Fix for %[%[Vauban%]%]%'s Vortex killing friendlies if owner dies and respawns."}},
        {tags={"Loki","Exterminate",},text={"*Fix for Radial Disarm being able to manipulate the “enemies remaining” in Exterminate missions."}},
        {tags={"Mag",},text={"*Fix for size inconstancy in Mag’s Bullet Attractor."}},
        {tags={"Mag",},text={"*Fix for Mag’s Pull not working as intended when client."}},
        {tags={"Frost",},text={"*Fix for Snow Globe “Power in Use” bug."}},
        {tags={"Volt",},text={"*Fix for Overload “Power in Use” bug."}},
        {tags={"Saryn",},text={"*Fix for %[%[Saryn%]%]’s Venom “Power in Use” bug."}},
},--fixes end

},--update end
{
["update number"]={"8.3"},
["date"]={"July 4, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/73282-hotfix-83/"},
["additions"]={
        {tags={},text={"*Added improved Solar Landmark system for Grandmasters."}},
        {tags={},text={"*Expanded animation library for the %[%[Grineer%]%] (combat and ambient animations)"}},
        {tags={"Clan",},text={"*MOTD now displayed in halls of the %[%[Dojo%]%]."}},
        {tags={"Clan",},text={"*Added support for /invite in chat, and inviting people who aren%'t on your friends list or in your clan."}},
        {tags={"Market",},text={"*Added 2 options for consumable Fireworks items to the Market."}},
        {tags={},text={"*Added Red White & Blue color picker."}},
        {tags={},text={"*Added game invite and add friend options to chat user list context menu."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'User Found Additions:%'%'%'"}},
        {tags={"Kogake",},text={"*%[%[Kogake%]%] slide attack is now a flying kick, the same one you may have noticed in the Tenno Reinforcement intro video on YouTube. Normal attack also includes an uppercut."}},
        {tags={"Machete",},text={"*%[%[Machete%]%] has a new animation."}},
        {tags={"Void",},text={"*%[%[Void%]%] now has some new tile sets, more traps and lasers, also turrets in locker rooms."}},
},--additions end
["changes"]={
        {tags={"Alert",},text={"*Doubled the length of alerts for rare rewards."}},
        {tags={"Alert",},text={"*Alert System 2.0 is live"}},
        {tags={"Dread","Paris","Stalker",},text={"*%[%[Dread|Stalker Bow%]%] and %[%[Paris%]%] 3D draw sounds now have fire rate multiplier."}},
        {tags={"Sentinel",},text={"*3D Sounds on Pistols and Sentinel now have proper mix effects."}},
        {tags={},text={"*Improved NPC awareness transfer across host migration."}},
        {tags={},text={"*Revised multiple melee weapon animations."}},
        {tags={},text={"*Improved enemy waypoints on minimap to show true location instead of next closest nav location."}},
        {tags={"Clan",},text={"*Dojo pieces that are dead ends are marked as such."}},
        {tags={},text={"*Enemies that had had elemental immunities now take regular damage, with multiplied damage for weaknesses (fire and electricity)."}},
        {tags={"Ash","Loki","Vauban",},text={"*Updated Warframe abilities to use energy color selected by player."}},
        {tags={"Ash","Loki","Vauban",},text={"**including Vauban%'s grenades, Loki%'s decoy, Ash Smoke Screen smoke, will have your energy color."}},
        {tags={},text={"*Grineer now play animation while activating security system, allowing slightly more time to interrupt."}},
        {tags={},text={"*Improved anti-cheat detection."}},
        {tags={},text={"*Replaced all known %[%[Corpus%]%] consoles with Grineer consoles in Grineer levels."}},
        {tags={"Void",},text={"*Made session join failures able to identify when the failure was because the session is full; hopefuly this will make losing a void key join race a little less magical."}},
        {tags={"Prime",},text={"*Added missing sounds from Prime melee weapons (swoosh!)."}},
        {tags={},text={"*Only enemies that see the player will activate panic buttons, preventing enemies in other zones hitting activating the alarms."}},
        {tags={},text={"*Reduced particle systems on some fog that were causing performance issues on low-end machines."}},
        {tags={"Prova",},text={"*EDIT @ 8:24 PM %[%[Prova%]%] Weapon model updated."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Warframe Buffs:%'%'%'"}},
        {tags={"Mag",},text={"*%[%[Mag%]%]: %[%https://forums.warframe.com/index.php?/topic/73286-mag-83-feedback-thread/ forum link%]"}},
        {tags={"Mag",},text={"**Mag: Pull- Changed to pull all targets in front of the player."}},
        {tags={"Mag",},text={"**Mag: Shield Polarize - Now radial instead of single target. Radial damage around enemy targets that suffer shield drain."}},
        {tags={"Mag",},text={"**Mag: Bullet Attractor - Bullet attractors now become volatile when target dies before attractor is finished, these cause radial damage around the dead target.(needs more visual polish)"}},
        {tags={"Rhino",},text={"*%[%[Rhino%]%]: %[%https://forums.warframe.com/index.php?/topic/73285-rhino-83-feedback-thread/ forum link%]"}},
        {tags={"Rhino",},text={"**Rhino: Iron Skin - 400,600,800,1200 damage caps. Removed timer."}},
        {tags={"Rhino",},text={"**Rhino Roar: NEW POWER: Radial damage buff for all players within range (10%,15%,25%,50%)"}},
        {tags={"Rhino",},text={"**Rhino: Rhino Stomp - Rolled Radial blast and Rhino Stomp together. Rhino Stomp now does damage to enemies(150,300,500,700)"}},
        {tags={"Volt",},text={"*%[%[Volt%]%]: %[%https://forums.warframe.com/index.php?/topic/73283-volt-83-feedback-thread/ forum link%]"}},
        {tags={"Volt",},text={"**Volt: Speed: Now a radial group buff, All Tenno in a radius around the caster will get a speed and melee weapon speed increase (speed, range, duration all increase with fusion level). Range (15,20,22,25) Speed (10%,15%,25%,50%) Duration (5,6,8,10)."}},
        {tags={"Volt",},text={"**Overload: Higher damage output during entire animation."}},
        {tags={"Volt",},text={"**Shock: Has proper chaining, fusion now increases the number of chains and the radius it looks for further chaining targets."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'User Found Changes:%'%'%'"}},
        {tags={"Gorgon","Latron Prime","Snipetron","Strun","Afuris","Aklato","Bronco","Furis","Lato","Viper","Prime",},text={"*Sound changes: Gorgon, Lato, Aklato, Strun, Viper, Twin Viper, Snipetron, Bronco, Dual Bronco, Furis, Afuris, Latron Prime. Melee Charge attack seems to have a slightly different sound effect."}},
        {tags={"Ash","Loki","Duel","Ghost",},text={"*Ash%'s invisibility (Smoke Screen) will not render Ash completely invisible anymore, just like Loki%'s Invisibility. Ash will now have a white, ghostly model during cloak (color may also be affected by your energy color). This may affect its usefulness during duel."}},
        {tags={"Clan",},text={"*You can now kneel and chill in dojo LOL. Also some minor color changes."}},
        {tags={},text={"*Railgun Moas will now knock you down instead of stagger you."}},
        {tags={},text={"*Infested Runners can knock you down when close enough while exploding, and stagger when they explode farther away."}},
},--changes end
["fixes"]={
        {tags={"Defense","Fusion Core",},text={"*Fixed %[%[Defense%]%] Missions awarding level 0 %[%[Fusion Core%]%]s"}},
        {tags={"Defense",},text={"*Fixed Endless Defense missions that could be ended immediately upon host migration."}},
        {tags={},text={"*Fixed AI pathfinding reported in Grineer Boss room."}},
        {tags={},text={"*Fixed areas in Grineer maps that players could wall run out of the level."}},
        {tags={"Capture",},text={"*Fixed edge case issue where objective marker would not clear upon completing Capture objective."}},
        {tags={},text={"*Fixed issue where some AI types could not be executed with stealth kills."}},
        {tags={},text={"*Fixed stealth attacks on %[%[Infested%]%] Chargers that failed to bring out melee weapon."}},
        {tags={},text={"*Fixed stealth attack kills not counting towards mission kill stats."}},
        {tags={"Corpus Outpost",},text={"*Fixed loot crate positions in Corpus Outpost hanger that were inside the floor."}},
        {tags={},text={"*Fixed loss of functionality when loading mods if user has significant amount in inventory."}},
        {tags={"Ether Daggers","Fang",},text={"*Fixed missing sound effects for %[%[Fang%]%] and %[%[Ether Daggers%]%] slide attack."}},
        {tags={},text={"*Fixed all projectiles to accept energy color selection."}},
        {tags={"Volt",},text={"*Fixed lag and FX issues when shooting through Volt’s shield."}},
        {tags={"Ember",},text={"*Fixed %[%[Ember%]%]’s World on Fire ability not showing effects on enemies."}},
        {tags={"Void",},text={"*Fixed missing Loc strings observed in Orokin missions."}},
        {tags={},text={"*Fixed missing ragdoll events on Infested death animations."}},
        {tags={"Cronus",},text={"*Fixed missing %[%[Cronus%]%] charge attack sound."}},
        {tags={"Clan",},text={"*Fixed idle animations that would move the player slightly when no weapons are equipped (Dojo)."}},
        {tags={"Burston",},text={"*Fixed mis-aligned muzzle flash on %[%[Burston%]%] weapon."}},
        {tags={"Defense","Corpus Outpost",},text={"*Fixed instances of inactive Corpus AI when spawned on centre platform of Outpost Defense."}},
        {tags={"Defense",},text={"*Fixed some Defense text strings that would appear to clients in host’s language."}},
        {tags={},text={"*Fixed various Warframe abilities that were not working on Cryopod/Core."}},
        {tags={},text={"*Fixed issue where pending recipe list was falsely reporting to be empty."}},
        {tags={},text={"*Fixed various reported graphics clipping and z-fighting issues."}},
        {tags={"Vauban",},text={"*Fixed Vortex instantly killing enemies in certain cases."}},
        {tags={"Vauban",},text={"*Fixed ragdolls being destroyed when held in a Vortex for too long (more than 15 seconds)."}},
        {tags={},text={"*Fixed various lightmap and z-fighting issues in reported levels."}},
        {tags={},text={"*Fixed issue where game invites would not be ignored from ignored users."}},
        {tags={"Void",},text={"*Fixed Orokin traps causing shockwave will cause screen blur throughout the whole level."}},
        {tags={},text={"*Fixed a Corpus extraction level that allowed users to climb out of it."}},
        {tags={"Ash",},text={"*Fixed Ash’s Smoke Screen where he’d hold both melee and primary weapon."}},
        {tags={"Kogake","Sentinel",},text={"*Fixed Kogake charge attack from damaging %[%[Sentinels%]%]."}},
        {tags={},text={"*Fixed various reported collision and clipping issues across all maps."}},
        {tags={},text={"*Fixed some edge cases where melee strikes would attack with primary weapon."}},
        {tags={"Dual Zoren",},text={"*Fixed melee action being temporarily blocked after completing a slide attack with %[%[Dual Zoren%]%]s."}},
        {tags={},text={"*Fixed some missions may be completed by simply walking into the extraction."}},
        {tags={},text={"*Fixed mantling not always working when there are some obstructions above the player."}},
        {tags={},text={"*Fixed issue where doors remain locked after lockdown is cleared."}},
        {tags={"Phorid",},text={"*Fixed %[%[Phorid%]%] not attacking crouched players."}},
        {tags={"Void",},text={"*Fixed Orokin laser trap cooldown UI timer not showing on clients."}},
        {tags={},text={"*Fixed various map holes and clipping issues based on user reports."}},
        {tags={"Rescue",},text={"*Fixed issue where %[%[Rescue%]%] Agents and nearby AI would pause if player ran two rooms ahead."}},
        {tags={"Capture",},text={"*Fixed progression stopper where secondary capture mission target did not appear."}},
        {tags={"Trinity",},text={"*Fixed an issue where %[%[Trinity%]%] could get sliced in half or ragdoll when her link target was meant to receive such an injury."}},
        {tags={"Rescue",},text={"*Fixed rescue room triggers to only enable when the objective is active to prevent bugs when it%'s a secondary objective."}},
        {tags={"Mag",},text={"*Fixed enemies springing to their feet immediately after surviving Mag%'s Crush ability."}},
        {tags={},text={"*Fixed some animation blending issues when carrying Datamass."}},
        {tags={},text={"*Fixed some common trouble spots where Datamass could get stuck and be unreachable."}},
        {tags={},text={"*Fixed issue where Corpus elevator could occasionally change direction before reaching the top."}},
        {tags={"Ember",},text={"*Fixed Ember’s World on Fire ability from targeting inactive turrets."}},
        {tags={"Mag","Glaive",},text={"*Fixed multiple issues with Mag Bullet Attractor ability (FX on host/client, unintended projectile weapon behaviour, Glaive was not working with this ability)."}},
        {tags={"Frost",},text={"*Fixed Hammer Boss phases breaking after Frost’s Avalanche ability."}},
        {tags={"Spy",},text={"*Fixed issue where a primary or secondary Spy objective would require 0 terminals."}},
        {tags={},text={"*Fixed multiple reported crash issues."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Hot-Hotfix @ 9:05 PM EDT%'%'%'"}},
        {tags={"Frost",},text={"*Fixed %'Power In Use%' bug when using %[%[Frost%]%]%'s Avalanche"}},
        {tags={"Volt",},text={"*Fixed missing animation with Volt%'s Overload."}},
        {tags={},text={"*Fixed Matchmaking region resetting on Login."}},
        {tags={},text={"*Fixed %'square%' light artifact around dynamic lights (most noticable in cave tilesets)."}},
        {tags={},text={"*Returned Infested pack to the store after accidentally removing it."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Note: Start Chart connections have changed in this Update in prep for rolling out the upcoming reworked UI."}},
},--fixes end

},--update end
{
["update number"]={"8.2.1"},
["type"]={"fix"},
["date"]={"July 3, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/72746-hotfix-821/"},
["misc"]={
        {tags={},text={"Just a small hotfix this afternoon... enjoy the livestream!"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"* fixed gameplay crash when joining a mission in progress"}},
},--misc end

},--update end
{
["update number"]={"8.2"},
["date"]={"June 28, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/70880-hotfix-82-tenno-reinforcement/"},
["title"]={"Tenno Reinforcement"},
["image"]={"E318X1b.jpg"},
["additions"]={
        {tags={"Kogake",},text={"%[%[File:Tenno_Reinforcement_-_Kogake|left|650px%]%]{{clr}}"}},
        {tags={},text={"%'%'%'Tenno Reinforcement!%'%'%'"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Kogake",},text={"* The %[%[Kogake%]%] are coverings for your hands and feet which will allow you to engage in hand-to-hand combat. Get up close and personal with these combat wraps and strike down your enemies!"}},
        {tags={"Kogake",},text={"* Love the Kogake? Join our Kogake Kills contest! The 5 Best Kogake Kills win 1000 %[%[Platinum%]%]: %[%https://forums.warframe.com/index.php?/topic/70878-kogake-kills-contest/ link%]"}},
        {tags={},text={"* Want to walk like an %[%[Infested%]%]? Check out the latest Infested Color Palette!"}},
        {tags={},text={"* Green with envy over the %[%[Grineer%]%]? Curious about your nemesis’ arsenal? Try out some Grineer weapons as an alternative to your Tenno starting gear!"}},
        {tags={},text={"* Added a “recruitment” channel to Global Chat!"}},
},--additions end
["changes"]={
        {tags={"Streamline",},text={"* Changes to %[%[Streamline%]%] Mod: cost reduction is now linear. (further explanation: %[%https://forums.warframe.com/index.php?/topic/70880-hotfix-82-tenno-reinforcement/?p=760062 link%])"}},
        {tags={"Hate","Reaper Prime","Prime",},text={"* Changes to %[%[Reaper Prime|Scy%]%]%[%[Hate|the%]%] hit detection: adjusted timing of first swing, and added appropriate damage once swing is over (people were being murdered long after the Scythe was no longer swinging)."}},
        {tags={"Lato",},text={"* %[%[Lato%]%] now has queued fire, and is set up like other semi-auto weapons."}},
        {tags={},text={"* %[%[Fusion MOA|Fusion Moa%]%] hitbox has been adjusted to be larger."}},
        {tags={},text={"* Changes to IRC commands to be case insensitive and reject unknown commands to avoid embarrassing chat attempts."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"<%s>Edit:<%/s>"}},
        {tags={"Prova",},text={"* <%s>Updated %[%[Prova%]%]<%/s> waiting on further positive reports beyond an updated icon. Results of reports: icon has been updated, rest remains to be added."}},
},--changes end
["fixes"]={
        {tags={},text={"* Fix for %[%[Team Heal%]%] not healing the team."}},
        {tags={},text={"* Fixing Warframe abilities not notifying in-mission challenges for clients."}},
        {tags={},text={"* Several Fixes for “In Air” bug when trying to cast certain powers."}},
        {tags={"Trinity",},text={"* Fix for %[%[Trinity%]%]’s Well of Life and Energy Vampire being considered “in use” even on dead targets."}},
        {tags={"Vauban","Void",},text={"* Fix for %[%[Vauban%]%]’s abilities not working if thrown on Orokin ice trap."}},
        {tags={},text={"* Fixed Fusion Moa’s from launching themselves into low-earth orbit."}},
        {tags={"Vauban",},text={"* Fix for Vauban’s Tesla not activating if tossed onto a Grineer Shield Lancer’s shield."}},
        {tags={"Torid",},text={"* Fixed %[%[Torid%]%] gas clouds not receiving damage buffs from mods."}},
        {tags={"Void",},text={"* Fixed shockwave orbs not hitting the player at certain angles."}},
        {tags={"Acrid",},text={"* Fixed %[%[Acrid%]%]’s DOT not always working on client."}},
        {tags={"Nyx",},text={"* Fixed ammo not being consumed on some weapons when shooting %[%[Nyx%]%]’s absorb."}},
        {tags={},text={"* Fixed UI issues when resizing window when mod screen is open."}},
        {tags={},text={"* Fixes for Infested “arm” attacks behaving poorly after death."}},
        {tags={"Wyrm","Crowd Dispersion",},text={"* Fix for %[%[Wyrm%]%]’s %[%[Crowd Dispersion|crowd dispersion%]%] not being able to stun certain enemy types."}},
        {tags={"Wyrm","Crowd Dispersion",},text={"* Fix for Wyrm’s crowd dispersion not stunning certain enemies during attack sequences."}},
        {tags={"Wyrm","Crowd Dispersion",},text={"* Fixed range damage issues with Wyrm’s crowd dispersion."}},
        {tags={"Wyrm","Crowd Dispersion",},text={"* Adjusted crowd dispersion FX to better match damage radius."}},
        {tags={},text={"* Fix for %[%[bosses%]%] not dropping %[%[resources%]%] on clients if they’re killed by the host with a projectile weapon."}},
        {tags={},text={"* Fix for melee weapon not being usable after host migration."}},
        {tags={},text={"* Fix for jump attack now setting velocity"}},
},--fixes end

},--update end
{
["update number"]={"8.1.7"},
["type"]={"fix"},
["date"]={"June 26, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/70155-hotfix-817-chat-optimizations-and-more/"},
["title"]={"Chat Optimizations And More!"},
["misc"]={
        {tags={},text={"Small and powerful!"}},
        {tags={},text={"* Huge optimizations to chat UI performance."}},
        {tags={},text={"* Added workarounds for 10054 and 10060 connection failures."}},
        {tags={},text={"* Fixed online missions becoming locked after host migration occurs. Players can now join provided that the objective has not yet been completed."}},
        {tags={"Ash",},text={"* Fixed another case of %'power in use%' occurring when using Bladestorm."}},
},--misc end

},--update end
{
["update number"]={"8.1.6"},
["type"]={"fix"},
["date"]={"June 24, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/69308-hotfix-816/"},
["misc"]={
        {tags={},text={"A small batch!"}},
},--misc end
["fixes"]={
        {tags={"Dethcube",},text={"* Weekend Dethcube bundle deal is now over."}},
        {tags={},text={"* Fixed crash when upgrading mod just as mission starts."}},
        {tags={"Alert",},text={"* Fixed rare hang that could occur when joining alert missions."}},
        {tags={},text={"* Added better back-end diagnostics for chat server connection issues."}},
},--fixes end

},--update end
{
["update number"]={"8.1.5"},
["type"]={"fix"},
["date"]={"June 21, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/68042-hotfix-815/"},
["misc"]={
        {tags={},text={"Some fixes!"}},
},--misc end
["fixes"]={
        {tags={"Defense","Grineer Galleon",},text={"* Fixed AI spawning issues in the %[%[Grineer Galleon%]%] defense level."}},
        {tags={},text={"* Increased napalm damage resistance for the Artifact Pod."}},
        {tags={"Dethcube","Market",},text={"* Added a new %[%[Dethcube%]%] bundle to the %[%[Market%]%]! Pew pew pew!"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Edit:"}},
        {tags={"Defense",},text={"* Removed %[%[Infested#Crawlers|Crawler%]%] type enemies from Artifact Defense missions."}},
},--fixes end

},--update end
{
["update number"]={"8.1.4"},
["type"]={"fix"},
["date"]={"June 21, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/67864-hotfix-814/"},
["misc"]={
        {tags={},text={"A tiny hotfix in prep for the Weekend!"}},
},--misc end
["fixes"]={
        {tags={},text={"* Polish for the Weekend Event."}},
        {tags={},text={"* Improved diagnostic report generated by crash reporter."}},
        {tags={},text={"* Improved font legibility."}},
},--fixes end

},--update end
{
["update number"]={"8.1.3"},
["type"]={"fix"},
["date"]={"June 19, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/66795-hotfix-813/"},
["changes"]={
        {tags={"Maneuvers",},text={"* Removed Slide Cooldown"}},
        {tags={"Sicarus",},text={"* Updated Sound FX for reloading a %[%[Sicarus%]%]"}},
        {tags={"Lanka","Ogris",},text={"* Added visual indicator to %[%[Ogris%]%] and %[%[Lanka%]%] when they are ready to fire"}},
        {tags={"Sentinel","Wyrm",},text={"* Added Sound FX for %[%[Wyrm Sentinel%]%]’s Crowd Control ability"}},
        {tags={"Void",},text={"* Reworked some of the pit traps in the Loot Rooms found in %[%[Orokin Void%]%] levels"}},
        {tags={"Ember",},text={"* Updated Visual FX on %[%[Ember%]%]’s Overheat ability"}},
        {tags={"Trinity",},text={"* Updated Visual FX on %[%[Trinity%]%]’s Link and Energy Vampire abilities"}},
        {tags={"Ash",},text={"* Updated Visual FX on %[%[Ash%]%]’s Smoke Screen ability"}},
        {tags={"Mastery Rank",},text={"* Tuned difficulty for %[%[Mastery Rank|Mastery%]%] Challenges for Ranks 4+ to be more balanced for a wider range of weapons"}},
        {tags={"Sentinel","Duel",},text={"* %[%[Sentinels%]%] will now be revived at the end of a dueling round"}},
},--changes end
["fixes"]={
        {tags={"Maneuvers",},text={"* Fixed an issue causing players to not acquire %[%[Pickups%]%] when rolling, sliding or using a power through them"}},
        {tags={"Vauban",},text={"* Fixed crash that could occur when using Vortex"}},
        {tags={"Nyx",},text={"* Fixed shields not replenishing if damaged while using %[%[Nyx%]%]%'s Absorb"}},
        {tags={},text={"* Fixed missing Charge-up Sound FX on various swords"}},
        {tags={"Clan",},text={"* Fixed dead ends appearing in %[%[Dojo%]%] at the point where two rooms perfectly connect"}},
        {tags={"Defense",},text={"* Fixed some collision and AI navigation issues in %[%[Corpus%]%] %[%[Defense%]%] missions"}},
        {tags={"Exterminate",},text={"* Fixed an issue causing enemies to continue spawning in an %[%[Exterminate|Extermination%]%] mission, after the count had reached zero"}},
        {tags={"Saryn",},text={"* Fixed an issue with %[%[Saryn%]%]’s Poison ability, so that the globes now replicate correctly for clients"}},
        {tags={"Acrid","Hornet Strike",},text={"* Fixed %[%[Hornet Strike%]%] not affecting DOT from the Acrid"}},
        {tags={"Void",},text={"* Fixed an issue causing some traps in the Orokin Void levels to not take any damage from certain weapons"}},
        {tags={"Duel",},text={"* Fixed an issue causing players to be left in an unresponsive, black screen state when a duel round completes"}},
},--fixes end

},--update end
{
["update number"]={"8.1.2"},
["type"]={"fix"},
["date"]={"June 13, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/64338-hotfix-812/"},
["misc"]={
        {tags={"Banshee",},text={"*Fixed %[%[Banshee|Banshee Sonar%]%] %'power in use%' issue"}},
        {tags={"Kestrel",},text={"*Fixed %[%[Infested%]%] bosses disappearing after being damaged by Kestrel"}},
        {tags={"Mobile Defense","Alert",},text={"*Added %[%[Mobile Defense%]%] missions to %[%[alert%]%]s"}},
        {tags={"Exterminate",},text={"*Fixed Tower %[%[Exterminate%]%] keys sometimes resulting in %[%[Raid%]%] missions"}},
        {tags={"Clan",},text={"*Fixed elevator direction being reversed in %[%[clan Dojo%]%] builder UI"}},
        {tags={"Clan",},text={"*Fixed elevator textures in Dojo"}},
        {tags={"Dual Cleavers",},text={"*Fixed %[%[Elemental Damage|elemental effects%]%] not outlining %[%[Dual Cleavers%]%] properly"}},
        {tags={"Acrid",},text={"*Fixed %[%[Acrid%]%] darts not disappearing"}},
        {tags={"Bo",},text={"*Updated %[%[Bo%]%] unequip sound"}},
        {tags={},text={"*Fixed Polearm not collapsing after performing a %[%[Combat Maneuvers|jumping melee attack%]%]"}},
        {tags={},text={"*Improved collision detection on Polearm attacks"}},
        {tags={},text={"*Fixed Polearm sometimes appearing blurry after attacking"}},
        {tags={"Sentinel",},text={"*Fixed %[%[Sentinels%]%] missing muzzle flash when attacking"}},
        {tags={"Flux Rifle","Ignis",},text={"*Fixed %[%[Ignis%]%] and %[%[Flux Rifle%]%] showing a clip size of 1.$ in the arsenal"}},
        {tags={"Frost",},text={"*Fixed incorrect tooltip description for %[%[Frost|Snow Globe%]%]"}},
        {tags={},text={"*Fixed sign-in reward UI showing 1 star when awarding coupon (consecutive sign-in count wasn’t actually affected)"}},
        {tags={},text={"*Fixed gameplay crashes"}},
},--misc end

},--update end
{
["update number"]={"8.1.1"},
["type"]={"fix"},
["date"]={"June 10, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/62817-hotfix-811/"},
["misc"]={
        {tags={"Ash",},text={"* fixed issues with %[%[Ash%]%]%'s Bladestorm on client"}},
        {tags={},text={"* fixed elemental visual FX not applying to polearm correctly"}},
        {tags={},text={"* fixed fire visual FX missing from levels"}},
        {tags={"Mars",},text={"* fixed missing textures and floor in %[%[Mars%]%] - War and other Grineer Cave levels"}},
        {tags={},text={"* highlight effect for Mod pickups will remain until all players have acquired the Mod"}},
        {tags={},text={"* fixed cases where players could fall through elevator floor when jumping & meleeing"}},
        {tags={},text={"* fixed rare DirectX crash when switching between windowed & fullscreen mode"}},
        {tags={"Defense",},text={"* fixed NPCs jumping down through terrain in Outpost Defense level"}},
},--misc end

},--update end
{
["update number"]={"8.1"},
["date"]={"June 7, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/60679-hotfix-810/"},
["image"]={"Update8 1.jpg"},
["additions"]={
        {tags={"Kestrel","Orthos",},text={"* Tenno reinforcements: POLEARM AND BOOMERANG! %[%[Kestrel%]%] and %[%[Orthos%]%]."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Orthos",},text={"The Orthos is a double bladed polearm, a first of its kind for the Tenno."}},
        {tags={"Kestrel",},text={"The Kestrel is a deadly Boomerang, a heavy throwing weapon that can knock down enemies at a distance."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"* Toggle Sprint now an option in UI Settings"}},
        {tags={},text={"* Aim Assist for controllers is now a toggle option."}},
        {tags={"Clan",},text={"* Added Clan “Message of the Day” feature. People with Ruler or higher privileges in clans can add a MOTD by using this command “/motd” in their clan chat channel ."}},
        {tags={"Maneuvers",},text={"* Mantle Animations added, get ready to front flip like Frost in the latest trailer!"}},
        {tags={"Machete","Prova",},text={"* %[%[Machete%]%] <%strike>and Prova Prod<%/strike> now share a new animation set. (Prova Prod is coming!)"}},
        {tags={"Kunai",},text={"* %[%[Kunai%]%] sheaths can now be colour customized."}},
},--additions end
["changes"]={
        {tags={"Defense","Fusion Core",},text={"* Defense mission reward tables have been reviewed and changed. Reward tables are now split between factions. Fusion cores have now been added to the drop tables."}},
        {tags={"Flux Rifle",},text={"* Increase max length of Flux Rifle Beam."}},
        {tags={},text={"* Added gibbing polish to enemies that are killed by doors."}},
        {tags={"Clan",},text={"* Added confirmation messages to UI when performing Clan Actions (promotions, etc.)."}},
        {tags={},text={"* Various Sound improvements to weapons with this Hotfix!"}},
        {tags={"Vauban",},text={"* Tesla Coils on characters will now have fewer FX."}},
},--changes end
["fixes"]={
        {tags={"Defense",},text={"* Fixed crates being in defense mission dead zone (https://forums.warframe.com/index.php?/topic/59740-defense-mission-deadzone-please-read/)"}},
        {tags={},text={"* Fixed bug where Arrows would float in game."}},
        {tags={"Mag",},text={"* Fixed issue where using Mags Crush on Moas would cause them to “die” twice."}},
        {tags={},text={"* Fix for Ammo pack beacon remaining in game after ammo is picked up."}},
        {tags={"Grineer Galleon",},text={"* Improvements to Galleon Wall Running in certain connectors ."}},
        {tags={},text={"* Fix for sprint preventing certain weapons functions (sprint and aim works, sprint and shoot cancels run)."}},
        {tags={"Ash",},text={"* Fix client issue with Blade Storm: wasn’t properly creating teleport effects."}},
        {tags={"Void",},text={"* Fixed various collision issues affecting AI enemies and players in the Orokin Void levels."}},
        {tags={"Excalibur","Prime",},text={"* Fixed arm fins on %[%[Excalibur%]%] and Excalibur Prime clipping through the arm when using iron sights."}},
        {tags={},text={"* Fix for Grineer bombard rockets being collidable after explosion"}},
        {tags={"Void",},text={"* Fix for triggered pressure plates being host only in Orokin Void."}},
        {tags={},text={"* Fix for lighting issues in certain levels."}},
        {tags={"Acrid","Capture","Captura",},text={"* Fix for Capture Target being dissolved by acrid, becoming un-capturable."}},
        {tags={"Nyx",},text={"* Fix for Nyx absorb being interrupted by Nauseous crawlers."}},
        {tags={"Volt",},text={"* Fix for Volt getting up from bleedout when speed ends."}},
        {tags={"Kunai",},text={"* Fix for Kunai not operating as a silent weapon."}},
        {tags={"Rhino",},text={"* Fixed kills not being counted by Rhino’s Charge and Stomp."}},
        {tags={},text={"* Fixed player being held in air when pulled by Grineer Scorpion on different elevation"}},
},--fixes end

},--update end
{
["update number"]={"8.0.7.1"},
["type"]={"fix"},
["date"]={"June 7, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/60106-hotfix-8071/"},
["misc"]={
        {tags={"Loki",},text={"* Fixed issues with Decoy’s ability to distract enemies. The current design is that the AI will give up trying to kill a decoy they cannot reach or damage."}},
        {tags={},text={"* Fix for reticule not being in center of screen."}},
        {tags={},text={"* Reposition for reload animations. This is related to the Reticule. Sorry for any confusion!"}},
        {tags={"Banshee",},text={"* Fix for clients not seeing %[%[Banshee%]%]’s silence."}},
        {tags={"Dera",},text={"* Increased the damage on %[%[Dera%]%] Energy Rifle."}},
        {tags={"Flux Rifle",},text={"* Increased fire distance on the %[%[Flux Rifle%]%]."}},
        {tags={"Lanka",},text={"* Reduced fieldron cost for %[%[Lanka%]%] Rifle."}},
        {tags={"Void",},text={"* Fixed issues where Void Key missions were unjoinable by invite."}},
},--misc end

},--update end
{
["update number"]={"8.0.7"},
["type"]={"fix"},
["date"]={"June 6, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/59853-hotfix-807/"},
["misc"]={
        {tags={"Jackal",},text={"* Fix for %[%[Jackal%]%] falling through floor. We have removed the portal-creating escape methods from his arsenal."}},
        {tags={"Kunai",},text={"* Fixes for reloads repeating at low framerates (this should help with Kunai)."}},
        {tags={},text={"* Coupons have returned to the login-reward pool! They are for use on the www.warframe.com/buyplatinum for discounts!"}},
        {tags={"Kunai",},text={"* Fix for %[%[Kunai%]%] sound FX."}},
        {tags={},text={"* Game now indicates when a game invite was successfully sent."}},
        {tags={},text={"* Fix for getting stuck in a sprinting state after sliding."}},
        {tags={"Void",},text={"* Fix for matchmaking options when joining a Void Key Lobby."}},
        {tags={"Capture",},text={"* Fix for objective markers not disappearing after completing capture objective."}},
        {tags={"Lotus",},text={"* <%strike>Fix for Lotus not talking in languages other than English.<%/strike> Rephrase: If you run game in language other than %'English%', Lotus would not speak her lines (these lines were still English)."}},
        {tags={"Nyx",},text={"* Fix for %[%[Nyx%]%] Power in Use bug (maybe time for a Livestream rematch!)."}},
        {tags={"Ember","Focus",},text={"* Fix %[%[Ember%]%]%'s Overheat ability preventing all damage/healing when damaged when upgraded and mixed with upgraded Focus mod."}},
        {tags={"Banshee",},text={"* Fixed %[%[Banshee%]%]’s Silence ability not affecting enemies."}},
        {tags={},text={"* Improved aiming reticule visibility."}},
        {tags={"Torid",},text={"* Fixed %[%[Torid%]%] rockets detonating immediately after firing."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Additional fixes:"}},
        {tags={"Ogris",},text={"* Fix for %[%[Ogris%]%] and Multishot damaging player."}},
},--misc end

},--update end
{
["update number"]={"8.0.6.1"},
["type"]={"fix"},
["date"]={"May 31, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/56204-hotfix-806/"},
["misc"]={
        {tags={"Rhino",},text={"* Fix for Rhino Stomp."}},
        {tags={"Kunai",},text={"* Potential fix for Kunai reload."}},
        {tags={"Sentinel","Market",},text={"* Fix for not being able to claim sentinel in Marketplace"}},
        {tags={},text={"* Optional Reset enabled."}},
},--misc end

},--update end
{
["update number"]={"8.0.6"},
["type"]={"fix"},
["date"]={"May 31, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/56204-hotfix-806/"},
["additions"]={
        {tags={},text={"*<%strike>Added a chance to win discounts on Website %[%[Platinum%]%] Bundles to the %[%[Login Rewards|daily login rewards%]%]! <%/strike>Reverted until further notice!"}},
},--additions end
["changes"]={
        {tags={"Clan",},text={"*Couches have been repossessed from all Tenno %[%[Clan Dojo|Dojos%]%]. The Tenno told us “these aren’t ninja enough”, so we are working to decorate appropriately in future"}},
        {tags={"Clan",},text={"*Dojo room capacity upped to 64"}},
        {tags={},text={"*<%strike>Users who made their Warframe accounts on the www.warframe.com website can now use their Steam Wallet on the Buy Platinum page as a payment option, instead of being limited to Ultimate Pay<%/strike> This Change has also been reverted until further notice. A few web changes need some fixin%'. Sit tight, it´ll come!"}},
        {tags={"Clan",},text={"*The Optional Reset is now live again. The team has come up with the following: IF you now contribute to Dojo, you Forfeit Optional Reset. Prompts will inform you of this as you play the game"}},
},--changes end
["fixes"]={
        {tags={"Duel",},text={"*Fixed bug where reload completion circle stays on screen after duel ends."}},
        {tags={},text={"*Fixed reloading and charging being cancelled by sprinting on charged weapons."}},
        {tags={"Duel",},text={"*Fixed round music playing after dueling player has disconnected."}},
        {tags={"Vauban",},text={"*Fixed %[%[Vauban|Vauban’s Tesla%]%] traps not appearing on clients that join after thrown."}},
        {tags={"Forma",},text={"*Fixed %[%[Forma%]%] %[%[Blueprints|Blueprint%]%] icon to match up with Forma icon."}},
        {tags={},text={"*Various improvements to member list population on Chat Window."}},
        {tags={},text={"*Fix occurrences of the %[%[Ballista%]%] stomp hitting the player twice."}},
        {tags={"Vauban",},text={"*Fixed infested leapers not being affected by Vauban’s bounce while leaping in air."}},
        {tags={"Duel",},text={"*Fixed issues with dueling where players could be teleported or break barrier into arena."}},
        {tags={"Alert","Forma",},text={"*Fixed Forma not being obtained by user as reward in alert missions."}},
        {tags={"Rage",},text={"*Fixed %[%[Rage%]%] mod not having a polarity."}},
        {tags={},text={"*Added contribution filtering for tech projects to prevent over contribution."}},
        {tags={"Ash","Loki","Duel",},text={"*Fix %[%[Ash|Ash%]%] and %[%[Loki|Loki%]%] teleport in duels, no longer target spectators."}},
        {tags={},text={"*Fixed Grineer %[%[Scorpion%]%] not working on client."}},
        {tags={},text={"*Fixed damage inconsistency with Orokin traps on host/client."}},
        {tags={"Capture",},text={"*Fixed crash when host migration occurs while capture victim is downed."}},
        {tags={"Defense",},text={"*Fix for Corpus melee enemies not attacking defense target."}},
        {tags={"Vauban",},text={"*Fixed Vortex functionality causing issues with other abilities (namely bounce)."}},
},--fixes end

},--update end
{
["update number"]={"8.0.5.1"},
["type"]={"fix"},
["date"]={"May 29, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/53908-805-its-getting-hotfix-in-here/"},
["misc"]={
        {tags={"Volt","Void",},text={"* Volt in Void Missions fixed."}},
        {tags={},text={"* Broken Textures in missions fixed."}},
        {tags={},text={"* Removed Placeholder text strings."}},
        {tags={"Void",},text={"* Ran Script to fix up accounts affected by Void Key Pack changes."}},
},--misc end

},--update end
{
["update number"]={"8.0.5"},
["type"]={"fix"},
["date"]={"May 29, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/53908-805-its-getting-hotfix-in-here/"},
["title"]={"Its getting Hot(Fix) in here!"},
["misc"]={
        {tags={"Banshee",},text={"*Fixed Sonic Boom damage on client"}},
        {tags={"Ash","Nyx",},text={"*Fixed Ash Shuriken and Nyx Psychic Bolts not functioning correctly on clients"}},
        {tags={"Void",},text={"*Fixed exploit where an Orokin Void mission could be started without the host directly using a Void Key"}},
        {tags={"Duel","Clan",},text={"*Fixed dueling in Dojo breaking after a host migration occurs"}},
        {tags={"Clan",},text={"*Fixed clients not connecting to new host when host migration occurs in Dojo"}},
        {tags={"Void",},text={"*Fixed not being able to sell Blueprints received from Orokin Void missions"}},
        {tags={"Void",},text={"*Void Key packs are now guaranteed to include one rare key"}},
        {tags={"Reaper Prime","Latron Prime","Void","Prime",},text={"*Increased drop rate of Reaper Blade and Latron Prime Receiver to %'Common%' for Void Level %'III%' Missions"}},
        {tags={"Sentinel","Revenge","Warrior",},text={"*Sentinel buffs: improved firing accuracy, plus extended attack range for Warrior and Revenge to 15m"}},
        {tags={"Dethcube",},text={"*Decreased volume on DethCube firing effects"}},
        {tags={},text={"*Launcher improvements: Added a new content download system and verification tool. You can trigger a verification scan from the launcher settings to repair corrupted files in place without having to re-download the entire game. Content updates are now even more rigorously checked for corruption and the launcher now includes download statistics for the content update phase."}},
        {tags={"Void",},text={"*Added note regarding Orokin Void blueprint drop rates."}},
},--misc end

},--update end
{
["update number"]={"8.0.4"},
["type"]={"fix"},
["date"]={"May 24, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/50567-hotfix-804-hit-me-with-your-best-hotfix/"},
["title"]={"Hit Me With Your Best Hot(Fix)"},
["misc"]={
        {tags={"Clan",},text={"*Added confirmation when quitting or leaving Clans."}},
        {tags={},text={"*Option added for larger font size in chat window."}},
        {tags={"Clan",},text={"*Only members with forged dojo keys can contibute to Dojos."}},
        {tags={},text={"*Critical chances on bows have been fixed, (10% for normal, 20% for charged)."}},
        {tags={"Vauban",},text={"*Vauban powers now working as intended. A bug prevented the physics of most skills to work properly."}},
        {tags={"Void",},text={"*Fix for Level 1 enemies appearing in difficult missions in The Void."}},
        {tags={"Reaper Prime",},text={"*Fix for Reaper Handle drop rate being too high."}},
        {tags={},text={"*Fixes for various Blueprints not being saved to inventory, including Reaper."}},
        {tags={},text={"*Flame Lancer and Shotgun Grineer improvements. They will no longer shoot at targets out of range."}},
        {tags={"Void"},text={"*Fixed objective not disappearing for clients on Orokin Levels."}},
        {tags={"Clan",},text={"*Fixed issue where Players would get stuck in the Dojo GreatHall"}},
        {tags={"Clan",},text={"*Fixed issue where destruction of Dojo Elements not working as intended."}},
        {tags={"Clan",},text={"*Fixed issue where permissions for Dojo Roles not working as intended."}},
        {tags={"Volt","Void",},text={"*Improved communication cues for Speed Runs in The Void."}},
        {tags={"Clan",},text={"*Fix for game invites between Clan members who aren%'t on Friends list."}},
        {tags={},text={"*Fixed issues with beam being visible for too long on certain beam weapons."}},
        {tags={},text={"*Fix for UI Synchronization when other players did contributions to rooms you were simultaneously contributing to."}},
        {tags={},text={"*Fix for fire effects now showing up on clients until shields are down."}},
        {tags={},text={"*Fix for Grineer Lancers not shield-bashing."}},
        {tags={"Mag",},text={"*Fix for Grineer Scoprion Rope remaining out when she is killed during pull action."}},
        {tags={"Lech Kril",},text={"*Lech Kril no longer burns himself with Fire... what a Pyro!"}},
        {tags={},text={"*Various Crash fixes."}},
},--misc end

},--update end
{
["update number"]={"8.0.3"},
["type"]={"fix"},
["date"]={"May 24, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/49588-hotfix-803-some-like-it-hotter/"},
["title"]={"Some Like It Hotter!"},
["fixes"]={
        {tags={"Nyx",},text={"*Fixed Nyx Absorb not working, resulting in %'Power in Use%' bug."}},
        {tags={},text={"*Fixed remaining levels that resulted in Critical failures, sending users into emptiness."}},
        {tags={"Frost",},text={"*Snowglobe bug fixed."}},
        {tags={"Void",},text={"*Fixed issue where end-of-mission rewards were not being saved (namely in The Void)."}},
        {tags={"Forma",},text={"*Fixed issue where Login Rewards (including Forma) were not being obtained."}},
        {tags={"Foundry",},text={"*Fixed issue where Foundry would break after receiving certain drops."}},
        {tags={},text={"*Fixed Ash Chassis tag appearing on incorrect items."}},
},--fixes end

},--update end
{
["update number"]={"8.0.2"},
["type"]={"fix"},
["date"]={"May 24, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/49393-hotfix-802-comin-in-hot/"},
["title"]={"Comin In%' Hot!"},
["fixes"]={
        {tags={"Frost",},text={"*Frost Powers not working"}},
        {tags={"Latron Prime","Prime",},text={"*Latron Prime recipes reading %'Ash Chassis%' requirement"}},
        {tags={},text={"*General bugs with %'Ash Chassis%' appearing where not intended"}},
        {tags={"Void",},text={"*Void Key pack giving 3 out of 5 keys (ALL people with this should make support.warframe.com tickets)"}},
        {tags={"Clan",},text={"*Dojo Permissions not working as intended."}},
        {tags={"Clan",},text={"*Can no longer sell Clan Key Blueprint"}},
        {tags={},text={"*Improvement to Critical Mission bug where levels would send users into emptiness and death. More progress coming soon."}},
},--fixes end

},--update end
{
["update number"]={"8.0.1"},
["type"]={"fix"},
["date"]={"May 23, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/49101-update-8-rise-of-the-warlords/"},
["fixes"]={
        {tags={},text={"*Fixed crash-to-desktop bug."}},
},--fixes end

},--update end
{
["update number"]={"8.0"},
["date"]={"May 23, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/49101-update-8-rise-of-the-warlords/"},
["title"]={"Rise of the Warlords"},
["additions"]={
        {tags={"Grineer Galleon",},text={"%'%'%[%[Grineer Galleon%]%] (NEW LOCATION SET!)%'%'"}},
        {tags={"Grineer Galleon",},text={"*At last we can reveal the Grineer ships!"}},
        {tags={"Grineer Galleon",},text={"*Explore vast, rusted chambers evocative of an amazing space-submarine vibe that exudes the gritty bulk of the %[%[Grineer%]%] Army!"}},
        {tags={"Grineer Galleon",},text={"*The %[%[Grineer Galleon|Grineer ships%]%] come with new vicious enemies, hell-bent on dismembering any %[%[Tenno%]%] intruders."}},
        {tags={"Lech Kril",},text={"*%[%[Lieutenant Lech Kril%]%] has been training and this already formidable %[%[Grineer%]%] boss has new tricks up his sleeve."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Void",},text={"%'%'%[%[Orokin Void%]%] (NEW SECRET LOCATION SET!)%'%'"}},
        {tags={"Void",},text={"*An exciting new tile-set hidden within a dimensional fold!"}},
        {tags={"Void",},text={"*Players can buy or loot %[%[Void Keys%]%] to open up exciting loot runs in the Ancient Orokin Towers."}},
        {tags={"Void",},text={"*Explore the hidden fortresses of the Ancient %[%[Orokin%]%] race!"}},
        {tags={"Void",},text={"*But beware, these are dangerous places, fraught with traps and guarded by the %[%[corrupted%]%] remains of past-raiders!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan",},text={"%'%'DOJO BUILDING (ALPHA)%'%'"}},
        {tags={"Clan",},text={"*Brand new tile set with Tenno architecture & design"}},
        {tags={"Clan",},text={"*New set of possibilities for user-created levels begins with our Dojo Building (Alpha)."}},
        {tags={"Clan",},text={"*Clan members contribute %[%[resources%]%] to fund construction projects to build their %[%[Clan Dojo%]%]."}},
        {tags={"Clan",},text={"*Architects have total control of the layout, selecting hallways, junctions and special rooms to build."}},
        {tags={"Clan",},text={"*Clan members %'vote with their resources%', funding the construction to completion."}},
        {tags={"Clan",},text={"**Note: Expect a few bumps as this is an ambitious new feature for Warframe: player-created levels! We will be working hard to smooth out the kinks and pave the way for amazing player-built future of Warframe!"}},
        {tags={"Clan",},text={"*The Dojo can be accessed by joining or creating a %[%[clan%]%]. Doing this automatically puts a %[%[Clan Key%]%] blueprint in your inventory to craft."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan","Research",},text={"%'%'DOJO RESEARCH (ALPHA)%'%'"}},
        {tags={"Clan","Research",},text={"*%[%[Clan%]%]s can build %[%[Clan_Dojo#Rooms|Dojo rooms%]%] that open up Technology %[%[Research%]%] options..."}},
        {tags={"Clan","Research",},text={"*This gives your clan access to an array of deadly new weapons only accessible through the research system."}},
        {tags={"Clan","Research",},text={"*Clan members collect research samples and pool resources to fund advanced new weaponry projects."}},
        {tags={"Clan","Research",},text={"*Upon completion, members have access to Blueprints allowing them to build never-seen-before weaponry in their Foundry!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Duel","Clan"},text={"%'%'DUELING (ALPHA)%'%'"}},
        {tags={"Duel","Clan",},text={"*Clans can build special dueling rooms to challenge your Clan members to friendly duels!"}},
        {tags={"Duel","Clan",},text={"*Clan members can watch the action and cry foul... our small dueling team is eager for feedback and have been careful to balance dueling in a way that only affects the Duels."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Forma",},text={"%'%'POLARIZE WEAPON SYSTEM!%'%'"}},
        {tags={"Forma",},text={"*Got your gear to level 30? Prepare to %[%[Polarization|Polarize%]%]!"}},
        {tags={"Forma",},text={"*With the newly discovered “%[%[Forma%]%]”, you can now add or swap a Polarity value on your gear every time you reach level 30."}},
        {tags={"Alert","Void","Forma",},text={"*Forma can be purchased or found through Daily %[%[Login Rewards%]%], %[%[Alert%]%]s, or possible %[%[Mission%]%]s rewards for completing missions in The %[%[Orokin Void%]%]."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'HUD IMPROVEMENTS! (Key Commands)%'%'"}},
        {tags={},text={"*Viewing your party’s stats is now a Toggle option instead of Hold key!"}},
        {tags={},text={"*Want to take some fancy %[%[Key Bindings|screenshots%]%]... WITHOUT the HUD? Now you can!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Stalker",},text={"%'%'WHAT IS %[%[Stalker%]%]?%'%'"}},
        {tags={"Stalker",},text={"*We don’t know... but we’ve heard killing him can garner quite the reward..."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'NEW WEAPONS & GEAR!%'%'"}},
        {tags={},text={"*20+ new weapons added in this update!"}},
        {tags={"Kunai","Market",},text={"*Tenno crafted %[%[Kunai%]%] (throwing daggers) available in the market for a silent weapon option in your pistol slot."}},
        {tags={"Vulkar","Dual Cleavers","Machete","Market",},text={"*New %[%[Grineer%]%] weapons added to the %[%[Market%]%] including the %[%[Machete%]%], %[%[Dual Cleavers%]%], and the lethal %[%[Vulkar%]%] sniper rifle."}},
        {tags={"Bronco","Ether Sword","Market",},text={"*By popular demand the Market also now has a single-handed %[%[Ether Sword%]%], and %[%[Dual Broncos%]%] for sale."}},
        {tags={"Clan","Research",},text={"*As mentioned above, %[%[Clan%]%] Research brings 9 exciting new player weapons to Warframe, but you need to build your %[%[Research%]%] facilities to discover them!"}},
        {tags={"Clan","Research",},text={"*Energy weapons, Biological Toxins and high-impact explosives are waiting to be %[%[Research|uncovered%]%]."}},
        {tags={},text={"*In addition to these weapons, there are 5 rare weapons to chase in special drops. Who will discover them first?"}},
        {tags={"Sentinel","Dethcube","Market",},text={"*New %[%[sentinels|Sentinel Pet%]%] available in the Marketplace...the infamous Dethcube!"}},
        {tags={"Frost","Void","Prime",},text={"*Looking for blueprint components to build your Frost Prime? Seek out the %[%[Orokin Void|Orokin Towers%]%] in the Void!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Sanctuary","Reach","Master Thief","Insulation","Rage","Hawk Eye","Eagle Eye",},text={"%'%'%'BRAND NEW MODS!%'%'%'"}},
        {tags={"Sanctuary",},text={"*%[%[Sanctuary%]%] - Creates a shield around the player when they are reviving fallen allies."}},
        {tags={"Reach",},text={"*%[%[Reach%]%] - Extends melee reach by %"}},
        {tags={"Master Thief",},text={"*%[%[Master Thief%]%] - % chance to unlock locked lockers."}},
        {tags={"Insulation",},text={"*%[%[Insulation%]%] - Reduces effect of environment ice on shields."}},
        {tags={"Rage",},text={"*%[%[Rage%]%] - Damage done to your health is added to your energy."}},
        {tags={},text={"*%[%[Melee Channel%]%] - Any energy you expend in casting is added to your next melee strike."}},
        {tags={},text={"*%[%[Acrobat%]%] - Reduces stamina cost on %[%[Combat Maneuvers|wallruns%]%]!"}},
        {tags={"Hawk Eye",},text={"*%[%[Hawk Eye%]%] - %[%[weapons|Pistol%]%] zoom"}},
        {tags={"Eagle Eye",},text={"*%[%[Eagle Eye%]%] - %[%[weapons|Rifle%]%] zoom"}},
},--additions end
["changes"]={
        {tags={"Vauban",},text={"*Ambient FX for %[%[Vauban|Vauban%'s Tesla%]%] ability have been toned down"}},
        {tags={"Banshee",},text={"*Infested enemy types now play reaction to %[%[Banshee|Banshee Soundquake%]%]."}},
        {tags={"Rhino",},text={"*%[%[Rhino|Rhino’s Iron Skin%]%] ability once again gives push immunity."}},
        {tags={"Rhino",},text={"*%[%[Rhino|Rhino’s Iron Skin%]%] damage absorption values capped: but up to a damage (d) cap of: 200 d, 400 d, 600 d, and 800 d based on mod rank."}},
        {tags={"Rhino",},text={"*%[%[Rhino|Rhino’s Iron Skin%]%] ability draws Aggro from enemies."}},
        {tags={"Pluto",},text={"*%[%[Alloy Plate%]%] Drop Rates have increased and been added as a resource to %[%[Pluto%]%]"}},
        {tags={"Foundry",},text={"*Recipes for %[%[foundry|crafting%]%] weapons have been adjusted to a lower %[%[resources|resource%]%] requirement."}},
        {tags={"Ash",},text={"*%[%[Ash|Ash%'s%]%] Shuriken improvements added: it now seeks targets and multiple projectiles added at higher ranks."}},
},--changes end
["fixes"]={
        {tags={"Vauban","Recovery",},text={"*Fixed issue where %[%[Vauban|Vauban%'s Bounce ability%]%] could be used to chain-incapacitate humanoid enemies during their recovery state."}},
        {tags={},text={"*Fixed issue where some %[%[Warframes|Warframe%]%] powers would be available even if you didn%'t have the %[%[mods|mod%]%] equipped."}},
        {tags={"Ash",},text={"*Fixed misnamed %[%[Ash|Ash%]%] Systems %[%[Blueprints%]%]."}},
        {tags={},text={"*Fixed some animation event and damage deformer related crashes"}},
        {tags={"Exterminate",},text={"*Fixed bug with %[%[Exterminate|Extermination Missions%]%] not being able to be completed."}},
        {tags={},text={"*Fix for fused ability mod, it now properly and consistently increases power."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Additional Information:%'%'%'"}},
        {tags={"Trading",},text={"*%'WHERE IS TRADING?%' It is still being worked on, not ready for deployment yet."}},
        {tags={},text={"*Team standing by for bug reports!"}},
},--fixes end

},--update end

}
return PatchData
```

