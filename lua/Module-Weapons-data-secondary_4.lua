	"data": {
		"AmmoCapacity": 5,
		"AmmoClipSize": 1,
		"ArtifactSlots": ["AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_ATTACK", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_UNIVERSAL", "AP_TACTIC", "AP_UNIVERSAL"],
		"Behaviors": [{
				"fire:LotusWeaponProjectileFireBehavior": {
					"AIMED_ACCURACY": {
						"Spread": {
							"SHOOTING": {
								"range": [0, 12],
								"type": "ST_EXPONENTIAL"
							}
						}
					},
					"IgnoreFireIterations": 0,
					"IsMeleeBehavior": 0,
					"IsSilenced": 0,
					"RoundUpAmmoConsumption": 0,
					"ScaleAmmoRequirement": 0,
					"UseAmmo": 1,
					"ammoRequirement": 1,
					"ammoType": "/Lotus/Weapons/Ammo/RifleAmmoEx",
					"chargedProjectileType": {
						"AttackData": {
							"Amount": 187,
							"HitType": "DHT_PROJECTILE",
							"ProcChance": 0.21,
							"Type": "DT_IMPACT"
						},
						"BounceOnAvatars": 0,
						"CanStick": 1,
						"ClusterProjectiles": {
							"AttackData": {
								"Amount": 49,
								"HitType": "DHT_PROJECTILE",
								"ProcChance": 0.21,
								"Type": "DT_IMPACT"
							},
							"BounceOnAvatars": 0,
							"CanStick": 1,
							"CriticalChance": 0.35,
							"CriticalMultiplier": 2.1,
							"DamageRadius": 3.5,
							"DealDamageThroughImpactBehavior": 1,
							"EmbedAttack": {
								"Amount": 0,
								"Type": "DT_POISON"
							},
							"EmbedDeathAttack": {
								"Amount": 35,
								"Type": "DT_EXPLOSION"
							},
							"EmbedTime": [0.5, 0.5],
							"ExplosionFallOff": 0.5,
							"ExplosionIgnoreSource": 1,
							"ExplosiveAttack": {
								"Amount": 57,
								"HitType": "DHT_RADIAL",
								"ProcChance": 0.21
							},
							"MaxLife": 2
						},
						"CriticalChance": 0.35,
						"CriticalMultiplier": 2.1,
						"DamageRadius": 8.3,
						"DealDamageThroughImpactBehavior": 1,
						"EmbedAttack": {
							"Amount": 0,
							"Type": "DT_POISON"
						},
						"EmbedDeathAttack": {
							"Amount": 175,
							"HitType": "DHT_RADIAL"
						},
						"ExplosionFallOff": 0.9,
						"ExplosiveAttack": {
							"Amount": 839,
							"HitType": "DHT_RADIAL",
							"ProcChance": 0.21
						},
						"MaxLife": 5,
						"NumClusterProjectiles": 3
					},
					"fireIterations": 1,
					"projectileType": {
						"AttackData": {
							"Amount": 187,
							"HitType": "DHT_PROJECTILE",
							"ProcChance": 0.21,
							"Type": "DT_IMPACT"
						},
						"BounceOnAvatars": 0,
						"CanStick": 1,
						"ClusterProjectiles": {
							"AttackData": {
								"Amount": 49,
								"HitType": "DHT_PROJECTILE",
								"ProcChance": 0.21,
								"Type": "DT_IMPACT"
							},
							"BounceOnAvatars": 0,
							"CanStick": 1,
							"CriticalChance": 0.35,
							"CriticalMultiplier": 2.1,
							"DamageRadius": 3.5,
							"DealDamageThroughImpactBehavior": 1,
							"EmbedAttack": {
								"Amount": 0,
								"Type": "DT_POISON"
							},
							"EmbedDeathAttack": {
								"Amount": 35,
								"Type": "DT_EXPLOSION"
							},
							"EmbedTime": [0.5, 0.5],
							"ExplosionFallOff": 0.5,
							"ExplosionIgnoreSource": 1,
							"ExplosiveAttack": {
								"Amount": 57,
								"HitType": "DHT_RADIAL",
								"ProcChance": 0.21
							},
							"MaxLife": 2
						},
						"CriticalChance": 0.35,
						"CriticalMultiplier": 2.1,
						"DamageRadius": 8.3,
						"DealDamageThroughImpactBehavior": 1,
						"EmbedAttack": {
							"Amount": 0,
							"Type": "DT_POISON"
						},
						"EmbedDeathAttack": {
							"Amount": 175,
							"HitType": "DHT_RADIAL"
						},
						"ExplosionFallOff": 0.9,
						"ExplosiveAttack": {
							"Amount": 839,
							"HitType": "DHT_RADIAL",
							"ProcChance": 0.21
						},
						"MaxLife": 5,
						"NumClusterProjectiles": 3
					}
				},
				"fire:Type": "/Lotus/Types/Game/LotusWeaponProjectileFireBehavior",
				"impact:LotusWeaponImpactBehavior": {
					"AttackData": {
						"Amount": 10,
						"DT_IMPACT": 0.33333,
						"DT_PUNCTURE": 0.33333,
						"DT_SLASH": 0.33333,
						"HitType": "DHT_NONE",
						"ProcChance": 0.1,
						"Type": "DT_PHYSICAL",
						"UseNewFormat": 0
					},
					"PlayerDamageMultiplier": 1,
					"PvpDamageMultiplier": 1,
					"criticalHitChance": 0.2,
					"criticalHitDamageMultiplier": 1.5,
					"radius": 0
				},
				"impact:Type": "/Lotus/Types/Weapon/LotusWeaponImpactBehavior",
				"state:ChargedRemoteMineStateBehavior": {
					"AutoFireWhenChargeCompleted": 0,
					"ChargeModifier": "WEAPON_FIRE_RATE",
					"ChargeTime": 0.4,
					"ClipSizeAffectsChargeTime": 0,
					"DamageMultiplier": 1,
					"IsAlternateFire": 0,
					"LocTag": "/Lotus/Language/Menu/Loadout_TriggerCharge",
					"MinChargeRatio": 1,
					"MinDamageMultiplier": 1,
					"fireRate": 40,
					"reloadTime": 0.6
				},
				"state:Type": "/Lotus/Types/Weapon/ChargedRemoteMineStateBehavior"
			}
		],
		"CompatibilityTags": ["PROJECTILE", "AOE", "SNIPER_AMMO", "SINGLESHOT", "GRNBOW"],
		"EquipTime": 1.8,
		"GripType": "BOW",
		"HasClip": 0,
		"Icon": "/Lotus/Interface/Icons/StoreIcons/Weapons/PrimaryWeapons/Weapons/KuvaGrnBow.png",
		"InventorySlot": "SLOT_2",
		"IsKuva": 1,
		"LevelCap": 40,
		"LocalizeDescTag": "/Lotus/Language/Weapons/KuvaGrnBowDesc",
		"LocalizeTag": "/Lotus/Language/Weapons/KuvaGrnBowName",
		"MarketMode": "MM_HIDDEN",
		"OmegaAttenuation": 0.6,
		"PVPAmmoClipSize": 1,
		"PremiumPrice": 225,
		"ProductCategory": "LongGuns",
		"RequiredLevel": 15,
		"SellingPrice": 7500,
		"ZoomLevels": [{}
		]
	},
	"id": 4245,
	"parent": "/Lotus/Weapons/Tenno/Bows/LotusLongBow",
	"parents": ["/Lotus/Weapons/Tenno/Bows/LotusLongBow", "/Lotus/Weapons/Tenno/Bows/LotusBow", "/Lotus/Weapons/Tenno/Rifle/LotusRifle", "/Lotus/Weapons/Tenno/LotusLongGun", "/Lotus/Weapons/Tenno/LotusBulletWeapon"],
	"path": "/Lotus/Weapons/Grineer/Bows/GrnBow/GrnBowWeapon",
	"storeData": {
		"DisplayRecipe": "",
		"PremiumPrice": 225,
		"ProductCategory": "LongGuns",
		"SearchTags": ["/Lotus/Language/Game/DT_EXPLOSION_NoIcon", "/Lotus/Language/Game/DT_IMPACT_NoIcon", "/Lotus/Language/Items/BowCategoryName", "/Lotus/Language/Items/RifleCategoryName", "/Lotus/Language/Items/SniperCategoryName"],
		"SellingPrice": 7500,
		"ShowInMarket": 0
	},
	"storeItemType": "/Lotus/StoreItems/Weapons/Grineer/Bows/GrnBow/GrnBowWeapon",
	"tag": "Weapon",
	"texture": "/Lotus/Interface/Icons/Store/KuvaGrnBow.png",
	"texture_new": "/Lotus/Interface/Icons/StoreIcons/Weapons/PrimaryWeapons/Weapons/KuvaGrnBow.png"
}
