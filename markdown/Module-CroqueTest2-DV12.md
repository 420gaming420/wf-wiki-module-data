---
title: "Module:CroqueTest2/DV12"
wiki_url: "https://wiki.warframe.com/w/Module/CroqueTest2/DV12"
wiki_timestamp: "2018-05-02T16:17:52Z"
---

*Documentation for this module may be created at [Module:CroqueTest2/DV12/doc](/w/Module:CroqueTest2/DV12/doc?action=edit&redlink=1 "Module:CroqueTest2/DV12/doc (page does not exist)")*

```lua
local PatchData =
{
{
["update number"]={"12.6.1"},
["type"]={"fix"},
["date"]={"March 26th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/201557-hotfix-1261/"},
["fixes"]={
        {tags={"Excalibur",},text={"*Fixed missing head on Excalibur when swapping out Proto Armor skin."}},
        {tags={"Market","Oxium",},text={"*Fixed issue where 1 Oxium was being sold for 10 Platinum, correct Market Price is 30 Platinum for 300 Oxium."}},
},--fixes end

},--update end
{
["update number"]={"12.6"},
["date"]={"March 26th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/201473-update-1260-dex-furis-limited-time-gift"},
["title"]={"%'%'%'First Anniversary Edition%'%'%'<%br>Tenno Reinforcements: Dex Furis"},
["image"]={"12.6poster.png"},
["misc"]={
        {tags={},text={"%'%'%'New Limited Edition Gear%'%'%':"}},
        {tags={"Dex Furis","Dex",},text={"*Dex Furis*: A FREE birthday weapon to celebrate Warframe’s 1 year Open Beta! Login to Warframe before April 2nd @ 11:59 PM EDT to receive this free gift!"}},
        {tags={"Excalibur",},text={"*New Excalibur-Proto Armor skin! For 7 days only, you can add Excalibur-Proto armor to your Cosmetic collection.<%br>(NOTE: Both of these will be offered on PS4 with the next content update.)"}},
},--misc end
["changes"]={
        {tags={"Foundry",},text={"*Added Gear and Key categories to the Foundry."}},
        {tags={"Market","Oxium",},text={"*Added the ability to purchase Oxium through the Market."}},
        {tags={"Torid","Clan",},text={"*The Torid has received a total visual overhaul - check out the new model in your Arsenal/dojo today!"}},
        {tags={"Excalibur","Stalker","Fusion Core",},text={"*Removed Slash Dash from Stalker’s drops and replaced with Rare Fusion Core."}},
        {tags={"Sentinel","Mods","Eagle Eye","Hawk Eye","Reach",},text={"*Made weapon zoom mods (Eagle Eye and Hawk Eye) and melee range mods (Reach) increase Sentinel targeting range."}},
        {tags={"Hunt","Looter",},text={"*Increased the amount of affinity awarded for completed in-game Challenges. More difficult Challenges get 5000 Affinity, whereas the easier challenges (Hacker, Exercising Power, Uber, Treasure Hunter, Looter) get 1000 Affinity. The UI will indicate the Affinity reward upon challenge completion. Affinity Boosters apply to this reward."}},
        {tags={"Pickups",},text={"*XP gained through Affinity Orbs and Challenge XP will now work the same way as XP shared from teammate kills:"}},
        {tags={},text={"**25PERZENTO to Frame"}},
        {tags={},text={"**25PERZENTO to Primary Weapon"}},
        {tags={},text={"**25PERZENTO to Secondary Weapon"}},
        {tags={"Sentinel",},text={"**25PERZENTO to Melee weapon<%br>An additional copy of this XP will also be split between your equipped Sentinel and Sentinel Weapon<%br>Note: this does not change regular XP earned from kills"}},
        {tags={},text={"<%div class=%'mw-collapsible mw-collapsed%'>"}},
        {tags={"Sentinel",},text={"*Reference on existing Sentinel targeting ranges:"}},
        {tags={},text={"**The targeting range for the attack precepts at max-rank are as follows:{{clr}}"}},
        {tags={},text={"<%div class=%'mw-collapsible-content%'>"}},
        {tags={"Carrier","Carrier",},text={"*Carrier: 10m"}},
        {tags={"Dethcube",},text={"*DethCube: 30m"}},
        {tags={"Djinn",},text={"*Djinn: 60m"}},
        {tags={"Wyrm",},text={"*Wyrm: 30m"}},
        {tags={"Shade",},text={"*Shade: 30m"}},
        {tags={"Glaive","Helios","Targeting Receptor",},text={"(Unranked attack precepts will have half the range listed above).<%br>Helios is special at does not increase with rank (it is always 10m) however ranking up the Targeting Receptor precept increase the number of active glaives it can manage."}},
        {tags={},text={"<%/div>"}},
        {tags={},text={"<%/div>"}},
        {tags={"Nyx",},text={"*Added a HUD damage counter and countdown timer to Nyx%'s Absorb ability."}},
        {tags={"Void",},text={"*Improved Void performance related to Laser traps."}},
        {tags={},text={"*Various performance improvements with objects in levels."}},
},--changes end
["fixes"]={
        {tags={"Nyx",},text={"*Fixed projectiles passing through Nyx%'s Absorb ability."}},
        {tags={"Sentinel","Helios","Deconstructor","Mods",},text={"*Fixed the damage type on the Deconstructor (Helios) Sentinel weapon so as to allow Melee mods to properly affect its stats"}},
        {tags={"Grineer Galleon",},text={"*Fixed some visible environment clipping in the Grineer Galleon tileset."}},
        {tags={"Nova",},text={"*Fixed a potential crash related to the usage of Nova%'s Wormhole ability."}},
        {tags={"Stalker",},text={"*Fixed an issue with the Stalker%'s health not properly scaling to player level. Prior to this, Stalker had perpetual 450 health due to a bug. He will now scale properly; beware Tenno."}},
        {tags={},text={"*Fixed users being unable to properly join certain chat channels."}},
        {tags={},text={"*Fixed various crashes."}},
},--fixes end

},--update end
{
["update number"]={"12.5.3"},
["type"]={"fix"},
["date"]={"March 24th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/200550-hotfix-1253/"},
["fixes"]={
        {tags={},text={"*Fixed an instance of player%'s not gaining mission completion rewards."}},
        {tags={"Castanas",},text={"*Fixed a duplicate flashlight being present on the Castanas."}},
        {tags={"Grustrag Three",},text={"*Fixed an issue related to the Grustrag Three crashing/hanging the game when all squad members are killed."}},
},--fixes end

},--update end
{
["update number"]={"12.5.2"},
["type"]={"fix"},
["date"]={"March 21st, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/199117-hotfix-1252/"},
["fixes"]={
        {tags={"Derelict",},text={"*Fixed players not being able to exit Orokin Derelict Vaults due to invisible walls."}},
        {tags={"Mods",},text={"*Fixed unranked Mods not appearing in Codex."}},
        {tags={"Mods",},text={"*Fixed UI error when accessing the Codex screen without any mods in your collection."}},
        {tags={"Arc Trap",},text={"*Fixed Arc Traps sometimes appearing in the opening room of a mission."}},
        {tags={"Grustrag Three",},text={"*Fixed a crash that could occur when defeating the Grustrag Three."}},
},--fixes end

},--update end
{
["update number"]={"12.5.1"},
["type"]={"fix"},
["date"]={"March 19th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/198348-hotfix-1251/"},
["fixes"]={
        {tags={"Arc Trap",},text={"*Fixed issues with Arc Traps appearing inside of other ‘destructibles’ on floor – Crates, Barrels, etc. They will currently only appear on walls until we can properly sort out floor spawn logic."}},
        {tags={"Arc Trap",},text={"*Fixed issues with Arc Trap dropping rare resource 100PERZENTO of time, not intended."}},
        {tags={"Banshee","Imperator",},text={"*Fixed Imperator Syandana appearing on Banshee’s waist."}},
        {tags={"Rhino","Prime",},text={"*Fixed Iron Skin appearing as keybound to “1” key power on Rhino Prime ."}},
        {tags={"Helios",},text={"*Fixed potential issues with Helios not having high resolution textures."}},
        {tags={"Sentinel",},text={"*Fixed issues with Sentinel casting/ability sounds."}},
},--fixes end

},--update end
{
["update number"]={"12.5"},
["date"]={"March 19th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/198137-update-1250-helios/"},
["title"]={"Tenno Reinforcements"},
["image"]={"Tenno Reinforcements Imperator Syandana & Helios Sentinel.png"},
["additions"]={
        {tags={"Glaive","Sentinel","Helios","Clan","Research","Market",},text={"*New Sentinel! Meet Helios, a Corpus Sentinel with a devastating Glaive-esque attack and the ability to assist you with Codex scans!<%br>Visit the Market or %'%'%'Corpus Research Room%'%'%' in the Dojo today!"}},
        {tags={"Imperator",},text={"*New Imperator Syandana"}},
},--additions end
["changes"]={
        {tags={"Market",},text={"*Retired the Shamrock Color Picker from the Market – until next time, folks!"}},
        {tags={"Sentinel",},text={"*Improvements to Sentinel audio."}},
        {tags={"Rhino","Prime",},text={"*Changed Rhino Prime%'s Iron Skin ability to now appear golden!"}},
        {tags={"Rhino",},text={"* Tweaks to the visuals of Rhino%'s abilities."}},
        {tags={},text={"*Removed intentional delay on weapon firing while running."}},
        {tags={"Death",},text={"* Limited the maximum amount of Grineer Death sounds that can be played at once."}},
        {tags={},text={"* Tweaks to Quantum Badge visuals to help improve visibility on multiple Warframes."}},
        {tags={},text={"* Waypoint markers set on enemies will no longer disappear when the enemy is knocked back or otherwise ragdolled."}},
        {tags={"Trinity",},text={"* Improved the client side visuals for the effect created when enemies are hit by Trinity%'s Energy Vampire and Well of Life abilities."}},
        {tags={"Gorgon",},text={"* Tweaks to Gorgon firing sound"}},
        {tags={},text={"*Broken Lights have now been replaced with Grineer Traps. The latest iteration of this mechanic replaces hard to spot Broken Lights with more visible Grineer Traps."}},
        {tags={},text={"**These Traps deal Damage Over Time as opposed to one pulse of damage."}},
        {tags={},text={"**These Traps can be spotted form a distance and targeted to damage nearby enemies."}},
},--changes end
["fixes"]={
        {tags={"Defense",},text={"*Fixed a number of navigation related issues with Infested on the Forest Defense Tilesets."}},
        {tags={},text={"* Fixed an issue related to client%'s attempting to attack with Dual Daggers type weapons."}},
        {tags={"Lato","Regulator",},text={"*Fixed the naming conventions for Grineer Regulators."}},
        {tags={"Lotus",},text={"*Fixed an issue with Lotus%' dialogue lines not properly matching her subtitles."}},
        {tags={"Interception",},text={"* Fixed non-localized text seen in Interception game modes."}},
        {tags={"Clan",},text={"*Fixed an instance of players getting stuck in their inbox after attempting to accept or decline a clan invitation"}},
        {tags={},text={"* Fixed players losing all experience after a Host Migration."}},
        {tags={"Death",},text={"* Fixed an issue with the Grineer Deathsquad not properly capturing players in a multiplayer match."}},
        {tags={},text={"* Fixed Saxis and Histo nodes not displaying the correct mission type."}},
        {tags={},text={"*Fixed an exploit which allowed the %'It keeps getting better%' achievement to be unlocked incorrectly."}},
        {tags={},text={"* Fixed a number of level holes and stuck spots."}},
        {tags={},text={"* Fixed a number of crashes"}},
        {tags={"Burston Prime","Prime",},text={"* Fixed the image for the Burston Prime Blueprint"}},
        {tags={"Rescue","Alert",},text={"* Fixed Rescue targets on Alert Rescue missions demonstrating older AI behaviours and lacking proper functions (health/shield UI)."}},
},--fixes end

},--update end
{
["update number"]={"12.4.6"},
["type"]={"fix"},
["date"]={"March 17th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/197103-hotfix-1246-luck-o-the-lotus/"},
["title"]={"Luck O%' The Lotus!"},
["additions"]={
        {tags={"Lotus","Pickups",},text={"*Luck o’ The Lotus: From now until Tuesday, March 18 at 12 PM EDT, you%'ll earn twice the amount of resources from pickups AND have double the chance of resource drops in missions throughout Warframe!"}},
        {tags={},text={"*%[%[Color_Picker_Extension#Shamrock|Shamrock%]%] Green Colour Palette!"}},
},--additions end
["changes"]={
        {tags={"Glaive",},text={"*Glaive FX optimizations."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed issue where Factions (Corpus/Grineer) could invade more than one planet at a time."}},
        {tags={"Sentinel",},text={"*Fixed issue where player would only see equipped Warframe stats when comparing Sentinel stats."}},
},--fixes end

},--update end
{
["update number"]={"12.4.5"},
["type"]={"fix"},
["date"]={"March 12th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/194749-hotfix-1245/"},
["additions"]={
        {tags={"Event","Cipher",},text={"*<%s>Rewards for Tethra’s Doom added to build, to be deployed shortly.<%/s> All rewards have been deployed. All leftover Tethra Event Cipher components/keys/blueprints can be sold for Credits."}},
},--additions end
["changes"]={
        {tags={"Frost",},text={"%'%'%'to Frost%'%'%' "}},
        {tags={"Frost",},text={"*Using a combination of ideas from the community and discussions between dev, Frost’s Snowglobe has changed. The changes are:"}},
        {tags={"Frost",},text={"*Snowglobe’s health is now affected by a Warframe’s Armor value."}},
        {tags={"Frost",},text={"*There is now a temporary invulnerability duration determined by the rank of a given Snowglobe Mod."}},
        {tags={"Frost",},text={"*Snowglobe’s health is increased by the amount of damage received in the “Invulnerability Duration” window."}},
        {tags={},text={"*The numerical details are as follows:"}},
        {tags={"Frost",},text={"**Unranked Snowglobe: Health = 1500 + Invulnerability Duration = 1 second"}},
        {tags={"Frost",},text={"**Rank 1 Snowglobe: Health = 2500 + Invulnerability Duration = 2 seconds"}},
        {tags={"Frost",},text={"**Rank 2 Snowglobe: Health = 3000 + Invulnerability Duration = 3 seconds"}},
        {tags={"Frost",},text={"**Rank 3 Snowglobe: Health = 3500 + Invulnerability Duration = 4 seconds"}},
        {tags={"Frost",},text={"**Snowglobe Health = Health + (Armor x 5)"}},
        {tags={},text={"**These improvements are subject to change, let us know what you think!"}},
        {tags={},text={"%'%'%'General Changes%'%'%'"}},
        {tags={"Inventory",},text={"*Selling items from the Arsenal%'s Inventory page now displays a full graphical manifest of all selected items before confirming sale."}},
        {tags={},text={"*Toned down flashing FX when light traps disintegrate in Grineer tilesets."}},
        {tags={},text={"*Reduced broken light damage by half."}},
        {tags={},text={"*Limited ability to post messages in trade chat to once every 2 minutes to reduce channel spamming."}},
        {tags={},text={"*Optimizations to Forest tileset to improve frame rate"}},
        {tags={"Zephyr",},text={"*Improved audio mixing for Zephyr%'s Turbulence."}},
},--changes end
["fixes"]={
        {tags={"Interception","Earth",},text={"*Fixed overly harsh Interception mode difficulty on Earth nodes (this was only meant to be applied to the Tethra%'s Doom mission)."}},
        {tags={"Survival","Earth",},text={"*Fixed intermittent hang when launching Survival missions on Earth ."}},
        {tags={"MOA",},text={"*Fixed clients being able to repeatedly hack Moa Cabinets to produce a flash mob of ally bipeds."}},
        {tags={"Grinlok","Castanas",},text={"*Fixed inability to fire Grinlok or throw Castanas and while sprinting."}},
        {tags={"Arena","Conclave",},text={"*Fixed clients immediately spawning in the middle of an active match when joining a Conclave arenas."}},
        {tags={"Banshee",},text={"*Fixed Banshee%'s Sonar effects lingering after enemies have been killed."}},
        {tags={"Survival",},text={"*Fixed another case where a player could become stuck in Survival mode if oxygen supply ran out while they were activating a life support capsule."}},
        {tags={"Rescue","Grineer Galleon",},text={"*Fixed Rescue missions in Grineer Galleon and Desert containing multiple hostages."}},
        {tags={"Nova","Zephyr",},text={"*Fixed issues with Nova and Zephyr ability descriptions."}},
        {tags={},text={"*Fixed gameplay crashes."}},
},--fixes end

},--update end
{
["update number"]={"12.4.4"},
["type"]={"fix"},
["date"]={"March 10th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/193552-hotfix-1244/"},
["fixes"]={
        {tags={"Hijack",},text={"*Fixed progression blocker where door could not be opened in Shipyards Hijack mission."}},
        {tags={"Grineer Galleon",},text={"*Fixed Grineer Galleon door & light traps ignoring radial damage from explosive weapons."}},
        {tags={"Survival",},text={"*Fixed clients getting stuck when activating Life Support Capsules in Survival missions"}},
},--fixes end

},--update end
{
["update number"]={"12.4.3"},
["type"]={"fix"},
["date"]={"March 10th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/193399-hotfix-1243/"},
["fixes"]={
        {tags={"Vauban","Zephyr","Sentinel","Target",},text={"*Fixed enemies not being affected by Vortex or Tornado if one was placed in the vicinity of a %'friendly%' target (cryopod, sentinel, etc)."}},
        {tags={"Boltor Prime","Prime","Rifle Ammo Mutation",},text={"*Fixed Rifle Ammo Mutation mod not being compatible with Boltor Prime."}},
        {tags={"Rescue","Alert",},text={"*Fixed incorrect mission type being activated when playing Rescue alerts."}},
        {tags={"MOA","Exterminate",},text={"*Fixed being unable to complete an Extermination mission after hacking Moa Cabinets to produce an ally Moa."}},
        {tags={"Hijack",},text={"*Fixed Hijack mission failure effects not appearing for clients."}},
        {tags={"Capture","Interception",},text={"*Fixed Interception mission issue where enemy AI would try to hack control towers that had already been captured by their own faction."}},
        {tags={"Star Chart","Void","Derelict",},text={"*Fixed inaccessible Void and Derelict labels appearing in Solar Map after backing out of a lobby."}},
        {tags={"Earth",},text={"*Fixed Infestation Outbreak missions on Earth not occurring within the proper forest tileset."}},
        {tags={"Clan",},text={"*Fixed graphical issue where dojo elevator doors weren%'t being lit correctly."}},
        {tags={"Grineer Galleon",},text={"*Fixed players occasionally spawning in mid-air when launching Grineer Galleon missions."}},
        {tags={},text={"*Graphical tweaks to improve Forest frame rate/performance in scenes containing rivers."}},
        {tags={},text={"*Fixed gameplay crashes."}},
},--fixes end

},--update end
{
["update number"]={"12.4.2"},
["type"]={"fix"},
["date"]={"March 7th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/191237-hotfix-1242/"},
["fixes"]={
        {tags={"Vauban","Zephyr","Stalker",},text={"*Fixed Zephyr’s Tornado and Vauban’s Vortex being able to ragdoll harder enemies (Minibosses like Stalker, etc). The Tornado will still deal DOT, but it won’t ragdoll. It is now consistent with other ragdoll-esque powers."}},
        {tags={"Survival",},text={"*Fixed problems where users get stuck to Life Support capsules in Survival."}},
        {tags={},text={"*Fixed some life support capsule pacing issues, the first 2-3 capsule spawns weren%'t being disabled after use and capsules were able to spawn in rooms other than intermediates and the boss room branch."}},
        {tags={},text={"*Fixed Dual Kama Whooshes!"}},
        {tags={"Valkyr","Furax",},text={"*Fixed ‘Rank 30 Furax’ bug appearing if using Hysteria and Valkyr."}},
        {tags={},text={"*Fixed rings on Sayrn%'s Chlora helm not using energy color"}},
        {tags={},text={"*Fixed Shipyard Grineer-robot-environment arms not moving for clients."}},
        {tags={},text={"*Fixed Crashes related to loading levels or shutting down game."}},
},--fixes end

},--update end
{
["update number"]={"12.4.1"},
["type"]={"fix"},
["date"]={"March 6th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/190653-hotfix-1241/"},
["additions"]={
        {tags={"Oberon","Zephyr",},text={"*Zephyr and Oberon abilities added to Codex/Enemy drops."}},
},--additions end
["changes"]={
        {tags={},text={"*Changed lightning effect in Shipyards to not be so bright and offensive."}},
        {tags={"Boltor Prime","Ankyros Prime","Prime",},text={"*Disabled skins on Boltor Prime and Ankyros Prime."}},
        {tags={"Hind",},text={"*Revised 3D Hind weapon sounds."}},
        {tags={},text={"*Optimized DSP effects to reduce memory usage and sound startup time."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed multiple reported crashes."}},
        {tags={"Limbo","Clan","Haven",},text={"*Fixed half-finished redesign concept being shipped in the Large Dojo garden room. If you haven’t build this room yet, it has also been removed as a buildable room as it is still in development. Users who built this room will still be able to access it, but note it will likely go through a visual redesign process."}},
        {tags={"Market","Extractor",},text={"*Fixed Regular Distilling Extractor not appearing in market for crafting."}},
        {tags={"Lotus",},text={"*Fixed spelling error in Lotus inbox message for Tethra’s Doom."}},
        {tags={},text={"*Fixed mission countdown in Korean builds."}},
        {tags={"Extractor",},text={"*Fixed missing Loc strings for the Distilling Extractor."}},
        {tags={"Castanas","Clan","Research",},text={"*Fixed inconsistent spelling of Castanas in Dojo research."}},
        {tags={"Hellion",},text={"*Fixed Arid Hellions not having jet-packs."}},
        {tags={},text={"*Fixed login screen issue where users could get into a state where text input in menus will also be typed into the e-mail/password fields."}},
        {tags={},text={"*Fixed players getting stuck in place if a new life support pod spawns while an existing one is being activated, also fixes pods being infinitely re-useable in similar circumstances"}},
        {tags={},text={"*Fixed client bleedout timer not returning when the player is abandoned (Grustrag 3)."}},
        {tags={},text={"*Fixed NPCs getting stuck using panic buttons."}},
        {tags={},text={"*Fixed some geo, collision, and lightmap issues."}},
        {tags={},text={"*Fixed crashes caused by running the game in Traditional Chinese; disabled the option until further testing proves its ready."}},
        {tags={},text={"*Fixed missing advance warning objective marker and incoming effect on life support capsules."}},
        {tags={"Nyx","Phorid",},text={"*Fixed Nyx parts not being received at mission end with Phorid."}},
        {tags={"Lech Kril",},text={"*Fixed Lech Kril not being killable at certain stages of the fight."}},
        {tags={},text={"*Fixed rain/lighting not appearing on clients."}},
},--fixes end

},--update end
{
["update number"]={"12.4"},
["date"]={"March 5th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/189809-update-1240"},
["title"]={"Tethra%'s Doom"},
["image"]={"U12.4_Tethra%'s_Doom.jpg"},
["misc"]={
        {tags={"Event",},text={"%'%'%'EVENT%'%'%':<%br>"}},
        {tags={"Vay Hek",},text={"Disable the Fomorian Fleet and stop Vay Hek%'s plans! (%[%https://warframe.com/news/tethras-doom-now Forum Link%])"}},
},--misc end
["additions"]={
        {tags={"Crewmen",},text={"*New Corpus Crewmen voices are here! They now have their own language and a whole new style as voted by the Design Council!"}},
        {tags={"Hijack","Event","Grineer Shipyard",},text={"*Grineer Shipyards tile set revealed with new “Hijack” game mode & Tethra’s Doom event!"}},
        {tags={"Void","Prime",},text={"*New Prime items in the Void! :"}},
        {tags={"Rhino","Prime",},text={"**Rhino Prime"}},
        {tags={"Ankyros Prime","Prime",},text={"**Ankyros Prime"}},
        {tags={"Boltor Prime","Prime",},text={"**Boltor Prime"}},
        {tags={"Akbronco Prime","Bronco Prime","Prime",},text={"**AkBronco Prime"}},
        {tags={"Oberon","Valkyr",},text={"*2x new Alternate helmets (Valkyr, Oberon)"}},
},--additions end
["changes"]={
        {tags={"Void","Derelict","Prime",},text={"*Changes to Void/Derelict Mission rewards to include new Prime gear. Locations of where new gear is being placed is listed on our forums, and will be fully unveiled in the coming weeks as the new items are discovered: (%[%https://forums.warframe.com/index.php?/topic/172911-prime-gear-drop-locations Forum Link%])"}},
        {tags={"Defense","Derelict",},text={"**Note: Orokin Derelict Defense has had all Credit Rewards removed from rotation with this Update. Review is ongoing for the current loot in the endless mission types."}},
        {tags={"Alert",},text={"*Panic buttons now can be un-alerted. This means if you%'ve been detected on a ship/planet/location, you can revert the alarms to a neutral state to complete missions with a more %'stealthy%' approach."}},
        {tags={"Ancient",},text={"*Gain and radius updates to all Infested Ancient vocals."}},
        {tags={},text={"*Updated sounds for electroprod whooshes."}},
        {tags={"Nova",},text={"*Nova’s Nullstar ability changed so radial damage can affect enemies with weak points."}},
        {tags={},text={"*Changed the description on the Polarization screen to be clearer about how Polarization works."}},
        {tags={"Trinity","Rescue",},text={"*Improvements to Rescue target in Rescue missions (pssst want to give us feedback on mission types? see here-> %[%https://forums.warframe.com/index.php?/topic/189247-optional-mission-feedback-survey Link!%])"}},
        {tags={"Volt","Rescue","Earth",},text={"*Changed the Rescue hostage%'s health, shield and speed, changed threat level, and fixed objective markers not following the path in Corpus and Earth Settlement levels."}},
        {tags={},text={"*Added support for using left analog stick and dpad for turning pages in Codex/Tutorials."}},
        {tags={},text={"*All 3D weapon reloads have had the radius adjusted."}},
        {tags={},text={"*Made some further optimizations in the Forest expansion levels to improve performance."}},
        {tags={"Survival","Derelict",},text={"*Tweaks to Derelict Survival levels to make it less repetitive and limit the number of smaller intermediates"}},
        {tags={"Nyx",},text={"*Nyx%'s Chaos ability deco uses the correct helmet."}},
        {tags={"Mods","Accelerated Blast",},text={"*Accelerated Blast%'s bonus to puncture damage now matches the description (at base level, was adding 22PERZENTO Puncture so when mod itself said 15PERZENTO), as well as all the other mods that increase physical damage."}},
        {tags={"Stalker",},text={"*Adjusted brightness of Stalker’s bow string to fix colour bleeding."}},
        {tags={"Void",},text={"*Orokin Void procedural level optimization - reduced number of dead ends, limited some of the heavier connectors, limited max intermediates to 3 instead of 4, reduced connectors in dead ends."}},
        {tags={"Aura",},text={"*Audio improvements to magnetic, fire, and toxic aura impact."}},
        {tags={},text={"*Disable auto-joining of other players when playing keys in public mode. Players will be required to join via invite or right-clicking from chat context menu."}},
        {tags={},text={"*Revised enemy AI Leader ability sounds."}},
        {tags={"Grineer Galleon",},text={"*Grineer Galleon gameplay additions: (broken light electrical hazard, new door type that damages players as the pass through)."}},
        {tags={},text={"*Corpus Laser doors adjusted under the hood to be more reliable at damaging passer-bys."}},
        {tags={"Interception",},text={"*Modified AI in Interception to balance between attacking players and capturing points better."}},
        {tags={"Furax",},text={"*Audio revisions to Furax flesh and metal impacts."}},
        {tags={"Conclave",},text={"*Weapon and Mod conclave tweaks."}},
        {tags={"Mods","Fusion Core",},text={"*Split Auto-Fuse into two buttons; one for just fusion cores, and one for just duplicate mods."}},
},--changes end
["fixes"]={
        {tags={"Void",},text={"*Fixed issue where Void missions could be completed without keys being consumed."}},
        {tags={"Vauban",},text={"*Fixed Vauban’s Bastille FX to fade properly."}},
        {tags={"Invasion",},text={"*Fixed issue with friendly AI Leaders that would cause negative effects on players during Invasion modes."}},
        {tags={},text={"*Fixed sniper reticules to rescale when HUD scale changes."}},
        {tags={"Nekros",},text={"*Fixed a situation where it was possible for a Nekros summoned ally to squad up with enemy AI and take points."}},
        {tags={"Clan",},text={"*Fixed Clan invite UI breaking for player when they use the field to type out a player%'s name."}},
        {tags={},text={"*Fixed most instances where multiple enemies would not appear on client until they die."}},
        {tags={"Nova","Mods",},text={"*Fixed the beam FX for Nova’s Wormhole ability that did not scale according to range mods."}},
        {tags={"Kela De Thaym",},text={"*Fixed Kela de Thaym to not appear as a Leader AI type."}},
        {tags={},text={"*Fixed issue with start timer not showing up for client when selecting a node."}},
        {tags={},text={"*Fixed Knee Slides for pistol/rifle - All holstered %'long%' weapons were clipping severely into ground."}},
        {tags={},text={"*Fixed and removed some unnecessary water planes from Forest levels."}},
        {tags={},text={"*Fixed Infested Whip that appeared broken when holstered."}},
        {tags={},text={"*Fixed multiple reported language bugs across all languages."}},
        {tags={},text={"*Fixed many reported collision issues across all tile sets."}},
        {tags={"Capture","Interception",},text={"*Fixed issue in Interception mode where occasionally the UI will indicate you have completed a capture at 99PERZENTO instead of 100PERZENTO."}},
        {tags={},text={"*Fixed issue where fusing dupe stack into a equipped mod would let you exceed mod capacity on that weapon/Warframe."}},
        {tags={"Sentinel","Sacrifice",},text={"*Fixed bug where the bleedout timer stops if a sentinel with the sacrifice mod is in the process of reviving a player and dies."}},
        {tags={"Sentinel","Regen",},text={"*Fixed malfunctioning Sentinel Regen mod."}},
        {tags={"Conclave",},text={"*Fixed some Warframe abilities that had errors in conclave battles."}},
        {tags={"Despair","Hikou",},text={"*Fixed Despair and Hikou in hand models disappearing forever after emptying one clip."}},
        {tags={},text={"*Fixed grenades and sticky bombs not being destroyed after use."}},
        {tags={"Thrown Weapons",},text={"*Fixed Agile and Noble animation sets that were playing akimbo pistol idles when using thrown weapons."}},
        {tags={"Vectis",},text={"*Fixed the scope ring material on Vectis."}},
        {tags={"Fusion MOA","MOA","Fusion Moa Event",},text={"*Fixed the Fusion Moa%'s drone that doesn%'t get elemental effects when attached to back of Moa."}},
        {tags={"Mesa","Boltor","Supra","Muzzle Flash",},text={"*Fixed muzzle flash FX on Boltor and Supra."}},
        {tags={},text={"*Fixed another instance of end of match black screen (edge case)."}},
        {tags={"Survival",},text={"*Fixed missing effect and objective marker for incoming life support drops in Survival."}},
        {tags={"Capture","Interception",},text={"*Fixed VFX in Interception: the pillar of light, letters, and symbols do not flash when player territories are being captured. Flashing the pillar of light and letters when an AI is attempting to capture a point."}},
        {tags={"Fusion",},text={"*Fixed fusion thinking a mod would exceed the drain limit of a config slot it%'s not installed in."}},
        {tags={},text={"*Fixed clients not seeing proper colour customization if they have the default colours, have never changed colours, and if they have the branded restraining bolt attached."}},
        {tags={"Sentinel",},text={"*Fixed bug that allowed you to sell your last remaining Sentinel precepts."}},
        {tags={},text={"*Fixed an issue where the player%'s left hand was open when hip firing with the payload device (Datamass)."}},
        {tags={},text={"*Fixed rare case where player A has a pending trade document for player B, but player B does not have a corresponding trade document for player A, at which point they can%'t continue to trade and can%'t cancel the trade."}},
        {tags={"Hikou",},text={"*Fixed Hikou not matching energy colour choice."}},
        {tags={"Rhino",},text={"*Fixed an issue with Rhino’s Iron Skin not appearing after using a scope."}},
        {tags={"Zanuka Hunter","Stalker",},text={"*Fixed music not starting on clients and G3/Stalker/Harvester music not playing on clients."}},
        {tags={"Zephyr",},text={"*Fixed Zephyr Tornado ability to properly switch appearance with damage type."}},
        {tags={"Mag","Vauban",},text={"*Fixed issue with clients that would be pulled into Vauban’s Vortex."}},
        {tags={"Zephyr",},text={"*Fixed some FX bugs with Zephyr."}},
        {tags={},text={"*Fixed bleedout marker that would remain on minimap for host after the client has died."}},
        {tags={"Void","Derelict","Clan",},text={"*Fixed label for void/derelict/dojo from appearing when associated key isn%'t available."}},
        {tags={"Sentinel",},text={"*Fixed Sentinel achievements not being awarded from bonus xp at the end of a mission."}},
        {tags={},text={"*Fixed some reported AI “stuck spots” in Settlement."}},
        {tags={},text={"*Fixed hack panels remaining indefinitely active after a hull-breach."}},
        {tags={},text={"*Fixed enemy projectiles from disappearing after the owner dies."}},
        {tags={"Interception",},text={"*Fixed host migration issue in Interception where host choosing to claim and exit causes the client to get the claim and exit screen a second time."}},
        {tags={"Survival",},text={"*Fixed objective markers disappearing in Survival after Host Migrations."}},
        {tags={"Derelict",},text={"*Fixed a missing connecter in Derelict procedural levels."}},
},--fixes end

},--update end
{
["update number"]={"12.3.2"},
["type"]={"fix"},
["date"]={"February 27th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/186716-hotfix-1232/"},
["changes"]={
        {tags={"Grustrag Three","Death",},text={"*Changes to the Grustrag Three drop logic, they no longer exhaust everything in their repertoire (mod + part + resource) on death, they now each drop (mod OR part OR resource)."}},
},--changes end
["fixes"]={
        {tags={"Jat Kittag","Reflect",},text={"*Fixed Jat Kittag FX reflecting a sweet party on the screen instead of a deadly hammer, sorry, party is over."}},
        {tags={"Grustrag Three",},text={"*Fixed issue with endless mission rewards in missions where the Grustrag Three have spawned."}},
        {tags={},text={"*Fixed issues with Forest Level walls and collisions."}},
        {tags={"Ember","Prime",},text={"*Fixed Immortal Skin unintentionally overriding Ember Prime’s gold colours."}},
        {tags={"Mods",},text={"*Fixed mods picked up in game not having backgrounds."}},
        {tags={},text={"*Fixed Grustrag Bolt removal recipe not being craftable if you only have one Warframe."}},
},--fixes end

},--update end
{
["update number"]={"12.3.1"},
["type"]={"fix"},
["date"]={"February 27th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/186309-hotfix-1231/"},
["misc"]={
        {tags={},text={"*Broken loot lockers on clients"}},
        {tags={"Market",},text={"*Typo in the market"}},
},--misc end

},--update end
{
["update number"]={"12.3"},
["date"]={"February 27th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/186244-update-1230-the-grustrag-three"},
["title"]={"The Grustrag Three"},
["image"]={"The_Grustrag_Three.jpg"},
["misc"]={
        {tags={},text={"*Vem Tabook, Shik Tal and Leekter. Remember their names, Tenno. They may be coming for you!"}},
        {tags={"Brakk","Vay Hek","Grustrag Three","Invasion",},text={"**Vay Hek has warned that any Tenno supporting the Corpus during invasions will face consequences; we now know what those consequences are. Riddled with mutation, violent tendencies and the urge to kill, these Grineer defects - otherwise known as The Grustrag Three - pose a high level threat. They have been detected in the Solar System and have been taking notice of Tenno support for Corpus during invasions. If it is the Brakk you seek, the Grustrag Three you must defeat."}},
        {tags={},text={"<%br>"}},
        {tags={},text={"%'%'%'Tenno Reinforcement:%'%'%'"}},
        {tags={"Marelok","Tech","Clan","Market",},text={"*Marelok! Grineer Lever Action Secondary weapon! Find it in Clan Tech or the Market today."}},
},--misc end
["additions"]={
        {tags={},text={"*Forest Level expansion!"}},
        {tags={},text={"*New Hyena information hooked up in Codex."}},
        {tags={},text={"*New ambient sounds added to the Forest Levels!"}},
        {tags={},text={"%'%'%'Cosmetic Additions:%'%'%'"}},
        {tags={"Ember","Nekros","Oberon","Valkyr",},text={"*4x Immortal Skins: Nekros, Valkyr, Oberon, and Ember!"}},
        {tags={},text={"*Twilight Colour Picker!"}},
},--additions end
["changes"]={
        {tags={},text={"*Level up effect now uses energy colour!"}},
        {tags={"Castanas",},text={"*Adjusted Timing to show Castanas in hand sooner after reload is complete."}},
        {tags={"Star Chart","Void","Derelict","Clan",},text={"*Show “The Void”, “The Derelicts” and “Dojo” in the Star Chart if players have the required keys."}},
        {tags={"Detron",},text={"*Tweaked the depth cue on energy projectile%'s flares so they aren%'t so large in the distance (Detron Projectile feedback changes)."}},
        {tags={"Synapse","Conclave","Mods","Heavy Caliber",},text={"*Weapon and Mod conclave tweaks - increased the ratings on the Synapse, Heavy Caliber, and Toxin Damage mods."}},
        {tags={},text={"*Revised name of Zoren Dagger Axe skin, so that we don%'t have duplicate names (Dagger Axe)."}},
        {tags={"Frost",},text={"*Changed Frost’s Ability Sounds to align with new casting times."}},
},--changes end
["fixes"]={
        {tags={"Burston Prime","Prime",},text={"*Fixed Burston Prime Blueprint not being tradeable."}},
        {tags={"Maneuvers",},text={"*Fixed problem where players could get stuck in a state where they can’t roll or melee if they were not completely knocked down by an enemy."}},
        {tags={},text={"*Fixed another instance of permanent end of mission black screen ."}},
        {tags={"Zephyr",},text={"*Fixed remaining issues with Zephyr’s Turbulence letting most shots through."}},
        {tags={"Prime",},text={"*Fixed issue where Players can trade in progress Prime Blueprints which caused loss of resources."}},
        {tags={},text={"*Fixed missing Japanese Characters (font) in game."}},
        {tags={"Mods",},text={"*Fixed issue where player attempts to fuse certain mods result in errors."}},
        {tags={"Earth",},text={"*Fixed issues with day/night fog on Earth."}},
        {tags={"Zanuka Hunter","Stalker",},text={"*Fixed music not restarting after Stalker/Harvester appears."}},
        {tags={},text={"*Fixed issues where Warframes that were Harvested while wearing Immortal skins weren’t showing proper FX in Aresenal."}},
        {tags={},text={"*Fixed issue 9 from here, issues with mesh cuts in Forest ->%[%[%https://forums.warframe.com/index.php?/topic/151081-grineer-jungle-explorafun-feedback-suggestion-glitch-report Forum Link%]%]"}},
        {tags={},text={"*Fixed issue where Sniper Rifle enemies would rapid-fire when blind-firing."}},
        {tags={"Ignis",},text={"*Fixed Ignis not using energy colour."}},
        {tags={"Boltor","Supra",},text={"*Fixed Supra/Boltor not using energy colour."}},
        {tags={"Amphis",},text={"*Fixed Amphis not using energy colour."}},
        {tags={"Capture","Earth",},text={"*Fixed issue where Capture target would get stuck on Earth missions."}},
        {tags={},text={"*Fixed enemies throwing grenades while/after running instead of in proper Grenade throwing ways sequence."}},
        {tags={"Sabotage","Nightmare Mode","Earth",},text={"*Fixed progression stopping issue if playing Earth’s Sabotage mission with Nightmare mode ‘timer’ permutation."}},
},--fixes end

},--update end
{
["update number"]={"12.2.1"},
["type"]={"fix"},
["date"]={"February 20th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/182504-hotfix-1221"},
["fixes"]={
        {tags={"Void",},text={"*Fixed Void Keys still appearing as rewards in a few higher-tiered Void missions"}},
        {tags={"Mods",},text={"*Fixed Legendary Cores not fusing Mods to maximum level in some situations"}},
        {tags={"Fusion",},text={"*Fixed Legendary Cores being consumed by Auto Fusion"}},
        {tags={"Clan",},text={"*Fixed ENTER key not functioning when attempting to send Clan invitations"}},
        {tags={},text={"%'%'%'Note%'%'%'"}},
        {tags={},text={"*As of Hotfix 12.2.1 Legendary Cores should now be distributed to all qualifying players. Details can be found at ->%[%https://forums.warframe.com/index.php?/topic/182094-steel-charge-update Forum Link%]"}},
},--fixes end

},--update end
{
["update number"]={"12.2"},
["date"]={"February 19th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/182229-update-1220-castanas/"},
["title"]={"Tenno Reinforcements: Castanas!"},
["image"]={"TR_Castanas.jpg"},
["misc"]={
        {tags={"Castanas","Clan","Research","Market",},text={"*Tenno Reinforcements: Castanas! -Find them in the Market or Clan Research Today!"}},
},--misc end
["additions"]={
        {tags={},text={"*Added setting for “Global Notifcations in Chat” to enable/disable Mauve Text and other notifications."}},
        {tags={},text={"*Added way to verify Steam economy items in game, see this post for more details-> %[%https://forums.warframe.com/index.php?/topic/182122-verifying-in-game-steam-items Forum Link%]"}},
},--additions end
["changes"]={
        {tags={"Void",},text={"%'%'%'to Void:%'%'%'"}},
        {tags={},text={"*Keys as end-of-mission rewards have been removed from T2 and T3 missions. T1 missions still can reward keys."}},
        {tags={"Exterminate",},text={"*PSA: Have seen 3 confirmed reports of T3 Exterminate keys giving keys as rewards, noted and will be fixed next Hotfix."}},
        {tags={"Prime",},text={"*Additional Distribution of some Prime Items, up-to-date table here: %[%https://forums.warframe.com/index.php?/topic/172911-prime-gear-drop-locations Forum Link%]"}},
        {tags={"Void","Prime",},text={"*All Prime Parts found in Void are now trade-able."}},
        {tags={"Void",},text={"*See Sheldon’s entry here about the changes->%[%https://forums.warframe.com/index.php?/topic/182179-void-master-void-faster/ Forum Link%]"}},
        {tags={},text={"%'%'%'Various Changes%'%'%'"}},
        {tags={"Aura","Steel Charge",},text={"*Steel Charge Aura changed from 10 rank Aura mod to 5 rank Auramod, see further information here-> %[%https://forums.warframe.com/index.php?/topic/182094-steel-charge-update/ Forum Link%]"}},
        {tags={"Eviscerator",},text={"*Changed Eviscerator Damage and Proc Rate."}},
        {tags={"Jat Kittag",},text={"*Changed Jat Kittag Charge attack FX for new charge animation."}},
        {tags={"Fusion",},text={"*Cannot start a fusion with a card that%'s already at its max fusion level."}},
        {tags={},text={"*Chat history won%'t be initially visible when going into a game until a new message is received – no point in spamming what you have already read until a new message comes in."}},
        {tags={"Invasion","Venus","Earth",},text={"*Omitted Venus/Earth being eligible for Grineer or Corpus invasions to not throw off new player path."}},
        {tags={"Fusion",},text={"*Refined and tweaked new “Auto Fusion” features:"}},
        {tags={"Mods","Fusion Core",},text={"*Added some safety checks so that auto fuse never grabs installed mods or fused mods that aren%'t Fusion Cores."}},
        {tags={},text={"*Now if you%'re fusing a ‘cooked’ mod, Auto Fuse WILL grab any raw duplicates of said mod."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed issue where players would complete missions and not receive any rewards."}},
        {tags={"Reflect",},text={"*Fixed issues where power duration timers were reflecting casts made by other players."}},
        {tags={"Excalibur","Frost",},text={"*Fixed image of Excalibur appearing for Frost Helmet skin."}},
        {tags={},text={"*Fixed typos in training section of Codex."}},
        {tags={},text={"*Fixed issues with overlapping Russian text."}},
        {tags={"Survival",},text={"*Fixed issues where HUD marker for Survival Pickup was using wrong image."}},
        {tags={},text={"*Fixed issue where new accounts may be unable to login."}},
        {tags={},text={"*Fixed issue where settings tab would intersect in some languages."}},
        {tags={"Survival",},text={"*Fixed issues where the new Survival objective marker wasn’t properly pathing meaning that some users wouldn’t be able to find the right door in the zone to lead them further."}},
        {tags={"Vauban",},text={"*Fixed issue where enemies would stand up in the middle of a blackhole or blackhole like situation (Vortex, etc.)."}},
        {tags={"Mesa","Muzzle Flash",},text={"*Fixed an issue where the %'dual wielded firing%' animations would get out of sync with what the weapon attachments were doing (so you%'d see a muzzle flash on left gun and recoil on right gun)."}},
        {tags={"Inventory",},text={"*Fixed the display of ammunition/total for all weapons. Bows will display a single value, as will the scanner, the former has no magazines and the latter has no ammunition. All other weapons will still show current ammo in weapon/ total ammo in inventory."}},
        {tags={"Fusion",},text={"*Fixed issues where mod fusion could become de-synced or exploited, implemented preventative measures."}},
        {tags={},text={"*Fixed possible errors when accounts are being updated with content."}},
        {tags={"Ash","Loki",},text={"*Fixed issues where some instances of switch teleporting involved attempted melee attempts on the player after the teleport has taken place."}},
        {tags={},text={"*Fixed issue where fusing into an equipped mod would let you exceed mod capacity on a given weapon/Warframe."}},
        {tags={"Clan","Conclave",},text={"*Fixed about two dozen Warframe abilities not working in Conclaves/Dojo PVP."}},
        {tags={"Foundry",},text={"*Fixed issues where weapon skins in player’s inventories will show as negative counts in the foundry."}},
        {tags={},text={"*Fixed inconsistencies in the naming conventions for the way Gear and Rank are displayed in the game (UNRANKED vs 0)."}},
        {tags={"Zephyr",},text={"*Fixed issue with Zephyr’s Turbulence letting most shots through even when maxed and rarely redirecting."}},
        {tags={"Defense",},text={"*Fixed steam not damaging players in the Forest Defense map as it should – things just got a bit deadlier on that map!"}},
        {tags={},text={"*Fixed issue where players would complete missions and not receive any rewards."}},
        {tags={"Loki","Commander",},text={"*Fixed issue where Grineer Commander’s would not move in proper sequence after Switch Teleporting player."}},
        {tags={},text={"*Various Crash fixes."}},
},--fixes end

},--update end
{
["update number"]={"12.1.2"},
["type"]={"fix"},
["date"]={"February 14th 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/179717-hotfix-1212/"},
["changes"]={
        {tags={"Eviscerator","Defense","Survival","Earth",},text={"*Earth enemy balancing and tweaks including removing Eviscerators from regular Earth missions; they now only appear after 5 minutes in Survival or 5 Waves in Defense."}},
        {tags={"Skana Prime","Prime",},text={"*Skana Prime is now tintable."}},
        {tags={"Jat Kittag",},text={"*Reverted to the old holster position for Jat Kittag."}},
        {tags={"Invasion","Star Chart",},text={"*Tweaked enemy strategies in invasions for factions that are on the ropes in the Star Chart."}},
        {tags={},text={"%'%'%'Performance%'%'%'"}},
        {tags={},text={"*Removed hitches when enemy leader units would spawn."}},
        {tags={"Lotus",},text={"*Removed hitches caused by resources being inadvertently unloaded after Lotus transmissions."}},
},--changes end
["fixes"]={
        {tags={"Survival",},text={"*Fixed enemies spawning behind locked exit doors in survival missions."}},
        {tags={},text={"*Various crash fixes."}},
},--fixes end

},--update end
{
["update number"]={"12.1.1"},
["type"]={"fix"},
["date"]={"February 13th 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/179019-hotfix-1211/"},
["changes"]={
        {tags={},text={"* Fixed issue where Launcher incorrectly prompted users to Update game, preventing logins."}},
},--changes end
["fixes"]={
        {tags={"Mesa","Grinlok","Muzzle Flash",},text={"*Changes to Grinlok%'s muzzle flash/sounds"}},
},--fixes end

},--update end
{
["update number"]={"12.1"},
["date"]={"February 13th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/178607-update-1210-grinlock"},
["title"]={"Tenno Reinforcements: Grinlok"},
["image"]={"TR_Grinlok.jpg"},
["additions"]={
        {tags={"Grinlok","Tech","Clan","Market",},text={"*Tenno Reinforcment: The Grinlok. Find it in Clan Tech/ or the Market today!"}},
        {tags={"Zephyr",},text={"*Warframe and Zephyr honor Flappy Bird%'s removal from the gaming world. How? There are two ways...<%br>One, Zephyr owners should explore their Arsenal...<%br>Two, those that don%'t own Zephyr should think about a bird-like-word to log in to Warframe... no %'@%' required."}},
        {tags={"Clan",},text={"*Added popup notification that the clan invite you sent was successful, since before there was very little feedback on the Clan tab (just the subtle change in pending count if pending list is collapsed), and no real feedback if you sent clan invite from Friends tab."}},
},--additions end
["misc"]={
        {tags={},text={"<%div class=%'mw-collapsible mw-collapsed%'>"}},
        {tags={},text={"%'%'%'Missing Mod Script:%'%'%'"}},
        {tags={"Maneuvers","Transmutation","Inventory","Mods",},text={"The script to remedy missing mods in the past week is about to be deployed, and it involves some amendment of inventory issues overall. Read on if you were affected by this (there were 2112 cases).<%br>The script is going to give players any mods they were entitled to from a mission, trade, or transmutation.<%br>However, the ‘not being able to received mod’ issue also allowed players to overfuse/sell mods for credits without the mods actually disappearing from their inventory. The script has a rollback for any accounts that overfused or sold mods, with the conditions listed out below.{{clr}}"}},
        {tags={},text={"<%div class=%'mw-collapsible-content%'>"}},
        {tags={},text={"%'%'%'TERMINOLOGY:%'%'%'"}},
        {tags={"Mods",},text={"*Raw Mod: an unranked mod that stacks with other unranked mods"}},
        {tags={"Mods",},text={"*Cooked Mod: a mod that does not stack with unranked mods"}},
        {tags={"Maneuvers",},text={"%'%'%'WHAT HAPPENS WHEN WE ROLLBACK A TRANSACTION:%'%'%'"}},
        {tags={"Mods",},text={"*Selling: credits are removed, raw and cooked mods are returned to you"}},
        {tags={"Fusion","Mods",},text={"*Fusion: credits are refunded, raw and cooked mods are returned to you. Upgrade level is reverted."}},
        {tags={"Transmutation","Mods",},text={"*Transmutation: credits are refunded, raw mods returned."}},
        {tags={"Trading","Mods",},text={"*Trading: credits are refunded, platinum reverted, keys reverted, raw and cooked mods reverted. (i.e. if you gave away mods, you get them back. If you received mods, you lose them). Your trading partner is unaffected."}},
        {tags={"Maneuvers",},text={"%'%'%'CONDITIONS FOR TRIGGERING A ROLLBACK:%'%'%'"}},
        {tags={"Mods",},text={"#if you acquired credits by selling raw mods you did not actually have, sale is rolled back."}},
        {tags={"Fusion","Mods",},text={"#if you consumed raw mods you did not have in order to create a new cooked mod via fusion, the cooked mod is marked %'illegally acquired%'. Fusion is rolled back."}},
        {tags={"Mods",},text={"#if you traded away raw mods you did not have, any cooked mods recieved{{sic}} in the trade are marked as %'illegally acquired%'. Trade is rolled back."}},
        {tags={"Mods",},text={"#if you acquired credits by selling cooked mods that were marked %'illegally acquired%', sale is rolled back."}},
        {tags={"Transmutation","Mods",},text={"#if you consumed raw mods you did not have as part of a transmutation, transmutation is rolled back."}},
        {tags={"Mods",},text={"#if you traded away a cooked mod marked %'illegally acquired%', any cooked mods recieved{{sic}} in the trade are also marked as illegally acquired. Trade is rolled back."}},
        {tags={"Fusion","Mods",},text={"#if you consumed raw mods you did not have to perform fusion to increase the level of a cooked mod, the cooked mod is marked %'illegally upgraded%'. Fusion is rolled back."}},
        {tags={"Fusion",},text={"#if you consumed a cooked mod marked as illegally acquired to perform fusion on a cooked mod, the mod is marked as illegally upgraded. Fusion is rolled back."}},
        {tags={"Fusion",},text={"#if you performed fusion to increase the level of a cooked mod marked as %'illegally upgraded%' or %'illegally acquired%', fusion is rolled back."}},
        {tags={"Fusion",},text={"#if you consumed a cooked mod marked as illegally acquired to create a new cooked mod, the mod is marked as illegally acquired. Fusion is rolled back."}},
        {tags={},text={"In the case that you%'ve already spent your ill-gotten platinum or credits, we are setting you to zero credits or platinum (instead of letting you go negative)."}},
        {tags={},text={"<%/div>"}},
        {tags={},text={"<%/div>"}},
},--misc end
["changes"]={
        {tags={},text={"*Reverted all holster changes back to original positions prior to Update 12 until we can better execute on the intended changes."}},
        {tags={},text={"*Changed the description on the polarization screen to be more clear about how polarization works."}},
        {tags={"Interception",},text={"*Now giving XP for capturing, neutralizing and dominating in Interception"}},
        {tags={},text={"*HUD changes:"}},
        {tags={},text={"**Added HUD/UI tab to Settings menu."}},
        {tags={},text={"**Added a %'Show Ability Dots%' option to Settings."}},
        {tags={},text={"**Fixed issues with HUD elements and scaling (reload timer, sniper reticules)."}},
        {tags={"Survival",},text={"**Survival objective markers now have a new icon."}},
        {tags={"Interception",},text={"**Interception game mode has colourized icons on minimap depending on faction possession."}},
},--changes end
["fixes"]={
        {tags={"Interception",},text={"*Fixed nightmare-mode rewards on Interception Missions."}},
        {tags={"Mods",},text={"*Fixed Ranked Mods not being tradeable ."}},
        {tags={"Nekros","Interception",},text={"*Fixed a situation where it was possible for a Nekros-Summoned-Ally to squad up with enemy ai and take points in Interception."}},
        {tags={"Nova","Mods",},text={"*Fixed Nova’s Wormhole having infinite range. It was in the 5000 meter range due to a bug, and is not again 50 m by default but can be upgraded with range mods still."}},
        {tags={"Heavy Impact",},text={"*Fixed Heavy Impact effect only playing once."}},
        {tags={"Banshee",},text={"*Fixed Banshee’s Sonar not showing enemies on clients."}},
        {tags={},text={"*Fixed issue where keys were not being used in inventories if host leaves or election occurs."}},
        {tags={"Vauban","Conclave",},text={"*Fixed Vauban’s Tesla’s not being destroyed in between Conclave matches."}},
        {tags={},text={"*Fixed accepting a trade while on a contribution screen causing screen overlapping."}},
        {tags={"Ember","Prime",},text={"*Fixed subtle tint colour mismatch with Ember Prime."}},
        {tags={"Zanuka Hunter",},text={"*Fixed issue where dying and reviving at a certain time would cause the Harvester to ignore you."}},
},--fixes end

},--update end
{
["update number"]={"12.0.5"},
["type"]={"fix"},
["date"]={"February 10th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/177262-hotfix-1205/"},
["changes"]={
        {tags={"Penta",},text={"*Changes to Penta’s sounds."}},
},--changes end
["fixes"]={
        {tags={"Mods",},text={"*Fixed issue where some accounts could not acquire Mods through end of mission or trades. We are maintaining a list of affected accounts and will fix them in a script shortly, stay tuned for confirmation when the script is complete, it might be a day or more but we will let you know as soon as it’s done."}},
        {tags={"Vauban",},text={"*Fixed issues where Vauban’s Tesla could cause a crash. We have optimized the FX of this power for performance and stability, it may look a bit different!"}},
        {tags={"Inventory","Mods",},text={"*Fixed issue where recently acquired mods were not appearing in the inventory when sorting by recent."}},
        {tags={"Sabotage","Orokin Reactor",},text={"*Fixed continuous fire weapons not being able to damage Sabotage Reactors or other “environment” pieces."}},
        {tags={"Zephyr",},text={"*Fixed issue where Zephyr’s Dive Bomb does not deal damage."}},
        {tags={"Sentinel",},text={"*Fixed team health restores not working for sentinels."}},
        {tags={"Nova",},text={"*Fixed Nova’s Immortal Skin blending and bug fix for her FX texture being improperly overrided."}},
        {tags={"Lephantis",},text={"*Fixed spelling of Lephantis in transmissions."}},
},--fixes end

},--update end
{
["update number"]={"12.0.4"},
["type"]={"fix"},
["date"]={"February 7th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/175069-hotfix-1204"},
["changes"]={
        {tags={"Interception",},text={"*HUD indicators now use separate colors for Tenno and Opponent in Interception mode"}},
        {tags={},text={"*More legibility tweaks to HUD & mini-map markers"}},
        {tags={},text={"*Hooked up missing sound effects to many Grineer movement animations"}},
        {tags={"Zephyr","Protect",},text={"*Improved Zephyr%'s Turbulence shield to provide better protection from distant enemies"}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed reticle not respecting HUD Scale after switching weapons"}},
        {tags={"Alert",},text={"*Fixed inability to launch alert mission after pressing ACCEPT on the alert info pop-up"}},
        {tags={"Conclave",},text={"*Fixed loss of functionality after finishing a Conclave match"}},
        {tags={"Sentinel",},text={"*Fixed all Sentinel Mastery achievements requiring rank 30 to unlock"}},
        {tags={},text={"*Fixed jittery HUD and mini-map markers"}},
        {tags={"Target","Capture",},text={"*Fixed players getting stuck in the Capture Target%'s room if they failed to hacked the same control panel that was used by the Target"}},
        {tags={"Vauban",},text={"*Fixed crash that could occur when using Vauban%'s Tesla"}},
        {tags={},text={"%'%'%'Hotfix 12.0.4.1%'%'%':"}},
        {tags={"Void",},text={"*Fixed mission countdown spontaneously starting when using Void Keys"}},
        {tags={"Trinity",},text={"*Fixed Trinity%'s Link becoming unusable if no enemy targets can be found after casting"}},
},--fixes end

},--update end
{
["update number"]={"12.0.3"},
["type"]={"fix"},
["date"]={"February 7th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/174833-hotfix-1203/"},
["additions"]={
        {tags={},text={"*Added a new option to the Settings screen for %'Show Player List%'. Makes the complete squad list visible by default during gameplay."}},
},--additions end
["changes"]={
        {tags={},text={"*%'%'%'HUD Changes:%'%'%'"}},
        {tags={},text={"**Revised mini-map marker icons for better readability"}},
        {tags={},text={"**Reticle and Mod card images are no longer affected by HUD Scale"}},
        {tags={},text={"**Ability dots now animate when they become active"}},
        {tags={"Reflect",},text={"**Ability icons and dots now reflect when they are in cooldown"}},
        {tags={},text={"**Fixed damage indicators on health not showing the right dimensions and sometimes not being visible at all"}},
        {tags={"Trinity","Death",},text={"**Teammate pre-death icon now blinks"}},
        {tags={},text={"*%'%'%'Overall Changes:%'%'%'"}},
        {tags={"Derelict",},text={"**Orokin Derelict Key Blueprints are now reusable"}},
        {tags={"Ember","Prime",},text={"**Changed Ember Prime Helmet drop to blueprint to be consist with other drops"}},
},--changes end
["fixes"]={
        {tags={"Roller",},text={"*Fixed the Gear Wheel not working when using a controller"}},
        {tags={"Ivara",},text={"*Reverted bow & quiver holster positions by popular demand"}},
        {tags={"Defense",},text={"*Fixed misaligned pistons found on machinery in Forest Defense map"}},
        {tags={"Mobile Defense",},text={"*Fixed a collision issue in Mobile Defense levels (e.g. Kappa) that could lead to players becoming permanently stuck"}},
        {tags={"Ash",},text={"*Fixed all Shuriken Proficiency achievements requiring rank 30 to unlock"}},
},--fixes end

},--update end
{
["update number"]={"12.0.2"},
["type"]={"fix"},
["date"]={"February 6th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/174127-hotfix-1202/"},
["misc"]={
        {tags={"Clan","Research","Oxium",},text={"*PSA: We have run a script that fixed Oxium over-contributions in Clan Research."}},
},--misc end
["additions"]={
        {tags={"Survival",},text={"*Added lockers to Survival spawn room."}},
        {tags={"Fusion","Mods",},text={"*Added a Sell All/ Select All button in the context of Mod fusion where stacked mods had to be chosen, now a button does it for you!"}},
},--additions end
["changes"]={
        {tags={"Void",},text={"*%'%'%'Void Reward Changes:%'%'%'"}},
        {tags={"Capture","Defense","Exterminate","Mobile Defense","Survival","Void","Forma","Prime",},text={"**Changes to Void Mission Rewards: Capture, Exterminate, and Mobile Defense missions no longer contain Resources/Cores as mission rewards, only Prime Parts, Forma, or a Key.<%br>For Survival and Defense missions, staying at least <%s>15<%/s> 20 minutes/15 waves guarantees a Prime Part, Forma or a Key. Resources, Cores, or Credits are included in the cycling of mission rewards for Survival/Defense.<%br><%br>%[Sheldon%'s Edit%]: Survival is actually at 20 minutes. Not 15."}},
        {tags={},text={"*%'%'%'HUD Changes:%'%'%'"}},
        {tags={},text={"**‘Hud Scale’ setting added– you can now scale it up to 50PERZENTO larger."}},
        {tags={},text={"**Made levelup notify last 3 seconds (up from 2)."}},
        {tags={},text={"**Extraction Icons are now green."}},
        {tags={"Interception",},text={"*%'%'%'Balance changes for Interception:%'%'%'"}},
        {tags={},text={"**Better AI scaling."}},
        {tags={},text={"**Fiddled with spawn numbers to make solo more viable."}},
        {tags={"Capture",},text={"**Adjusting capture rates, a bit faster for solo players a bit slower for multiple players"}},
        {tags={},text={"**XP share radius increased in this mission type."}},
        {tags={"Zephyr",},text={"*Adjusted Syandanas on Zephyr."}},
        {tags={},text={"*Changes to holster position of polearm weapons on All Warframes to prevent clipping."}},
        {tags={"Zephyr",},text={"*FX Tweaks to Zephyr’s Turbulence to improve visibility."}},
        {tags={"Boar Prime","Prime",},text={"*Tweaks to Boar Prime sounds."}},
        {tags={},text={"*Double-clicking an item in the Gear selection menu will now equip it, instead of either doing nothing, or asking you if you want to purchase more of said item."}},
        {tags={"Sentinel","Pickups",},text={"*Health Orbs now give your Sentinel HP."}},
        {tags={"Interception",},text={"*Context sounds added to Interception mode."}},
        {tags={"Jat Kittag",},text={"*Sound tweaks to Jat Kittag."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed Zoom Out option vanishing forever if you back out of a diorama in Solo mode."}},
        {tags={"Zephyr",},text={"*Fixed location and position of Emblems on Zephyr Warframe."}},
        {tags={},text={"*Fixed missing minimap in Jungle Tileset."}},
        {tags={"Capture",},text={"*Fixed issue with Client not getting capture progress when battling."}},
        {tags={},text={"*Fixed Auto-Fuse not fusing rare duplicates."}},
        {tags={"Vauban",},text={"*Fixed Vauban’s Vortex not ragdolling enemies."}},
        {tags={"Phobos",},text={"*Fixed multi-boss fights not working (Phobos)."}},
        {tags={},text={"*Fixed issue where client’s destroying an enemies armor would not be considered by the host."}},
        {tags={},text={"*Fixed “C” switching melee weapons instead of triggering voice chat."}},
        {tags={},text={"*Fixed issue with enemies spawning through the ground."}},
        {tags={"Earth",},text={"*Fix for issues loading Earth missions where on clients in long load scenario."}},
        {tags={"Defense","Earth",},text={"*Fixed and implemented preventive measures for this issues of AI falling into water basins in defense map ->%[%https://forums.warframe.com/index.php?/topic/173284-earth-defense-lith-bug-pictures-included/ ForumLink%]"}},
        {tags={"Exterminate",},text={"*Fixed issue where enemies requiring extermination were not being marked."}},
        {tags={},text={"*Fixed issue with enemies potentially spawning in floor."}},
        {tags={"Survival",},text={"*Fixed issue where Survival missions could be failed if you were in the process of reviving/ being revived."}},
        {tags={},text={"*Fixed various crashes."}},
},--fixes end

},--update end
{
["update number"]={"12.0.1"},
["type"]={"fix"},
["date"]={"February 6th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/173291-hotfix-1201/"},
["changes"]={
        {tags={},text={"*Changes to size of minimap."}},
        {tags={"Zephyr",},text={"*Zephyr now has Agile/Noble idle stances. First day on her new legs, tough to be confident enough for stances."}},
        {tags={"Zephyr","Lua","Research",},text={"*Zephyr Research at Moon Tier reductions:"}},
        {tags={},text={"**Blueprint: 50K to 20K"}},
        {tags={},text={"**Parts: 10 K to 2K"}},
        {tags={""},text={"<%br/>"}},
        {tags={"Clan","Research",},text={"*Sheldon confirming all clan tier research reduced as well :D ->%[%https://forums.warframe.com/index.php?/topic/173291-hotfix-1201/page-3#entry2032645 forum post%]"}},
        {tags={"Clan","Oxium",},text={":PSA: Over contributions resulting in negative Oxium in some clans cases, fixes ongoing."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed polarity Swap UI nuking polarities, if you selected a swap and then hit apply without making any changes, it would wipe your polarities."}},
        {tags={"Sentinel",},text={"*Fixed the Sentinels, they do nothing!"}},
        {tags={"Mods",},text={"*Fixed issues where mods increasing magazine capacity did nothing."}},
        {tags={"Natural Talent",},text={"*Fixed Natural Talent not being tradeable"}},
        {tags={"Sabotage","Earth",},text={"*Fixed reward tier not being set for players who didn’t add a toxin to the injector in earth Sabotage missions, as well as fixed screen not turning red for clients."}},
        {tags={"Lephantis",},text={"*Fixed issues with text on Lephantis Transmissions."}},
        {tags={"Drakgoon","Detron",},text={"*Fixed status chance for projectile weapons that shot multiple pellets (Drakgoon/Detron)."}},
        {tags={},text={"*Fixed a few crashing issues."}},
},--fixes end

},--update end
{
["update number"]={"12.0"},
["date"]={"February 5th, 2014"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/172913-update-12-zephyr-rises/"},
["title"]={"Zephyr Rises"},
["image"]={"U12ZephyrRises.png"},
["misc"]={
        {tags={"Alert","Darvo",},text={"*‘Ties That Bind’ – Darvo’s Alert return! For a Limited Time Only, play it before it’s gone!"}},
},--misc end
["additions"]={
        {tags={"Zephyr",},text={"*New Warframe – %[%[Zephyr%]%], the aeronautical Warframe (+ alternate helmet!)"}},
        {tags={"Phage","Clan","Research","Market",},text={"*New Weapon – “%[%[Phage%]%]” Infested Primary. Get it in the Market or Clan Research Today!"}},
        {tags={"Jat Kittag","Clan","Research","Market",},text={"*New Weapon – “%[%[Jat Kittag%]%]” Grineer Melee. Get it in the Market or Clan Research Today!"}},
        {tags={"Akstiletto","Clan","Research","Market",},text={"*New Weapon – “%[%[Akstiletto%]%]” Tenno Secondary. Get it in the Market or Clan Research Today!"}},
        {tags={"Cestra","Dual Cestra","Clan","Research","Market",},text={"*New Weapon – “%[%[Dual Cestra%]%]” – Dual wield your Cestras! Get it in the Market or Clan Research Today!"}},
        {tags={"Earth","Hunt",},text={"*Level Expansion – Hunt for the Grineer in the overgrown forests of Earth!"}},
        {tags={"Interception","Mobile Defense","Earth",},text={"*New Game Mode – “%[%[Interception%]%]” Territory Control Mode! This Mission type is making its debut on %[%[Earth%]%], check it out where Mobile Defense missions used to be!"}},
        {tags={"Clan","Research",},text={"*New Clan %[%[Dojo%]%] room available - Build Warframes in the %[%[Tenno Research Lab%]%]."}},
        {tags={"Clan",},text={"*New Clan Dojo Garden room + 8 new decorations!"}},
        {tags={"Nova","Saryn","Vauban","Volt",},text={"*4x new Warframe %'Immortal%' skins (Volt, Vauban, Saryn, Nova)"}},
        {tags={"Oberon",},text={"*“Oryx” Oberon Alternate Helmet"}},
        {tags={},text={"*%'%'%'HUD 2.0%'%'%' – all new look HUD with expanded informational output."}},
        {tags={},text={"*Added 3D character portraits for transmissions! Get ready to see your allies and foes come to life!"}},
        {tags={},text={"*Improved Mod management – including duplicate mod stacking and auto-install."}},
        {tags={},text={"*Enemy Leaders AI – specialized enemy types that spawn with improved stats and ally support abilities."}},
        {tags={},text={"*Added support for Steam Big Picture."}},
        {tags={"Market",},text={"*Added Daybreak colour picker to the Market."}},
        {tags={"Frost","Mag","Oberon","Prime",},text={"*Added avatar packs for Oberon, Mag Prime, and Frost Prime."}},
        {tags={"Ancient",},text={"*Completely reworked the sounds of all Infested Ancients - this is also the first time players will hear the winning sounds as voted on in the Design Council."}},
        {tags={"Forma",},text={"*Polarity Management is here! You can now swap the order of Polarities on your Forma’d gear!"}},
        {tags={"Interception","Natural Talent",},text={"*Reintroduced “Natural Talent” Mod, play the new Interception missions to find it today!"}},
        {tags={"Alert","Aura","Dead Eye",},text={"*Reintroduced “Dead Eye” Aura to the Alert Pool!"}},
        {tags={},text={"*“Training” Section now live in the Codex, a helpful area for all things Warframe!"}},
},--additions end
["changes"]={
        {tags={},text={"*%'%'%'Warframe Changes%'%'%':"}},
        {tags={"Nyx",},text={"**Improved sounds for Nyx’s Psychic Bolts."}},
        {tags={"Saryn",},text={"**Saryn’s Moult ability now causes radial damage when it is killed."}},
        {tags={"Valkyr",},text={"**Valkyr now has 600 base armor."}},
        {tags={"Valkyr","Dera",},text={"**Valkyr’s Hysteria ability now takes weapon damage and crit into consideration."}},
        {tags={"Ember","Frost",},text={"**Frost%'s Freeze now comparable to Ember’s Fireball ability."}},
        {tags={"Frost","Volt",},text={"**Frost’s Avalanche ability now has increased casting speed and damage."}},
        {tags={"Frost",},text={"**Frost’s Snowglobe now has health in the following values as upgraded/fused: 1500,2500,3000,3500."}},
        {tags={"Frost",},text={"**Frost’s Ice Wave now force procs slow (chill)."}},
        {tags={"Oberon",},text={"**Oberon%'s Regeneration projectile speed increase."}},
        {tags={},text={"*%'%'%'Weapon Changes%'%'%':"}},
        {tags={"Bow Weapons",},text={"**Bow weapons receive 1/3 damage buff + gave charged arrows innate puncture depth."}},
        {tags={"Dread",},text={"**Dread arrows have increased flight speed."}},
        {tags={"Embolist",},text={"**Embolist now has increased damage and forced poison proc."}},
        {tags={"Tigris",},text={"**Tigris now has improved damage, critical chance, and proc rate."}},
        {tags={"Hek",},text={"**Hek damage increased and more minimum damage added to falloff."}},
        {tags={},text={"**Hammer and Staff weapons now ragdoll enemies on charged attacks."}},
        {tags={"Vulkar",},text={"**Vulkar now has increased damage and proc rate."}},
        {tags={"Latron","Latron Prime","Prime",},text={"**Latron and Latron Prime now have increased damage."}},
        {tags={"Sentinel","Deth Machine Rifle",},text={"**Sentinel Deth Machine Rifle weapon now has 5PERZENTO crit chance."}},
        {tags={"Flux Rifle",},text={"**Flux Rifle now has improved damage and proc rate."}},
        {tags={"Volt",},text={"**Critical Chance and reload speed of bows slightly tweaked."}},
        {tags={"Aura",},text={"*%'%'%'Aura Changes%'%'%':"}},
        {tags={"Aura","Physique",},text={"**Physique Aura rebalanced (+3PERZENTO Health per level)"}},
        {tags={"Aura","Steel Charge",},text={"**Steel Charge Aura rebalanced (+5PERZENTO Damage per level)."}},
        {tags={"Aura","Rejuvenation",},text={"**Rejuvenation Aura rebalanced (+.5PERZENTO Heal Rate per level)."}},
        {tags={"Alert","Aura","Sprint Boost",},text={"**Sprint Boost Aura Rebalanced and re-released into Alert System. (+2.5PERZENTO per level, 10PERZENTO overall)."}},
        {tags={"Mods",},text={"*All Damage Resistance Mods buffed (2PERZENTO to 10PERZENTO per level)."}},
        {tags={"Defense","Void",},text={"*Void Defense missions are now Endless, they no longer have a set number of waves to complete."}},
        {tags={"Interception","Mobile Defense","Earth",},text={"*Mobile Defense removed from Earth in favor of new Interception game mode."}},
        {tags={"Crewmen",},text={"*Corpus Crewmen Helmets now are destroyed after taking an amount of damage, revealing a head that is open for headshots underneath!"}},
        {tags={"Banshee","Volt","Clan","Research",},text={"*Volt and Banshee parts can now be researched in the new Dojo Labs!"}},
        {tags={"Void","Prime",},text={"*Improvements made to the Void Drop table, find Prime Drop locations on the Wikia or Forums (%[%https://forums.warframe.com/index.php?/topic/172911-prime-gear-drop-locations/ forum post%])."}},
        {tags={"Trading",},text={"*Trading - Added “trade item changed” notification in trade screen."}},
        {tags={"Trading",},text={"*Trading logic changes: It%'s no longer %'turn based%' for the most part, you can change your offer at any time. Only when you accept the trade do you wait, for the other player to accept or make a change. Both players have to accept the current trade before it completes."}},
        {tags={},text={"*Reworked menu profile bar to accommodate new boosters."}},
        {tags={"Corpus Outpost",},text={"*Replaced some ice piles in Corpus Outpost with snow, that were being confused for game play related objects."}},
        {tags={},text={"*Further tweaks to radius and occlusion of 3D weapons."}},
        {tags={},text={"*Slight reduction in firework%'s particle count."}},
        {tags={"Jackal",},text={"*Lowered max height on Jackal missile volley to avoid detonation in the rafters."}},
        {tags={},text={"*Added new Grineer attack animations."}},
        {tags={"Alad V","Jupiter","Lotus",},text={"*Alad V and Lotus transmissions now appear in Jupiter."}},
        {tags={},text={"*Toned down the frequency and strength of rumble and alarm sounds in transition levels."}},
        {tags={},text={"*Random diorama music cues will now play at login screen."}},
        {tags={},text={"*Shortened the duration of the Day/Night cycle to be on 4 hour intervals."}},
        {tags={"Login Rewards","Sentinel",},text={"*Sentinel & Sentinel weapon XP added to login rewards."}},
        {tags={"Ember",},text={"*Reduced audio radius for Ember’s World on Fire ability."}},
        {tags={"Defense",},text={"*Replaced “Naked Nick” with a tinted Tenno Prisoner for the casket defense mode."}},
        {tags={"Derelict",},text={"*Visual language cleanup – Orokin Derelict keys now look more like keys."}},
        {tags={},text={"*Made some optimizations to several visual FX."}},
        {tags={"Capture","Survival",},text={"*Changed survival pickup and capture target objective marker icon."}},
        {tags={},text={"*Reloading after the last shot fired is now more responsive."}},
        {tags={"Glaive","Focus",},text={"*Made the glaive type weapons shrink when %'unfocused%' in arsenal."}},
        {tags={"Sentinel",},text={"*Sentinel Mod card duplicate images changed to have unique images."}},
},--changes end
["fixes"]={
        {tags={"Grineer Galleon",},text={"*Fixed door collision in Grineer Galleon that would block projectiles when shooting through the door."}},
        {tags={"Trading",},text={"*Fixed trading race condition on initial offer."}},
        {tags={"Trading",},text={"*Fixed trading Platinum being offered by both players."}},
        {tags={},text={"*Fixed %'Trades Remaining%' not updating when it is refilled on login."}},
        {tags={"Synapse","Spectra",},text={"*Fixed beam FX registration for Synapse and Spectra."}},
        {tags={},text={"*Fixed issue where stats were not updating for the selected Warframe that is being compared to the equipped."}},
        {tags={},text={"*Fixes to scarf physics."}},
        {tags={"Spectra",},text={"*Fixed animations for the Spectra reload."}},
        {tags={"Cernos",},text={"*Fixed holster positions of Cernos for multiple Warframes."}},
        {tags={},text={"*Fixed multiple issues where meshes were intruding other areas (tilesets invading eachother)."}},
        {tags={"Clan",},text={"*Fixed misnamed dojo props."}},
        {tags={"Sentinel","Death","Mods",},text={"*Fixed Sentinel weapons that lose their mods when they are revived after death."}},
        {tags={},text={"*Fixed enemy melee types that could hit the player twice in one swing."}},
        {tags={},text={"*Fixed some issues with cover and AI navigation across all maps."}},
        {tags={},text={"*Fixed the Galantine not having elemental FX on its blade."}},
        {tags={},text={"*Fixed a deadzone in the melee sweeps, which could cause attacks to miss where the enemy%'s full body collision started roughly where the player%'s hand is."}},
        {tags={"Void",},text={"*Fixed minimap for multiple Orokin Void rooms."}},
        {tags={},text={"*Fixed destroy sounds on breakable fan and vent covers."}},
        {tags={},text={"*Fixed some issues related to elevator door hints on mini-map."}},
        {tags={"Mobile Defense","Grineer Asteroid",},text={"*Fixed the Grineer asteroid floating cryopod bug in Mobile Defense."}},
        {tags={},text={"*Fixed the cryopod doors being triggered more than once by solo players."}},
        {tags={"Jackal","Mods",},text={"*Fixed Jackal not dropping Mods when defeated."}},
        {tags={},text={"*Fixed missing squad chat tab that was unavailable in-game."}},
        {tags={},text={"*Fixed some bugs related to the codex."}},
        {tags={},text={"*Fixed NPCs on clients to now play exit-cover transitions properly."}},
        {tags={},text={"*Fixed some zipline activation and landing points in multiple tile sets."}},
        {tags={"Ash",},text={"*Fixed teleport script still getting players in falling loops."}},
        {tags={"Invasion",},text={"*Fixed Operations panel not automatically appearing when goal/invasion arrives."}},
        {tags={},text={"*Fixed an issue where weapon attachments wouldn%'t update when cloaked."}},
        {tags={"Fusion","Fusion Core",},text={"*Fixed an issue where selecting a core after starting fusion mode would let you fuse into a fusion core."}},
        {tags={},text={"*Fixed edge cases of crashing when player1 is spectating player 2, and player 2 revives after dying causing player 1 to crash when trying to get a camera view from the other players avatar."}},
        {tags={},text={"*Fixed multiple reported crashes."}},
        {tags={"Tigris",},text={"*Fixed an issue with the Tigris where having an odd number of bullets could cause the reload animation to play twice."}},
        {tags={},text={"*Fixed weapon holster positions of many weapons across many Warframes."}},
        {tags={},text={"*Fixed multi-boss intro cinematics on clients."}},
        {tags={"Galatine",},text={"*Fixed Galatine clipping when jogging, jumping, or running."}},
        {tags={},text={"*Fixed NPCs from making noise when they shoot themselves - now they will only bark if an ally shoots them."}},
        {tags={"Defense",},text={"*Fixed the issue where disarmed enemies would not attack the player or the core in defense missions."}},
        {tags={"Master Thief",},text={"*Fixed Master Thief mod ceasing to function after a host migration."}},
        {tags={},text={"*Fixed character rotation errors that occur when moving between menu screens."}},
        {tags={"Zanuka Hunter",},text={"*Fixed hang and/or crash when reviving after Harvester kills you."}},
        {tags={"Lotus",},text={"*Fixed a number of repeating and incorrect Lotus lines."}},
        {tags={},text={"*Fixed display of crit-rate and crit-multiplier for projectile weapons (it was showing values lower than were actually being used)."}},
        {tags={},text={"*Fixed issue where player names did not appear in chat when players join or leave a match."}},
        {tags={},text={"*Fixed ‘Kill remaining enemies’ message from appearing after a host migration during the claim screen."}},
        {tags={},text={"*Fixed issue where Clients were not seeing Critical damage indicators if their shots were lethal as critical indicators were not shown if the enemy had no chance at surviving the shot."}},
},--fixes end

},--update end

}
return PatchData
```

