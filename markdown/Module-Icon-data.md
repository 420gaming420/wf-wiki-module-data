---
title: "Module:Icon/data"
wiki_url: "https://wiki.warframe.com/w/Module/Icon/data"
wiki_timestamp: "2026-06-30T07:46:22Z"
---

Database for miscellaneous icons used in [WARFRAME](/w/WARFRAME "WARFRAME"). Some categories of items/icons/content are not large enough or unique enough in terms of properties to justify having their own database.

## Icon Entry Schema

[[edit source](/w/Module:Icon/data/doc?action=edit&section=T-1 "Edit section's source code: Icon Entry Schema")]

Item template:

```lua
	["Item name"] = {
		Description = "Item Description",
		Image = "ItemName.png",
		Link = "Link Name",
		Name = "Page Name",
		CssClasses = "CSS Classes"
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Description` | Boolean | ❌ | Description of icon | `"Modifies the Duration of Warframe Abilities and the Energy cost of toggled Abilities. Hover over each Ability to see how its stats are affected."` |
| `Image` | String | ✔️ | Image file name of the icon as uploaded to the wiki | `"Health.png"` |
| `Link>` | String | ✔️ | Page/article link to the mod on the wiki | `"Health"` |
| `Name` | String | ✔️ | Name of item | `"Health"` |
| `CssClasses` | String | ❌ | CSS classes to be applied when icon is used in tooltips | `"light-invert"` |

---

