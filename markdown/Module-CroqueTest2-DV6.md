---
title: "Module:CroqueTest2/DV6"
wiki_url: "https://wiki.warframe.com/w/Module/CroqueTest2/DV6"
wiki_timestamp: "2018-04-16T12:12:14Z"
---

*Documentation for this module may be created at [Module:CroqueTest2/DV6/doc](/w/Module:CroqueTest2/DV6/doc?action=edit&redlink=1 "Module:CroqueTest2/DV6/doc (page does not exist)")*

```lua
local PatchData =
{
{
["update number"]={"6.5.3"},
["type"]={"fix"},
["date"]={"March 8th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/13457-update-65-hotfixes/"},
["title"]={""},
["image"]={""},
["misc"]={
        {tags={},text={"*Network Improvements"}},
        {tags={},text={"*Animation with holding %'floating%' gun fixed."}},
},--misc end

},--update end
{
["update number"]={"6.5.2"},
["type"]={"fix"},
["date"]={"February 22nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/13457-update-65-hotfixes/"},
["title"]={""},
["image"]={""},
["misc"]={
        {tags={},text={"*Idle Warframe Animation no longer breaks head/neck."}},
        {tags={},text={"*Squad count fixed."}},
        {tags={},text={"*Frozen Leaper animation for Client fixed."}},
        {tags={"Lato","Lato Prime","Prime",},text={"*Lato Mods are now Compatible with Lato Prime."}},
},--misc end

},--update end
{
["update number"]={"6.5.1"},
["type"]={"fix"},
["date"]={"February 22nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/13457-update-65-hotfixes/"},
["title"]={""},
["image"]={""},
["misc"]={
        {tags={"Ash",},text={"*Ash Shuriken crash fixed!"}},
},--misc end

},--update end
{
["update number"]={"6.5"},
["date"]={"February 22nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/13457-update-65/"},
["title"]={"Tenno Reinforcements"},
["image"]={"Amphis Update.png"},
["misc"]={
        {tags={},text={"%'%'%'New:%'%'%'{{clr}}"}},
        {tags={"Amphis","Reflect",},text={"Wield the deadly %'%'%'%[%[Amphis%]%]%'%'%'! This Grineer Heavy Staff is a traditional staff weapon that has received a monstrous makeover that reflects the design and culture of Grineer technology."}},
        {tags={""},text={"<%br/>"}},
},--misc end
["changes"]={
        {tags={},text={"*Enabled manual configuration of network ports in options menu to allow multiple players on the same LAN."}},
        {tags={},text={"*Several balancing tweaks to Rifles and Pistols. More Details %[%https://forums.warframe.com/index.php?/topic/13457-update-65-hotfixes/page__st__40#entry114064 Here%]"}},
        {tags={},text={"*Sped up weapon swap times."}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed boss kill counts not tracking properly in stats."}},
        {tags={},text={"*Leaper should no longer jump through walls."}},
        {tags={"Rhino",},text={"*Fixed issue with Rhino Stomp breaking if an enemy is just killed before the stomp."}},
        {tags={"Loki",},text={"*Fixed an issue with Loki Switch Teleport breaking if a target dies at right moment."}},
        {tags={},text={"*Fixed osprey exhaust effect."}},
        {tags={},text={"*Fixed an issue with Crawlers standing upright when shot."}},
        {tags={"Frost",},text={"*Fixed an issue with Snow Globe persisting if user dies and then revives while it is active."}},
        {tags={},text={"*Fixed poison clouds persisting after they%'ve expired for clients."}},
        {tags={},text={"*Resolution should now save properly when switching from fullscreen to windowed mode."}},
        {tags={},text={"*Fixed a UI error displaying incorrect resolution in options menu."}},
        {tags={"Excalibur","Nyx",},text={"*Excalibur Radial Javelin + Nyx Absorb no longer kills nearby Clients."}},
        {tags={},text={"*Chargers killed with freeze damage should now properly ragdoll."}},
        {tags={},text={"*Fixed a case where the player could be stuck finding squads."}},
        {tags={"Bolto",},text={"*Fixed Bolto projectiles firing in the wrong direction when standing close to an object."}},
        {tags={},text={"*Active squads count now properly shows matches from the appropriate region."}},
        {tags={},text={"*Improved loading times for large levels."}},
        {tags={},text={"*Fix for melee AI having issues attacking larger targets."}},
        {tags={},text={"*AI should no longer target invisible players."}},
        {tags={"Bolto",},text={"*Bolto projectiles should now be less affected by lag and more reliable at hitting targets."}},
        {tags={"Loki",},text={"*Radial Disarm should no longer de-level the enemy to level 1."}},
        {tags={"Nyx",},text={"*Log file should no longer receive error spam when using Nyx."}},
        {tags={},text={"*Fixed some enemy ragdolls not despawning properly."}},
        {tags={"Ash",},text={"*Corrected Shuriken accuracy, especially on higher FOV settings."}},
        {tags={"Excalibur",},text={"*Radial Javelin should now target airborne enemies properly."}},
},--fixes end

},--update end
{
["update number"]={"6.4.2"},
["type"]={"fix"},
["date"]={"February 23rd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/12232-update-64-hotfixes/?page=9&tab=comments#comment-103141"},
["misc"]={
        {tags={},text={"*Saturated Color Picker Added for on sale 1 Credit (Limited Time Only)!"}},
        {tags={},text={"*Auto Strict-NAT Network Tool will only display at start-up."}},
        {tags={},text={"*Users behind same Strict-NAT can once again play together!"}},
},--misc end

},--update end
{
["update number"]={"6.4.1"},
["type"]={"fix"},
["date"]={"February 22nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/12232-update-64-hotfixes/?page=4&tab=comments#comment-101407"},
["misc"]={
        {tags={},text={"*fixed squad sizes getting capped at 3 players instead of 4"}},
        {tags={},text={"*restored default color palette back to original colors"}},
        {tags={},text={"*fixed obnoxiously loud ricochet sounds"}},
        {tags={"Nyx",},text={"*removed unwanted background sound effect attached to Nyx"}},
        {tags={},text={"*fixed gore effects not appearing for some players"}},
        {tags={"Frost","Nyx",},text={"*fixed Chaos, Absorb, and Avalanche animations repeating if player was knocked down while casting"}},
        {tags={},text={"*fixed flashlights not working in some Infestation levels"}},
},--misc end

},--update end
{
["update number"]={"6.4"},
["date"]={"February 22nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/12232-update-64-hotfixes/"},
["title"]={"Tenno Reinforcements"},
["image"]={"Axe Skins.jpg"},
["misc"]={
        {tags={},text={"%'%'%'Community News:%'%'%'{{clr}}"}},
        {tags={},text={"Warframe: Q&A LIVESTREAM, February 27 @ 1:00 PM EST."}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Our first Dev Q&A video was a hit, so we’re taking it one step further: LIVESTREAM DEV Q&A!"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"More info %[%https://forums.warframe.com/index.php?/topic/12231-developer-livestream-qa-february-27th/ here%]"}},
        {tags={""},text={"<%br/>"}},
},--misc end
["additions"]={
        {tags={"Dual Zoren","Scindo",},text={"*%'Dagger Axe%' skins added to the Market for Scindo and Dual Zoren."}},
        {tags={},text={"*FOV slider added to display options."}},
        {tags={""},text={"<%br/>"}},
},--additions end
["changes"]={
        {tags={},text={"*Player must now login to the launcher to receive updates, going from launcher to game logs player in automatically."}},
        {tags={},text={"*Enemies affected by freeze damage mods will now have an effect applied to their model."}},
        {tags={},text={"*AI death from freeze damage now causes them to shatter."}},
        {tags={},text={"*Options menu tabs now have a roll over effect when highlighted."}},
        {tags={"Lex",},text={"*Lex balancing (less recoil, slightly higher fire rate)"}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={"Defense",},text={"*Fix for frozen enemies messing with Defense wave counters."}},
        {tags={},text={"*Restorative items now use the proper effects."}},
        {tags={},text={"*Fixed a case where players could consume their last weapon in a slot for a blueprint."}},
        {tags={},text={"*Temporary invulnerability added to beginning of bleedout to prevent near instant bleedout timer."}},
        {tags={"Grineer Asteroid",},text={"*Client logs will not be spammed when playing a Grineer Asteroid level."}},
        {tags={},text={"*Fixed an issue with co-op doors and dead spectating players."}},
        {tags={},text={"*Fixed several problems with aggregated stat views."}},
        {tags={},text={"*Dying on an elevator no longer causes body to fall through elevator."}},
        {tags={},text={"*Fix for being stuck in place for several seconds after a skipped cinematic."}},
        {tags={},text={"*Fixed taking damage during a cinematic."}},
        {tags={"Frost",},text={"*Fixed freeze damage actually speeding up some AI animations."}},
        {tags={},text={"*Fix for Bullet Attractor attach position not always looking great."}},
        {tags={"Clan",},text={"*Fix for enemies running away during tutorial/dojo tests."}},
        {tags={},text={"*Fix for text not appearing on the upgrade screen when language is set to Chinese."}},
        {tags={},text={"*Fix for gear names overlapping prices."}},
        {tags={"Clan",},text={"*Fixed an issue with clan chat messages sometimes not showing up."}},
        {tags={"Clan",},text={"*New clan members now update their clan status upon accepting a clan invite."}},
        {tags={"Ash",},text={"*Gravity is now disabled during Bladestorm preventing player from falling after each strike."}},
        {tags={},text={"*Fixed Infestation boss being in wrong boss room."}},
        {tags={"Maneuvers"},text={"*Roll can now interrupt a reload."}},
        {tags={"Maneuvers"},text={"*Pressing V no longer causes the player to roll."}},
        {tags={},text={"*Ammo pickups are shared for all players in a match."}},
        {tags={"Exterminate",},text={"*Fix for certain AI showing as a target on the minimap in Exterminate missions."}},
        {tags={},text={"*Fixed security camera death effect position."}},
        {tags={},text={"*Fix for multiple damage immunity effects occurring at the same time causing various issues."}},
        {tags={},text={"*Fixed fullscreen setting not saving if player used Alt+Enter without saving display options after."}},
        {tags={},text={"*Fix for host migration causing pickups to disappear."}},
        {tags={"Mag","Volt",},text={"*Fix for Crush and Overload animations continuing after being knocked down."}},
        {tags={},text={"*Likely fix for resolution changes not being saved for some users"}},
        {tags={"Grineer Asteroid",},text={"*Fixed an issue for certain Grineer Asteroid level layouts not spawning enemies until reaching the end"}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={},text={"*Thanks for all the new updates, Tenno Operatives!"}},
},--localizations end

},--update end
{
["update number"]={"6.3.4"},
["type"]={"fix"},
["date"]={"February 19th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/10762-update-63-hotfixes/"},
["misc"]={
        {tags={"Braton Vandal","Vandal",},text={"*Removed Open-Beta Weekend %'Braton Vandal%' from Market."}},
        {tags={"Frost","Rhino",},text={"*Boosted Rhino and Frost base sprint by 5%."}},
        {tags={},text={"*Lowered base Damage of Toxic Ancient cloud."}},
        {tags={"Rhino",},text={"*Rhino Radial Blast does more damage as it levels."}},
        {tags={"Rhino",},text={"*Rhino Stomp stun length escalates with level increase."}},
        {tags={"Defense",},text={"*Defense spawn room Navigation fix"}},
        {tags={"Trinity",},text={"*Improved Trinity speed for Health trade off."}},
},--misc end

},--update end
{
["update number"]={"6.3.3"},
["type"]={"fix"},
["date"]={"February 15th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/10762-update-63-hotfixes/"},
["misc"]={
        {tags={},text={"*Fixed Nervos targeting you if downed"}},
        {tags={},text={"*Fixed Nervos repeatedly stun locking character, no break out time"}},
        {tags={},text={"*Broken Objective marker has been fixed in Grineer levels."}},
        {tags={""},text={"<%br/>"}},
},--misc end

},--update end
{
["update number"]={"6.3.2"},
["type"]={"fix"},
["date"]={"February 15th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/10762-update-63-hotfixes/"},
["misc"]={
        {tags={"Ash",},text={"*Bladestorm improvements: Ash is now invulnerable when using Bladestorm."}},
        {tags={"Ash",},text={"*Fixed an edge case where Bladestorm would fail to target any enemies."}},
        {tags={"Ash",},text={"*Bladestorm increased number of enemies targeted to: 7, 9, or 12 depending on level."}},
        {tags={"Mobile Defense","Eris",},text={"*Added an Infestation version of %'Mobile Defense%' in Eris."}},
        {tags={"Braton Vandal","Vandal",},text={"*Fixed rifle mods not being compatible with new Braton Vandal."}},
        {tags={"Loki","Mag",},text={"*Can no longer use Switch Teleport or Pull on teammates standing in mission extraction zone."}},
        {tags={},text={"*Fixed a couple edge case crashes in physics and net code."}},
},--misc end

},--update end
{
["update number"]={"6.3.1"},
["type"]={"fix"},
["date"]={"February 15th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/10762-update-63-hotfixes/"},
["title"]={"Open Beta Weekend"},
["misc"]={
        {tags={},text={"%'%'%'New:%'%'%'{{clr}}"}},
        {tags={"Braton Vandal","Vandal",},text={"Braton Vandal added for this weekend only"}},
        {tags={"Braton Vandal","Vandal",},text={"%[%[File:Braton Vandal update.jpg|660px|center%]%]"}},
        {tags={""},text={"<%br/>"}},
},--misc end
["changes"]={
        {tags={},text={"*Love is fleeting and has been removed from the game - but we have a little love left and will extending the life of our Valentine colour picker through Open Beta Weekend!"}},
        {tags={},text={"*Ammo boxes now have unique models and colours depending on the type of ammo."}},
        {tags={"Ash",},text={"*Bladestorm power changed, attacks 5, 7, or 9 targets based on level and teleports back to starting position when the ability ends."}},
        {tags={},text={"*Text cursor will default to the password box if email is auto populated."}},
        {tags={"Dual Skana",},text={"*Damage adjustments for the Dual Skanas."}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={"Mobile Defense",},text={"*Fixed doors locking down during mobile defense mission."}},
        {tags={"Gram",},text={"*Remove hum sound from Gram."}},
        {tags={},text={"*Prevent more than 2 Nervos being deployed at once."}},
        {tags={},text={"*Prevent debilitated players from being targeted."}},
        {tags={},text={"*Fixed artifact card being selectable while Contacts list is open."}},
        {tags={"Bolto",},text={"*Fixed an issue with Bolto projectiles velocity slowing to zero while in the air still."}},
        {tags={"Mobile Defense",},text={"*Fixed not being able to fail mobile defense missions after a host migration."}},
        {tags={},text={"*Fixed an issue with players playing the debilitated animation while playing another animation."}},
        {tags={"Mag"},text={"*Fix for bullet attractor having issues targeting Grinders."}},
        {tags={},text={"*Fixed page selector so it is less confusing: Next/Previous now move over 1 page, First/Last behave as expected and current page should always be highlighted."}},
},--fixes end

},--update end
{
["update number"]={"6.3"},
["date"]={"February 14th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/10554-update-63-make-love-not-warframe/"},
["title"]={"Make Love, Not War(frame)"},
["image"]={"Kraken Update.jpg"},
["additions"]={
        {tags={},text={"*11 brand new rooms for Grineer environment set"}},
        {tags={"Mobile Defense",},text={"*New game mode! Mobile Defense missions are now available."}},
        {tags={},text={"*New enemy types: The Grineer Seeker with a devastating new attack."}},
        {tags={"Kraken",},text={"*New weapon added: Grineer Heavy Pistol (%[%[Kraken%]%])"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Special Limited Additions:%'%'%'"}},
        {tags={},text={"*Valentine’s Day Colour palette –"}},
        {tags={},text={"*Valentine’s Day Theme – love is in the air!"}},
        {tags={},text={"*These are %'%'%'%'%'one day only%'%'%'%'%', get ‘em while they%'re hot!"}},
        {tags={""},text={"<%br/>"}},
},--additions end
["changes"]={
        {tags={},text={"*Inventory screen now only shows 10 pages of items at a time, added First and Last buttons as well"}},
        {tags={"Maneuvers"},text={"*Player will now slide back down a wall if they reach the peak of their wall run without jumping off"}},
        {tags={},text={"*Avatar can now be rotated on the colour picker screen"}},
        {tags={"Alert",},text={"*Increase probability of Alerts dropping blueprints"}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={},text={"*Skill tree fixes for activation and network"}},
        {tags={"Nyx",},text={"*Mind controlled AI can now be damaged by players while still mind controlled"}},
        {tags={},text={"*Bosses will now stagger instead of being knocked down in most cases"}},
        {tags={},text={"*Fixed an issue with consumables that may have had bad data allowing them to never expire"}},
        {tags={},text={"*Boss cinematics should now play even if there is a dead player spectating"}},
        {tags={},text={"*Fix for opening player list and consumable menu at the same time"}},
        {tags={},text={"*Fixes for leech and mine projectiles in MP"}},
        {tags={},text={"*Fix for Clients getting a shortened bleedout timer if killed by radial damage"}},
        {tags={},text={"*Infested Chargers now properly ragdoll when killed by elemental effects"}},
        {tags={},text={"*Local Reflections settings now properly save"}},
        {tags={"Nyx",},text={"*Nyx%'s mind control visual effect now lasts the same duration as the power itself"}},
        {tags={"Volt",},text={"*Fix for Overload blocking player melee as while the power is still damaging enemies"}},
        {tags={},text={"*Contact list UI improvements"}},
        {tags={},text={"*Clicking on the Market banners now open the correct item page"}},
        {tags={},text={"*Game will now wait for all players to connect after a host migration before giving the new host control"}},
        {tags={"Gram",},text={"*Gram hit box improved"}},
        {tags={"Heat Sword",},text={"*Dual Heat Sword charge attack fixed"}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={},text={"*85 German updates from Clemonde, philversprechend"}},
        {tags={},text={"*254 Spanish updates from DeadlyShadow"}},
        {tags={},text={"*68 French updates from Ivanoiide, Kreylan"}},
        {tags={},text={"*201 Italian updates from kreel, Maleklum"}},
        {tags={},text={"*104 Japanese updates from Gashin, lunarian"}},
        {tags={},text={"*13 Korean updates from"}},
        {tags={},text={"*140 Polish updates from iffyJinx, SabreUr, Troold, Wac3"}},
        {tags={},text={"*18 Portuguese updates from Orphen"}},
        {tags={},text={"*75 Russian updates from B1ind, FedorHooch, Grayscarr, Moloxix, n7snk"}},
        {tags={},text={"*181 Chinese updates from Keinez, Krisstina, loliconest, The_BBQ"}},
},--localizations end

},--update end
{
["update number"]={"6.2.3"},
["type"]={"fix"},
["date"]={"Feb 12th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/9532-update-6-hotfix-62/"},
["misc"]={
        {tags={},text={"*Fixed players randomly being returned to a non-functional lobby when loading into Grineer missions"}},
        {tags={},text={"*Fixed higher level/upgraded warframe abilities not being available when playing as client"}},
        {tags={},text={"*Fixed lobby attempting to join other squads after switching to SOLO mode"}},
},--misc end

},--update end
{
["update number"]={"6.2"},
["date"]={"February 8th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/9532-update-6-hotfix-62/"},
["title"]={"Tenno Reinforcements"},
["image"]={"New weapons 6-2.jpg"},
["misc"]={
        {tags={},text={"%'%'%'TENNO REINFORCEMENTS: WEAPONS ADDED!%'%'%'"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"Get ready for..."}},
        {tags={"Gram",},text={"*%[%[Gram%]%]: A devastating GreatSword!"}},
        {tags={"Dual Heat Swords",},text={"*%[%[Dual Heat Swords%]%]: slice with twice the power!"}},
        {tags={"Boltor",},text={"*%[%[Boltor%]%] Model Updated: A new look for a new favourite weapon!"}},
        {tags={""},text={"<%br/>"}},
},--misc end
["additions"]={
},--additions end
["changes"]={
},--changes end
["fixes"]={
        {tags={},text={"*Affinity, health, and ammo pick-ups are now duplicated when dropped so that all players have the opportunity to collect them."}},
        {tags={"Bolto","Excalibur"},text={"*Fixed Bolto & Javelin projectiles carrying enemies for unrealistic distances."}},
        {tags={},text={"*Fixed Rifle Challenge not counting kills that were made with elemental damage."}},
        {tags={},text={"*Fixed UI bug allowing helmets to be equipped on arbitrary Warframes."}},
        {tags={},text={"*Fixed being able to wall run through doors in certain circumstances."}},
        {tags={},text={"*Fixed player getting stuck in wall run animation when zip-lining immediately after wall running."}},
        {tags={},text={"*Fixed enemies killed by player AoE attacks not tracking in kill stats."}},
        {tags={"Dual Zoren",},text={"*Dual Zoren balancing: Increased critical chance and increased critical damage."}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={},text={"*308 French updates from amtarace, (kolookool), Ln_Fridfromedisailleur, Slick Joint"}},
        {tags={},text={"*153 Italian updates from Edheldui, genesx, Kingdrake, kreel, Maleklum, pascalbrax, Saddy4, Snake3000"}},
        {tags={},text={"*309 German updates from Afinda, Clemonde, freakysteo101, Noa3, philversprechend, Tillomaticus"}},
        {tags={},text={"*102 Spanish updates from Deadly Shadow, RareApo, Rexgad, SgtSpectre, zineasta"}},
        {tags={},text={"*204 Japanese updates from Gashin, k1sEy, lunarian, WhiteNekophus"}},
        {tags={},text={"*237 Korean updates from SpringNote, Cushion"}},
        {tags={},text={"*276 Polish updates from barrakketh, Flugcojt, iffyJinx, klops, SabreUr, Troold, Wac3"}},
        {tags={},text={"*304 Portuguese updates from Azdragoras, BathrobeHero, Gnoman, Kokuen, Kysuke, Orphen, Tardivex, Tarmhorn, Vethis, vitorbf"}},
        {tags={},text={"*346 Russian updates from B1ind, Dyshes, fafnir4ik, FedorHooch, Grayscarr, Moloxix, n7snk, (razer.crusader)"}},
        {tags={},text={"*1105 Ukrainian updates from BlooDONER, dantistnfs, EvilAndrew, iKillUnicorns, snakusoid, ((raneydnext))"}},
        {tags={},text={"*959 Chinese updates from AminoaCow, Keinez, Krisstina, loliconest, sternguard, The_BBQ"}},
},--localizations end

},--update end
{
["update number"]={"6.1.3"},
["type"]={"fix"},
["date"]={"February 5th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/7727-update-6-hotfixes/"},
["misc"]={
        {tags={},text={"*Fixed 65K health bug"}},
        {tags={"Boltor",},text={"*Changed Boltor stats"}},
},--misc end

},--update end
{
["update number"]={"6.1.2"},
["type"]={"fix"},
["date"]={"February 5th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/7727-update-6-hotfixes/"},
["misc"]={
        {tags={"Excalibur","Frost","Nyx",},text={"*Nyx, Frost and Excalibur Alt Helmet changes"}},
        {tags={},text={"*Fixed grenade throwing for AI as well as tweaking grenade damage"}},
        {tags={},text={"*Security cameras no longer get alerted by AI on different factions"}},
        {tags={},text={"*Fixed Brightness, Contrast, Local Reflections and Tutorials Enabled not taking effect"}},
        {tags={"Boltor",},text={"*Boltor tweaks: Faster fire rate, less damage"}},
        {tags={},text={"*Daggers now bypass armor"}},
        {tags={"Heat Dagger",},text={"*Heat Dagger added to store"}},
},--misc end

},--update end
{
["update number"]={"6.1.1"},
["type"]={"fix"},
["date"]={"January 31st, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/7727-update-6-hotfixes/"},
["misc"]={
        {tags={"Lech Kril",},text={"*Fixed Lech Kril blueprint drops"}},
        {tags={},text={"*Fixed being able to play locked missions in solo mode"}},
        {tags={},text={"*Possible contact list fixes!"}},
},--misc end

},--update end
{
["update number"]={"6.1"},
["date"]={"January 30th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/7727-update-6-hotfixes/"},
["misc"]={
        {tags={},text={"*Fixed objective not appearing correctly on mini map in some Grineer locations."}},
        {tags={},text={"*Added some missing control panels in Grineer areas."}},
        {tags={},text={"*Fixed crash when joining mission while boss intro cinematic is playing."}},
        {tags={},text={"*Fixed pickups falling through floor after spawning."}},
        {tags={},text={"*Fixed overly loud zip-line sound FX."}},
        {tags={"Jackal",},text={"*Fixed extra/inanimate jackal appearing after his intro cinematic."}},
        {tags={"Vor",},text={"*Fixed Captain Vor not spawning until host player enters boss room."}},
        {tags={},text={"*Removed sort-by-price of Mods in inventory."}},
        {tags={},text={"*Fixed inventory screen appearing blank if player owned a large quantity of Mods."}},
        {tags={"Alert",},text={"*Fixed loss of functionality/crash when Accepting an alert mission quickly after viewing it."}},
        {tags={},text={"*Fixed Ancients getting stuck when attempting to melee."}},
        {tags={},text={"*Fixed Loot Corpse message not disappearing after looting corpses."}},
        {tags={"Nyx",},text={"*Fixed Mind Control FX not appearing."}},
        {tags={},text={"*Fixed visual effects not applying to Warframe helmets."}},
        {tags={},text={"*Fixed selling of blueprints and added safeguards against selling blueprints that are currently being built."}},
        {tags={"Rhino",},text={"*Fixed Warframe skins being incorrectly listed as %'Rhino Chassis%'."}},
        {tags={},text={"*Fixed Health Bonus upgrades not working."}},
        {tags={},text={"*Corrected store descriptions for health and shield restore items."}},
},--misc end

},--update end
{
["update number"]={"6.0"},
["date"]={"January 29th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/7485-update-6-new-stompin%E2%80%99-grounds/"},
["title"]={"New Stompin%' Grounds"},
["misc"]={
        {tags={},text={"%'%'%'***BETA-NOTICE***%'%'%'"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Forced respec has been done for all Warframes! Please use the Arsenal screen to redesign your upgrades and Mods from an expanded set!%'%'%'"}},
        {tags={""},text={"<%br/>"}},
},--misc end
["additions"]={
        {tags={"Grineer Asteroid",},text={"*All New Grineer Asteroid Base – explore and battle in a brand new location set!"}},
        {tags={"Frost",},text={"*Frost! A new ice-based Warframe with chilling power!"}},
        {tags={"Nyx",},text={"*Nyx! A psychic-based Warframe named by our Design Council!"}},
        {tags={"Maneuvers"},text={"*Wall Running – a new Space Ninja Style mobility option to master!"}},
        {tags={},text={"*Zip-lines – take on foes while ziplining across the more open spaces of the Grineer set!"}},
        {tags={"Boltor","Akbolto","Dual Zoren",},text={"*New weapons: Dual Zoren, Akbolto, and Boltor!"}},
        {tags={},text={"*Alternate helmet designs available in the Market for several Warframes."}},
        {tags={"Ceres","Eris","Star Chart"},text={"*Solar Map has expanded with two new regions: Ceres and Eris."}},
        {tags={},text={"*Two more deadly bosses added, proceed with caution, Tenno!"}},
        {tags={},text={"*More enemy types have emerged: Grinder and Infested Charger."}},
        {tags={},text={"*Dynamic Lighting added to Display Options for those with older hardware."}},
        {tags={},text={"*Firewall/NAT detection added to Options to diagnose connectivity/contact issues."}},
        {tags={""},text={"<%br/>"}},
},--additions end
["changes"]={
        {tags={},text={"*Each Warframe now has a custom upgrade tree with more choices and increased specialization! You must respec as a result of this change!"}},
        {tags={},text={"*Player will now be teleported back to their previous spot on the ground after jumping into pits."}},
        {tags={"Titania",},text={"*Warframes now have different starting statistics for key attributes."}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={"Jackal",},text={"*Fix for Jackal falling through elevator and not spawning in proper room."}},
        {tags={},text={"*Fixed issue where players were stuck on black screen if mission failed."}},
        {tags={},text={"*Fixed disappearing datamass problems on host crashes."}},
        {tags={},text={"*Fixed extraction ship disappearing when all players were in level-end without completing missions."}},
        {tags={},text={"*UPnP, connectivity and Contact fixes. If you are still having problems run the Network test on the Options screen."}},
        {tags={},text={"*Performance improvements for particle-heavy scenes (fire and ice)."}},
        {tags={},text={"*Launcher and Update fixes related to local internet caches and work-offline modes."}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={},text={"*1209 Chinese updates from AminoaCow, Bayah, Krisstina, sternguard, Tarlafic and The_BBQ"}},
        {tags={},text={"*741 French updates from amtrace, Ln_Fridfromedisailleur, NorthernLightT, SlickJoint, xanthony and YnotnA"}},
        {tags={"Ash",},text={"*375 Japenese updates from Gashin, GF5700, lunarian and WhiteNekophus"}},
        {tags={},text={"*228 Polish updates from barrakketh, Daroslaw, Flugcojt, iffyJinx, Lorthar, SabreUr, Troold and Wac3"}},
        {tags={},text={"*150 Russian updates from Dyshes, FedorHooch, Grayscarr, Moloxix, n7snk and YTUX"}},
        {tags={},text={"*132 Portuguese updates from Azdragoras, BathrobeHero, Goggles, Kokuen and Orphen"}},
        {tags={"Clem",},text={"*123 German updates from Clemonde, Exceed, freakysteo101, Noa3, ScHlAuChi and Tillomatics"}},
        {tags={},text={"*109 Spanish updates from SgtSpectre, DeadlyShadow and Rexgad"}},
        {tags={},text={"*96 Italian updates from akrennes, Kingdrake, kreel, Maleklum, pascalbrax and Snake3000"}},
        {tags={},text={"*77 Korean updates from SpringNote"}},
        {tags={},text={"*55 Ukranian updates from EvilAndrew and Jupter87a"}},
},--localizations end

},--update end
{
["update number"]={"5.4.3"},
["type"]={"fix"},
["date"]={"January 23rd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/5233-54-hotfixes/"},
["changes"]={
        {tags={},text={"*Various crash fixes & loc updates"}},
        {tags={},text={"*Fixed level 1 mods being dropped by higher enemies"}},
},--changes end

},--update end
{
["update number"]={"5.4.2"},
["type"]={"fix"},
["date"]={"January 23rd, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/6414-hotfix-542-fixin-for-fixes/"},
["changes"]={
        {tags={},text={"*Improved distribution of XP to melee weapons."}},
        {tags={},text={"*Mod generation changes. Weapon-specific mods are more potent. Fixed bug in value ranges. Should be less confusing now."}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed launchers fault tolerance when checking for downloads/updates, should eliminate hangs."}},
        {tags={"Jackal",},text={"*Fixed jackal getting stuck under floor on boss fights."}},
        {tags={"Ember",},text={"*Fixed Ember%'s head not appearing during cinematics as well as not retaining customized colors."}},
        {tags={},text={"*Fixed login screen not displaying last-equipped Warframe."}},
        {tags={},text={"*Fixed mouse button presses on Contacts overlay being unintentionally handled by Mission Selection screen in background."}},
        {tags={"Defense","Sabotage",},text={"*Fixed missing mission UI indicators: Defense Cryopod health and Sabotage Extraction timer are back!"}},
        {tags={},text={"*Fix multiplicative stacking in mods (work-in-progress)."}},
        {tags={},text={"*Various Crash Fixes."}},
},--fixes end

},--update end
{
["update number"]={"5.4.1.5"},
["type"]={"fix"},
["date"]={"January 18th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/5233-54-hotfixes/"},
["misc"]={
        {tags={},text={"*Fixes to Mod drop levels / rarity."}},
        {tags={},text={"*Crash fixes during update."}},
        {tags={},text={"*Rank exploits fixed."}},
        {tags={},text={"*Fixed a few cases where setting wouldn%'t save (illegal characters). Sorry but this one resets your settings."}},
        {tags={},text={"*Balance changes for out of control critical damage Mods."}},
},--misc end

},--update end
{
["update number"]={"5.4.1"},
["type"]={"fix"},
["date"]={"January 18th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/5233-54-hotfixes/"},
["misc"]={
        {tags={},text={"*Fixed a long-standing memory corruption bug that was the cause of many random crashes."}},
        {tags={},text={"*Mod drop levels determined by enemy killed not your inventory. No more farming Mercury for level 30 Mods."}},
        {tags={"Foundry",},text={"*Foundry enforced player level requirements. Fix checks for unranked players."}},
        {tags={},text={"*Minimap rendering changed to use navigation mesh. Necessary for upcoming environment. Work-in-progress..."}},
        {tags={},text={"*Preliminary in-game update message when updates are pushed (working on getting this to sync better with our CDN)."}},
        {tags={},text={"*Hardware failure check to detect problems due to faulty RAM, overclocking instability, heat problems."}},
        {tags={},text={"*Signin rewards UI shows required days to reach tiers."}},
        {tags={},text={"*Added fallbacks when trying to join a session that ends while joining."}},
        {tags={},text={"*Fix chosen Artifacts cards not showing promptly in Front-end."}},
        {tags={},text={"*Fix double cameras after host migration."}},
        {tags={},text={"*Fix crashes in AI and animation."}},
        {tags={},text={"*Fix Corpus laser door networking issues."}},
        {tags={},text={"*Fix over-bloom on characters."}},
        {tags={},text={"*Fix for doors/elevator problems with join-in-progress."}},
        {tags={},text={"*Improvements to prevent accidental selling in Inventory. Work-in-progress..."}},
        {tags={"Redirection",},text={"*Fix rockets and redirectional power."}},
        {tags={"Ash","Volt",},text={"*Energy cost changes for Volt and Ash."}},
        {tags={},text={"*Launcher can now resume bulk downloads if the connection to CDN times out."}},
        {tags={},text={"*Fix network problem with other player showing shield > 100%."}},
        {tags={"Clan",},text={"*Dojo enemies now scale up in level. Work-in-progress..."}},
        {tags={"Fragor","Scindo",},text={"*Fix elemental effects not showing on Scindo, Fragor and many crafted Swords and Daggers."}},
        {tags={},text={"*Energy pickups are now shared with other players. More energy in Coop!"}},
        {tags={"Volt",},text={"*Fixes for Volt overload being over-powered, then under-powered. Does radial damage as well."}},
        {tags={"Alert",},text={"*Fix quit exploits with Alerts."}},
        {tags={},text={"*Fix revive from Pause menu."}},
        {tags={},text={"*Prevent join-in-progress of late-stage missions."}},
        {tags={},text={"*Relax video card restrictions in Launcher."}},
        {tags={},text={"*Fix Artifacts not applying with join-in-progress."}},
        {tags={},text={"*AI will not incorrectly target Turrets anymore."}},
        {tags={},text={"*Update APEX libraries to improve Nvidia PhysX Effects stability."}},
        {tags={},text={"*Add help option for chat commands."}},
        {tags={},text={"*Fix Shotgun Ammo Pack reward being 0."}},
        {tags={},text={"*Fix disarm exploit for some bosses."}},
        {tags={"Clan",},text={"*Fix for Contacts list not working when you have large number of Contacts/Clan members."}},
        {tags={"Fragor","Scindo",},text={"*Additional attack animation for Scindo and Fragor"}},
        {tags={"Alert",},text={"*Alert enemy levels are now using their region level range."}},
        {tags={},text={"*Stamina Mods for Warframes added."}},
        {tags={},text={"*Fix Corpus Security Cams being alert when they shouldn%'t. Work-in-progress..."}},
        {tags={},text={"*Fix chat window input text being erased as presence changes came in."}},
        {tags={},text={"*Fix Warframe Armor Mods being most common type."}},
        {tags={},text={"*Disabled non-XInput joystick enumeration that was causing instability."}},
        {tags={},text={"*Improvements to %'massive lag%' problems caused when a client re-joins a session they had left."}},
        {tags={},text={"*Fix %'too many%' Ancients in some missions."}},
},--misc end

},--update end
{
["update number"]={"5.4"},
["date"]={"January 14th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/4030-update-54-hammer-time-preview/"},
["title"]={"Hammer Time"},
["additions"]={
        {tags={"Fragor","Scindo",},text={"*%[%[Scindo|SCINDO%]%] and %[%[Fragor|FRAGOR%]%] added to the Market. Slow, powerful, multi-hit weapons for lovers of heavy-metal!"}},
        {tags={""},text={"<%br/>"}},
},--additions end
["changes"]={
        {tags={},text={"*Inventory screen now shows level of item."}},
        {tags={},text={"*Settings screen now detects APEX support and disables the option if not supported."}},
        {tags={},text={"*Pistol ammo increased for all pistol types."}},
        {tags={"Gorgon","Hek",},text={"*Balance changes for Gorgon and Hek."}},
        {tags={},text={"*Shield Mods increased in power."}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={"Spy",},text={"*Fixes to Spy missions and secondary objectives."}},
        {tags={},text={"*Fixed dying while hacking a terminal"}},
        {tags={"Loki",},text={"*Cryopod can no longer be switch-teleported."}},
        {tags={},text={"*Fixes to keypass objective marker not always sticking around."}},
        {tags={"Alert",},text={"*Fixed being able to play the same alert multiple times."}},
        {tags={},text={"*Fix for some users incorrectly receiving an error message about their graphics card."}},
        {tags={},text={"*Fixes for Upgrade tree broken on some items."}},
        {tags={},text={"*Fixed issue with pausing in an elevator."}},
        {tags={"Jackal",},text={"*Jackal will now spawn if players run in to the elevator pit before encounter has started."}},
        {tags={},text={"*Fix for VoIP breaking after one match."}},
        {tags={"Jackal",},text={"*Potential fix for Jackal stomp loop."}},
        {tags={},text={"*Fixes for packet drops breaking contact list."}},
        {tags={},text={"*Fixes for Corpus laser-doors."}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={},text={"*1294 Korean updates from Dingo, SpringNote and Switch_."}},
        {tags={},text={"*937 Russian updates from Crond, Digimortal, Dyshes, FedorHooch, Grayscarr, SaSslx86, Moloxix and YTUX."}},
        {tags={},text={"*639 French updates from ap0k41yp5, Flamby, Jupiter87a, Kolo, Ln_Fridfromedisailleur and RageSeeker."}},
        {tags={},text={"*827 German updates from Afinda, Clemond, Creydah, FDCage, Nightleave, philversprechend and Tillomaticus."}},
        {tags={},text={"*722 Italian updates from Snake3000, arkennes, jkflame, kanon82, Kingdrake, kreel and MarikMadness."}},
        {tags={},text={"*471 Polish updates from barrakketh, Daroslaw, Flugcojt, iffyJinx, Robak220, SabreUr, Troold, Wac3."}},
        {tags={},text={"*201 Ukranian updates from Jupiter87a."}},
        {tags={},text={"*157 Japanese updates from Gashin."}},
        {tags={},text={"*152 Portuguese updates from Azdragoras and Tamhorn,"}},
        {tags={},text={"*133 Spanish updates from Flagonard, Killbe, RareApo and Rexgad."}},
},--localizations end

},--update end
{
["update number"]={"5.3"},
["date"]={"January 10th, 2013"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/2803-update-53-blazing-embers/"},
["title"]={"Blazing Embers"},
["additions"]={
        {tags={"Ember",},text={"*Ember powers reworked:"}},
        {tags={"Ember",},text={"**Overheat moved to second ability, acts as a shield and radial damage power."}},
        {tags={"Ember",},text={"**Fireball is now properly attached to the target and doing damage over time."}},
        {tags={"Ember",},text={"**World on Fire has been boosted: it now cycles through nearby targets to immolate!"}},
        {tags={"Excalibur","Loki","Volt",},text={"*Warframe Blueprints for Excalibur, Volt and Loki."}},
        {tags={"Afuris","Bolto",},text={"*Weapon Blueprints for Afuris and Bolto."}},
        {tags={},text={"*More mid-mission surprise change-ups."}},
        {tags={},text={"*More localization updates from our amazing volunteers!"}},
        {tags={},text={"*Pro system dropped, new Super-Charge requires an item to be installed."}},
        {tags={"Foundry",},text={"*Items can be purchased with Platinum (same cost as before) or built in the Foundry."}},
        {tags={},text={"*Users with Pro items will have this automatically installed for them."}},
        {tags={"Alert","Orokin Catalyst","Orokin Reactor",},text={"*More Blueprint rewards added to Alerts including Orokin Reactors and Catalysts used to Super-Charge Warframes and weapons."}},
        {tags={""},text={"<%br/>"}},
},--additions end
["changes"]={
        {tags={"Ember",},text={"*Ember model has had a revamp on its mesh and materials."}},
        {tags={"Energy Siphon",},text={"*Balancing changed for Energy Siphon cards, Mods with shield, energy, and health bonuses will be additive for more sane stacking."}},
        {tags={},text={"*Small improvements to stat displays for upgrades and projectile-based weapons."}},
        {tags={},text={"*Settings improvements for mouse sensitivity, brightness, contrast and UPnP."}},
        {tags={"Alert",},text={"*Alerts only require node unlock vs. region. Faster UI response to new Alerts."}},
        {tags={},text={"*Improvements to selling UI to reduce accidental selling of important items."}},
        {tags={},text={"*Balance changes to Mod resale and rarity."}},
        {tags={},text={"*Infested Disruptor color effects toned down."}},
        {tags={},text={"*Balance changes to Boss scaling with four players."}},
        {tags={},text={"*Reduced frequency of mission key wrinkle."}},
        {tags={},text={"*Players are now prompted before removing a friend."}},
        {tags={""},text={"<%br/>"}},
},--changes end
["fixes"]={
        {tags={},text={"*Fixed Matchmaking problems related to overzealous filtering."}},
        {tags={},text={"*Expanded Matchmaking search to include nearby regions if no games found."}},
        {tags={},text={"*Fixed duplicate Artifact cards taking up space on interface."}},
        {tags={},text={"*Fixed pass-key loss when a player leaves the session while holding it."}},
        {tags={},text={"*VOIP fixes for Contacts list."}},
        {tags={},text={"*Fixed hangs related to slow UPnP updates."}},
        {tags={},text={"*Fixed join session from Contacts."}},
        {tags={},text={"*Several crashes in DirectX11, Physics, Networking, Input and Updating code."}},
        {tags={},text={"*Fixed a few cases of players exiting the level and falling into space."}},
        {tags={},text={"*Fixed Datamass loss after extended period of time."}},
        {tags={"Dual Skana","Furax",},text={"*Mod effects show up properly on Dual Skanas and Furax."}},
        {tags={},text={"*Fixed loss of Mastery when selling an item."}},
        {tags={},text={"*Equipped consumables are no longer deleted when spending a revive."}},
        {tags={"Bolto",},text={"*Fixed Bolto and powers inflating player weapon accuracy."}},
        {tags={},text={"*Fixed controller vibration not toggling off."}},
},--fixes end

},--update end
{
["update number"]={"5.2"},
["date"]={"January 4th, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/613-update-5-is-here/?page=4#comment-8855"},
["title"]={"Give%'em Hek"},
["additions"]={
        {tags={"Hek",},text={"*A fearsome new shotgun has been added: %[%[Hek|HEK%]%]. Look for the weapon and blueprint in the Market."}},
        {tags={},text={"*Improvements to daily sign-in rewards."}},
        {tags={},text={"*Transmissions for Cryo/Fire level complications. Shields are reduced by Cryo malfunctions; watch out!"}},
        {tags={},text={"*Gauntlet and Dagger attack animations have been improved."}},
        {tags={},text={"*Screenshot support bound to F6 key. Creates a Captures folder."}},
        {tags={},text={"*Gear auto-equips when purchased."}},
        {tags={""},text={"<%br/>"}},
},--additions end
["fixes"]={
        {tags={},text={"*Optimized cases of network congestion and crashing due to host migration."}},
        {tags={},text={"*Fixed exploits while equipping Mods."}},
        {tags={},text={"*Adding contacts is case-insensitive. We have increased retries to help with connectivity issues."}},
        {tags={""},text={"<%br/>"}},
},--fixes end
["localizations"]={
        {tags={"Ash",},text={"*1388 Japanese updates from Gashin!!!"}},
        {tags={},text={"*649 Polish updates from Etheryon, Robak220 and nepstoner"}},
        {tags={},text={"*611 Russian updates from WolfFenrir, Moloxix, JOOBING and Crond"}},
        {tags={},text={"*504 Spanish updates from IBum, Rexgad and Killbe"}},
        {tags={},text={"*427 French updates from ap0k41yp5"}},
        {tags={},text={"*357 Italian updates from pascalbrax"}},
        {tags={},text={"*228 German updates from Sh3pp4rd"}},
        {tags={},text={"*77 Ukranian updates from NamatK47"}},
        {tags={},text={"*54 Portguese updates from Gnoman"}},
        {tags={},text={"*4 Chinese updates from WKYZODIAC"}},
},--localizations end

},--update end
{
["update number"]={"5.1"},
["date"]={"January 2nd, 2013"},
["forumurl"]={"https://forums.warframe.com/topic/613-update-5-is-here/?page=3#comment-7608"},
["misc"]={
        {tags={},text={"*Fixed crashes related to host migration, VOIP shutdown and Shield Drones."}},
        {tags={"Loki",},text={"*Fixed Loki Switch Teleporting stationary enemies."}},
        {tags={},text={"*Removed Holiday FX. Happy New Year!"}},
        {tags={},text={"*Improvements to Solar map clipping and ring accuracy."}},
        {tags={},text={"*Crouching improvements, lowered firing positions for better cover."}},
        {tags={},text={"*Some Market prices have been lowered."}},
        {tags={},text={"*Improve AI attack times and movement when out of cover."}},
        {tags={},text={"*Some Melee Mods are more potent now."}},
        {tags={},text={"*Minor mission fixes based on forum posts (hostage problems, incorrect VO)."}},
        {tags={"Excalibur","Prime",},text={"*Excalibur Prime can properly install Excalibur Mods."}},
        {tags={},text={"*Fixed some boss drops going through the floor."}},
},--misc end

},--update end
{
["update number"]={"5.0.5"},
["type"]={"fix"},
["date"]={"December 27th, 2012"},
["forumurl"]={"https://forums.warframe.com/topic/613-update-5-is-here/?page=3#comment-5977"},
["misc"]={
        {tags={"Earth",},text={"*Fixed Neurode components not available. These rare resources are now found in the Earth region."}},
        {tags={},text={"*Fixed GPF in VOIP code when disconnected."}},
        {tags={},text={"*Fixed DirectX 11 crash on Windows 8 when you have a video card that is only DirectX 10 compatible."}},
},--misc end

},--update end
{
["update number"]={"5.0.1"},
["type"]={"fix"},
["date"]={"December 18th, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/613-update-5-is-here/"},
["misc"]={
        {tags={},text={"*Fixed text corruption in several languages"}},
        {tags={"Exterminate",},text={"*Improvements to Exterminate spawning"}},
        {tags={},text={"*Affinity Boosters now give boosts for non-combat actions"}},
        {tags={},text={"*Fixed minor respawn issues"}},
        {tags={},text={"*Higher level enemies are tougher"}},
        {tags={"Vor",},text={"*Captain Vor is more aggressive! Look out!"}},
},--misc end

},--update end
{
["update number"]={"5.0"},
["date"]={"December 18th, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/613-update-5-is-here/"},
["title"]={"The Big One!"},
["misc"]={
        {tags={"Star Chart"},text={"%'%'%'Major new features:%'%'%'"}},
        {tags={"Star Chart"},text={"*All-new mission structure: explore the solar system!"}},
        {tags={"Star Chart"},text={"*Different factions control regions of space; destroy them!"}},
        {tags={},text={"*Crushing bosses added; team up and take them down!"}},
        {tags={"Foundry"},text={"*Foundries have opened up; build your own gear!"}},
        {tags={"Star Chart"},text={"*Resources are hidden in different regions"}},
        {tags={"Star Chart"},text={"*Real-time mission events on the star-chart"}},
        {tags={"Star Chart"},text={"*Lucrative opportunities and tough raids"}},
        {tags={},text={"*Artifact cards to be used for missions of extreme danger"}},
        {tags={},text={"*In game voice chat to coordinate your attacks"}},
        {tags={},text={"*Host migration & improved networking fault-tolerance"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Major changes:%'%'%'"}},
        {tags={},text={"*New and improved revive system; includes temporary invulnerability!"}},
        {tags={},text={"*Ships can now have multiple objectives unlocked throughout"}},
        {tags={},text={"*Improved enemy placement and encounter pacing"}},
        {tags={},text={"*Enemy difficulty scaling tuned for greater challenges in deep-space"}},
        {tags={},text={"*Automatic profit-sharing with your squad"}},
        {tags={},text={"*Upgrade UI now has stats to help you make the ultimate gear"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Cool updates:%'%'%'"}},
        {tags={"Mag",},text={"*Mag’s pull ability can rip shields away from enemies"}},
        {tags={},text={"*Cold damage now slows affected targets"}},
        {tags={"Corpus Ship",},text={"*Corpus ships now feature turrets, cameras and laser doors"}},
        {tags={},text={"*End of mission bonuses & rewards"}},
        {tags={},text={"*Tenno bonuses for “First win of the Day”"}},
        {tags={},text={"*The in-game music is now generated dynamically"}},
        {tags={},text={"*Painted targets are now context-sensitive"}},
        {tags={},text={"*Weapon effects now change based on installed modules"}},
        {tags={},text={"*In-game challenges can now be completed"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Notorious bugs fixed:%'%'%'"}},
        {tags={},text={"*Walls are no longer transparent on older video cards!"}},
        {tags={"Lotus",},text={"*The Lotus’ voice now conforms to volume control"}},
        {tags={},text={"*DirectX11 no longer crashes when running multiple video cards"}},
        {tags={},text={"*Mission-completion checks are now more thorough"}},
        {tags={},text={"*International keyboard stability issues"}},
        {tags={},text={"*The upload datamass cannot be lost in missions"}},
        {tags={},text={"*Ultra-wide displays now supported properly"}},
        {tags={},text={"*Improved video-card compatibility and min-spec detection"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Miscellaneous updates:%'%'%'"}},
        {tags={},text={"*Nearly 1000 translation updates from our volunteer army!"}},
        {tags={},text={"*Improved Tenno animations"}},
        {tags={},text={"*Many menus & screens polished"}},
        {tags={""},text={"<%br/>"}},
        {tags={},text={"%'%'%'Note:%'%'%' that all accounts have been reset due to these massive changes."}},
},--misc end

},--update end
{
["update number"]={"4"},
["date"]={"November 2nd, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/470-update-4-is-here/"},
["misc"]={
        {tags={},text={"*Mods are now dropped by enemies on death rather than appearing in crates"}},
        {tags={"Trinity",},text={"*New Trinity abilities! Well of life, Energy Vampire, Link, Blessing."}},
        {tags={},text={"*Difficulty selection is now available for cards that have been completed in the battle deck"}},
        {tags={},text={"*Mission completion rewards are fixed"}},
        {tags={},text={"*Added explanations for ammo pickups that aren%'t in current loadout"}},
        {tags={},text={"*Fixed enemy ragdolls freezing in death pose"}},
        {tags={"Bo",},text={"*Bo Staff damage increase"}},
        {tags={},text={"*Fixed certain Mods not applying correct bonus"}},
        {tags={"exterminate"},text={"*Improved mini-map markers and feedback for Extermination missions"}},
        {tags={},text={"*Tuned AI targeting and perception"}},
        {tags={},text={"*Various crash and localization fixes"}},
},--misc end

},--update end
{
["update number"]={"3"},
["date"]={"October 30th, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/429-update-3-is-here/"},
["misc"]={
        {tags={"Jackal",},text={"*Fixed not being able to exit room after destroying Jackal"}},
        {tags={},text={"*Reduced damage dealt by Grineer rifles"}},
        {tags={"Dual Skana",},text={"*Reduced Dual Skana slide-roundhouse damage"}},
        {tags={},text={"*Added “Seasonal surprise”"}},
        {tags={"Rescue",},text={"*Improved rescue target’s pathfinding and animation cycle"}},
        {tags={"Gorgon",},text={"*Beefed up the Gorgon rifle"}},
        {tags={},text={"*Fixed enemy name tag in tutorial"}},
        {tags={},text={"*Grineer shield regeneration tweaked"}},
},--misc end

},--update end
{
["update number"]={"2"},
["date"]={"October 29th, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/399-update-2-is-here/"},
["misc"]={
        {tags={"Defense",},text={"*Fixed cipher panels not activating after breaking out windows at end of defense mission"}},
        {tags={"exterminate"},text={"*Fixed enemy count in extermination missions"}},
        {tags={},text={"*Got rid of red progress bars over bleeding-out players"}},
        {tags={},text={"*Fixed floating infestation worms/snails"}},
        {tags={},text={"*Fixed exploit where you could choose a locked color when exiting the color picker"}},
        {tags={},text={"*Improved responsiveness when picking up mods and other pickups"}},
        {tags={},text={"*Tweaked XP (leveling) curves, should take much longer to rank up"}},
        {tags={},text={"*Smoothed out animation transitions for mantling and rolling"}},
        {tags={},text={"*Added low health indicators and feedback when taking damage"}},
        {tags={"Snipetron",},text={"*Nerfed Snipetron, added scope effects"}},
        {tags={},text={"*Reduced Grineer Commander spawn frequency"}},
        {tags={"Quest",},text={"*Fixed quest card missions not playing as intended"}},
        {tags={},text={"*Fixed high level mods dropping inappropriately"}},
        {tags={},text={"*Various crashes fixed"}},
},--misc end

},--update end
{
["update number"]={"1"},
["date"]={"October 26th, 2012"},
["forumurl"]={"https://forums.warframe.com/index.php?/topic/228-update-1-is-here/"},
["misc"]={
        {tags={},text={"*Made launcher support custom Windows text sizes (high-DPI settings caused problems)"}},
        {tags={"Rescue",},text={"*Fixed rescue agent getting stuck on cover objects"}},
        {tags={},text={"*Prevented players from dying in tutorial"}},
        {tags={},text={"*Fixed “raise reactor” prompt not appearing for some players"}},
        {tags={},text={"*Fixed players animating at higher rate in menus"}},
        {tags={},text={"*Fixed kill ranking and display issues (all missing kills were recovered)"}},
        {tags={},text={"*Fixed problems caused by enemies fallen into pits"}},
        {tags={},text={"*Fixed enemies taking cover inside solid objects"}},
        {tags={},text={"*Fixed player rank displayed at sign in (was showing 0 instead of actual rank)"}},
        {tags={},text={"*Fixed jump-slash attack embedding players into stairs"}},
        {tags={},text={"*Fixed a number of crashes and defects discovered by Beta testers"}},
        {tags={},text={"*Rebalanced store item prices."}},
        {tags={},text={"*Please remember to obey all signs and rules; the safety of you and our crew is our highest priority"}},
},--misc end

},--update end
{
["update number"]={"Vanilla"},
["date"]={"October 25th, 2012"},
["forumurl"]={""},
["title"]={"Closed Beta Launch"},
["misc"]={
        {tags={},text={"Warframe Closed Beta is NOW. Today we have randomly started selecting people from our VIP list to participate in the Closed Beta. Only Closed Beta members can currently log in to http://www.warframe.com/ however, while you wait for your invite explore all the new information and news on the site. Didn%'t get a Closed Beta email yet? Don%'t sweat- we%'ll be sending out tons more soon."}},
},--misc end
["additions"]={
        {tags={"NOUPDATE","Braton","MK1-Braton","Burston","Gorgon","Latron","Boar","Strun","Snipetron","Furis","Lato","Lex","Sicarus","Bronco","Aklato","Cronus","Skana","Dual Skana","Furax","Bo","Ash","Ember","Excalibur","Loki","Mag","Rhino","Trinity","Volt","Jackal","Captain Vor","Exterminate","Spy","Rescue","Assassination","Survival"},text={"*Introduced in the game."}},
        {tags={},text={";Introduced in Original Version of the game:","*Warframes:","** Ash, Ember, Excalibur, Loki, Mag, Rhino, Trinity, Volt","*Primary Weapons:","**Braton, MK1-Braton, Burston, Gorgon, Latron, Boar, Strun, Snipetron","*Secondary Weapons:","**Furis, Lato, Lex, Sicarus, Bronco, Aklato", "*Melee Weapons:","**Cronus, Skana, Dual Skana, Furax, Bo","*Bosses :","**Jackal, Captain Vor","*Game Modes :","**Exterminate, Spy, Rescue, Assassination, Survival"}},
},--additions end          
 
},--update end

}
return PatchData
```

