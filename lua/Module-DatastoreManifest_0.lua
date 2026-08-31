---	Mapping item type to datastore locations on the wiki (e.g. 'Mod' to 'Module:Mods/data').
--	
--	@module			datastoremanifest
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|Gigamicro]] (based on [[Module:Tooltips/icon]])
--	@release		stable
--	

local MODULE_LOCALIZATION = mw.site.namespaces[828].name	-- TODO: Generalize for different wiki localizations?
return {
	Ability = {
		Description = 'Powersuit abilities',
		Source = 'Module:Ability/data', 
		CollectionNames = { 'Ability' },
	},
	Arcane = {
		Description = 'Arcane Enhancements',
		Source = 'Module:Arcane/data',
		CollectionNames = { 'Arcanes' },
	},
	Blueprint = {
		Description = 'Item blueprints',
		Source = 'Module:Blueprints/data',
		CollectionNames = { 'Blueprints' },
	},
	Companion = {
		Description = 'Player companions',
		Source = 'Module:Companions/data',
		CollectionNames = { 'Companions' },
	},
	Component = {
		Description = 'Item components',
		Source = 'Module:Resources/data',
		CollectionNames = { 'Resources', 'GenericComponents' },
	},
	Cosmetic = {
		Description = 'Cosmetic items',
		Source = 'Module:Cosmetics/data',
		-- Full list of collection name aliases can be found in [[Module:Cosmetics/data]]
		CollectionNames = {},
	},
	DamageType = {
		Description = 'Damage system including damage types, status effects, and enemy damage resistances/vulnerabilities',
		Source = 'Module:DamageTypes/data',
		CollectionNames = { 'Types', 'Health', 'Procs' },
	},
	Decoration = {
		Description = 'Orbiter, Clan Dojo, and Base of Operations decorations',
		Source = 'Module:Decorations/data',
		CollectionNames = { 'Atmospherics', 'Corpus', 'Grineer', 'Infested', 'Natural', 'Orokin', 'Ostron', 'Sentient', 'Solaris', 'Tenno', 'Trophies'},
	},
	Enemy = {
		Description = 'Enemy or NPC units',
		Source = 'Module:Enemies/data',
		CollectionNames = { },
	},
	Faction = {
		Description = 'Enemy and allied factions, including Syndicates',
		Source = 'Module:Factions/data',
		CollectionNames = { 'Factions' },
	},
	Focus = {
		Description = 'Operator focus trees',
		Source = 'Module:Focus/data',
		CollectionNames = { 'Ways', 'Schools', 'Symbols' },
	},
	Gear = {
		Description = 'Gear items',
		Source = 'Module:Resources/data',
		CollectionNames = { 'Resources' },
	},
	Key = {
		Description = 'Mission keys',
		Source = 'Module:Keys/data',
		CollectionNames = { },
	},
	Mod = {
		Description = 'Mod upgrades',
		Source = 'Module:Mods/data',
		CollectionNames = { 'Mods' },
	},
	Node = {
		Description = 'Mission node',
		Source = 'Module:Missions/data',
		CollectionNames = { 'MissionDetails' },
	},
	Relic = {
		Description = 'Void relics',
		Source = 'Module:Void/data', 
		CollectionNames = { 'RelicData' },
	},
	Resource = {
		Description = 'Item resources',
		Source = 'Module:Resources/data',
		CollectionNames = { 'Resources', 'GenericComponents' },
	},
	Scene = {
		Description = 'Captura scenes',
		Source = 'Module:Placeholder',
		CollectionNames = { },
	},
	Sigil = {
		Description = 'Sigil cosmetics',
		Source = 'Module:Sigils/data',
		CollectionNames = { },
	},
	Stat = {
		Description = 'Player and weapon statistics icons',
		Source = 'Module:Icon/data',
		CollectionNames = { 'Buff' },
	},
	Warframe = {
		Description = 'Warframe and other playable avatar stats',
		Source = 'Module:Warframes/data',
		CollectionNames = { 'Warframes', 'Archwings', 'Necramechs', 'Operators' },
	},
	Weapon = {
		Description = 'Weapon stats',
		Source = 'Module:Weapons/data',
		-- Full list of collection name aliases can be found in [[Module:Weapons/data]]
		CollectionNames = { 'Primary', 'Secondary', 'Melee', 'Arch-gun', 'Arch-melee', 'Robotic', 'Hound', 'Railjack', 'Amp', 'Kitgun', 'Zaw', 'Misc' },
	},
}
