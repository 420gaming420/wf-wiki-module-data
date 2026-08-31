---
title: "Module:NightwaveActs"
wiki_url: "https://wiki.warframe.com/w/Module/NightwaveActs"
wiki_timestamp: "2021-06-14T16:34:21Z"
---

[![](/images/Lotusiconsmall.png?17208)](/w/WARFRAME_Wiki:Administrators "WARFRAME Wiki:Administrators")

*Please do not use this article for critical in-game information!  
Use [NightwaveActs.json](/w/NightwaveActs.json "NightwaveActs.json") instead 20:39, 31 August 2021 (UTC)*

This article is [archived](/w/Category:Archived "Category:Archived"). The content was relevant to an **obsolete** version of Warframe, and has since been removed, retrieved, and/or revamped.

JSON data to be parsed by [MediaWiki:NightwaveActs.js](/w/MediaWiki:NightwaveActs.js "MediaWiki:NightwaveActs.js") to map out act name to associated image in wiki. To be used with [Template:NightwaveActs](/w/Template:NightwaveActs "Template:NightwaveActs").

Keys are in alphabetical order and values are hexidecimal values with image name to be concatenated to the following URL:

```lua
https://vignette.wikia.nocookie.net/warframe/images/
```

## Notes

[[edit source](/w/Module:NightwaveActs/doc?action=edit&section=T-1 "Edit section's source code: Notes")]

* Some acts don't have image so their values are links to a placeholder image (i.e. `"4/47/Placeholder.png"`)
* Keys and values must be double quoted (`""`)
* No trailing comma after last element of each JSON object
* TODO: Check if ?action=raw can be used instead of ?action=parse in MediaWiki API. If that is the case, we can replace the JSON delimiters.

## See Also

[[edit source](/w/Module:NightwaveActs/doc?action=edit&section=T-2 "Edit section's source code: See Also")]

* [Module:NightwaveActs/dev](/w/Module:NightwaveActs/dev "Module:NightwaveActs/dev") - for development

---

