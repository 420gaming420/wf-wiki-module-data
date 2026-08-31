---	'''Weapons/infobox''' builds the infobox on weapon pages and adds the 
--	appropriate category pages.<br />
--
--	@module		weapons
--	@alias		p
--	@author			[[User:FINNER|FINNER]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Weapons/Conclave/data]]
--	@require	[[Module:Math]]
--	@require	[[Module:Table]]
--	@require	[[Module:Polarity]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Vendors]]
--	@require	[[Module:Baro]]
--	@require	[[Module:InfoboxBuilder]]
--	@release	stable
--	

local Weapons = require([[Module:Weapons]])
local Math = require([[Module:Math]])
local Table = require([[Module:Table]])
local Polarity = require([[Module:Polarity]])
local Tooltips = require([[Module:Tooltips]])
local Vendor = require([[Module:Vendors]])
local Baro = require([[Module:Baro]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])

return {
--- Builds the weapon infobox.
--	@function	p.buildInfobox
--	@param		{table} frame Frame object
--	@return		{string} Wikitext of infobox
buildInfobox = function(frame)
	local args = frame.args;
	local name = mw.text.decode(args['Name']);
	local isConclaveArticle = mw.title.getCurrentTitle().nsText == 'Conclave'
	local weapon = Weapons._getWeapon(name, isConclaveArticle)
	local formatted = Weapons._statFormatter(weapon, {})
	local isArchwing = Weapons._getValue(weapon, 'IsArchwing')
	local isMelee = Weapons._getValue(weapon, 'IsMelee')
	
	local tradableBaseText = "[[File:TradableIcon.png|x32px|class=icon dark-invert]] '''[[Trading|<span style=\"color:var(--positive-text-color)\">%s</span>]]<br />"
	local tradableTextMap = {
		[0] = "<span style=\"color:var(--negative-text-color)\">Untradeable</span>",
		[1] = tradableBaseText.."(unranked w/ no Forma or Catalyst)'''",
		[2] = tradableBaseText.."(parts and/or blueprint only)'''",
		[3] = tradableBaseText.."(indirectly through [[Adversary System|Lich]] trading)'''",
		[4] = tradableBaseText.."(only fully built components, not blueprints)'''",
		[5] = tradableBaseText.."(indirectly, comes with parent companion)'''",
	}
	
	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/weapons.json', 'WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/meta.json')
	:title(name)
	:image(
		weapon.IncarnonImage and {
			{label='Normal',  image=weapon.Image},
			{label='Incarnon',image=weapon.IncarnonImage}
		}
		or weapon.Image
		or 'UnidentifiedItem.png'
	,'Image')
	:group()
		:caption('Tradeable', weapon.Tradable and tradableTextMap[weapon.Tradable] or tradableTextMap[0], 'tradable')
		:caption('UniqueUpgrade', weapon.IsLichWeapon and 'Innate [[Adversary System#Notes|%s]]' or '', 'progenitor-bonus')
		:caption('CodexSecret', weapon.CodexSecret and '[[Hidden Mastery|%s]]' or nil, 'codex-secret')
	:done()
	:group():header('%s', 'general-information')
		:caption('UniqueTrait', weapon.UniqueTrait and formatted('UniqueTrait'), 'unique-trait')
		:row('Class', '[[File:MiniMapMod.png|x18px|link=Mod/Compatibility]] [[Mod/Compatibility|%s]]', formatted('Class'), 'type')
		:row('Mastery',	'[[File:MasterySigilClear.png|x18px|link=Mastery Rank]] [[Mastery Rank|%s]]', formatted('Mastery'), 'mastery-rank-requirement')
		:row('MaxRank', '%s', formatted('MaxRank'), 'max-rank')
		:row('Slot', '[[File:TopWeapon.png|x18px|link=Weapons]] [[Weapons|%s]]', formatted('Slot'), 'slot')
		:row('Trigger',	'[[Trigger Type|%s]]', formatted('Trigger'), 'trigger-type')
	:done()
	
	:group():header('%s', 'utility')
		:row('Accuracy', '[[Accuracy|%s]]', Weapons._statFormatIf(weapon, nil, 'AccuracyBucket'), 'accuracy')
		:row('AttackSpeed', '[[Attack Speed|%s]]', isMelee and Weapons._statFormat(weapon, nil, 'AttackSpeed') or nil, 'attack-speed')
		:row('AmmoMax', '[[Ammo#Ammo Maximum|%s]]', weapon.AmmoMax and formatted('AmmoMax'), 'ammo-max')
		:row('AmmoPickup', '[[Ammo#Ammo Pickup|%s]]', weapon.AmmoPickup and formatted('AmmoPickup'), 'ammo-pickup')
		:row('AmmoType', '[[Ammo#Ammo Packs|%s]]', weapon.AmmoType and formatted('AmmoType'), 'ammo-type')
		:row('BlockAngle', '[[Melee#Blocking|%s]]', weapon.BlockAngle and formatted('BlockAngle'), 'block-angle')
		:row('ComboDur', '[[Melee|%s]]', weapon.ComboDur and formatted('ComboDur'), 'combo-duration')
		:row('Disposition', '[[Riven_Mods#Disposition|%s]]', formatted('Disposition'), 'disposition')
		:row('FireRate', '[[Fire Rate|%s]]', (not isMelee) and weapon.FireRate and formatted('FireRate') or nil, 'fire-rate')
		:row('FollowThrough', '[[Melee#Follow_Through|%s]]', weapon.FollowThrough and formatted('FollowThrough'), 'follow-through')
		-- :row('IncarnonChargeGain', '[[Incarnon Mode|%s]]', weapon.IncarnonChargeGain and atk_formatted('IncarnonChargeGain'), 'incarnon-charge-gain')
		:row('MeleeRange', '[[Melee#Range|%s]]', weapon.MeleeRange and formatted('MeleeRange'), 'range')
		:row('NoiseLevel', '[[Noise Level|%s]]', weapon.IsSilent and formatted('NoiseLevel'), 'noise-level')
		:row('Magazine', '[[Ammo#Magazine Capacity|%s]]', weapon.Magazine and formatted('Magazine'), 'magazine-size')
		:row('Reload', '[[Reload|%s]]', weapon.Reload and formatted('Reload'), 'reload-time')
		:row('ReloadDelay', '[[Reload|%s]]', weapon.ReloadDelay and formatted('ReloadDelay'), 'reload-delay')
		:row('ReloadRate', '[[Reload|%s]]', weapon.ReloadRate and formatted('ReloadRate'), 'reload-rate')
		:row('ShotSpeed', '[[Projectile Speed|%s]]', weapon.ShotSpeed and formatted('ShotSpeed'), 'projectile-speed')
		:row('ShotType', '%s', weapon.ShotType and formatted('ShotType'), 'projectile-type')
		:row('SniperComboReset', '[[Sniper Rifle|%s]]', weapon.SniperComboReset and formatted('SniperComboReset'), 'combo-decay')
		:row('SniperComboMin', '[[Sniper Rifle|%s]]', weapon.SniperComboMin and formatted('SniperComboMin'), 'combo-min')
		:row('Spread', '[[Spread|%s]]', weapon.MinSpread and formatted('AvgSpread')..' ('..formatted('MinSpread')..' min, '..formatted('MaxSpread')..' max)', 'spread')
		:row('SweepRadius', '[[Sweep Radius|%s]]', weapon.SweepRadius and formatted('SweepRadius'), 'sweep-radius')
		:row('Spool', '[[Fire Rate#Auto-Spool Weapons|%s]]', weapon.Spool and formatted('Spool'), 'spool-up-rate')
		:row('Zoom', '[[Zoom|%s]]', weapon.Zoom and formatted('Zoom'), 'zoom')
	:done()
	
	-- Weapons attack sections
	local horiz, elems, attack
	for i, attackEntry in ipairs(weapon.Attacks) do
		local atk_formatted = Weapons._statFormatter(weapon, i)
		attack = 'Attack'..i
		elems = {}
		for dt, dmg in pairs(attackEntry.Damage) do
			if dt ~= 'Impact' and dt ~= 'Puncture' and dt ~= 'Slash' then
				table.insert(elems, dt)
			end
		end
		
		Infobox=Infobox:group():header(atk_formatted('AttackName') or name)
		
		-- Displaying IPS damage types first to match in-game presentation
		horiz = Infobox:hgroup()
		local damageFormatString = '%s<br />(%s)'
		
		if isConclaveArticle then
			horiz:row(attack..'PvPImpact', nil, attackEntry.Damage.Impact and 
					damageFormatString:format(atk_formatted('PvPImpact'), atk_formatted('ImpactDistribution')), 'impact')
				:row(attack..'PvPPuncture', nil, attackEntry.Damage.Puncture and 
					damageFormatString:format(atk_formatted('PvPPuncture'), atk_formatted('PunctureDistribution')), 'puncture')
				:row(attack..'PvPSlash', nil, attackEntry.Damage.Slash and 
					damageFormatString:format(atk_formatted('PvPSlash'), atk_formatted('SlashDistribution')), 'slash')
		else
			horiz:row(attack..'Impact', nil, attackEntry.Damage.Impact and 
					damageFormatString:format(atk_formatted('Impact'), atk_formatted('ImpactDistribution')), 'impact')
				:row(attack..'Puncture', nil, attackEntry.Damage.Puncture and 
					damageFormatString:format(atk_formatted('Puncture'), atk_formatted('PunctureDistribution')), 'puncture')
				:row(attack..'Slash', nil, attackEntry.Damage.Slash and 
					damageFormatString:format(atk_formatted('Slash'), atk_formatted('SlashDistribution')), 'slash')
		end
		
		for _, elem in ipairs(elems) do
			if isConclaveArticle then
				horiz:row(attack..'PvP'..elem, nil, attackEntry.Damage[elem] and 
					damageFormatString:format(atk_formatted('PvP'..elem), atk_formatted(elem..'Distribution')), elem)
			else
				horiz:row(attack..elem, nil, attackEntry.Damage[elem] and 
					damageFormatString:format(atk_formatted(elem), atk_formatted(elem..'Distribution')), elem)
			end
		end
		Infobox=horiz:done()
		
			:row(attack..'Total', '[[Damage|%s]]', atk_formatted('TotalDamage')..' ('..atk_formatted('DamageBias')..')', 'total-damage')
			:row(attack..'Accuracy', '[[Accuracy|%s]]', attackEntry.MinSpread and atk_formatted('AccuracyBucket'), 'accuracy')
			-- A melee weapon's index 1 attack should always be a normal melee sweep
			:row(attack..'AttackSpeed', '[[Attack Speed|%s]]', (isMelee and i == 1) and atk_formatted('AttackSpeed') or nil, 'attack-speed')
			:row(attack..'AmmoCost', '%s', attackEntry.AmmoCost and atk_formatted('AmmoCost'), 'ammo-cost')
			:row(attack..'AmmoMax', '[[Ammo#Ammo Maximum|%s]]', attackEntry.AmmoMax and atk_formatted('AmmoMax'), 'ammo-max')
			:row(attack..'AttackSpeed', '[[Attack Speed|%s]]', attackEntry.AttackSpeed and atk_formatted('AttackSpeed'), 'attack-speed')
			:row(attack..'BurstCount', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstCount and atk_formatted('BurstCount'), 'burst-count')
			:row(attack..'BurstDelay', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstDelay and atk_formatted('BurstDelay'), 'burst-delay')
			:row(attack..'BurstReloadDelay', '[[Fire Rate#Fire Rate and Burst Weapons|%s]]', attackEntry.BurstReloadDelay and atk_formatted('BurstReloadDelay'), 'burst-reload-delay')
			:row(attack..'ChargeTime', '[[Fire_Rate#Fire_Rate_and_Charge_Time|%s]]', attackEntry.ChargeTime and atk_formatted('ChargeTime'), 'charge-time')
			:row(attack..'CritChance', '[[Critical Hit|%s]]', atk_formatted('CritChance'), 'crit-chance')
			:row(attack..'CritMultiplier', '[[Critical Hit|%s]]', atk_formatted('CritMultiplier'), 'crit-multiplier')
			:row(attack..'Falloff', '[[Damage Falloff|%s]]', attackEntry.Falloff and atk_formatted('Falloff'), 'damage-falloff')
			:row(attack..'EffectDuration', '%s', attackEntry.Duration and atk_formatted('Duration'), 'effect-duration')
			:row(attack..'ExplosionDelay', '%s', attackEntry.ExplosionDelay and atk_formatted('ExplosionDelay'), 'explosion-delay')
			-- A melee weapon's index 1 attack should always be a normal melee sweep so don't show this attack as
			-- having a Fire Rate; additional attacks that are not Heavy/Slam/Slide attacks should display it as Fire Rate
			-- like in the case of gunblades
			:row(attack..'FireRate', '[[Fire Rate|%s]]', (i ~= 1 or not isMelee) and attackEntry.FireRate and atk_formatted('FireRate'), 'fire-rate')
			:row(attack..'ForcedProcs', '[[Status Effect|%s]]', attackEntry.ForcedProcs and atk_formatted('ForcedProcs'), 'forced-procs')
			:row(attack..'HeadshotMultiplier', '%s', attackEntry.HeadshotMultiplier and atk_formatted('HeadshotMultiplier'), 'headshot-multiplier')
			:row(attack..'IncarnonCharges', '%s', attackEntry.IncarnonCharges and atk_formatted('IncarnonCharges'), 'incarnon-charges')
			:row(attack..'Multishot', '[[Multishot|%s]]', attackEntry.Multishot and ('%d (%s damage per projectile)'):format(attackEntry.Multishot, atk_formatted('BaseDamage')), 'multishot')
			:row(attack..'NoiseLevel', '[[Noise Level|%s]]', atk_formatted('NoiseLevel'), 'noise-level')
			:row(attack..'PunchThrough', '[[Punch Through|%s]]', attackEntry.PunchThrough and atk_formatted('PunchThrough'), 'punch-through')
			:row(attack..'Range', '[[Range|%s]]', attackEntry.Range and atk_formatted('Range'), 'range')
			:row(attack..'Reload', '[[Reload|%s]]', attackEntry.Reload and atk_formatted('Reload'), 'reload-time')
			:row(attack..'Spread', '[[Spread|%s]]', attackEntry.MinSpread and atk_formatted('AvgSpread')..' ('..atk_formatted('MinSpread')..' min, '..atk_formatted('MaxSpread')..' max)', 'spread')
			:row(attack..'StatusChance', '[[Status Chance|%s]]', attackEntry.StatusChance and atk_formatted('StatusChance'), 'status-chance')
			:row(attack..'ShotSpeed', '[[Projectile Speed|%s]]', attackEntry.ShotSpeed and atk_formatted('ShotSpeed'), 'projectile-speed')
			:row(attack..'ShotType', '%s', attackEntry.ShotType and atk_formatted('ShotType'), 'projectile-type')
			:row(attack..'Trigger', '[[Trigger Type|%s]]', attackEntry.Trigger and atk_formatted('Trigger'), 'trigger-type')
		:done()
	end
	
	-- Adding additional melee-only rows; not including Archmelees
	if (isMelee and not isArchwing) then
		Infobox:group():header('%s', 'heavy-attack')
			:row('HeavyAttack', '[[Melee#Heavy Attack|%s]]', formatted('HeavyAttack'), 'heavy-damage')
			:row('WindUp', '[[Melee#Heavy Attack|%s]]', formatted('WindUp'), 'wind-up')
		:done()
		
		:group():header('%s', 'slide-attack')
			:row('SlideAttack', '[[Melee#Slide Attack|%s]]', formatted('SlideAttack'), 'slide-damage')	-- Archmelees don't have slide attacks
		:done()
	end
	
	Infobox:group():header('%s', 'miscellaneous')
		:row('Augment', '[[Weapons Augments|%s]]', weapon.Augment, 'augments')	-- TODO: Rename key to Augments b/c some weapons have multiple augments; also hook getter to M:Weapons
		:row('CompatibilityTags', '[[Compatibility Tag|%s]]', weapon.CompatibilityTags and table.concat(weapon.CompatibilityTags, ', '), 'compatibility-tags')
		:row('RivenFamily', '[[Riven Mods|%s]]', formatted('Family'), 'riven-family')
		:row('ExilusPolarity', '[[Exilus Weapon Adapter|%s]]', weapon.ExilusPolarity and formatted('ExilusPolarity'), 'exilus-polarity')
		:row('Introduced', '%s', weapon.Introduced and formatted('Introduced'), 'introduced')
		:row('Polarities', '[[Polarity|%s]]', formatted('Polarities'), 'polarities')
		:row('SellPrice', '%s', weapon.SellPrice and formatted('SellPrice'), 'sell-price')
		:row('StancePolarity', '[[Stance|%s]]', weapon.StancePolarity and formatted('StancePolarity'), 'stance-polarity')	-- Note Exalted weapons will not show this row
		:row('SyndicateEffect',	'[[Syndicate Radial Effects|%s]]', formatted('SyndicateEffect'), 'syndicate-effect')
		:row('Users', '%s', weapon.Users and formatted('Users'), 'users')
		:row('Variants', '%s', weapon.Family and formatted('FamilyList'), 'variants')
	:done()
	
	local vendorStr = Vendor._buildVendorSourceStrings(name)
	local baroStr = Baro._buildBaroSourceStrings(name)
	
	Infobox:group():header('%s', 'vendor-sources')
		:value('<div class="tabber-borderless">'..frame:callParserFunction('#tag:tabber',
			((vendorStr ~= '') and '|-|Vendors='..vendorStr..'\n' or '')..
			((baroStr ~= '') and '|-|Baro Ki\'Teer='..baroStr..'\n' or '')
		)..'</div>', 'Offerings')
	:done()
	:group(true,name..' Categories'):header('%s', 'article-categories')
		:value(formatted('Categories'), 'Categories')
	:done()
	:group():header('%s', 'maintenance')
		:caption('UpdateInfoboxData', '[[Module:Weapons/data|📝 %s]]', 'update-infobox-data')
	:done()

	return Infobox:_dump(weapon)
end
}
