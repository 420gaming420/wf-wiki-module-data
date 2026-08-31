---
title: "Module:CroqueTest2/DV10"
wiki_url: "https://wiki.warframe.com/w/Module/CroqueTest2/DV10"
wiki_timestamp: "2018-04-19T16:40:35Z"
---

*Documentation for this module may be created at [Module:CroqueTest2/DV10/doc](/w/Module:CroqueTest2/DV10/doc?action=edit&redlink=1 "Module:CroqueTest2/DV10/doc (page does not exist)")*

```lua
local PatchData =
{
{
["update number"]={"10.8"},
["date"]={"November 13th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/130600-update-1080/"},
["title"]={"Nekros/Nova Cosmetic Helmets"},
["image"]={"Nekros_Shroud-Quantum_Nyx_alternate_helms.jpg"},
["changes"]={
        {tags={"Banshee","Conclave",},text={"*Conclave Power change: Banshee’s Sonic Boom stunlock’s opponents. A cooldown of 5 seconds has been added to Sonic Boom in Conclaves."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed Mission session slot permanently being eaten by client who fails to properly connect or is rejected by host."}},
        {tags={},text={"*Fixed players not being given temporary invulnerability after using a revive, also prevent them from being knocked down while invulnerable."}},
        {tags={"Derelict",},text={"*Fixed continued issues with fog in Orokin Derelicts."}},
        {tags={"Calculated Redirection","Redirection",},text={"*Fixed mod card sorting so that like-named cards are grouped properly (Sentinel Redirection separate from Warframe Redirection)."}},
        {tags={"Conclave",},text={"*Fixed dead/spectating players being able to revive in Conclave pause menu."}},
        {tags={"Alert",},text={"*Fixed Credit Alert mission rewards giving double the advertised amount; changed Credit Alerts to give better rewards based on difficulty of the Planet that the Alert appears on."}},
        {tags={"Void",},text={"*Fixed flickering glass in Orokin Void circular connector."}},
        {tags={"Foundry",},text={"*Fixed Foundry not showing number of built keys you already have for a recipe."}},
        {tags={"Void",},text={"*Fixed pressure plates in the Orokin Void colour puzzle not showing correct colour for clients."}},
        {tags={"Coolant Leak",},text={"*Fixed numerous issues with Coolant Leak; it no longer prevents other precepts from working and should now work properly for clients."}},
        {tags={"Clan","Research",},text={"*Fixed Clan Tech Research issue where player could be invited to a friend%'s Dojo, do research in their Dojo, and it goes towards the invitees own clan, even if their clan doesn%'t have the research rooms built!"}},
},--fixes end

},--update end
{
["update number"]={"10.7.1"},
["type"]={"fix"},
["date"]={"November 8th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/129289-hotfix-1071-double-resource-weekend/"},
["title"]={"Weekend Special: Double Resource Weekend!"},
["image"]={"TF2odbx.jpg"},
["changes"]={
        {tags={"HUD",},text={"*Changed ‘remaining enemy’ minimap-marker to be red dot and no longer the player waypoint icon."}},
        {tags={"Frost","Stalker",},text={"*Stalker has practiced against Frost’s Snowglobe and is no longer affected."}},
        {tags={"Pickups","HUD"},text={"*Affinity Orb amounts no longer appear in HUD log as they are on screen already, rendering double-note redundant."}},
},--changes end
["fixes"]={
        {tags={"Survival","UI",},text={"*Fixed credits not being saved at the end of Survival missions if someone in squad goes to extraction before anyone else had a chance."}},
        {tags={"Spy",},text={"*Fixed players being short a data terminal if a host migration happens during a Spy mission."}},
        {tags={},text={"*Fixed crash if disconnected while using continuous fire weapon."}},
        {tags={"Inventory",},text={"*Fixed only 1 copy of mission reward showing up in inventory when acquiring multiples in missions."}},
        {tags={"Derelict",},text={"*Fixed Orokin Derelict Vault being lootable if the door is not unlocked."}},
        {tags={"Nyx","Torid",},text={"*Fixed Torid and Nyx’s Absorb causing a game hang."}},
        {tags={"Nova",},text={"*Fixed Nova’s Worm Hole not being accessible at all angles."}},
        {tags={"Conclave","Corrupted Mods",},text={"*Fixed corrupted mods not accounting for Conclave Values."}},
        {tags={"Star Chart",},text={"*Fixed mouse input on friends and chat overlay clicking through to star chart."}},
        {tags={"Derelict",},text={"*Fixed Fog levels in Orokin Derelict Tunnels."}},
        {tags={"Banshee",},text={"*Fixed Banshee’s Sonar leaving mini-map icons for dead enemies."}},
        {tags={"Exterminate",},text={"*Fixed issues with distribution of enemy spawning in Exterminate mission types."}},
        {tags={},text={"*Fixed lingering old Grineer audio being used for Corpus enemies. "}},
        {tags={},text={"*Various Crash fixes."}},
},--fixes end

},--update end
{
["update number"]={"10.7"},
["date"]={"November 6th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/128768-update-1070/"},
["title"]={"The Obex"},
["image"]={"Tenno_Reinforcements_Obex.jpg"},
["additions"]={
        {tags={},text={"The Obex!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Obex",},text={"The OBEX system multiplies the kinetic energy of a Tenno%'s kicks and punches, delivering devastating blows to any target."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Fusion","UI",},text={"*Added polarity sort to mod card list (for easier fusion)"}},
        {tags={"UI",},text={"*Made loadout color randomization pick one of your purchased palettes before randomizing (rather than just using the defaults)"}},
},--additions end
["changes"]={
        {tags={},text={"*Reverted all Net Code changes to pre-10.5.6 to alleviate the more frequent De-Sync and Lag that we suspect these changes added. We are troubleshooting and continuing to make improvements based on player reports."}},
        {tags={"Mercury",},text={"*Mercury Matchmaking Changes for new players. New players will no longer be “matched” in lobbies with high-leveled peers in Mercury Region."}},
        {tags={"HUD",},text={"*More UI Awareness for Platinum Coupon holders."}},
        {tags={"Vectis",},text={"*Removed .25 second delay for auto reloading the Vectis."}},
        {tags={},text={"*Pulling overreacting fog volumes from room for now as we continue to work on a fix."}},
        {tags={"Derelict",},text={"*Derelict Vault Rooms can no longer be accessed without a key."}},
},--changes end
["fixes"]={
        {tags={"Void",},text={"*Fixed Orokin Void transparency issues: %[%https://forums.warframe.com/index.php?/topic/127689-orokin-void-texture-bug/ forum post%]"}},
        {tags={"Stalker",},text={"*Fixed the Stalker%'s melee combo sometimes getting stuck in a restarting loop on client"}},
        {tags={},text={"*Fixed clients XP and items being lost after host migration occurs within the mission."}},
},--fixes end

},--update end
{
["update number"]={"10.6.2"},
["type"]={"fix"},
["date"]={"November 5th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/128406-hotfix-1062/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={},text={"* Fixed excessive lag and desyncs occurring when playing multiple missions in a row."}},
        {tags={},text={"* Fixed unresponsive black screen appearing at end of mission, also a message is now displayed if unexpected delays occur when returning to main menu."}},
        {tags={},text={"* Improved distribution of random numbers generated by RNG. More information: %[%https://forums.warframe.com/topic/128402-rng-algorithm-bugschanges/ forum post%]"}},
        {tags={"Consumables",},text={"* Fixed Team Heal unintentionally reviving downed players."}},
        {tags={"Consumables"},text={"* Fixed Team Heal/Ammo/Shield/Energy drops permanently remaining on client, also removed collision from them and fixed missing effects."}},
        {tags={"Clan",},text={"* Fixed being unable to contribute to new rooms after host migration occurs in clan dojo."}},
        {tags={"Security Camera",},text={"* Fixed security camera %'alerted%' sounds not playing for clients."}},
        {tags={"Sentinel","Stalker","Ghost",},text={"* Fixed sentinel%'s ghost ability not being cancelled by the Stalker."}},
        {tags={"Stalker",},text={"* Improvements and potentially fixed bug where Stalker would become unresponsive."}},
        {tags={"UI",},text={"* Addendum: Added %'Show Frames Per Second%' toggle in config options."}},
},--fixes end

},--update end
{
["update number"]={"10.6.1.1"},
["type"]={"fix"},
["date"]={"November 1st, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/127121-hotfix-1061/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={"Weapon Cosmetics"},text={"*Small Hotfix to remove an unreleased weapon skin."}},
},--fixes end

},--update end
{
["update number"]={"10.6.1"},
["type"]={"fix"},
["date"]={"November 1st, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/127121-hotfix-1061/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={"UI",},text={"*Fixed unresponsive black screen appearing at end of mission."}},
        {tags={"Clan","UI",},text={"*Fixed Hud UI breaking when more than 4 players connect in a clan dojo."}},
        {tags={"Sprint Boost",},text={"*Drastically reduced benefit of unintentionally-released Sprint Speed Aura. This mod is still in development until official release. (reduced the effects and maximum rank from +10% sprint speed per rank for 5 ranks to +2.5% sprint speed per rank for 3 ranks.)"}},
        {tags={},text={"*Fixed a case where player would occasionally be unable to melee/block after being knocked down during melee swings."}},
        {tags={},text={"*Fixed a similar case where player would become stuck in the melee charge anim if knocked down while meleeing."}},
        {tags={"Vauban","Sentinel","Wyrm","Crowd Dispersion",},text={"*Fixed Sentinel Crowd Dispersion knocking AI out of Bastille causing them to pop."}},
        {tags={"Mastery Rank",},text={"*Reduced difficulty of some mastery challenges, implemented frame-time performance improvements (noticeably for lower-end hardware), and lessened depth-of-field effect."}},
        {tags={"Ash",},text={"*Restored original Bladestorm functionality where all enemies in the current room are eligible for attack, plus fixed a long-standing issue where subsequent targets weren%'t prioritized based on proximity to original target."}},
        {tags={"Derelict",},text={"*Fixed missing roots in Orokin Derelicts (DX11-only); these were sometimes needed to advance in the level."}},
        {tags={},text={"*Halloween decorations have been boxed up and put away in the attic until next year."}},
},--fixes end

},--update end
{
["update number"]={"10.6"},
["date"]={"October 30th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/126269-update-1060-the-vectis/"},
["title"]={"The Vectis"},
["image"]={"Update106official.jpg"},
["additions"]={
        {tags={"Vectis",},text={"*The Vectis is here! A classic Tenno sniper rifle, the Vectis is ideal for ranged takedowns! "}},
        {tags={},text={"*Pumpkin Panic! Pumpkins have been added to the Solar System – they will appear in many places in celebration of Halloween!"}},
        {tags={"Sentinel",},text={"*Added new art for several Sentinel Mods"}},
        {tags={"The Gradivus Dilemma",},text={"*Added a lore entry based on “The Gradivus Dilemma”"}},
        {tags={"The Gradivus Dilemma",},text={"*Preparation of deploying Gradivus Rewards. "}},
},--additions end
["changes"]={
        {tags={},text={"*Changes to DX9 Rendering. People running Direct X in Multi-threaded mode may notice a frame-rate increase. We are hoping to help performance on low-end PC’s playing Warframe with this change. See here for more details on Multi-Threaded rendering: %[%https://forums.warframe.com/index.php?/topic/105651-optional-multi-threading-feedback/ link%]"}},
        {tags={},text={"*Jetpacks destroyed in mid-flight will now stop the motion."}},
        {tags={"Dera","Clan",},text={"*Corpus Dera wielded by enemies now match Clan Tech Dera (alternate between top and bottom barrels when firing)."}},
        {tags={"Speed Holster","Alert",},text={"*Holster Speed Aura moved to alerts, removed from enemy drop table for consistency."}},
        {tags={"UI",},text={"*UI tweaks to facilitate longer Alias/PlayerNames being cropped."}},
        {tags={},text={"*We now prevent loading into gameplay if user is already in a lobby when new build is detected."}},
},--changes end
["fixes"]={
        {tags={"Ash",},text={"*Fixed and response to complaints that Ash’s Blade Storm will sometimes ignore enemies who are standing right beside the initial target."}},
        {tags={"Ash",},text={"*Due to people pointing out enemies not being hit enough though their camera %'sees%' them, Blade Storm will now perform a raycast from the Warframe’s eye AND the camera%'s view position and if the existing conditions are satisfied on either one, the enemy will be included in the hit list."}},
        {tags={"Nyx",},text={"*Fixed Nyx’s Mind Control and Chaos abilities making the targets not behave in a proper manner. Mind Control was not having enemies aggressively attack their own, and Chaos was making the player a target over enemies. The affected targets will now properly perceive their targets."}},
        {tags={"Nyx","Sentinel",},text={"*Fixed Sentinels hitting themselves when firing inside Nyx%'s Absorb bubble."}},
        {tags={"Ash",},text={"*Fixed teleported players falling through world if they had not had footing on ground."}},
        {tags={"Nova","Sentinel",},text={"*Fixed Nova’s Molecular Prime not chaining when the kill is made by a Sentinel."}},
        {tags={"Clan","Cipher",},text={"*Fixed sell price for cipher 10-run blueprints and the clan totems (all should be 200K CR just like regular totems)"}},
        {tags={"Nyx","Torid",},text={"*Fixed game-hangs when shooting Absorb bubble with Torid (and possibly other projectile weapons)."}},
        {tags={"Derelict","UI",},text={"*Fixed to the star map not showing correctly when client is disconnected from host during a derelict key mission in lobby."}},
        {tags={"Reflection","Volatile Runner",},text={"*Fixed game crash when Reflection Mod parries an Infested suicide runner."}},
        {tags={},text={"*Fixed for edge case where 5 users could enter a mission together."}},
        {tags={},text={"*Fixed for crashes in LensFlare when there are no flare paramaters."}},
        {tags={"Clan",},text={"*Fixed for dojo room costs being +1 of (Insert Resource/Credit here) when running 64 bit version of Warframe."}},
},--fixes end

},--update end
{
["update number"]={"10.5.6"},
["type"]={"fix"},
["date"]={"October 29th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/125633-hotfix-1056/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={},text={"*Addressed issue where event results could be manipulated by users."}},
},--fixes end

},--update end
{
["update number"]={"10.5.5"},
["type"]={"fix"},
["date"]={"October 28th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/125283-hotfix-1055/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={},text={"*Fixed Windows User Account Control popup appearing when launching the game."}},
        {tags={"Invasion",},text={"*Improved AI spawning and pacing of invasion missions."}},
        {tags={"Clan",},text={"*Fixed clan dojo being inaccessible if spawn room was set to the older version of Grand or Grandest Hall."}},
        {tags={},text={"*Fixed a handful of gameplay crashes."}},
},--fixes end

},--update end
{
["update number"]={"10.5.4"},
["type"]={"fix"},
["date"]={"October 27th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/124720-hotfix-1054/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={},text={"* Fixed battle reward display for Arcadia (they%'re actually the new reusable 10-pack blueprints worth 250,000 credits!)"}},
        {tags={"Defense","Survival","UI",},text={"* Fixed blueprint images in Survival and Defense rewards."}},
        {tags={"Invasion",},text={"* Fixed opposite diorama appearing when choosing corpus-invasion missions."}},
        {tags={},text={"* Fixed a number of crashes that could occur when Mult-Threaded rendering was enabled."}},
        {tags={"Rhino",},text={"* Fixed Rhino%'s IronSkin making his allies attack him."}},
        {tags={},text={"* Added crash-handler to firewall exception list (might fix people not getting a WAR-number for crashes)."}},
        {tags={"Clan",},text={"* Fixed stats being contributed to a clan you have only been invited to (but not accepted)."}},
},--fixes end

},--update end
{
["update number"]={"10.5.3"},
["type"]={"fix"},
["date"]={"October 25th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/123878-hotfix-1053/"},
["fixes"]={
        {tags={"Mag","Roller"},text={"*Fixed Grineer Rollers becoming invincible when affected by Mag%'s Pull ablility"}},
        {tags={"Invasion",},text={"*Fixed loot crates being rotated improperly during Grineer invasion missions"}},
        {tags={"Invasion",},text={"*Fix placeholder image appearing in Invasion Faction Selection screen when Blueprint rewards are offered"}},
        {tags={"Invasion",},text={"*Ally NPCs will no longer hack the shield control panel during invasion missions"}},
        {tags={"Invasion",},text={"*Invasion progress bars now display tenths of a percent"}},
        {tags={},text={"*Fixed mission not locking once the defender count falls below 50% (same rule as regular Extermination missions)"}},
        {tags={"Invasion",},text={"*Toned down sound FX for ambient laser fire during invasion missions"}},
},--fixes end

},--update end
{
["update number"]={"10.5.2"},
["type"]={"fix"},
["date"]={"October 24th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/123417-hotfix-1052/"},
["fixes"]={
        {tags={"Invasion",},text={"*Added counter to Invasion Faction-Selection screen indicating progress for the selected battle location."}},
        {tags={"Invasion",},text={"*Added missing translations for Invasion missions."}},
        {tags={"Napalm",},text={"*Removed camera shake from Grineer napalm projectile."}},
        {tags={},text={"*Fixed enemies getting trapped inside rocky areas where they can%'t be killed (take 2)"}},
        {tags={},text={"*Fixed some cases of online presence not refreshing immediately after logging out/logging in again."}},
        {tags={},text={"*Fixed Revive prompt not appearing when approaching teammates from certain angles."}},
        {tags={"Mag","Prime","UI",},text={"*Fixed missing Mag Prime component blueprint icons."}},
},--fixes end

},--update end
{
["update number"]={"10.5.1"},
["type"]={"fix"},
["date"]={"October 24th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/123306-hotfix-1051/"},
["fixes"]={
        {tags={"The Gradivus Dilemma"},text={"*Fixed enemies being caught under asteroid terrain in the “Gradivus Dilemma”."}},
        {tags={},text={"*Fixed intermittent gameplay crashes."}},
        {tags={"Clan","Event",},text={"*Added Clan member leaderboards for the event so clans can organize their efforts."}},
        {tags={"Invasion",},text={"*Fixed host migration not functioning for Invasion missions."}},
        {tags={"Invasion",},text={"*Updated “Invasion Faction-Selection%' screen to better indicate progress towards Battle Pay, also added more descriptive explanation."}},
        {tags={"Weapon Cosmetics",},text={"*Fixed description of Day of the Dead packs to reflect the proper amount of skins within: 11!"}},
        {tags={"HUD",},text={"*Fixed percentage bar UI having a line break."}},
        {tags={},text={"*Fixed screen continuing to shake for 10-60 seconds if a host migration occurs while screen is shaking."}},
        {tags={"Stalker",},text={"*Fix for invulnerable Stalker."}},
        {tags={},text={"*Fix for Grineer and Corpus playing old death and pain sounds."}},
        {tags={"UI",},text={"*Fix for large chat fonts not working correctly on chat start."}},
        {tags={"Inventory",},text={"*Fix for Credit gaining method after bulk selling blueprints."}},
        {tags={"Invasion",},text={"*Removed lock down during Invasion missions."}},
        {tags={"UI",},text={"*Fix for some fonts not showing up in Korean language."}},
        {tags={"UI",},text={"*More work towards unifying fonts used in game."}},
},--fixes end

},--update end
{
["update number"]={"10.5"},
["date"]={"October 23rd, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/122841-update-1050-the-gradivus-dilemma/"},
["title"]={"The Gradivus Dilemma"},
["image"]={"7MYSXLL.jpg"},
["additions"]={
        {tags={"Weapon Cosmetics",},text={"*Day of the Dead weapon skins pack."}},
        {tags={"Color Picker Extension",},text={"*Halloween color picker added!"}},
        {tags={},text={"*Team Totem consumables now available for purchase in 10-pack quantities with reusable Blueprints."}},
},--additions end
["changes"]={
        {tags={"Soma","Mastery Rank",},text={"*Soma Mastery Rank increased from 3 to 6."}},
        {tags={"Death",},text={"*Made it easier to revive fallen Tenno (facing angle no longer matters)."}},
        {tags={"Survival","Phobos",},text={"*Swapped Skyresh & Stickney mission types to moves survival off the main path in Phobos"}},
        {tags={"UI",},text={"*Oft-requested “separate DOF/Motion Blur” options is now live. These are separate options now."}},
        {tags={"Survival","HUD",},text={"*Resized Survival reward popup for easier reading."}},
        {tags={"Crawler","Nauseous Crawler","Toxic Crawler","Electric Crawler","Lobber Crawler"},text={"*Added unique names and descriptions for differing Infested Crawlers."}},
        {tags={"Boar Prime","Prime",},text={"*Boar Prime energy colour is now tint-able."}},
        {tags={},text={"*Weapons affected by sound-dampening mods are a little louder now by request."}},
        {tags={"Conclave",},text={"*Camera faces in player direction when starting a Conclave match."}},
        {tags={"Corpus Outpost",},text={"*Corpus Outpost - Large circular doors now behave like all other doors in the game and do not automatically close."}},
        {tags={"Acrid","Heavy Caliber",},text={"*Corrupted Heavy Caliber mod now works with Acrid."}},
        {tags={"Magnum Force",},text={"*Corrupted Mod “Magnum Force” changed from Damage/Recoil to Damage/Accuracy trade-off."}},
        {tags={"Survival","Void","Prime",},text={"*Prime gear rewards added to 5m, 10m, and 20+ min tiers in Void Survival missions."}},
        {tags={"Grineer Galleon","Grineer Settlement",},text={"*Optimizations made to ambient sounds on Grineer Galleon and Grineer Settlement."}},
        {tags={"Conclave",},text={"*Standardized conclave requirements at lower levels in mission decks and powersuit ability rebalance for lower conclave levels."}},
        {tags={"Lotus",},text={"*Lotus HUD beeps and text typing sounds now mute when user lowers volume of Lotus"}},
        {tags={"Soma",},text={"*Turned non-player Soma down."}},
        {tags={"Conclave",},text={"*Stun/Knockdown mods value decreased in conclaves."}},
        {tags={"Conclave","Rage",},text={"*Rage mod value increased to upper tier conclaves (200 to 500)"}},
        {tags={"Conclave",},text={"*Increased damage resistance for all Warframes in conclave. (10% to 15%)"}},
        {tags={"Corpus Ship",},text={"*New skybox added to Corpus ship levels."}},
        {tags={"Frost",},text={"*New sound for Frost’s Snowglobe ability."}},
},--changes end
["fixes"]={
        {tags={"Dual Ichor",},text={"*Fixed a crash that could happen if you did a charged melee attack with Dual Ichor on a downed enemy."}},
        {tags={},text={"*Fixed some enemy AI navigation issues."}},
        {tags={},text={"*Fixed ragdolls affected by weapons and abilities so they function consistently between host and client."}},
        {tags={"Ancient Healer",},text={"*Fixed healing ancient from emitting healing pulses while ragdolled (pulses would look like they were coming from the wrong spot)."}},
        {tags={"Bow Weapons",},text={"*Fixed broken firing animations for Bow weapons."}},
        {tags={"Assassination","Nightmare Mode",},text={"*Fixed nightmare Assassination missions giving only the nightmare reward, and not the boss reward."}},
        {tags={"Survival",},text={"*Fixed the Survival mission issue of life support bar appearing at 0% for a few seconds before life support is deactivated."}},
        {tags={"Derelict"},text={"*Fixed many possible bad cases happening when doing multiple vault runs (loss of player functionality, potential crash, debuff applied to wrong player, debuff fx applied to non-debuffed player, etc)."}},
        {tags={},text={"*Fixed various reported map issues across all art sets (navigation, broken geometry, etc.)"}},
        {tags={"Survival",},text={"*Fixed Survival rewards that were doubling up on the 5 minute reward."}},
        {tags={"Duel","Conclave",},text={"*Fixed revive context action from appearing in Conclave duels."}},
        {tags={"Ash",},text={"*Fixed Ash’s Bladestorm ability that would sometimes ignore enemies who are standing right beside the initial target."}},
        {tags={"Nova","Duel","Conclave",},text={"*Fixed duration of Nova’s Molecular Prime in Conclave duels (lowered to 5 seconds)."}},
        {tags={"UI",},text={"*Fixed Arsenal UI that would not update accuracy values when equipping mods that change accuracy."}},
        {tags={"Lotus",},text={"*Fixed Lotus enemy alert notifications from happening too often."}},
        {tags={"Conclave",},text={"*Fixed some layout issues in multiple Conclave maps."}},
        {tags={"Loki","Saryn","Duel","Conclave",},text={"*Fixed issue where destroying a Loki Decoy or Saryn Moult avatar would award players a kill in Conclave duels."}},
        {tags={"Vauban",},text={"*Fixed Vauban’s Bounce ability that caused friendly AI to play perpetual falling animation."}},
        {tags={"Pickups",},text={"*Fixed some reported issues related to malfunctioning loot containers."}},
},--fixes end

},--update end
{
["update number"]={"10.4.1"},
["type"]={"fix"},
["date"]={"October 18th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/121173-hotfix-1041/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={},text={"*Fixed intermittent DirectX 11 driver crashes"}},
        {tags={"Survival",},text={"*Fixed rewards collected during Survival missions disappearing if you died & revived as a client"}},
        {tags={"Loki",},text={"*Fixed Loki%'s Radial Disarm causing no loot to drop from enemies"}},
        {tags={"UI",},text={"*Fixed unresponsive UI after right-clicking to remove an Aura Mod"}},
        {tags={},text={"*Fixed skybox backgrounds occasionally missing during gameplay "}},
},--fixes end

},--update end
{
["update number"]={"10.4"},
["date"]={"October 16th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/120557-update-1040/"},
["title"]={""},
["image"]={""},
["additions"]={
        {tags={"Ballistica",},text={"*%[%[Ballistica%]%]: Dual firing crossbow available now! A one-handed crossbow featuring a unique dual-firing mechanism, the Ballistica allows you to choose between a four bolt volley or a deadly accurate charged shot. As it is a secondary weapon, the Ballistica can be paired with the Paris compound bow for a lethal load out. Take aim and pin your enemy to the wall!"}},
        {tags={"Fist Weapons",},text={"*Added animations for Gauntlet style weapon Charge Attacks."}},
},--additions end
["changes"]={
        {tags={"Sentinel",},text={"*New overall less-bouncy camera collision that also now ignores Sentinels colliding to create unwanted shake."}},
        {tags={"Market",},text={"*You can no longer re-purchase reusable recipes that you already own."}},
        {tags={"Corrupted Mods",},text={"*Corrupted Mod that had a negative recoil affect has been changed to a %'damage spread increase%'* negative affect to account for 0 recoil weapons not having a negative consequence."}},
        {tags={"UI",},text={"*UI tweaks when viewing friend’s profiles."}},
        {tags={"UI",},text={"*Minor improvements to usability of Mods and loadouts"}},
        {tags={"Sentinel","Mods","UI",},text={"** Since some Sentinel weapons use pistol Mods, we now perform a check to ensure you aren%'t using the same mods on your pistol and Sentinel weapon"}},
        {tags={"Mods","UI",},text={"** We now only hide duplicates of level 0 Mods; players may want to pick one level 9 Mod over the other (to avoid the nag screen when exiting the loadout)"}},
        {tags={"Volt",},text={"*Volt%'s Speed boost won%'t affect other player%'s FOV"}},
        {tags={"Fusion","Mods",},text={"*Changes to logic of Mod “auto-resolve” feature. Equips best Mod of equal or lesser fusion rather than first Mod of equal or lesser fusion."}},
        {tags={"Conclave",},text={"*No longer allow Conclave in Solo mode."}},
        {tags={"Tech",},text={"*Corpus Tech enemy now gives more XP."}},
        {tags={"Parry","Reflection",},text={"*Can no longer deal parry-reflection damage when AFK"}},
        {tags={"Ancient Healer",},text={"*Prevent Healing Ancient from emitting healing pulses while ragdolled (pulses would look like they were coming from the wrong spot)."}},
        {tags={"Saryn",},text={"*Added more of a visual indicator on Saryn’s Contagion."}},
        {tags={"Ignis",},text={"*Changed Ignis’s default colour to represent realistic fire, not white flames."}},
        {tags={"Foundry","UI",},text={"*Tweaks to Foundry UI sounds."}},
        {tags={"Volt",},text={"*Small performance improvements to Volt%'s overload, was creating a lot of particles/unneeded scripts in a single frame"}},
        {tags={},text={"*Optimization to use of Runtime Tesselation, objects that were out of sight or in shadow do not need this option. Should improve performance."}},
        {tags={"UI",},text={"*Multiple translations added."}},
},--changes end
["fixes"]={
        {tags={"UI",},text={"*Fix for Arsenal Weapon accuracy not updating when equipping mods which change accuracy"}},
        {tags={},text={"*Fix for issues when players joining sessions from friend list would result in a “double-join”"}},
        {tags={"UI","HUD",},text={"*Fix for damage numbers not being shown on frozen enemies, and damage against frozen enemies not being tracked in stats."}},
        {tags={"Ash","Defense",},text={"*Fix for Ash %'power in use%' bug when using %'Teleport%' on defense target."}},
        {tags={"Loki","Nova","Lephantis",},text={"*Fix for being able to escape Golem boss arena with Loki or Nova when mission is in progress."}},
        {tags={"UI",},text={"*Fixes for UI formatting in Turkish language."}},
        {tags={"Ancient Healer","Ancient Disruptor","Toxic Ancient"},text={"*Fix for Infested Ancient death burst FX not showing on clients."}},
        {tags={"Duel",},text={"*Fix for after killing your opponent in a duel, there is a brief moment where you receive a revive context action"}},
        {tags={"Dakra Prime","Orthos Prime","Prime",},text={"*Fix for Orthos Prime appearing on Dakra Prime blueprint."}},
        {tags={"Conclave",},text={"*Fix for Conclave team assignment not respecting user choices for teams."}},
        {tags={},text={"*Fix for nodes that did not lead to a proper mission."}},
        {tags={},text={"*Fix for getting stuck in a charge animation if meleeing off an edge/corner/Mount Doom."}},
        {tags={"Charger",},text={"*Fix for Infested chargers not disintegrating on client."}},
        {tags={},text={"*Fix for enemies disappearing on Client screen when killed by armor piercing damage."}},
        {tags={"Derelict",},text={"*Fixed issues where Vaults would sometimes not appear in Derelicts."}},
        {tags={"Defense","Lotus",},text={"*Fix for Lotus Defense mission transmissions not appearing in French, Italian, German, and Spanish."}},
        {tags={},text={"*Multiple Crash and freeze fixes."}},
},--fixes end

},--update end
{
["update number"]={"10.3.4"},
["type"]={"fix"},
["date"]={"October 12th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118923-hotfix-1033-1034/"},
["additions"]={
        {tags={"Derelict",},text={"*Fixed many possible bad cases happening when doing multiple vault runs including: loss of player functionality, potential crash, debuff applied to wrong player, and debuff fx applied to non-debuffed player."}},
        {tags={"Bow Weapons",},text={"*Fixed a number of bow animation issues."}},
        {tags={"UI",},text={"*Fixed ESC-key being ignored when chat window is active (so you can back out of a lobby even with the chat window open)."}},
        {tags={},text={"*Fixed Dx11 driver errors that would happen if last thing rendered before PostFX had tessellation enabled"}},
},--additions end
["changes"]={
        {tags={"Derelict",},text={"*Added a profile setting to enable/disable runtime tessellation for DirectX 11. We encourage players to give us feedback whether disabling this option results in performance improvement on mid-to-low-end video cards when playing Orokin Derelicts."}},
},--changes end
["fixes"]={
        {tags={"Survival",},text={"*5 minute Survival reward is only rewarded once. (Was giving double rewards, lucky ducks!)"}},
},--fixes end

},--update end
{
["update number"]={"10.3.3"},
["type"]={"fix"},
["date"]={"October 12th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118923-hotfix-1033-1034/"},
["changes"]={
        {tags={"Conclave",},text={"*Made victory default if opposing team abandons a conclave."}},
        {tags={"Kunai","Thrown Weapons",},text={"*Kunai and other thrown weapons now hide on player%'s thighs when player is attacking with melee weapons."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed many possible bad cases happening when doing multiple vault runs including: loss of player functionality, potential crash, debuff applied to wrong player, and debuff fx applied to non-debuffed player."}},
        {tags={},text={"*Fixed a number of bow animation issues."}},
        {tags={},text={"*Fixed ESC-key being ignored when chat window is active (so you can back out of a lobby even with the chat window open)."}},
        {tags={},text={"*Fixed Dx11 driver errors that would happen if last thing rendered before PostFX had tessellation enabled"}},
},--fixes end

},--update end
{
["update number"]={"10.3.2"},
["type"]={"fix"},
["date"]={"October 10th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118455-hotfix-1032/"},
["additions"]={
        {tags={},text={"*Add a way to bind toggle sprint on the gamepad."}},
        {tags={"Mobile Defense",},text={"*%[%[Corpus%]%] %[%[Mobile Defense%]%] Spawning: Adding doors, tweaking nav, position of mobile defense objectives for better spawning."}},
},--additions end
["changes"]={
        {tags={},text={"*AI performance improvements for when many enemies are spawned."}},
        {tags={"Mods",},text={"*Silence modded weapons are now more audible for the user."}},
},--changes end
["fixes"]={
        {tags={"Foundry",},text={"*Ran script to fix people who had %[%[Blueprint%]%] parts not appearing in %[%[Foundry%]%], live since 3:46 PM EST."}},
        {tags={"Loki","Derelict",},text={"*Orokin have adapted to thwart trickster %[%[Loki%]%]%'s from switch teleporting into Vaults. Look trigger added for join in progress check."}},
        {tags={"UI",},text={"*Fix for loss of UI functionality when adjusting sliders in settings screen."}},
        {tags={"Dual Zoren",},text={"*Fix for a crash if you had Dual Axes charged and then tried to do a ground attack on a downed enemy."}},
        {tags={},text={"*Fix for several NPC path following issues. Npcs slow down if they need to turn to reach a bridge - helps stop running in circles. Fixed trace to next path point. Fixed updating path if fall off nav ledge onto nav below. Fixed repath after teleport."}},
        {tags={"UI",},text={"*Fix path strings showing up in the PC settings menu."}},
        {tags={"Conclave","Pickups",},text={"*Fix for %[%[Conclave%]%] ammo pickups."}},
        {tags={"Derelict",},text={"*Fix for players circumventing the Vault design by jumping out of a mission, crafting the required key, then returning to the original mission."}},
        {tags={"UI",},text={"*Fix for drop down from opening up when pressing escape on initial load of the game."}},
        {tags={"UI",},text={"*Fix for Pressing K in chat after returning from a mission opens the Mission Results window."}},
        {tags={"Maneuvers",},text={"*Fixing issue where you couldn%'t get up a pipe by wall running."}},
        {tags={"Boar Prime","Prime",},text={"*Fix for %[%[Boar Prime%]%] energy colour not being tintable."}},
        {tags={"Rush","Clan","Rush",},text={"*Fix for not being able to rush %[%[Clan Dojo|Dojo%]%] %[%[Decorations%]%] with Platinum."}},
        {tags={},text={"*Fix for bow not playing firing animations."}},
        {tags={"Grineer Galleon",},text={"*Fix for %[%[Grineer Galleon%]%] map clipping."}},
        {tags={"Market",},text={"*Fix for crash with high paced clicking on popups (%[%[Market%]%], etc.)."}},
        {tags={"Nightmare Mode",},text={"*Fix for nightmare assassinate missions giving only the %[%[Nightmare Mode|nightmare%]%] reward, and not the boss reward."}},
        {tags={},text={"*Fix %[%[Dragon Key|Suvival Vault%]%] missions not giving out a reward from the Vault loot pool."}},
        {tags={"Flux Rifle","Ignis","Sabotage","Void",},text={"*Fix for %[%[Flux Rifle%]%] and %[%[Ignis%]%] not being able to damage reactor cores or Orokin death orbs."}},
        {tags={"Saryn","Flux Rifle","Ignis",},text={"*The above fix also fixes not being able to pop %[%[Saryn%]%]%'s venom orbs with %[%[Flux Rifle%]%] and %[%[Ignis%]%]."}},
        {tags={"Miter",},text={"*Fix for %[%[Miter%]%] blades firing on wrong axis."}},
},--fixes end

},--update end
{
["update number"]={"10.3.1.2"},
["type"]={"fix"},
["date"]={"October 9th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118024-hotfix-1031-humpier-day/"},
["fixes"]={
        {tags={"Derelict","Mutagen Sample",},text={"*Fix for Mutagen Drops in Derelicts"}},
        {tags={"Clan",},text={"*Fix for accidental increase in Bio Clan-tech weapons, back down to 50K Credits per replication."}},
},--fixes end

},--update end
{
["update number"]={"10.3.1.1"},
["type"]={"fix"},
["date"]={"October 9th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118024-hotfix-1031-humpier-day/"},
["fixes"]={
        {tags={"UI",},text={"*Fix for use of the ESC freezing the game UI if hit when entering lobby."}},
},--fixes end

},--update end

{
["update number"]={"10.3.1"},
["type"]={"fix"},
["date"]={"October 9th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/118024-hotfix-1031-humpier-day/"},
["title"]={"Humpier Day!"},
["fixes"]={
        {tags={"Void","Derelict","Pickups",},text={"*Fix resources not dropping in Derelict and Void missions."}},
        {tags={"Mods",},text={"*Fix for players receiving pre-leveled/maxed mods. Lucky ducks!"}},
        {tags={"Corrupted Mods","UI",},text={"*Fix for missing Corrupted Mod icon."}},
        {tags={"Foundry",},text={"*Fix for blueprints received as boss drops not saving to Foundry."}},
        {tags={"Derelict",},text={"*Fix for Clients joining Derelict Missions holding a Dragon Key not seeing Key indicator on HUD. "}},
        {tags={"Star Chart","UI",},text={"*Fix for loss of functionality and unintended navigation when chatting in star chart."}},
        {tags={"Clan",},text={"*Fix for clan MOTD back to 256 character max."}},
        {tags={},text={"*Fix FOMORIAN missions appearing at Minthe and Kala-azar"}},
        {tags={},text={"*Fix for New Dragon key blueprints not explicitly stating they are reusable."}},
        {tags={"Conclave",},text={"*Fix for Conclaves not working."}},
        {tags={"Login Rewards",},text={"*Fix for login rewards not working."}},
},--fixes end

},--update end
{
["update number"]={"10.3"},
["date"]={"October 9th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/117806-update-1030-hump-day/"},
["title"]={"Hump Day!"},
["additions"]={
        {tags={"Derelict",},text={"*The Orokin Vaults have emerged in the Derelict Tile Sets! https://forums.warframe.com/index.php?/topic/117801-the-orokin-vaults-have-emerged/"}},
        {tags={"UI",},text={"*Ongoing User Interface upgrades and styling improvements."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Survival","Lotus","Void",},text={"*Survival Mission Improvements:"}},
        {tags={"Lotus",},text={"**Items awarded at 5 minute intervals are now shown in the HUD below the Lotus transmissions."}},
        {tags={"Survival",},text={"**Reward items now stack as you play - all rewards are given at the end of the mission."}},
        {tags={"Survival",},text={"**As you play and survive, you will receive items at these times:"}},
        {tags={"Survival",},text={"***5m: Item from the first reward tier"}},
        {tags={"Survival",},text={"***10m: Item from the first reward tier again"}},
        {tags={"Survival","Void",},text={"***15m: Guaranteed Void key (this is considered the second reward tier)."}},
        {tags={"Survival",},text={"***20m, 25m, 30m+: Item from the third reward tier"}},
        {tags={"Survival","Void","Prime",},text={"**Void mission Prime rewards are awarded at 15 minutes only."}},
        {tags={"Survival",},text={"**Mission rewards are now split into three distinct tiers of enemy level, instead of being based on faction."}},
        {tags={"Survival",},text={"**Expect better rewards based on the enemy tier you are fighting:"}},
        {tags={"Survival",},text={"***Tier 1: Level 1-25"}},
        {tags={"Survival",},text={"***Tier 2: Level 25-45"}},
        {tags={"Survival",},text={"***Tier 3: Level 45+"}},
        {tags={"Survival","Void",},text={"**Void mission rewards are tied to the tier of the key."}},
        {tags={"Survival",},text={"**Extraction no longer triggers if only one player enters the extraction area."}},
        {tags={"Survival",},text={"**If the life support bar is still depleting, *all* players must be at extraction to complete the mission."}},
        {tags={"Survival",},text={"**The regular 60 second extraction timer starts if half the team is at extraction *after* the life support bar reaches zero."}},
        {tags={"Survival",},text={"**All doors in the level are now locked until you trigger the alarms."}},
        {tags={"Survival",},text={"**Added an effect to show the exact position of the next incoming support capsule."}},
},--additions end
["changes"]={
        {tags={"Mods","UI",},text={"*Improved management and feedback when equipping mods between weapons and sentinels."}},
        {tags={"Lephantis","Foundry",},text={"*Bosses now have their blueprint drops as end-mission rewards (like Lephantis) instead of physical orbs in the level. (PSA: Known issue with BP%'s not appearing in Foundry will be Hot*Fixed.)."}},
        {tags={},text={"*Further improvements on the experimental multi-threaded rendering option. If you had this enabled, take note you will need to re-enable this in the settings area."}},
        {tags={"Conclave","UI",},text={"*Hid conclave scores from lobby UI; only reveal them in squad panel when someone votes on a Conclave node, and also provide name of player who doesn%'t meet Conclave rating requirement."}},
        {tags={"Clan",},text={"*Made Dojo prop decoration destruction give all your resources back."}},
        {tags={"Death",},text={"*Hooked up sound to the Revive mechanic, falling downed allies now has audio feedback."}},
        {tags={},text={"*Improved matchmaking to consider a player%'s %'Loadout rank%' when finding a suitable squad to join (sum of pistol + rifle + melee + powersuit rank) ."}},
        {tags={"Dera","Sicarus",},text={"*Updated Dera and Sicarus firing sounds."}},
        {tags={"Quick Thinking",},text={"*Added missing mod card image for Quick Thinking."}},
        {tags={},text={"*Improved camera motion under collision."}},
        {tags={"Nekros",},text={"*Gloss maps added to Nekro’s materials for more varied shininess."}},
        {tags={"Kama",},text={"*Added elemental FX for Kama."}},
        {tags={"Embolist",},text={"*Added more colour variation to Infested Pistol FX."}},
        {tags={"Acrid",},text={"*Acrid now uses energy color."}},
        {tags={"Trinity",},text={"*Added sound for Trinity’s Energy Vampire ability deactivating."}},
        {tags={"Sentinel","Inventory",},text={"*Players can only sell their last remaining Sentinel weapon if they have no Sentinels in their inventory."}},
        {tags={"HUD",},text={"*Improved mini-map pathing to prevent misleading objective icons."}},
        {tags={},text={"*Reduced impulse on stealth finishers."}},
        {tags={"Nova","Conclave",},text={"*Balanced Nova’s Molecular Prime ability for Conclaves only."}},
        {tags={"Banshee",},text={"*Added unique casting sounds for Banshee abilities and updated Soundquake and Silence."}},
        {tags={"Volt",},text={"*Added new Volt Shield ability sounds."}},
        {tags={"Volt",},text={"*Updated Volt overload charge sounds to match animation."}},
        {tags={"UI",},text={"*Added translations for some text that was English only."}},
        {tags={"Ash",},text={"*Added local and remote teleport sound slots for Ash’s Bladestorm."}},
        {tags={"Toxic Crawler",},text={"*Added small smoke effect to noxious crawlers."}},
        {tags={"Mobile Defense",},text={"*Fixed mobile-defense objective markers; they now stay on the active defense objective and only show the other terminal markers after the defense wave is complete."}},
        {tags={"Ash","Loki","Vor",},text={"*Prevented Vor’s electrical attacks from hiting the invisible players (Loki, Ash)."}},
        {tags={"Defense",},text={"*Improved spawning in multi-defense (and other modes that explicitly spawn enemies using custom spawn filters)."}},
        {tags={"Survival","Corpus Ship",},text={"*Improved spawning logic in Corpus Ship Survival."}},
        {tags={"Survival","Grineer Galleon","HUD",},text={"*Changed minimap marker settings to help with finding Survival capsules in Grineer Galleon."}},
        {tags={"Survival","HUD",},text={"*Added a limit to the number of Survival markers that appear onscreen at once; aside from making it easier to see the action this may also help with frame-rate."}},
        {tags={"Survival","Derelict",},text={"*Removed elevators from Orokin Derelict Survival."}},
        {tags={},text={"*Improved melee weapon accuracy vs. non-upright targets."}},
        {tags={"Sentinel",},text={"*Made sentinel flare visual effect use energy color."}},
        {tags={},text={"*Removed redundant mission start VO after host migration."}},
        {tags={"Death",},text={"*Changed pre-death (aka bleed-out) to disallow blocking or parrying."}},
        {tags={"UI",},text={"*Changed all UPPERCASE Warframe and weapon names in descriptions to Capital Case."}},
        {tags={"Ash",},text={"*Improved Ash Teleport responsiveness – trimmed animation and added reaction to enemy being teleported to."}},
        {tags={"Sentinel","Carrier",},text={"*Added Carrier Sentinel ambient FX."}},
        {tags={"Dual Ichor","Dual Zoren","Dual Cleavers",},text={"*Added holster animation to Dual Zoren, Dual Ichor, and Dual Cleaver weapons after a jump attack."}},
        {tags={"UI",},text={"*Replaced pagination with scrolling navigation for browsing available profile pictures."}},
        {tags={"Death",},text={"*Revised player resurrection sounds."}},
        {tags={"Kama","Sentinel","Conclave",},text={"*Added conclave values to Sentinels and Kama."}},
        {tags={"Clan",},text={"*Revised Clan leaderboard badges."}},
        {tags={"Ignis",},text={"*Made Ignis flame effects use energy color."}},
        {tags={},text={"*Added immediately display of cosmetic item loadout changes to on the main menu avatar; Backing out without equipping a cosmetic item will then revert to your actual loadout."}},
        {tags={"Mag","Prime",},text={"*Improved Mag Prime materials to better allow tinting."}},
        {tags={"Rhino","Sentinel","Djinn","Fatal Attraction",},text={"*Improved logic for drawing enemy fire while using Rhino’s Iron Skin ability and Djinn Sentinel Fatal Attraction precept."}},
        {tags={"Clan",},text={"*Improved ambient sound for Dojo Gardens."}},
        {tags={"Conclave",},text={"*Conclaves now operate on best-of-three rounds instead of single round."}},
        {tags={"Boar","Gorgon","Dual Ether","Ether Daggers","Machete","Market",},text={"*A few Market weapons are being retired: Gorgon, Dual Ether Daggers, Boar, and Machete. You have 7 days to get them before they go into the retirement! "}},
},--changes end
["fixes"]={
        {tags={"Survival",},text={"*Fixed various host migration issues found in Survival related to enemy spawning."}},
        {tags={"Survival",},text={"*Fixed Survival life support capsule and pickup timing."}},
        {tags={"Alert",},text={"*Fixed issue with news/alerts not displaying intermittently."}},
        {tags={"Alert",},text={"*Fixed mission nodes being selected in the background when clicking on alert popup."}},
        {tags={"Consumables",},text={"*Fixed some highlight issues with consumables (buttons now disabled when not picking consumables)."}},
        {tags={},text={"*Fixed rare cases where an alarm panel outside of the spawn would be enabled instead of the one in the spawn room, changed how health drain works."}},
        {tags={"Dual Ichor",},text={"*Fixed Dual Ichor getting stuck in charge mode."}},
        {tags={"Sure Footed",},text={"*Fixed Sure Footed mod that was not working on clients."}},
        {tags={"Star Chart",},text={"*Fixed issue where using chat while in a non-star node lobby will prevent the player from starting it, and when done in a star chart lobby, will start the match."}},
        {tags={},text={"*Fixed bounding box on consoles that allowed players to walk up them."}},
        {tags={"Defense",},text={"*Fixed issue where player loses rewards in key-accessed defense missions if they do not claim and exit with host."}},
        {tags={"Conclave",},text={"*Fixed missing intro/outro music in Conclaves."}},
        {tags={"Clan",},text={"*Fixed issue where Clans could build more than one of the same Clan Halls."}},
        {tags={"Alert",},text={"*Fixed changing regions while zoomed preventing alert panel from every showing up again."}},
        {tags={"Ember","HUD",},text={"*Fixed missing damage number reports for clients during Ember’s Overheat ability."}},
        {tags={},text={"*Fixed some issues with Warframe idles."}},
        {tags={"Quick Return","Rebound",},text={"*Fixed (switched) Glaive mod names of Quick Return and Rebound to match the function."}},
        {tags={"Boltor",},text={"*Fixed animation bug with Boltor if reload is interrupted by melee."}},
        {tags={"Mag",},text={"*Fixed Mag’s Shield Polarize ability FX on enemies to use correct color."}},
        {tags={"Nekros",},text={"*Fixed a “power in use” bug that occurred after using Nekros’ Desecrate."}},
        {tags={"Soma",},text={"*Fixed issue with Soma where clip mesh during reload animation was rendering black"}},
        {tags={"Akbolto","Bolto",},text={"*Fixed Akimbo Bolto sound attenuation and missing reload sounds."}},
        {tags={"Glaive Weapons",},text={"*Fix for Glaive mods to be shared between Glaive/Kestrel"}},
        {tags={"Conclave",},text={"*Fixed Conclave game type not counting in stats."}},
        {tags={"Torid",},text={"*Fixed Torid gas cloud not appearing when the projectile hits and kills an enemy."}},
        {tags={},text={"*Fixed reported collision issues across all maps."}},
        {tags={},text={"*Fixed clients not being able to damage ragdolled enemies with trace fire weapons."}},
        {tags={"Ignis","Embolist",},text={"*Fixed continuous fire AoE weapons (Ignis, Embolist) from hitting the same target multiple times per shot when in ragdoll."}},
        {tags={},text={"*Fixed missing bodyfall event sounds for Grineer deaths."}},
        {tags={},text={"*Fixed inbox not popping up after tutorial, if you have unread messages."}},
        {tags={"Ash","Nova",},text={"*Fixed issue that allowed Nova’s Wormhole ability to teleport through rock walls."}},
        {tags={"Loki",},text={"*Fixed Loki’s Radial Disarm that was removing limbs from Infested Runners."}},
        {tags={"Mobile Defense","Void,"},text={"*Fixed issue where after activating the first objective in Orokin mobile defense, the timer does not start."}},
        {tags={},text={"*Fixed Dx11 being disabled in the launcher if you went to the settings panel before Dx11 had been auto-detected."}},
        {tags={},text={"*Fixed enemies not always playing their death animations / ragdolls."}},
        {tags={"Grakata","Ignis","Embolist",},text={"*Fixed weapons that played reload sounds twice (Ignis, Grakata, Embolist)"}},
        {tags={"Nekros","Lanka",},text={"*Fixed Nekros “noble” pose with Lanka equipped."}},
        {tags={"Sentinel","Survival",},text={"*Fixed Survival reward that awarded a maxed Sentinel mod."}},
        {tags={"Shade",},text={"*Fixed weapon energy shader for dark (black) energy colors."}},
        {tags={"Nekros",},text={"*Fixed issue where MOAs raised with Nekros Shadows of the Dead ability knocked down friendly players."}},
        {tags={"Nekros",},text={"*Fixed Shadows of the Dead not applying effects on clones for clients when there is enough latency between them and the host."}},
        {tags={"Sentinel","Carrier","Djinn",},text={"*Fixed emblem deco positions on Carrier and Djinn sentinels."}},
        {tags={"Torid",},text={"*Fixed Torid gas cloud damage radius, which was larger than the actual visible cloud."}},
        {tags={"Torid",},text={"*Fixed Torid elemental damage not being affected by armor."}},
        {tags={"Mods","UI",},text={"*Fixed issue where Mods won%'t apply to newly purchased weapons until you %'touch%' them in the arsenal."}},
        {tags={"Volatile Runner",},text={"*Fixed level 60+ Infested suicide runners surviving after they self-explode."}},
        {tags={"Ember","Ospreys",},text={"*Fixed Osprey%'s not being affected by Ember’s Fireblast (even when flying right through the effects)."}},
        {tags={},text={"*Fixed multiple animation bugs reported in forums."}},
        {tags={"Phobos","UI",},text={"*Fixed mismatched translations of planet name for Phobos."}},
        {tags={"Ash","Vor",},text={"*Fixed Vor teleporting after targets he hasn%'t seen yet."}},
        {tags={"UI","HUD",},text={"*Fixed ragdolled enemies not displaying a health bar."}},
        {tags={"Hikou","Kunai",},text={"*Fixed throwing animation (Kunai, Hikou) becoming jittery with fire rate increase."}},
        {tags={},text={"*Fixed NPCs potentially falling through floor when activating panic-button."}},
        {tags={"Sentinel","Lephantis",},text={"*Fixed issue where Sentinels were destroyed during Lephantis battle phase switches."}},
        {tags={"Vasto",},text={"*Fixed reload sounds for Dual Vastos with data mass reload animation."}},
        {tags={"Reflection","Lancer",},text={"*Fixed Reflection mod not working on Grineer Lancers."}},
        {tags={"Vauban","Charger","Ancients",},text={"*Fixed Infested chargers and ancients not being appropriately affected by Vauban’s Vortex ability."}},
        {tags={"Foundry",},text={"*Fixed issue where player could craft last remaining secondary weapon (for dual version) leaving the player with no secondary weapon available."}},
        {tags={"Ignis","Duel","Conclave","Pickups",},text={"*Fixed Ignis and other weapons causing Pickups to go crazy if they had not come to rest in Conclave duels."}},
        {tags={"Alert","UI",},text={"*Fixed the news and alerts blocking the mouse even when they are invisible."}},
        {tags={"Clan",},text={"*Fixed issue where users may be unable to rotate their camera after placing a decoration in the Dojo."}},
        {tags={"Galatine",},text={"*Fixed perceived range issues with Galatine, and also **Fixed misaligned elemental FX."}},
        {tags={"Rescue",},text={"*Fixed some reported issues with Rescue Target “stuck” spots."}},
        {tags={},text={"*Fixed some gfx settings that would not actually take effect the 1st time you toggle if your reconfig required a device reset (ie: res change)"}},
        {tags={"Neptune","Pluto","Conclave",},text={"*Fixed issue where players could attack and kill each other between rounds in Neptune and Pluto Conclaves."}},
        {tags={"Duel",},text={"*Fixed issue where players were repeatedly teleported out of the duel area upon host migration."}},
        {tags={"Dakra Prime","Plasma Sword","Prime",},text={"*Fixed missing elemental FX for Dakra Prime and Plasma sword."}},
        {tags={"Nekros","Nyx","Shield Osprey",},text={"*Fixed issue where enemy Shield Osprey drones would shield friendly enemies controlled by Nyx or Nekros."}},
        {tags={"Rebound",},text={"*Fixed Glaive Rebound mod to have improved rebounding (must travel specified distance before auto-recall)"}},
        {tags={"UI",},text={"*Fixed headshot stat tracking issues with all ranged weapons."}},
        {tags={"Survival","Death",},text={"*Fixed issue where if a player dies during a survival mission, they will lose their previously acquired checkpoint."}},
        {tags={},text={"*Fixed client not initiating lobby when joining sessions while zoomed in on a planet."}},
        {tags={"UI",},text={"*Fixed %'joined %' message unnecessarily appearing when returning to frontend after completing a mission."}},
        {tags={"Duel","Conclave","UI",},text={"*Fixed stat tracking to exclude enemy pet kills/deaths in Conclave duels."}},
        {tags={"Ember",},text={"*Fixed Ember’s Fireblast light FX being independent of its power duration."}},
        {tags={},text={"*Fixed spectating mode - spectators no longer spectate themselves."}},
        {tags={"Conclave",},text={"*Fixed Conclave spawning to avoid players spawning on top of each other."}},
        {tags={"Fatal Attraction",},text={"*Fixed Fatal Attraction precept error on clients, resulting in missing FX."}},
        {tags={"Maneuvers",},text={"*Fixed player getting stuck in sprint without toggle sprint in some cases."}},
        {tags={},text={"*Fixed akimbo animations related to crouching and hand positioning."}},
        {tags={"Ammo Mutation",},text={"*Fixed issues with Ammo Mutation mods that were not functioning as intended."}},
},--fixes end

},--update end
{
["update number"]={"10.2.1"},
["type"]={"fix"},
["date"]={"October 4th,2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/116270-hotfix-1021/"},
["fixes"]={
        {tags={"Mastery Rank",},text={"*Fix for issues with retrying the rank 7 – 8 mastery tests."}},
        {tags={"Mastery Rank",},text={"*Fix for issues after failing the rank 9 mastery test not allowing successful retrials."}},
        {tags={"Mastery Rank",},text={"*Fix for issues with rank 10 – 11 mastery not informing players of failure."}},
        {tags={"Torid",},text={"*Fix for Torid’s cloud not using energy colour."}},
        {tags={"Twin Vipers",},text={"*Fixed Twin Vipers having redundant flashlight."}},
        {tags={"Arena","Duel",},text={"*Fix for after a migration during a duel players will be repeatedly teleported out of the duel arena"}},
        {tags={"Twin Gremlins",},text={"*Fixed Twin Gremlins having a flashlight on your off-hand weapon."}},
        {tags={"Dera"},text={"*Fixed Dera Muzzle flash offset."}},
        {tags={},text={"*Fixed NPCs potentially falling through floor when activating panic-button."}},
        {tags={"Clan",},text={"*Fix for context action button in Dojo reading file path instead of “X”."}},
        {tags={"UI",},text={"*Fix for unresponsive UI in certain cases of leaving and joining sessions."}},
        {tags={"Clan",},text={"*Fix for not being able to accept invite-only game sessions from clan members who weren’t on friends list."}},
},--fixes end

},--update end
{
["update number"]={"10.2"},
["date"]={"September 27th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/113787-update-1020/"},
["title"]={""},
["image"]={"0kvOoKR.jpg"},
["additions"]={
        {tags={"Galatine","Market",},text={"* %[%[Galatine%]%], a Tenno-forged great sword has been added to the market! See it in action here: http://www.youtube.com/watch?v=aPk4mTv0TuM"}},
        {tags={"Foundry",},text={"*Blueprints now show build requirements."}},
        {tags={"Hush","Suppress",},text={"*Hush and Suppress mods now lower the sound of weapons when equipped."}},
        {tags={"Market","Mods",},text={"*Mods available from the Referral Program can now be found in-game or through Mod *packs in the Market."}},
},--additions end
["fixes"]={
        {tags={"Carrier","Vacuum",},text={"* %[%[Carrier%]%] would only suck up drops with Vacuum if the host has not picked them up already. Now he sucks up drops regardless of if the host has picked them up!"}},
        {tags={"Boar Prime","Prime",},text={"*After greasing the gears of the %[%[Boar Prime%]%] it now moves when firing and reloading."}},
        {tags={"Ignis","Pickups",},text={"*Fix for %[%[Ignis%]%] and other weapons causing Pickups to go crazy by flying off the map if they had not come to rest."}},
        {tags={},text={"*Fix for sounds/music not always playing when starting a mission."}},
        {tags={},text={"*Fix for some hit sound effects constantly playing and never dying out."}},
        {tags={},text={"*Fixed footstep and slide sound effects randomly not playing."}},
        {tags={},text={"*Fixed visual and sound effects looping endlessly when firing projectile weapons at certain surfaces (doors, railings, lights, etc)."}},
        {tags={"Hush","Suppress",},text={"*Fixed Suppress/Hush mod to actually reduce sound effect volume of the weapon it’s attached to."}},
        {tags={"Survival","Rage",},text={"*Rage mod no longer converts oxygen-depletion damage in Survival mode to energy and will not convert asphyxiation or vampire damage to energy"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Drum contest is now live! Go here for the details: https://forums.warframe.com/index.php?/topic/113786-drum-contest-is-now-live/"}},
},--fixes end

},--update end
{
["update number"]={"10.1.3"},
["type"]={"fix"},
["date"]={"September 25th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/113027-hotfix-1013/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"Sentinel",},text={"* Sentinels are now aware of lazy Tenno masters and will take a break if they go AFK for over a minute"}},
        {tags={"Vor",},text={"*Fixed a case where the infamously-sneaky Captain Vor could teleport to a distant room after his intro cinematic finishes"}},
        {tags={"UI",},text={"*Fixed button callouts missing from tutorial messages"}},
        {tags={"Ember",},text={"*Fixed Ember%'s Fireblast not affecting flying enemies"}},
        {tags={},text={"*Added Referral Program link to Contacts overlay"}},
        {tags={""},text={"<%br/>"}},
        {tags={"UI",},text={"Update: Recruit Ninjas button now links to correct URL."}},
},--fixes end

},--update end
{
["update number"]={"10.1.2"},
["type"]={"fix"},
["date"]={"September 24th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/112656-hotfix-1012/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"Vor",},text={"* Fixed Vor becoming permanently invincible during boss fight"}},
        {tags={"Torid","Serration",},text={"* Fixed Serration mod not affecting Torid damage"}},
        {tags={"Mobile Defense",},text={"* Fixed Mobile Defense cryopod becoming invulnerable after host migration"}},
        {tags={"Phorid","Pickups",},text={"* Adjusted Phorid%'s drop rate chances to match other bosses"}},
        {tags={"Sentinel","Carrier","Djinn",},text={"* Fixed emblem positions on Carrier and Djinn Sentinels"}},
        {tags={},text={"* Reworked chat server authentication protocols"}},
},--fixes end

},--update end
{
["update number"]={"10.1.1"},
["type"]={"fix"},
["date"]={"September 23rd, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/112182-update-1011/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"Clan",},text={"* Fixed unresponsiveness that could occur when returning to the main menu from a mission/dojo."}},
        {tags={},text={"* Fixed DirectX11 being disabled in the launcher if you went to the settings panel before DirectX11 had been auto-detected."}},
        {tags={},text={"* Fixed enemies sometimes not playing their death animations/ragdolling."}},
        {tags={"Mag","Prime",},text={"* Fixed misaligned emblems for Mag Prime."}},
        {tags={},text={"* Fixed quantities of some equipped gear items increasing after host migration occurs."}},
},--fixes end

},--update end
{
["update number"]={"10.1"},
["date"]={"September 20th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/110525-update-1010/"},
["title"]={""},
["image"]={""},
["additions"]={
        {tags={"Conclave",},text={"*Added new conclave for 1500-2500."}},
        {tags={"Void",},text={"*Gave all players playing since update 10 a free 50 platinum and 1 Mutagen Mass to make up for the incorrect void rewards system."}},
},--additions end
["changes"]={
        {tags={"Void",},text={"*End-of-mission Orokin Void Rewards have been properly rectified."}},
        {tags={"Dual Ichor","Embolist","Synapse","Djinn",},text={"*Resource requirement changes for:"}},
        {tags={"Dual Ichor",},text={"**Dual Ichors:"}},
        {tags={"Dual Ichor",},text={"***Mutagen: 10 to 4"}},
        {tags={"Dual Ichor",},text={"***Forma: 2 to 1"}},
        {tags={"Embolist",},text={"**Embolist:"}},
        {tags={"Embolist",},text={"***Mutagen: 7 to 5"}},
        {tags={"Embolist",},text={"***Forma: 2 to 1"}},
        {tags={"Synapse",},text={"**Synapse:"}},
        {tags={"Synapse",},text={"***Mutagen: 11 to 5"}},
        {tags={"Synapse",},text={"***Forma 3 to 2"}},
        {tags={"Djinn",},text={"**Djinn:"}},
        {tags={"Djinn",},text={"***Mutagen: 15 to 6"}},
        {tags={"Djinn",},text={"***Forma: 3 to 2"}},
        {tags={},text={" "}},
        {tags={"Derelict",},text={"*Derelict keys: "}},
        {tags={"Derelict",},text={"**Into the Derelict: 1 hour to 1 minute."}},
        {tags={"Derelict",},text={"**Into the Assassination mission aka Boss Fight: 3 hours to 1 hour"}},
},--changes end
["fixes"]={
        {tags={"Vauban",},text={"*Fixed Bastille affecting fewer targets than expected when immune enemies (turrets, cameras, drones) are nearby"}},
        {tags={"Miter",},text={"*Fix for Miter not taking energy color attributes."}},
        {tags={"Conclave","Pickups",},text={"*Fix for pickups not working in Conclave. "}},
        {tags={"Dethcube","Conclave","Vaporize",},text={"*Fix for crash that would occur if Dethcube vaporizes opponent in the Conclaves."}},
},--fixes end

},--update end
{
["update number"]={"10.0.7"},
["type"]={"fix"},
["date"]={"September 19th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/110005-hotfix-1007/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"Fusion","Fusion Core",},text={"*Fix for Unranked Fusion Cores being offered as a mission reward."}},
        {tags={},text={"*Fix for motion blur in Syandana."}},
        {tags={"Inventory",},text={"*Fix for Gear Blueprints being sold for more credits than they cost."}},
        {tags={"UI",},text={"*Fix for crash that could occur when viewing Arsenal while mission is starting."}},
        {tags={},text={"*Fix for Turkish Players unable to join in-progress missions."}},
},--fixes end

},--update end
{
["update number"]={"10.0.6"},
["type"]={"fix"},
["date"]={"September 18th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/109386-hotfix-1005-hotfix-1006/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"UI",},text={"*Fixed News & Alerts panel disappearing randomly while traversing the UI (and actually fixed in 10.0.6)"}},
},--fixes end

},--update end
{
["update number"]={"10.0.5"},
["type"]={"fix"},
["date"]={"September 18th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/109386-hotfix-1005-hotfix-1006/"},
["title"]={""},
["image"]={""},
["additions"]={
},--additions end
["fixes"]={
        {tags={"Survival",},text={"*Fixed clients receiving bottom-tiered rewards from Survival missions"}},
        {tags={"Consumables",},text={"*Reduced cost of Team Totem blueprints, also changed resource requirements to Ferrite and Salvage only"}},
        {tags={"Clan","Consumables",},text={"*Reduced crafting costs of Clan Tech items: Heal, Ammo, Shield, and Energy now 500cr"}},
        {tags={"Clan",},text={"*Fixed room prerequistites not being checked when attempting to construct new dojo rooms"}},
        {tags={"Nekros",},text={"*Fixed %'power in use%' bug that could occur when using Desecrate"}},
        {tags={"Sentinel","Inventory",},text={"*Added prevention for unintentionally selling last remaining sentinel weapon"}},
        {tags={"Ember",},text={"*Fixed damage numbers not appearing for Overheat"}},
        {tags={"Quick Return","Rebound",},text={"*Fixed names for Rebound and Quick Return mods being switched"}},
},--fixes end

},--update end
{
["update number"]={"10.0.4"},
["type"]={"fix"},
["date"]={"September 17th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/108751-hotfix-1004/"},
["title"]={""},
["image"]={""},
["additions"]={
        {tags={"Conclave",},text={"*Added Conclaves for 500-1000 and 1000-1500 ratings."}},
        {tags={"UI",},text={"*Added XP progress bar to Arsenal UI."}},
},--additions end
["changes"]={
        {tags={},text={"*Weekly Leaderboards have been manually reset to start anew. They will continue to reset weekly automatically henceforth."}},
        {tags={"Mag","Survival","Void","Prime","Ciphers",},text={"*Changes to Void Reward distribution for Mag Prime, removed ciphers from all survival rewards."}},
        {tags={"Lotus",},text={"*Lotus Transmission captioning is no longer “ALL CAPS”. She isn’t yelling at you.. yet."}},
        {tags={"Dakra Prime","Prime",},text={"*Dakka Prime is now called Dakra Prime."}},
        {tags={"Derelict","Pickups",},text={"*Replaced Orokin Loot crates in the Derelcits with their own “Derelicted” versions and added more."}},
        {tags={"Conclave","Mods",},text={"*Added Conclave rating to Mod Cards."}},
        {tags={"Survival","Grineer Settlement",},text={"*Grineer Settlement Survival missions now use correct Grineer enemies against the Tenno."}},
        {tags={"Lephantis",},text={"*The J-2000 Golem is now known as “Lephantis”."}},
        {tags={"Lephantis",},text={"*Lephantis (Golem) now has an increased damage radius of grenade and gun attacks as well as reduced max incoming damage per second with a slight bump to health."}},
        {tags={"Lephantis",},text={"*Increased Lephantis%'s (Golem) damage output for head and body attacks."}},
        {tags={"Dera",},text={"*Changes to Dera Rifle firing sounds."}},
        {tags={"Djinn",},text={"*Sound changes to Djinn’s abilities."}},
        {tags={"Runner",},text={"*Tweaks to Infested Runner’s claw attack sounds."}},
        {tags={},text={"*Slide attack no longer takes precedence over a charged melee attack."}},
        {tags={},text={"*Removing physics from small bushes, moss decals and alike."}},
        {tags={},text={"*Tweak to enemy ragdolling to ensure matching on host and clients when enemy enters ragdoll state."}},
        {tags={},text={"*Tweaks to text fitting in areas."}},
        {tags={"Defense","Void",},text={"*Tweaks to Orokin Defense Lasers: removed charge up effects and nudged beams a bit."}},
        {tags={"Derelict",},text={"*Adding blocking volumes to bottom push back area, preventing players from getting stuck in Orokin Derelict loot Room."}},
        {tags={"UI",},text={"*Fix for invisible buttons being accessible in UI."}},
        {tags={"Void","Derelict",},text={"*Orokin exploding barrels now look different!"}},
        {tags={"Crawler",},text={"*Crawler fire-death animation hooked up."}},
        {tags={"UI",},text={"*Better indication of selected items in arsenal"}},
        {tags={"Survival",},text={"*Added sound effect to survival artifacts."}},
        {tags={"UI",},text={"*Less Opaque UI background."}},
        {tags={"Clan","Research",},text={"*Adjustments to Credit Price of replicating Bio Blueprints (150,000 to 50,000)."}},
},--changes end
["fixes"]={
        {tags={"Derelict",},text={"*Fixed players being blocked by invisible collision in derelict"}},
        {tags={"Maneuvers",},text={"*Fix for toggle sprinting and aiming getting in the way of each other."}},
        {tags={"Alert",},text={"*Fix for Alerts not properly appearing in Game UI."}},
        {tags={},text={"*Fix for Stamina not being depleted on Clients for Stamina-based actions."}},
        {tags={"UI",},text={"*Fix for Play Now button being accessible when it shouldn’t."}},
        {tags={},text={"*Fix for Uru Syandana not being color customizable. "}},
        {tags={"UI",},text={"*Fix for using chat while in a non-star node (Keys) lobby will prevent the appearance of the “Play Now” button."}},
        {tags={"Lephantis",},text={"*Fix for clients sometimes not being able to damage Golem."}},
        {tags={"Survival",},text={"*Fix for no enemies spawning in Survival missions after host migration."}},
        {tags={"UI",},text={"*Fix for German localizations."}},
        {tags={"Duel","Clan","Death",},text={"*Fix for Clan Dojo dueling not allowing players to revive."}},
        {tags={"Alert","UI",},text={"*Fix for tooltip descriptions not appearing when hovering over alert reward items."}},
        {tags={"Trinity","Survival",},text={"*Fix for Trinity’s Well of Life causing shields to increase exponentially during Survival missions."}},
        {tags={"Sure Footed",},text={"*Fix for Sure-Footed mod not working on Clients."}},
        {tags={"Nekros","Roller",},text={"*Fixed Shadows of the Dead power in use bug when used to revive/resurrect Grineer rollers (possibly other enemies as well)."}},
        {tags={"Ash",},text={"*Fix for player can get caught in falling loop with teleport."}},
        {tags={},text={"*Fix for branch clipping through floor in levels."}},
        {tags={},text={"*Fix for hand clipping into leg."}},
        {tags={"Clan","Research","UI",},text={"*Fix for image preview on Clan research."}},
        {tags={},text={"*Fixed stealth challenge completing on being spotted in third phase."}},
        {tags={"Survival",},text={"*Fix for rare cases where an alarm panel outside of the spawn would be enabled instead of the one in the spawn room, added log message for final score, changed how health drain works."}},
        {tags={"Clan",},text={"*Fix for dojo test Stealth Challenge not spawning enemies."}},
        {tags={"Defense",},text={"*Fix for player loses rewards in key accessed defense missions if they do not claim and exit with host. Allow for migration if it%'s a defense mission, even if it requires a key"}},
        {tags={"Void",},text={"*Fix for enemies not proceeding though some doors in Orokin level."}},
},--fixes end

},--update end
{
["update number"]={"10.0.3"},
["type"]={"fix"},
["date"]={"September 14th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/106722-hotfix-1003/"},
["title"]={""},
["image"]={""},
["changes"]={
        {tags={"Ignis",},text={"*Ignis Buffs"}},
        {tags={"Ignis",},text={"**Longer range"}},
        {tags={"Ignis",},text={"**More damage"}},
        {tags={"Ignis",},text={"**Bigger AOE effect."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Maneuvers",},text={"*Stamina System tweaks:"}},
        {tags={"Maneuvers",},text={"**Reduced delay on stamina recharge."}},
        {tags={"Maneuvers",},text={"**Increased stamina recharge rate."}},
        {tags={"Maneuvers",},text={"**Decreased cost of stamina required for sprinting."}},
        {tags={"Maneuvers",},text={"**Dodging now uses stamina and has reduced damage while dodging"}},
        {tags={"Maneuvers",},text={"**Dodges are executed slightly faster."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fix for bug where %'Buy Slots%' would appear in gear menu after being sold."}},
        {tags={"Void","Derelict","Pickups",},text={"*Fix for resources not dropping from The Void or Derelict Regions (this includes Mutagen)."}},
        {tags={},text={"*Fix for Orokin Glass not being reflective."}},
        {tags={"Mods",},text={"*Fix for Metallic look of Mod frames/borders."}},
        {tags={"Derelict",},text={"*Fixed doors shutting down on players once they failed challenge in Orokin Derelicts."}},
        {tags={"Derelict",},text={"*Fixed gap in Orokin Derelict level."}},
        {tags={},text={"*Fixed clients not being able to see generator hallway effects."}},
},--fixes end

},--update end
{
["update number"]={"10.0.2"},
["type"]={"fix"},
["date"]={"September 14th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/106032-hotfix-1002/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={"Derelict","Foundry",},text={"*Further reductions to Orokin Derelict recipes."}},
        {tags={"UI",},text={"*Added Charge attack melee stats to UI."}},
},--fixes end

},--update end
{
["update number"]={"10.0.1"},
["type"]={"fix"},
["date"]={"September 14th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/105954-hotfix-1001/"},
["title"]={""},
["image"]={""},
["fixes"]={
        {tags={"Grakata",},text={"*%[%[Grakata%]%] critical rate buff."}},
        {tags={"Soma","Kama","UI",},text={"*Added proper BP icons for %[%[Kama%]%] and %[%[Soma%]%]."}},
        {tags={"Research",},text={"*Fix for missing Bio Lab research component."}},
        {tags={"Derelict",},text={"*Adjustments to Derelict Key recipes: lowered build times and adjusted resource requirements. (Note: Blueprints currently in progress will experience a UI bug with negative percentage.)"}},
        {tags={"UI",},text={"*Fix for certain Asian languages text not appearing."}},
        {tags={"Sentinel","Conclave",},text={"*Fix for sentinels attacking owner in The Conclave."}},
        {tags={"Banshee",},text={"*Fix for stumbles in %[%[Sound Quake%]%]."}},
        {tags={},text={"*Fix for broken texture in connector."}},
        {tags={"Saryn",},text={"*Fix for %[%[Miasma%]%] not dealing correct damage."}},
},--fixes end

},--update end
{
["update number"]={"10.0"},
["image"]={"Update10official840x400fb.jpg"},
["date"]={"September 13th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/105648-update-10-shadows-of-the-dead/"},
["title"]={"Shadows of the Dead"},
["additions"]={
        {tags={"Mag","Prime","Nekros",},text={"*%[%[Warframes%]%]: "}},
        {tags={"Mag","Prime",},text={"**%[%[Mag|Mag Prime%]%] has arrived as the first Female Prime Frame. "}},
        {tags={"Nekros",},text={"**%[%[Nekros%]%] Find him today by destroying the new Golem in the Orokin Derelicts, or through the Market!"}},
        {tags={},text={"Find his alternate “%[%[Raknis_Nekros_Helmet|Raknis%]%]” alternate helmet in the Market or Alerts! ."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%[%[file:NekrosAraknidHelmet.png|link=Raknis Nekros Helmet|150px%]%]%[%[file:Nekros.png|link=Nekros|150px%]%]%[%[file:NekrosPack.png|link=Avatar Pack|150px%]%]"}},
        {tags={""},text={"<%br/>"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Finishing Touch","Berserker","Whirlwind","Power Throw","Rebound","Quick Return","Spare Parts","Fired Up","Reflex Guard","Parry","Reflection","Provoked","Intruder","Stabilizer","Hush","Steady Hands","Suppress","Speed Holster",},text={"*New %[%[Mods%]%]!"}},
        {tags={},text={"**%[%[Second Wind%]%] (Melee) mod – Melee kills restore Stamina"}},
        {tags={"Finishing Touch",},text={"**%[%[Finishing Touch%]%] (Melee) mod – Increased Damage to knockdown enemies"}},
        {tags={"Berserker",},text={"**%[%[Berserker%]%] (Melee) mod – Landing a critical hit will temporarily increase fire rate"}},
        {tags={"Whirlwind",},text={"**%[%[Whirlwind%]%] (Glaive) mod – Increases flight speed"}},
        {tags={"Power Throw",},text={"**%[%[Power Throw%]%] (Glaive) mod – puncture (Dark Sector fans, this one’s for you)"}},
        {tags={"Rebound",},text={"**%[%[Rebound%]%] (Glaive) mod – increases number of bounces before returning"}},
        {tags={"Quick Return",},text={"**%[%[Quick Return%]%] (Glaive) mod – decreases number of bounces before returning"}},
        {tags={"Spare Parts",},text={"**%[%[Spare Parts%]%] (Sentinel) mod – chance to spawn a rare resource on death"}},
        {tags={"Fired Up",},text={"**%[%[Fired Up%]%] (Sentinel) mod - the longer a sentinel fires the more fire damage is added to his attacks"}},
        {tags={"Reflex Guard",},text={"**%[%[Reflex Guard%]%] (Warframe) mod – chance for your Warframe to auto-block incoming damage"}},
        {tags={"Parry",},text={"**%[%[Parry%]%] (Warframe) mod - blocking a melee enemy will cause a knock back, fusion increases % chance"}},
        {tags={"Reflection",},text={"**%[%[Reflection%]%] (Warframe) mod – blocking with melee deflects % of damage back at attacker"}},
        {tags={},text={"**%[%[Shield Flux%]%] (Warframe) mod - after stamina is consumed your shields will be used a second stamina bar"}},
        {tags={"Provoked",},text={"**%[%[Provoked%]%] (Warframe) mod - % damage increase while in the downed/bleed out state."}},
        {tags={"Intruder",},text={"**%[%[Intruder%]%] (Warframe) mod – increases time limit for hacking security consoles"}},
        {tags={"Stabilizer",},text={"**%[%[Stabilizer%]%] (Primary) mod – rifle recoil reduction"}},
        {tags={"Hush",},text={"**%[%[Hush%]%] (Primary) mod – noise reduction on rifles, decreased enemy awareness"}},
        {tags={"Steady Hands",},text={"**%[%[Steady Hands%]%] (Secondary) mod – pistol recoil reduction"}},
        {tags={"Suppress",},text={"**%[%[Suppress%]%] (Secondary) mod – noise reduction on pistols, decreased enemy awareness"}},
        {tags={"Speed Holster",},text={"**%[%[Speed Holster%]%] (Aura) mod – increases weapon switching speed for entire squad"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Survival",},text={"*Survival Missions Return!"}},
        {tags={"Survival",},text={":%[%[Survival%]%] missions are here to stay and can be played by choosing Survival Missions on the Starchart. Our Survival weekend gave the team some early feedback on playability and difficulty, and our new Survival missions are ready for your Warframes! Survival missions will get more challenging the further you travel through the solar system. Expect to face lower level enemies closer to the sun, and higher level enemies as you reach the outer planets."}},
        {tags={"Survival",},text={":The enemies you face will be prepared to take on the strongest Tenno – the longer you play, the higher the stakes!"}},
        {tags={"Survival",},text={"<%br/>"}},
        {tags={"Survival",},text={"::%'%'%'Notes:%'%'%'"}},
        {tags={"Survival",},text={":::Survival now takes place in procedurally generated levels, allowing greater mission variety, challenge, and replayability."}},
        {tags={"Survival",},text={":::Weekly leaderboards are now live for all survival missions on the Starchart!"}},
        {tags={"Survival",},text={":::All Raid Void Keys have been retroactively replaced with Survival missions."}},
        {tags={"Survival",},text={":::A handful of our new mods can be found by playing Survival missions, good luck!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Conclave","Duel","Clan","Star Chart",},text={"*The %[%[Conclave%]%]"}},
        {tags={"Duel","Clan",},text={":Dueling is no longer restricted to clans!"}},
        {tags={"Star Chart","Conclave",},text={":An ancient Tenno tradition has reemerged; THE CONCLAVES have started appearing throughout the Solar Map. Here the Tenno meet in secret to challenge each another in honorable combat. 1v1 and 2v2 Conclaves have been added through the Solar Map. Are you ready to test your skills?"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Derelict",},text={"*New Level Sets: %[%[Orokin Derelict|Orokin Derelict Spacecrafts%]%]"}},
        {tags={"Derelict",},text={"What happened to the Orokin places that did not get hidden in the Void? Search the solar system for co-ordinate crafting components in loot containers to locate the mysterious Orokin Derelicts."}},
        {tags={""},text={"<%br/>"}},
        {tags={"Sentinel","Carrier","Djinn",},text={"*New Sentinels!"}},
        {tags={"Sentinel","Carrier",},text={"**%[%[Carrier%]%] a Sentinel with the ability to collect your loot for you!"}},
        {tags={"Sentinel","Djinn",},text={"** Craft %'%[%[Djinn%]%]%', an Infested Sentinel found in Clan Research!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Sentinel",},text={"*New Sentinel Cosmetics!"}},
        {tags={"Sentinel",},text={"**%[%[Sentinel_Cosmetics|Infested Mask%]%] "}},
        {tags={"Sentinel",},text={"**%[%[Sentinel_Cosmetics|Infested Tail%]%] "}},
        {tags={"Sentinel",},text={"**%[%[Sentinel_Cosmetics|Infested Wings%]%] "}},
        {tags={},text={"%[%[file:PetDjinn.png|link=Djinn|120px%]%]"}},
        {tags={},text={"%[%[file:PetCarrier.png|link=Carrier|120px%]%] %[%[file:PetInfestedMask.png|link=Sentinel_Cosmetics|120px%]%] %[%[file:PetInfestedTail.png|link=Sentinel_Cosmetics|120px%]%] %[%[file:PetInfestedWings.png|link=Sentinel_Cosmetics|120px%]%]"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Lephantis",},text={"*New boss: Infested %[%[Lephantis|J-2000 Golem%]%]"}},
        {tags={"Lephantis",},text={"Lurking in the very depths of %[%[Orokin Derelict%]%]s is the Golem. Find his coordinates within the Derelicts today!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Phobos","Grineer Settlement",},text={"*Level Expansion - %[%[Grineer Settlement%]%]"}},
        {tags={"Phobos","Grineer Settlement",},text={"More tiles added to the Grineer Settlement maps on %[%[Phobos%]%]!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Soma","Ether Reaper","Kama","Boar Prime","Dakra Prime","Void","Prime",},text={"*New Weapons!"}},
        {tags={"Soma","Ether Reaper","Kama",},text={"**%[%[Ether Reaper%]%], %[%[Soma%]%] (a new Tenno Assault Rifle), and the %[%[Kama%]%], are in the marketplace for Tenno!"}},
        {tags={"Boar Prime","Dakra Prime","Void","Prime",},text={"**The %[%[Boar Prime%]%] and %[%[Dakra Prime|Dakka Prime%]%] are ready for discovery in the %[%[Orokin Void|Void%]%]!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan","Research","Synapse","Embolist","Dual Ichor",},text={"*New Clan weapons!"}},
        {tags={"Synapse","Embolist","Dual Ichor","Derelict","Clan",},text={"**Infested Primary, Secondary, and Melee weapons are now in Clan %[%[Research|research%]%]! Find the new Infested crafting component in the Derelicts. %[%[Synapse%]%], %[%[Embolist%]%], %[%[Dual Ichor%]%]."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%[%[file:PrimeBoar.png|link=Boar Prime|72px%]%] %[%[file:WraithStrun.png|link=Strun Wraith|72px%]%] %[%[file:SwordPrime.png|link=Dakra Prime|72px%]%] %[%[file:DualVasto.png|link=Dual Vasto|72px%]%] %[%[file:U10DesignCouncilTennoAR.png|link=Soma|72px%]%] %[%[file:EtherScythe.png|link=Ether Reaper|72px%]%] %[%[file:U10InfPrimary.png|link=Synapse|72px%]%] %[%[file:InfestedPistol.png|link=Embolist|72px%]%] %[%[file:DualInfestedAxes.png|link=Dual Ichor|72px%]%]"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"*New Customization Options: Fancy a Scarf, Tenno? The %[%[Market%]%] holds the latest in Warframe Customization: the %[%[Warframe_Cosmetics#Syandanas|SYANDANA%]%]!"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan",},text={"*%[%[Clan Dojo%]%] Level update/props:"}},
        {tags={"Clan",},text={"**Zen Garden vanity room"}},
        {tags={"Clan",},text={"**17x Zen Garden decorations"}},
        {tags={"Clan",},text={"**8x Taiko drums decorations %[%https://forums.warframe.com/topic/105649-taiko-drums-band-practice/ forum post%]"}},
        {tags={"Clan",},text={"**5x Bronze statues"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"*All %[%[Grineer%]%] now speak “Grineer”, a language capable of communicating their barbaric ways!"}},
        {tags={"Lotus",},text={"*You can now control the Lotus’s dialog volume!"}},
        {tags={"Star Chart",},text={"*Added all new Solar Landmarks from latest batch of Grandmasters."}},
        {tags={},text={"*Added all-new Male and Female Grineer combat VO!"}},
        {tags={},text={"*Added new option for new experimental Multi-Threaded Rendering in Launcher Settings!"}},
        {tags={},text={"NOTE: Tenno, this is an experimental option we have introduced with the goal to improve performance on multi-core machines. Let us know if you notice higher frame-rates with this option! This option may not be for everyone, disable it if you encounter problems!"}},
},--additions end
["changes"]={
        {tags={"UI",},text={"*Arsenal and Inventory screen UI overhaul! Explore the latest revision to the Warframe UI!"}},
        {tags={},text={"*Stamina:"}},
        {tags={"Maneuvers",},text={"**%[%[Combat Maneuvers|Stamina%]%] system now has a timer before it recharges. This makes Stamina a more significant system in game play."}},
        {tags={"Maneuvers",},text={"**Reduced Stamina cost of melee swings and jumping"}},
        {tags={"Maneuvers",},text={"**Reduced the rate of stamina recharge"}},
        {tags={"Sentinel",},text={"*Sentinels can now wield any (primary/secondary?) weapon you want!"}},
        {tags={"Survival",},text={"*%[%[Raid%]%] missions are no longer available and have been replaced with Survival mission types."}},
        {tags={"Conclave",},text={"*Added initial PvP values to all Warframes, Weapons, and Mods."}},
        {tags={"Ogris",},text={"*%[%[Ogris%]%] charge FX revised, toned down."}},
        {tags={},text={"*Swapped the descriptions of Neurodes and Neural Sensors."}},
        {tags={"Crawlers",},text={"*%[%[Infested%]%] Crawlers (all types) have new movement, death, and attack animations."}},
        {tags={"Orthos Prime","Prime",},text={"*Added missing elemental FX to %[%[Orthos Prime%]%]."}},
        {tags={"Ash","Banshee","Mag","Nyx","Volt",},text={"*Added idle FX to %[%[Ash%]%], %[%[Banshee%]%], %[%[Mag%]%], %[%[Nyx%]%], and %[%[Volt%]%]."}},
        {tags={"Sentinel",},text={"*Sentinel Weapons no longer locked to the Sentinel bundled with at purchase."}},
        {tags={"Excalibur","Trinity",},text={"*New ability icons for %[%[Trinity%]%] (was using Excalibur icons)."}},
        {tags={},text={"*Mission Success/Failure music now ducks all other music."}},
        {tags={},text={"*Added delay timer to Stamina recharge."}},
        {tags={"HUD","UI",},text={"*Added a new icon for the Extraction Marker."}},
        {tags={"Maneuvers",},text={"*Smaller radius and volumetrics for zipline sounds."}},
        {tags={},text={"*More audio updates for Warframe idles."}},
},--changes end
["fixes"]={
        {tags={"UI",},text={"*Fix for players exiting lobby when trying to dismiss friends list."}},
        {tags={"Grineer Galleon",},text={"*Fixed issue where Corpus alarm sound was being used in %[%[Grineer Galleon%]%]."}},
        {tags={},text={"*Fixed issue where Warframe landing sounds would play twice."}},
        {tags={},text={"*Fixed Master Volume setting that was set to 0 by default."}},
        {tags={},text={"*Fixed %[%[Grineer%]%] voiceboxes that occurred in %[%[Corpus%]%] levels."}},
        {tags={"Ember",},text={"*Fixed inconsistent damage on host and client for %[%[Ember%]%]’s World on Fire ability."}},
        {tags={},text={"*Prevent certain cloned enemies from using their abilities (specifically abilities that spawn other enemies)."}},
        {tags={"Ember",},text={"*Fixed Ember’s Fire Blast ability where FX would remain if caster respawned or left the game."}},
        {tags={"Trinity",},text={"*Fixed Trinity’s Link ability that was targeting closed turrets and security cameras."}},
        {tags={"Banshee",},text={"*Fixed Banshee%'s Sonar ability not applying damage multipliers to shields."}},
        {tags={"Frost","Volt","Miter",},text={"*Fixed %[%[Miter%]%] disk projectile to behave like other projectiles that pass through Volt’s Shield and %[%[Frost%]%]’s Snowglobe."}},
        {tags={},text={"*Fixed an issue in the Tutorial where players could not progress past melee stage."}},
        {tags={"Clan",},text={"*Fixed issue where %[%[Clan%]%]s could not destroy the Oracle room."}},
        {tags={},text={"*Fixed broken %[%[Bosses|Boss%]%] transmissions."}},
        {tags={"Lotus",},text={"*Fixed the Lotus %'not detected%' transmission playing at level start."}},
        {tags={},text={"*Fixed reported broken wrist and elbow animations."}},
        {tags={"Defense","UI",},text={"*Fixed defense leaderboards tracking of time elapsed so that it isn%'t lost after host migration."}},
        {tags={"UI",},text={"*Fixed beam weapon critical hits not being clearly conveyed to the player."}},
        {tags={"Shade","Ghost",},text={"*Fixed %[%[Shade%]%]%'s Ghost Ability (and other invisibility Abilities) granting the cloaked player invincibility"}},
        {tags={"Corpus Outpost",},text={"*Fixed some AI navigation issues occurring in %[%[Corpus Outpost%]%]."}},
        {tags={},text={"*Fixed various crashes and hangs reported by players."}},
},--fixes end

},--update end

}
return PatchData
```

