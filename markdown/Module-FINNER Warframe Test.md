---
title: "Module:FINNER Warframe Test"
wiki_url: "https://wiki.warframe.com/w/Module/FINNER Warframe Test"
wiki_timestamp: "2021-06-08T17:58:23Z"
---

*Documentation for this module may be created at [Module:FINNER Warframe Test/doc](/w/Module:FINNER_Warframe_Test/doc?action=edit&redlink=1 "Module:FINNER Warframe Test/doc (page does not exist)")*

```lua
--	
local attacks = {
	NormalAttack = 'Normal Attack',
	SecondaryAttack = 'Secondary Attack',
	ChargeAttack = 'Charge Attack',
	ChargeAreaAttack = 'Charge Area Attack',
	AreaAttack = 'Area Attack',
	SecondaryChargeAttack = 'Secondary Charge Attack',
	SecondaryAreaAttack = 'Secondary Area Attack',
	ChargedThrowAttack = 'Charged Throw Attack',
	ThrowAttack = 'Throw Attack',
}

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

local function attack(data, param)
	return data[param] or
		(data.NormalAttack and data.NormalAttack[param]) or
		(data.SecondaryAttack and data.SecondaryAttack[param]) or
		(data.ChargeAttack and data.ChargeAttack[param]) or
		(data.ChargeAreaAttack and data.ChargeAreaAttack[param]) or
		(data.AreaAttack and data.AreaAttack[param]) or
		(data.SecondaryChargeAttack and data.SecondaryChargeAttack[param]) or
		(data.SecondaryAreaAttack and data.SecondaryAreaAttack[param]) or
		(data.ChargedThrowAttack and data.ChargedThrowAttack[param]) or
		(data.ThrowAttack and data.ThrowAttack[param])
end

local function format(data, str)
	return data and data..str
end

return {
buildInfobox = function(frame)
	local name = frame.args['name'];
	local data = {}

	if frame.args['conclave'] == 'false' then
		data = mw.loadData([[Module:Weapons/data]]).Weapons[name];
	else
		data = mw.loadData([[Module:Weapons/Conclave/data]]).Weapons[name];
	end

	local infobox = mw.html.create('infobox')
		:tag('title')
			:tag('default')
				:tag('b'):wikitext(name):done()
			:done()
		:done()
		:tag('image'):attr('source', 'Image')
			:tag('default'):wikitext(data.Image or 'Panel.png'):done()
		:done()
		:tag('header'):wikitext('Statistics'):done()
		:tag('data'):attr('source', 'Mastery')
			:tag('label'):wikitext('[[File:MasterySigilClear.png|x18px|link=Mastery Rank]] [[Mastery Rank|Mastery]]'):done()
			:tag('default'):wikitext(data.Mastery or '0'):done()
		:done()
		:tag('data'):attr('source', 'Type')
			:tag('label'):wikitext('[[File:TopWeapon.png|x18px|link=Weapons]] [[Weapons|Slot]]'):done()
			:tag('default'):wikitext(data.Type):done()
		:done()
		:tag('data'):attr('source', 'Class')
			:tag('label'):wikitext('[[File:MiniMapMod.png|x18px|link=Mods#Mod_List]] [[Mods#Mod_List|Type]]'):done()
			:tag('default'):wikitext(data.Class):done()
		:done()
		:tag('data'):attr('source', 'Trigger')
			:tag('label'):wikitext('[[Trigger Type]]'):done()
			:tag('default'):wikitext(data.Trigger):done()
		:done()
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Utility'):done()
			:tag('data'):attr('source', 'AmmoType')
				:tag('label'):wikitext('[[Ammo#Ammo Packs|Ammo Type]]'):done()
				:tag('default'):wikitext(data.AmmoType or data.Trigger):done()
			:done()
			:tag('data'):attr('source', 'ShotType')
				:tag('label'):wikitext('Projectile Type'):done()
				:tag('default'):wikitext(attack(data, 'ShotType')):done()
			:done()
			:tag('data'):attr('source', 'ShotSpeed')
				:tag('label'):wikitext('[[Projectile Speed]]'):done()
				:tag('default'):wikitext(format(attack(data, 'ShotSpeed'), 'm/s')):done()
			:done()
			:tag('data'):attr('source', 'Range')
				:tag('label'):wikitext('Range'):done()
				:tag('default'):wikitext(format(attack(data, 'MeleeRange') or attack(data, 'Range'), 'm')):done()
			:done()
			:tag('data'):attr('source', 'NoiseLevel')
				:tag('label'):wikitext('[[Noise Level]]'):done()
				:tag('default'):wikitext(attack(data, 'NoiseLevel')):done()
			:done()
			:tag('data'):attr('source', 'FireRate')
				:tag('label'):wikitext(data.Type == 'Melee' and '[[Attack Speed]]' or '[[Fire Rate]]'):done()
				:tag('default'):wikitext(attack(data, 'FireRate')):done()
			:done()
			:tag('data'):attr('source', 'Spool')
				:tag('label'):wikitext('[[Fire Rate#Auto-Spool Weapons|Spool Up Rate]]'):done()
				:tag('default'):wikitext(data.Spool):done()
			:done()
			:tag('data'):attr('source', 'Accuracy')
				:tag('label'):wikitext('[[Accuracy]]'):done()
				:tag('default'):wikitext(attack(data, 'Accuracy')):done()
			:done()
			:tag('data'):attr('source', 'Magazine')
				:tag('label'):wikitext('[[Ammo#Magazine Capacity|Magazine Size]]'):done()
				:tag('default'):wikitext(data.Magazine):done()
			:done()
			:tag('data'):attr('source', 'MaxAmmo')
				:tag('label'):wikitext('[[Ammo#Ammo Maximum|Max Ammo]]'):done()
				:tag('default'):wikitext(data.MaxAmmo):done()
			:done()
			:tag('data'):attr('source', 'Reload')
				:tag('label'):wikitext('[[Reload Speed|Reload Time]]'):done()
				:tag('default'):wikitext(format(attack(data, 'Reload'), 's')):done()
			:done()
			:tag('data'):attr('source', 'Zoom')
				:tag('label'):wikitext('[[Zoom]]'):done()
				:tag('default'):wikitext(data.Zoom and table.concat(data.Zoom, '  
')):done()
			:done()
			:tag('data'):attr('source', 'SniperComboReset')
				:tag('label'):wikitext('[[Sniper Rifle|Combo Decay]]'):done()
				:tag('default'):wikitext(format(data.SniperComboReset, 's')):done()
			:done()
			:tag('data'):attr('source', 'SniperComboMin')
				:tag('label'):wikitext('[[Sniper Rifle|Combo Min]]'):done()
				:tag('default'):wikitext(format(data.SniperComboMin, ' shots')):done()
			:done()
			:tag('data'):attr('source', 'ComboDur')
				:tag('label'):wikitext('[[Melee|Combo Duration]]'):done()
				:tag('default'):wikitext(format(data.ComboDur, 's')):done()
			:done()
			:tag('data'):attr('source', 'BlockAngle')
				:tag('label'):wikitext('[[Melee#Blocking|Block Angle]]'):done()
				:tag('default'):wikitext(format(data.BlockAngle, '°')):done()
			:done()
			:tag('data'):attr('source', 'FollowThrough')
				:tag('label'):wikitext('[[Melee#Follow_Through|Follow Through]]'):done()
				:tag('default'):wikitext(data.FollowThrough and 100*data.FollowThrough..'%'):done()
			:done()
			:tag('data'):attr('source', 'Disposition')
				:tag('label'):wikitext('[[Riven_Mods#Disposition|Disposition]]'):done()
				:tag('default'):wikitext('{{Icon|Dis|'..(data.Disposition or 0)..'}} ('..
					(data.Disposition or 0)..'x)'):done()
			:done()
		:done()
		
		local horiz, elem, total, plur, plurDT, attackData
		for attack, name in pairs(attacks) do
			if data[attack] then
				attackData = data[attack]
				elem = nil
				plur = 0
				for dt, dmg in pairs(attackData.Damage) do
					if plur < dmg then plur = dmg; plurDT = dt end
					if dt ~= 'Impact' and dt ~= 'Puncture' and dt ~= 'Slash' then
						elem = dt
					end
				end
				
				total = (attackData.Damage.Impact or 0) +
					(attackData.Damage.Puncture or 0) +
					(attackData.Damage.Slash or 0)
					
				horiz = mw.html.create('group'):attr('layout', 'horizontal')
					:tag('data'):attr('source', attack..'Impact'):css({
						['height'] = '30px',
						['padding'] = '0',
						['text-align'] = 'center',
					})
						:tag('default'):wikitext('{{D/img|Impact}}'..(attackData.Damage.Impact)):done()
					:done()
					:tag('data'):attr('source', attack..'Puncture')
						:tag('default'):wikitext('{{D/img|Puncture}}'..(attackData.Damage.Puncture)):done()
					:done()
					:tag('data'):attr('source', attack..'Slash')
						:tag('default'):wikitext('{{D/img|Slash}}'..(attackData.Damage.Slash)):done()
					:done()
				if elem then
					horiz:tag('data'):attr('source', attack..'Element')
						:tag('default'):wikitext('{{D/img|'..elem..'}}'..(attackData.Damage[elem])):done()
					:done()
					total = total + attackData.Damage[elem]
				end
				
				infobox:tag('group'):attr('collapse', 'open')
					:tag('header'):wikitext(attackData.AttackName or name):done()
					:node(horiz)
					:tag('data'):attr('source', attack..'Total')
						:tag('label'):wikitext('[[Damage|Total Damage]]'):done()
						:tag('default'):wikitext(total..' ({{D/img|'..plurDT..'}}'..100*plur/total..'%)'):done()
					:done()
					:tag('data'):attr('source', attack..'Trigger')
						:tag('label'):wikitext('[[Trigger Type]]'):done()
						:tag('default'):wikitext(attackData.Trigger):done()
					:done()
					:tag('data'):attr('source', attack..'ShotType')
						:tag('label'):wikitext('Projectile Type'):done()
						:tag('default'):wikitext(attackData.ShotType):done()
					:done()
					:tag('data'):attr('source', attack..'ShotSpeed')
						:tag('label'):wikitext('[[Projectile Speed]]'):done()
						:tag('default'):wikitext(format(attackData.ShotSpeed, 'm/s')):done()
					:done()
					:tag('data'):attr('source', attack..'Range')
						:tag('label'):wikitext('Range'):done()
						:tag('default'):wikitext(format(attackData.MeleeRange or attackData.Range, 'm')):done()
					:done()
					:tag('data'):attr('source', attack..'NoiseLevel')
						:tag('label'):wikitext('[[Noise Level]]'):done()
						:tag('default'):wikitext(attackData.NoiseLevel):done()
					:done()
					:tag('data'):attr('source', attack..'FireRate')
						:tag('label'):wikitext(data.Type == 'Melee' and '[[Attack Speed]]' or '[[Fire Rate]]'):done()
						:tag('default'):wikitext(attackData.FireRate):done()
					:done()
					:tag('data'):attr('source', attack..'ChargeTime')
						:tag('label'):wikitext('[[Fire Rate#Charged Weapons|Charge Time]]'):done()
						:tag('default'):wikitext(format(attackData.ChargeTime, 's')):done()
					:done()
					:tag('data'):attr('source', attack..'Accuracy')
						:tag('label'):wikitext('[[Accuracy]]'):done()
						:tag('default'):wikitext(attackData.Accuracy):done()
					:done()
					:tag('data'):attr('source', attack..'Reload')
						:tag('label'):wikitext('[[Reload Speed|Reload Time]]'):done()
						:tag('default'):wikitext(format(attackData.Reload, 's')):done()
					:done()
					:tag('data'):attr('source', attack..'BurstCount')
						:tag('label'):wikitext('Burst Count'):done()
						:tag('default'):wikitext(attackData.BurstCount):done()
					:done()
					:tag('data'):attr('source', attack..'BurstRate')
						:tag('label'):wikitext('Burst Rate'):done()
						:tag('default'):wikitext(attackData.BurstRate):done()
					:done()
					:tag('data'):attr('source', attack..'BurstDelay')
						:tag('label'):wikitext('Burst Delay'):done()
						:tag('default'):wikitext(format(attackData.BurstDelay, 's')):done()
					:done()
					:tag('data'):attr('source', attack..'Multishot')
						:tag('label'):wikitext('[[Multishot|'..(attackData.PelletName or 'Pellet')..'s]]'):done()
						:tag('default'):wikitext(format(attackData.PelletCount, attackData.PelletCount and (total/attackData.PelletCount)..' per '..(attackData.PelletName or 'Pellet'))):done()
					:done()
					:tag('data'):attr('source', attack..'StatusChance')
						:tag('label'):wikitext('[[Status Chance]]'):done()
						:tag('default'):wikitext(attackData.StatusChance and 100*attackData.StatusChance..'%'):done()
					:done()
					:tag('data'):attr('source', attack..'CritChance')
						:tag('label'):wikitext('[[Critical Hit|Crit Chance]]'):done()
						:tag('default'):wikitext(attackData.CritChance and 100*attackData.CritChance..'%'):done()
					:done()
					:tag('data'):attr('source', attack..'CritMultiplier')
						:tag('label'):wikitext('[[Critical Hit|Crit Multiplier]]'):done()
						:tag('default'):wikitext(format(attackData.CritMultiplier, 'x')):done()
					:done()
					:tag('data'):attr('source', attack..'HeadshotMultiplier')
						:tag('label'):wikitext('HS Multiplier'):done()
						:tag('default'):wikitext(format(attackData.HeadshotMultiplier, 'x')):done()
					:done()
					:tag('data'):attr('source', attack..'PunchThrough')
						:tag('label'):wikitext('[[Punch Through]]'):done()
						:tag('default'):wikitext(format(attackData.PunchThrough, 'm')):done()
					:done()
					:tag('data'):attr('source', attack..'Radius')
						:tag('label'):wikitext('Radius'):done()
						:tag('default'):wikitext(format(attackData.Radius, 'm')):done()
					:done()
					:tag('data'):attr('source', attack..'Duration')
						:tag('label'):wikitext('Duration'):done()
						:tag('default'):wikitext(format(attackData.Duration, 's')):done()
					:done()
					:tag('data'):attr('source', attack..'Falloff')
						:tag('label'):wikitext('Damage Falloff'):done()
						:tag('default'):wikitext(attackData.Falloff and
							'100% damage to '..attackData.Falloff.StartRange..'m  
'..
							100*(1 - attackData.Falloff.Reduction)..'% damage past '..attackData.Falloff.EndRange..'m'):done()
					:done()
					:tag('data'):attr('source', attack..'AmmoCost')
						:tag('label'):wikitext('Ammo Cost'):done()
						:tag('default'):wikitext(attackData.AmmoCost):done()
					:done()
				:done()
			end
		end
		
		local slamRadial, slide, exilus, stance
		local pols = '';
		if data.SlamRadialDamage then
			if data.SlamRadialElement then
				slamRadial = '{{D/img|'..data.SlamRadialElement..'}}'..data.SlamRadialDamage
			else
				slamRadial = data.SlamRadialDamage
			end
		end
		
		if data.SlideAttack then
			if data.SlideElement then
				slide = '{{D/img|'..data.SlideElement..'}}'..data.SlideAttack
			else
				slide = data.SlideAttack
			end
		end
		
		exilus = data.ExilusPolarity and '{{Icon|Pol|'..data.ExilusPolarity..'}}' or 'None'
		
		stance = data.StancePolarity and '{{Icon|Pol|'..data.StancePolarity..'}}'
		
		for _, v in ipairs(data.Polarities) do
			pols = pols..'{{Icon|Pol|'..v..'}}'
		end
		
		infobox:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Heavy Attack'):done()
			:tag('data'):attr('source', 'HeavyAttack')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Heavy Damage]]'):done()
				:tag('default'):wikitext(data.HeavyAttack):done()
			:done()
			:tag('data'):attr('source', 'WindUp')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Wind-up]]'):done()
				:tag('default'):wikitext(format(data.WindUp, 's')):done()
			:done()
			:tag('data'):attr('source', 'HeavySlamAttack')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Slam Damage]]'):done()
				:tag('default'):wikitext(data.HeavySlamAttack):done()
			:done()
			:tag('data'):attr('source', 'HeavySlamRadius')
				:tag('label'):wikitext('Slam Radius'):done()
				:tag('default'):wikitext(format(data.HeavySlamRadius, 'm')):done()
			:done()
			:tag('data'):attr('source', 'HeavyRadialDmg')
				:tag('label'):wikitext('Radial Damage'):done()
				:tag('default'):wikitext(data.HeavyRadialDmg):done()
			:done()
		:done()
		
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Slam Attack'):done()
			:tag('data'):attr('source', 'SlamAttack')
				:tag('label'):wikitext('[[Melee#Slam Attack|Slam Damage]]'):done()
				:tag('default'):wikitext(data.SlamAttack):done()
			:done()
			:tag('data'):attr('source', 'SlamRadius')
				:tag('label'):wikitext('Slam Radius'):done()
				:tag('default'):wikitext(format(data.SlamRadius, 'm')):done()
			:done()
			:tag('data'):attr('source', 'SlamRadialDamage')
				:tag('label'):wikitext('Radial Damage'):done()
				:tag('default'):wikitext(slamRadial):done()
			:done()
			:tag('data'):attr('source', 'SlamRadialProc')
				:tag('label'):wikitext('Radial Forced Proc'):done()
				:tag('default'):wikitext(data.SlamRadialProc):done()
			:done()
		:done()
		
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Slide Attack'):done()
			:tag('data'):attr('source', 'SlideAttack')
				:tag('label'):wikitext('[[Melee#Slide Attack|Slide Damage]]'):done()
				:tag('default'):wikitext(slide):done()
			:done()
		:done()
		
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Miscellaneous'):done()
			:tag('data'):attr('source', 'SyndicateEffect')
				:tag('label'):wikitext('[[Syndicate Radial Effects|Syndicate Effect]]'):done()
				:tag('default'):wikitext(data.SyndicateEffect):done()
			:done()
			:tag('data'):attr('source', 'Augment')
				:tag('label'):wikitext('[[Weapon Augments|Augments]]'):done()
				:tag('default'):wikitext(data.Augment):done()
			:done()
			:tag('data'):attr('source', 'Polarities')
				:tag('label'):wikitext('[[Polarity|Polarities]]'):done()
				:tag('default'):wikitext(pols ~= '' and pols or 'None'):done()
			:done()
			:tag('data'):attr('source', 'ExilusPolarity')
				:tag('label'):wikitext('[[Exilus Weapon Adapter|Exilus Polarity]]'):done()
				:tag('default'):wikitext(exilus):done()
			:done()
			:tag('data'):attr('source', 'StancePolarity')
				:tag('label'):wikitext('[[Stance|Stance Polarity]]'):done()
				:tag('default'):wikitext(stance):done()
			:done()
			:tag('data'):attr('source', 'Users')
				:tag('label'):wikitext('[[Stance|Stance Polarity]]'):done()
				:tag('default'):wikitext(data.Users and table.concat(data.Users, '  
')):done()
			:done()
			--:tag('data'):attr('source', 'Introduced')
			--	:tag('label'):wikitext('[[Stance|Stance Polarity]]'):done()
			--	:tag('default'):wikitext('{{ver|'..data.Introduced..'}}'):done()
			--:done()
		:done()

	return frame:preprocess(tostring(infobox))
end
}
```