```lua
local IconData = {
["Items"] = {
	["Void Keys"] = {
		Image = "DEVoid Key.png",
		Link = "Void Keys",
		CssClasses = "light-invert"
	},
	["Void Key"] = {
		Image = "DEVoid Key.png",
		Link = "Void Keys",
		CssClasses = "light-invert"
	},
	["Lith"] = {
		Image = "VoidProjectionsIronD.png",
		Link = "Void Relic",
		CssClasses = "light-invert"
	},
	["Meso"] = {
		Image = "VoidProjectionsBronzeD.png",
		Link = "Void Relic",
		CssClasses = "light-invert"
	},
	["Neo"] = {
		Image = "VoidProjectionsSilverD.png",
		Link = "Void Relic",
		CssClasses = "light-invert"
	},
	["Axi"] = {
		Image = "VoidProjectionsGoldD.png",
		Link = "Void Relic",
		CssClasses = "light-invert"
	},
	["Fusion Core"] = {
		Image = "FusionCorePackSilversingle.png",
		Link = "Fusion Core",
		CssClasses = "light-invert"
	},
	["Mods"] = {
		Image = "FusionCorePackSilversingle.png",
		Link = "Mods",
		CssClasses = "light-invert"
	},
	["Mod"] = {
		Image = "FusionCorePackSilversingle.png",
		Link = "Mods",
		CssClasses = "light-invert"
	},
	["Blueprint"] = {
		Image = "Blueprint2(xBlack).svg",
		Link = "Blueprints",
	CssClasses = "dark-invert"
	},
	["Blueprints"] = {
		Image = "Blueprint2(xBlack).svg",
		Link = "Blueprints",
	CssClasses = "dark-invert"
	},
	["Market"] = {
		Image = "MarketIcon(xBlack).png",
		Link = "Market",
		CssClasses = "dark-invert"
	},
	["Affinity"] = {
		Image = "Affinity(xWhite).png",
		Link = "Affinity",
		CssClasses = "light-invert"
	},
	["Resources"] = {
		Image = "Resource Orange.png",
		Link = "Resources",
		CssClasses = "light-invert"
	},
	["Mutate"] = {
		Image = "AmmoMutation(xBlack).png",
		Link = ":Category:Ammo Mutation Mods",
		CssClasses = "dark-invert"
	},
	["Mastery"] = {
		Image = "MasterySigilClear(xBlack).png",
		Link = "Mastery Rank",
		CssClasses = "dark-invert"
	},
	["TennoGen"] = {
		Image = "TennoGenLogo(xBlue).png",
		Link = "TennoGen",
		CssClasses = "light-invert"
	},
	["Arcane"] = {
		Image = "CosmeticEnhancer.png",
		Link = "Arcane Enhancement",
		CssClasses = "light-invert"
	},
	["Power Cell"] = {
		Image = "PowerCell.png",
		Link = "Power Cell",
		CssClasses = "light-invert"
	},
	["100x Cipher"] = {
		Image = "Cipherx100.png",
		Link = "Cipher|100 x Cipher",
		CssClasses = "light-invert"
	},
	["10x Cipher"] = {
		Image = "CipherPackMedium2.png",
		Link = "Cipher|10 x Cipher",
		CssClasses = "light-invert"
	},
	["Titan Extractor"] = {
		Image = "TitanExtractor.png",
		Link = "Extractor#Titan_Extractor|Titan Extractor",
		CssClasses = "light-invert"
	},
	["Distilling Extractor"] = {
		Image = "DistillingExtractor.png",
		Link = "Extractor#Distilling_Extractor|Distilling Extractor",
		CssClasses = "light-invert"
	},
	["Granum Crown Decoration"] = {
		Image = "GranumCrown64.png",
		Link = "Granum Crown Decoration",
		CssClasses = "light-invert"
	},
	["Exemplar Granum Crown Decoration"] = {
		Image = "ExemplarGranumCrown64.png",
		Link = "Exemplar Granum Crown Decoration",
		CssClasses = "light-invert"
	},
	["Zenith Granum Crown Decoration"] = {
		Image = "ZenithGranumCrown64.png",
		Link = "Zenith Granum Crown Decoration",
		CssClasses = "light-invert"
	},
	["Mortuus Shoulder Guard"] = {
		Image = "MortuusShoulderGuard.png",
		Link = "Mortuus Shoulder Guard",
		CssClasses = "light-invert"
	},
    ["Energy Pulse"] = {
        Image = "FocusEnergyPulse.png",
        Link = "Energy Pulse",
        CssClasses = "dark-invert"
    },
},

["Affinity"] = {
	["Mastery"] = {
		Image = "MasteryAffinity64(xDark).png",
		Link = "Mastery Rank",
		CssClasses = "dark-invert"
	},
	["Clan"] = {
		Image = "ClanAffinity64.png",
		Link = "Research",
		CssClasses = "light-invert"
	},
	["Legendary"] = {
		Image = "LegendaryIcon.png",
		Link = "Mastery Rank",
		CssClasses = "light-invert"
	},
},

["Heads-Up Display"] = {
	["Objective"]= {
		Image = "MiniMapObjective.png",
		Link = "Objective",
		CssClasses = "light-invert"
	},
	["Goal"]= {
		Image = "MiniMapObjective.png",
		Link = "Objective",
		CssClasses = "light-invert"
	},
	["Attack"] = {
		Image = "MiniMapAttack.png",
		Link = "Attack",
		CssClasses = "light-invert"
	},
	["Capture"] = {
		Image = "MiniMapAttack.png",
		Link = "Attack",
		CssClasses = "light-invert"
	},
	["Hostage"] = {
		Image = "MiniMapHostage.png",
		Link = "Hostage",
		CssClasses = "light-invert"
	},
	["Rescue"] = {
		Image = "MiniMapHostage.png",
		Link = "Hostage",
		CssClasses = "light-invert"
	},
	["Prisoner"] = {
		Image = "MiniMapHostage.png",
		Link = "Hostage",
		CssClasses = "light-invert"
	},
	["DestroyA"] = {
		Image = "MiniMapDestroyA.png",
		Link = "Destroy A",
		CssClasses = "light-invert"
	},
	["DestroyB"] = {
		Image = "MiniMapDestroyB.png",
		Link = "Destroy B",
		CssClasses = "light-invert"
	},
	["DestroyC"] = {
		Image = "MiniMapDestroyC.png",
		Link = "Destroy C",
		CssClasses = "light-invert"
	},
	["DestroyD"] = {
		Image = "MiniMapDestroyD.png",
		Link = "Destroy D",
		CssClasses = "light-invert"
	},
	["HackA"] = {
		Image = "MiniMapHackA.png",
		Link = "Hack A",
		CssClasses = "light-invert"
	},
	["HackB"] = {
		Image = "MiniMapHackB.png",
		Link = "Hack B",
		CssClasses = "light-invert"
	},
	["HackC"] = {
		Image = "MiniMapHackC.png",
		Link = "Hack C",
		CssClasses = "light-invert"
	},
	["HackD"] = {
		Image = "MiniMapHackD.png",
		Link = "Hack D",
		CssClasses = "light-invert"
	},
	["Escort"] = {
		Image = "MiniMapEscort.png",
		Link = "Escort",
		CssClasses = "light-invert"
	},
	["Waypoint"] = {
		Image = "MiniMapGeneric.png",
		Link = "Waypoint",
		CssClasses = "light-invert"
	},
	["LeaderWaypoint"] = {
		Image = "LeaderMarker1.png",
		Link = "Leader Waypoint",
		CssClasses = "light-invert"
	},
	["Leader"] = {
		Image = "LeaderMarker1.png",
		Link = "Leader Waypoint",
		CssClasses = "light-invert"
	},
	["Life Support"] = {
		Image = "MiniMapO2PostWhite.png",
		Link = "Life Support",
		CssClasses = "light-invert"
	},
	["Tenno"] = {
		Image = "MiniMapFriend.png",
		Link = "Tenno",
		CssClasses = "light-invert"
	},
	["Ally"] = {
		Image = "MiniMapFriend.png",
		Link = "Ally",
		CssClasses = "light-invert"
	},
	["Archwing"] = {
		Image = "FriendArchwing.png",
		Link = "Ally (Archwing)",
		CssClasses = "light-invert"
	},
	["NPC"] = {
		Image = "MiniMapFriendAi.png",
		Link = "NPC",
		CssClasses = "light-invert"
	},
	["Kubrow"] = {
		Image = "MiniMapKubrow.png",
		Link = "Kubrow",
		CssClasses = "light-invert"
	},
	["Bleedout"] = {
		Image = "MiniMapFriendPreDeath.png",
		Link = "Bleedout",
		CssClasses = "light-invert"
	},
	["Bleeding"] = {
		Image = "MiniMapFriendPreDeath.png",
		Link = "Bleedout",
		CssClasses = "light-invert"
	},
	["Downed"] = {
		Image = "MiniMapFriendPreDeath.png",
		Link = "Bleedout",
		CssClasses = "light-invert"
	},
	["Dying"] = {
		Image = "MiniMapFriendPreDeath.png",
		Link = "Bleedout",
		CssClasses = "light-invert"
	},
	["Enemy"] = {
		Image = "MiniMapEnemy.png",
		Link = "Enemy",
		CssClasses = "light-invert"
	},
	["Enemies"] = {
		Image = "MiniMapEnemy.png",
		Link = "Enemies",
		CssClasses = "light-invert"
	},
	["MarkedEnemy"] = {
		Image = "MiniMapEnemyPainted.png",
		Link = "Marked Enemy",
		CssClasses = "light-invert"
	},
	["MarkedEnemies"] = {
		Image = "MiniMapEnemyPainted.png",
		Link = "Marked Enemies",
		CssClasses = "light-invert"
	},
	["PaintedEnemy"] = {
		Image = "MiniMapEnemyPainted.png",
		Link = "Marked Enemy",
		CssClasses = "light-invert"
	},
	["PaintedEnemies"] = {
		Image = "MiniMapEnemyPainted.png",
		Link = "Marked Enemies",
		CssClasses = "light-invert"
	},
	["EnemyWaypoint"] = {
		Image = "MiniMapEnemyPainted.png",
		Link = "Enemy Waypoint",
		CssClasses = "light-invert"
	},
	["Loot"] = {
		Image = "MiniMapLoot.png",
		Link = "Loot",
		CssClasses = "light-invert"
	},
	["Resource"] = {
		Image = "MiniMapLoot.png",
		Link = "Resource",
		CssClasses = "light-invert"
	},
	["Pickup"] = {
		Image = "MiniMapLoot.png",
		Link = "Pickup",
		CssClasses = "light-invert"
	},
	["Mod"] = {
		Image = "MiniMapMod.png",
		Link = "Mod",
		CssClasses = "light-invert"
	},
	["Module"] = {
		Image = "MiniMapMod.png",
		Link = "Mod",
		CssClasses = "light-invert"
	},
	["MarkedMod"] = {
		Image = "MiniMapModPainted.png",
		Link = "Marked Mod",
		CssClasses = "light-invert"
	},
	["ModWaypoint"] = {
		Image = "MiniMapModPainted.png",
		Link = "Mod Waypoint",
		CssClasses = "light-invert"
	},
	["Extraction"] = {
		Image = "MiniMapExtraction.png",
		Link = "Extraction",
		CssClasses = "light-invert"
	},
	["Extract"] = {
		Image = "MiniMapExtraction.png",
		Link = "Extraction",
		CssClasses = "light-invert"
	},
	["BuildComplete"] = {
		Image = "BuildComplete.png",
		Link = "Build Complete",
		CssClasses = "light-invert"
	},
	["BuildDone"] = {
		Image = "BuildComplete.png",
		Link = "Build Complete",
		CssClasses = "light-invert"
	},
	["FoundryComplete"] = {
		Image = "BuildComplete.png",
		Link = "Build Complete",
		CssClasses = "light-invert"
	},
	["FoundryDone"] = {
		Image = "BuildComplete.png",
		Link = "Build Complete",
		CssClasses = "light-invert"
	},
	["Discount"] = {
		Image = "Market.png",
		Link = "Platinum-Purchase Discount",
		CssClasses = "light-invert"
	},
	["Coupon"] = {
		Image = "Market.png",
		Link = "Platinum-Purchase Discount",
		CssClasses = "light-invert"
	},
	["Market"] = {
		Image = "Market.png",
		Link = "Market",
		CssClasses = "light-invert"
	},
	["Mail"] = {
		Image = "Mail.png",
		Link = "Unread Message",
		CssClasses = "light-invert"
	},
	["Message"] = {
		Image = "Mail.png",
		Link = "Unread Message",
		CssClasses = "light-invert"
	},
	["Inbox"] = {
		Image = "Mail.png",
		Link = "Unread Message",
		CssClasses = "light-invert"
	},
	["FriendRequest"] = {
		Image = "FriendRequestPendingIcon.png",
		Link = "Pending Friend Request",
		CssClasses = "light-invert"
	},
	["FriendInvite"] = {
		Image = "FriendRequestPendingIcon.png",
		Link = "Pending Friend Request",
		CssClasses = "light-invert"
	},
	["DroneComplete"] = {
		Image = "DroneComplete.png",
		Link = "Drone Complete",
		CssClasses = "light-invert"
	},
	["DroneDone"] = {
		Image = "DroneComplete.png",
		Link = "Drone Complete",
		CssClasses = "light-invert"
	},
	["DroneFinished"] = {
		Image = "DroneComplete.png",
		Link = "Drone Complete",
		CssClasses = "light-invert"
	},
	["DroneFull"] = {
		Image = "DroneComplete.png",
		Link = "Drone Complete",
		CssClasses = "light-invert"
	},
	["DroneDestroyed"] = {
		Image = "DroneDestroyed.png",
		Link = "Drone Destroyed",
		CssClasses = "light-invert"
	},
	["DroneKilled"] = {
		Image = "DroneDestroyed.png",
		Link = "Drone Destroyed",
		CssClasses = "light-invert"
	},
	["DroneDead"] = {
		Image = "DroneDestroyed.png",
		Link = "Drone Destroyed",
		CssClasses = "light-invert"
	},
	["DoubleAffinityEvent"] = {
		Image = "DoubleAffinityEventIcon.png",
		Link = "Double Affinity Event",
		CssClasses = "light-invert"
	},
	["DoubleCreditEvent"] = {
		Image = "DoubleCreditEvent.png",
		Link = "Double Credit Event",
		CssClasses = "light-invert"
	},
	["DoubleResourcesEvent"] = {
		Image = "DoubleResourcesEvent.png",
		Link = "Double Resources Event",
		CssClasses = "light-invert"
	},
},

["Flags"] = {
	["Italy"] = "Mainpage-Flag-Italy.png",
	["Portugal"] = "Mainpage-Flag-Portugal.png",
	["France"] = "Mainpage-Flag-France.png",
	["Germany"] = "Mainpage-Flag-Germany.png",
	["Poland"] = "Mainpage-Flag-Poland.png",
	["Russia"] = "Mainpage-Flag-Russia.png",
	["Spain"] = "Mainpage-Flag-Spain.png",
	["Hungary"] = "Mainpage-Flag-Hungary.png",
	["Turkey"] = "Mainpage-Flag-Turkey.png",
	["Hong Kong"] = "Flag-HK.png",
	["USA"] = "Flag-USA.png",
	["Finland"] = "Flag-Finland.png",
	["Canada"] = "Flag-Canada.png",
	["Philippines"] = "Flag-Philippines.png",
	["New Zealand"] = "Flag-NZ.png",
	["Indonesia"] = "Flag-Indonesia.png",
	["Vietnam"] = "Flag-Vietnam.png",
	["Japan"] = "Flag-Japan.png",
	["China"] = "Flag-China.png",
	["Taiwan"] = "Flag-Taiwan.png",
	["Korea"] = "Flag-Korea.png",
	["Nederlands"] = "Flag-Nederlands.png",
	["Ukraine"] = "Flag-Ukraine.png",
	["EU"] = "Flag-EU.png",
	["English"] = "Flag-English.png",
},
--Note that these names are based off of Janice Chu's work shown here:
--https://www.behance.net/gallery/42964973/Warframe-Buff-Icons
["Buff"] = {
	["Ability Duration"] = {
		Description = "Modifies the Duration of Warframe Abilities and the Energy cost of toggled Abilities. Hover over each Ability to see how its stats are affected.",
		Image = "AbilityDurationBuff.png",
		Link = "Ability Duration",
		CssClasses = "light-invert"
	},
	["Ability Range"] = {
		Description = "Modifies the Range of Warframe Abilities. Hover over each Ability to see how its stats are affected.",
		Image = "AbilityRangeBuff.png",
		Link = "Ability Range",
		CssClasses = "light-invert"
	},
	["Ability Strength"] = {
		Description = "Modifies the Strength of Warframe Abilities. Hover over each Ability to see how its stats are affected.",
		Image = "AbilityStrengthBuff.png",
		Link = "Ability Strength",
		CssClasses = "light-invert"
	},
	["Ability Efficiency"] = {
		Description = "Modifies the Energy cost of Warframe abilities. The minimum Energy cost is 1/4 of the Base value.",
		Image = "EnergyOrb.png",
		Link = "Ability Efficiency",
		CssClasses = ""
	},
	["Ability Casting Speed"] = {
		Description = "",
		Image = "Panel.png",
		Link = "Casting Speed",
		CssClasses = "light-invert"
	},
	["Health"] = {
		Description = "Total amount of Damage a Warframe can take before going into Bleedout.",
		Image = "HealOrb.png",
		Link = "Health",
		CssClasses = ""
	},
	["Energy"] = {
		Description = "Used to cast Abilities and can be replenished during missions.",
		Image = "EnergyOrb.png",
		Link = "Energy Capacity",
		CssClasses = ""
	},
	["Affinity"] = {
		Description = "Affinity is the in-game mechanic for experience points.",
		Image = "AffinityOrb.png",
		Link = "Affinity",
		CssClasses = ""
	},
	["Shield"] = {
		Description = "Shields reduce Damage by 50% for all Damage Types except Toxin, which bypasses shields.",
		Image = "IconShield.png",
		Link = "Shield",
		CssClasses = ""
	},
	["Armor"] = {
		Description = "Reduces damage to Health by %. Shields are not affected by armor.",
		Image = "ArmorBuff.png",
		Link = "Armor",
		CssClasses = "light-invert"
	},
	["Sprint Speed"] = {
		Description = "Modifies how fast a Warframe moves.",
		Image = "SprintSpeed.png",
		Link = "Sprint Speed",
		CssClasses = "light-invert"
	},
	["Accuracy"] = {
		Description = "How far projectiles will deviate from the reticle. Higher values are more accurate. Accuracy is improved while Aiming.",
		Image = "AccuracyBuff.png",
		Link = "Accuracy",
		CssClasses = "light-invert"
	},
	["Affinity Range"] = {
		Image = "AffinityRangeIcon.png",
		Link = "Affinity",
		CssClasses = "light-invert"
	},
	["Bullet Jump"] = {
		Image = "BulletJumpBuff.png",
		Link = "Maneuvers",
		CssClasses = "light-invert"
	},
	["Combo Critical Chance"] = {
		Image = "ComboCriticalChanceBuff.png",
		Link = "Melee#Combo Counter",
		CssClasses = "light-invert"	 --Can't think of a more appropriate link
	},
	["Combo Duration"] = {
		Description = "Melee Combo resets after this time. Refresh the timer by adding to the Combo Count with melee hits or blocks.",
		Image = "ComboDurationBuff.png",
		Link = "Melee Combo",
		CssClasses = "light-invert"
	},
	["Combo Status Chance"] = {
		Image = "ComboStatusChanceBuff.png",
		Link = "Melee#Combo Counter",
		CssClasses = "light-invert"	 --Can't think of a more appropriate link
	},
	["Critical Chance"] = {
		Description = "Chance that any given attack will do bonus Critical Hit Damage. Values over 100% have a chance to become orange Critical Hits, and over 200% have a chance to become red.",
		Image = "CritChanceBuff.png",
		Link = "Critical Hit#Critical Hit Chance",
		CssClasses = "light-invert"
	},
	["Critical Multiplier"] = {
		Description = "Critical Hit Damage is multiplied by this value. The added Damage is doubled for orange Critical Hits, and tripled for red.",
		Image = "CriticalDamageBuff.png",
		Link = "Critical Hit",
		CssClasses = "light-invert"
	},
	["Damage"] = {
		Description = "Damage dealt to a certain target. Damage results are modified by several mechanics – damage type modifiers, armor, critical hit bonuses, stealth bonuses, Warframe ability debuffs, body part modifiers, faction modifiers, and other sources of damage reduction.",
		Image = "DamageBuff.png",
		Link = "Damage",
		CssClasses = "light-invert"
	},
	["Damage Reduction"] = {
		Description = "When a player or enemy deals damage to their targets' health or shields, that damage may be mitigated by sources of damage reduction. In other words, players may deal less damage than the listed Arsenal value due to armor; damage type modifiers from different health, armor, and shield classes; and/or other sources of damage reduction.",
		Image = "DamageReductionBuff.png",
		Link = "Damage Reduction",
		CssClasses = "light-invert"
	},
	["Energy Regen"] = {
		Image = "EnergyRegenBuff.png",
		Link = "Energy",
		CssClasses = "light-invert"
	},
	["Fire Rate"] = {
		Description = "Maximum number of projectiles that can be launched per second.",
		Image = "FireRateBuff.png",
		Link = "Fire Rate",
		CssClasses = "light-invert"
	},
	["Health Conversion"] = {
		Image = "HealthConversionBuff.png",
		Link = "Health Conversion",
		CssClasses = "light-invert"	
	},
	["Health Regen"] = {
		Image = "HealthRegenBuff.png",
		Link = "Health",
		CssClasses = "light-invert"
	},
	["Status Chance"] = {
		Description = "The chance that a hit will apply a Status Effect based on the types of damage the weapon inflicts.",
		Image = "StatusChanceBuff.png",
		Link = "Status Effect#Status Chance",
		CssClasses = "light-invert"
	},
	["Affinity Blessing"] = {
		Image = "MasteryRankBlessingAffinityBooster.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
	["Damage Blessing"] = {
		Image = "MasteryRankBlessingBuffDamage.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
	["Health Blessing"] = {
		Image = "MasteryRankBlessingBuffHealth.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
	["Shield Blessing"] = {
		Image = "MasteryRankBlessingBuffShield.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
	["Credit Blessing"] = {
		Image = "MasteryRankBlessingCreditBooster.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
	["Resource Blessing"] = {
		Image = "MasteryRankBlessingResourceBooster.png",
		Link = "True Master's Font",
		CssClasses = "light-invert"
	},
},

["Clan"] = {
	["Ghost"] = {
		Image = "LeaderBadgeGhostHolo.png",
		Link = "Clan#Clan Tier",
		CssClasses = "light-invert"
	},
	["Shadow"] = {
		Image = "LeaderBadgeShadowHolo.png",
		Link = "Clan#Clan Tier",
		CssClasses = "light-invert"
	},
	["Storm"] = {
		Image = "LeaderBadgeStormHolo.png",
		Link = "Clan#Clan Tier",
		CssClasses = "light-invert"
	},
	["Mountain"] = {
		Image = "LeaderBadgeMountainHolo.png",
		Link = "Clan#Clan Tier",
		CssClasses = "light-invert"
	},
	["Moon"] = {
		Image = "LeaderBadgeMoonHolo.png",
		Link = "Clan#Clan Tier",
		CssClasses = "light-invert"
	},
},
}

return IconData
```

