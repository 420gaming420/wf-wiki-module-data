"data": {
    "ArtifactPolarity": "AP_ATTACK", -- Mod polarity as stored as an string enum
    "BaseDrain": "QA_MEDIUM", -- Base mod capacity drain as stored as a string enum
    "ExcludeFromCodex": 0, -- Boolean value as an integer (0 or 1) to determine whether to hide mod from Codex or not
    "FusionLimit": "QA_VERY_HIGH", -- Mod's max rank as stored a a string enum
    "Icon": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.png", -- Game's internal file path to the mod image
    "IncludeInBoosterPack": 1, -- Boolean value as an integer to determine if mod is transmutable or not
    "ItemCompatibility": "/Lotus/Weapons/Tenno/Rifle/LotusRifle", - Mod item compatibility as location to object definition
    "ItemCompatibilityLocTag": "/Lotus/Language/Items/RifleCategoryName", -- Location of mod item compatibility localization string (e.g. "Rifle")
    "LocalizeDescTag": "",
    "LocalizeTag": "/Lotus/Language/Items/RifleModDamageAmount", -- Location of localization string of mod description
    "MarketMode": "MM_HIDDEN", -- Whether or not mod is available in in-game market as a string enum
    "ProductCategory": "Upgrades", - Item category
    "Rarity": "UNCOMMON", - Mod rarity as a string enum
    "RectangleIcon": 1, -- Boolean value as an integer to determine whether or not mod image has a dimensions of a rectangle
    "Slotted": 0, -- Boolean value as an integer to determine if mod is installed
    "Upgrades": [{ -- Array of stat modifiers that the mod provides
            "AutoType": 1,
            "DamageType": "DT_ANY", -- If mod's effect provides damage stat modifiers, this will determine damage type that it will apply to as a string enum
            "DisplayAsMultiplier": 0,
            "DisplayAsPercent": 1,
            "LocKeyWordScript": {
                "Script": ""
            },
            "LocTag": "/Lotus/Language/Upgrades/WeaponDamageModDesc", -- Location of localization string of stat modifier
            "OperationType": "STACKING_MULTIPLY", -- How stat modifier is applied to base stat and how it interacts with other similar stat modifiers as a string enum
            "OverrideLocalization": 1,
            "ReverseValueSymbol": 0,
            "RoundTo": 0.1,
            "RoundingMode": "RM_ROUND", -- Value rounding mode as a string enum
            "SmallerIsBetter": 0, -- Boolean value as an integer to determine if smaller stat modifier is a buff or not
            "SymbolFilter": "", -- Search filter for any symbols present in mod description (e.g. damage icons)
            "UpgradeObject": "",
            "UpgradeType": "WEAPON_DAMAGE_AMOUNT", -- Stat modifier as a string enum
            "ValidModifiers": [],
            "ValidPostures": [], -- Array of valid avatar movement states to trigger mod's effect
            "ValidProcTypes": [], -- Array of valid status effects to trigger mod's effect
            "ValidType": "",
            "Value": 0.15000001 -- Value of said stat modifier as a floating-point value
        }]
    },
    "id": 626,
    "parent": "/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade", -- Parent game object of mod for inheritance
    "parents": ["/Lotus/Types/Game/LotusArtifactUpgrades/BaseArtifactUpgrade", "/Lotus/Types/Game/LotusArtifactUpgrade"],
    "path": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod", -- Unique path to mod data
    "storeData": { -- In-game market data for mod
        "Giftable": 0,
        "ProductCategory": "Upgrades",
        "SearchTags": ["/Lotus/Language/Items/RifleCategoryName"],
        "SellingPrice": 500, -- Mod's sell price in Credits
        "ShowInMarket": 0,
        "TypeName": "/Lotus/Upgrades/Mods/Rifle/WeaponDamageAmountMod"
    },
    "storeItemType": "/Lotus/StoreItems/Upgrades/Mods/Rifle/WeaponDamageAmountMod",
    "tag": "Mod",
    "texture": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg",
    "texture_new": "/Lotus/Interface/Cards/Images/Rifle/RifleDamageAmountMod.jpg"
},