```lua
--[[
{
    "daily": {
        "Accelerator": "3/38/KillEnemiesWhileSliding.png",
        "Agent": "1/14/CompleteAnyMission.png",
        "Air It Out": "8/80/DeployAirSupport.png",
        "Ancient Obelisk": "e/e0/ActivateDeimosRequiemTotem.png",
        "Arsonist": "f/fe/KillEnemiesDamageTypeFire.png",
        "Attractive": "4/47/KillEnemiesDamageTypeMagnetic.png",
        "Biohazard": "7/7e/KillEnemiesDamageTypeGas.png",
        "Child at Heart": "8/8f/ChildAtHeart.png",
        "Communicator": "5/5d/PlaceWaypoint.png",
        "Confiscated": "5/56/HijackCrewshipFromEnemy.png",
        "Deep Freeze": "4/4b/KillEnemiesDamageTypeCold.png",
        "Deep Impact": "9/95/HeavyImpact.png",
        "Detonator": "c/c3/KillEnemiesDamageTypeBlast.png",
        "Doppelganger": "4/40/DeploySpecter.png",
        "Energizing": "a/ac/EnergyOrbs.png",
        "Everything Old is New Again": "7/77/TransmuteMods.png",
        "Executioner": "c/ca/KillEnemiesFinishingMoves.png",
        "Expressive": "f/f2/PerformEmote.png",
        "Gatherer": "a/aa/Resources.png",
        "Glider": "1/1d/AimGlide.png",
        "Graffiti": "8/87/PlaceGlyph.png",
        "Hacker": "7/75/SolveCipher.png",
        "Hands Full": "f/ff/CompleteMissionPrimaryWeapon.png",
        "Hush": "1/13/KillKuvaThrall.png",
        "Just Visiting": "f/ff/VisitFeaturedDojo.png",
        "Kleptomaniac": "0/0d/OpenLootLocker.png",
        "Loyalty": "3/35/PetKubrowKavat.png",
        "Marksman": "3/3a/GetHeadshots.png",
        "Meltdown": "e/e0/KillEnemiesDamageTypeCorrosive.png",
        "Mow Them Down": "9/9a/KillEnemiesWithPrimary.png",
        "No Mercy": "3/3c/MercyKillEnemy.png",
        "Patron": "6/6a/Patron.png",
        "Poisoner": "5/5a/KillEnemiesDamageTypePoison.png",
        "Power Trip": "9/93/KillEnemiesWithAbilities.png",
        "Reactor": "4/4b/KillEnemiesDamageTypeRadiation.png",
        "Reanimator": "2/20/PilotDownedMech.png",
        "Reclaimed": "e/ed/ClearLichInfluencedNode.png",
        "Researcher": "0/01/CodexScan.png",
        "Saver": "3/30/CollectCredits.png",
        "Sharing is Caring": "4/4e/KillEnemiesDamageTypeViral.png",
        "Shiny": "a/a2/FindMod.png",
        "Short Circuit": "8/8a/KillEnemiesDamageTypeElectricty.png",
        "Sidearm": "d/d0/CompleteMissionSecondaryWeapon.png",
        "Smaller Is Bigger": "f/f4/KillEnemiesWithSecondary.png",
        "Surf's Up!": "c/cc/KillEnemiesKDrive.png",
        "Sword Dance": "d/df/KillEnemiesWithMelee.png",
        "Swordsman": "7/73/CompleteMissionMeleeWeapon.png",
        "The Hunt is On": "0/02/FindSyndicateMedallions.png",
        "Trampoline": "a/aa/BulletJump.png",
        "Warning Shot": "a/a7/KillEnemies.png"
    },
    "weekly": {
        "Animator": "a/a4/AyatanSculptures.png",
        "Assassin": "6/66/CompleteMissionTypesAssassination.png",
        "Cache Hunter": "c/ce/SabotageCaches.png",
        "Conservationist": "5/53/PerfectConservations.png",
        "Don't Blow It": "2/2b/CompleteConduits.png",
        "Don't Fear The Reaper": "2/23/CompleteKuvaSiphonMissions.png",
        "Earth Bounty Hunter": "f/f9/BountiesPoE.png",
        "Earth Fisher": "2/29/RareFishPoE.png",
        "Earth Miner": "f/f3/MineGemsPoE.png",
        "Eliminator": "1/1f/MissionsOfXType.png",
        "Enhance!": "7/79/AcquireRareMods.png",
        "Eximus Eliminator": "2/22/KillEnemiesWeekly.png",
        "Explorer": "1/19/Complete3RailjackMissions.png",
        "Feed The Beast": "e/e3/FeedHelminthResource.png",
        "Flawless": "b/bf/RailjackBoardingPartyWithoutWarframeTakingDamage.png",
        "Forward Thinking": "f/f5/DestroyCrewshipForwardArtillery.png",
        "Friendly Fire": "0/08/FriendlyFire.png",
        "Gilded": "a/a0/GildKitgunZaw.png",
        "Good Friend": "7/77/HelpClem.png",
        "Heavy Ordnance": "9/94/HeavyOrdnance.png",
        "Invader": "9/9a/InvasionMissions.png",
        "Jailer": "8/8a/CompleteMissionTypesCapture.png",
        "Necralizer": "5/5b/KillEnemiesWithMech.png",
        "Not a Warning Shot": "2/22/KillEnemiesWeekly.png",
        "Now Boarding": "c/ce/CompleteDifferentKDriveRacesInOrbVallis.png",
        "Operative": "e/ec/CompleteMissionTypesSpy.png",
        "Polarized": "b/b8/FormaWeapons.png",
        "Protector": "3/3f/CompleteMissionTypeDefense.png",
        "Rescuer": "f/fd/CompleteMissionTypesRescue.png",
        "Saboteur": "2/20/CompleteMissionTypesSabotage.png",
        "Sanctuary Researcher": "a/a0/SynthesizeSimarisTargets.png",
        "Sound Sleeper": "f/f4/NightmareMissions.png",
        "Sortie Specialist": "1/1e/SortieWarframe.png",
        "Supporter": "0/0c/SyndicateDailies.png",
        "Test Subject": "a/a0/Weekly_EliteSanctuaryOnslaught.png",
        "Tusk Thumpin'": "a/a6/KillTuskThumper.png",
        "Unlock Relics": "5/53/UnlockRelics.png",
        "Vault Looter": "0/01/UnlockDragonVaults.png",
        "Vault Raider": "b/bc/IsolationBounty.png",
        "Venus Bounty Hunter": "b/b3/BountiesOrbVallis.png",
        "Venus Fisher": "d/d2/RareFishOrbVallis.png",
        "Venus Miner": "8/86/MineGemsOrbVallis.png"
    },
    "elite": {
        "Ascendant": "2/2b/HallsOfAscension.png",
        "Choose Wisely": "1/17/KillConvertKuvaLich.png",
        "Cold Steel": "f/fd/KillEnemiesonTheSteelPath.png",
        "Day Trader": "3/39/IndexRounds.png",
        "Defense": "3/31/DefenseMissionWaveXWithFriendsClan.png",
        "Elite Explorer": "a/af/Complete8RailjackMissions.png",
        "Elite Test Subject": "d/db/EliteSanctuaryOnslaught.png",
        "Eximus Executioner": "5/5d/KillEnemiesHardcore.png",
        "Flying High": "c/c7/DefeatRopalolyst.png",
        "Grove Guardian": "5/5d/KillEnemiesHardcore.png",
        "Hold Your Breath": "1/11/KuvaSurvival.png",
        "Hydrolyst Hunter": "c/c0/Hydrolists.png",
        "Kill Shot": "5/5d/KillEnemiesHardcore.png",
        "Machine Interference": "4/47/MachineInterface.png",
        "Night Terror": "a/ac/NightmareMissionsHardcore.png",
        "Nothing but Profit": "e/e3/KillExploiterOrb.png",
        "Profit-Taker": "7/71/OrbHeistFullParty.png",
        "Resource Scavenger": "a/ae/CollectResources.png",
        "Silent Eliminator": "c/c6/ExterminationWithoutAlarms.png",
        "Sortie Expert": "9/9e/Hardcore_Sortie.png",
        "Speedster": "d/db/Speedster.png",
        "Survival": "a/ab/HighLevelSurvivalWithFriendsClan.png",
        "The Path Less Traveled": "6/67/CompleteSteelPathMissions.png",
        "Unlock Relics": "5/59/UnlockRelicsHardcore.png",
        "Walk Without Rhythm": "c/cf/KillTuskThumperDoma.png"
    }
}
]]--
```

