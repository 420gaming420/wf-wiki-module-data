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

local function makeTooltip(dataParam, image, link)
	return string.format('<span class="tooltip" data-param="%s" data-param2="Weapons">[[File:%s|x19px]]&nbsp;<span style="border-bottom:1px dotted;">[[%s]]</span></span>',
		dataParam,
		image or 'Panel.png',
		link
	)
end

local function polarity(pol)
    return string.format('[[File:%s|20px|link=Polarity]]', ({
        Zenurik = "Zenurik_Pol.svg",
        Naramon = "Naramon_Pol.svg",
        Vazarin = "Vazarin_Pol.svg",
        Penjaga = "Penjaga_Pol.svg",
        Exilus  = "Exilus.svg",
        Madurai = "Madurai_Pol.svg",
        Koneksi = "Koneksi_Pol.svg",
        Umbra   = "Umbra_Pol.svg",
        Unairu  = "Unairu_Pol.svg",
        Aura    = "Aura_Pol.svg",
        None    = "Spacer.png",
    })[({
        Ability='Zenurik',Bar='Naramon',D='Vazarin',Y='Penjaga',Sila='Penjaga',Sentinel='Penjaga',Precept='Penjaga',
        V='Madurai',O='Koneksi',Core='Koneksi',Fusion='Koneksi',Pengetikan='Koneksi',U='Umbra',Q='Umbra',Ward='Unairu',R='Unairu'
    })[pol]or(pol)] or error('Could not find polarity: '..(pol or '<nil>')))
end

local function pols(ps)
    if not (ps and ps[1]) then return 'None' end
    local p = {}
    for i, v in ipairs(ps or {'None'}) do
        p[i] = polarity(v)
    end
    return table.concat(p)
end

local function proc(proc, size)
    return string.format('[[File:Dmg%sSmall64.png|%s|link=Damage/%s]]', proc, size or '16x16px', proc)
end

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

local function attack(weapon, param)
	return weapon[param] or
		(weapon.NormalAttack and weapon.NormalAttack[param]) or
		(weapon.SecondaryAttack and weapon.SecondaryAttack[param]) or
		(weapon.ChargeAttack and weapon.ChargeAttack[param]) or
		(weapon.ChargeAreaAttack and weapon.ChargeAreaAttack[param]) or
		(weapon.AreaAttack and weapon.AreaAttack[param]) or
		(weapon.SecondaryChargeAttack and weapon.SecondaryChargeAttack[param]) or
		(weapon.SecondaryAreaAttack and weapon.SecondaryAreaAttack[param]) or
		(weapon.ChargedThrowAttack and weapon.ChargedThrowAttack[param]) or
		(weapon.ThrowAttack and weapon.ThrowAttack[param])
end

local function format(weapon, str)
	return weapon and weapon..str
end

return {
buildInfobox = function(frame)
	local args = frame.args;--require('Dev:Arguments').getArgs(frame);
	local name = args['Name'];
	local data = {}
	local weapon = {}

	if args['Conclave'] == 'false' then
		data = mw.loadData([[Module:Weapons/data]]).Weapons;
	else
		data = mw.loadData([[Module:Weapons/Conclave/data]]).Weapons;
	end
	weapon = data[name]
	
	local dispo = tonumber(override(args.Disposition)) or weapon.Disposition
	if dispo then
		dispo = math.min(math.floor(5 * (dispo - (dispo < 1 and 0.3 or 0.309))), 5)
    	dispo = ('<span style="font-size:27px;display:inline;position:relative;top:2px">%s%s</span> (%.2fx)'):format(('●'):rep(dispo), ('○'):rep(5-dispo), tonumber(override(args.Disposition)) or weapon.Disposition)
    end
    
    local users = ''
    if weapon.Users then
    	for _, user in ipairs(weapon.Users) do
	    	users = users..user..'<br />'
    	end
    	users = string.sub(users, 1, -7)
    end
    
    local family = {}
    if weapon.Family then
        for _, weap in pairs(data) do
            if weap.Family == weapon.Family then
                table.insert(family, makeTooltip(weap.Name, weap.Image, weap.Name))
            end
        end
        table.sort(family)
        family = table.concat(family, '<br />')
    end

	local infobox = mw.html.create('infobox')
		:tag('title')
			:tag('default')
				:tag('b'):wikitext(name):done()
			:done()
		:done()
		:tag('image'):attr('source', 'Image')
			:tag('default'):wikitext(weapon.Image or 'Panel.png'):done()
		:done()
		:tag('header'):wikitext('Statistics'):done()
		:tag('data'):attr('source', 'Mastery')
			:tag('label'):wikitext('[[File:MasterySigilClear.png|x18px|link=Mastery Rank]] [[Mastery Rank|Mastery]]'):done()
			:tag('default'):wikitext(weapon.Mastery or '0'):done()
		:done()
		:tag('data'):attr('source', 'Type')
			:tag('label'):wikitext('[[File:TopWeapon.png|x18px|link=Weapons]] [[Weapons|Slot]]'):done()
			:tag('default'):wikitext(weapon.Type):done()
		:done()
		:tag('data'):attr('source', 'Class')
			:tag('label'):wikitext('[[File:MiniMapMod.png|x18px|link=Mods#Mod_List]] [[Mods#Mod_List|Type]]'):done()
			:tag('default'):wikitext(weapon.Class):done()
		:done()
		:tag('data'):attr('source', 'Trigger')
			:tag('label'):wikitext('[[Trigger Type]]'):done()
			:tag('default'):wikitext(weapon.Trigger):done()
		:done()
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Utility'):done()
			:tag('data'):attr('source', 'AmmoType')
				:tag('label'):wikitext('[[Ammo#Ammo Packs|Ammo Type]]'):done()
				:tag('default'):wikitext(weapon.AmmoType or weapon.Trigger):done()
			:done()
			:tag('data'):attr('source', 'ShotType')
				:tag('label'):wikitext('Projectile Type'):done()
				:tag('default'):wikitext(attack(weapon, 'ShotType')):done()
			:done()
			:tag('data'):attr('source', 'ShotSpeed')
				:tag('label'):wikitext('[[Projectile Speed]]'):done()
				:tag('default'):wikitext(format(attack(weapon, 'ShotSpeed'), 'm/s')):done()
			:done()
			:tag('data'):attr('source', 'Range')
				:tag('label'):wikitext('Range'):done()
				:tag('default'):wikitext(format(attack(weapon, 'MeleeRange') or attack(weapon, 'Range'), 'm')):done()
			:done()
			:tag('data'):attr('source', 'NoiseLevel')
				:tag('label'):wikitext('[[Noise Level]]'):done()
				:tag('default'):wikitext(attack(weapon, 'NoiseLevel') and attack(weapon, 'NoiseLevel')..'[[Category:'..attack(weapon, 'NoiseLevel')..']]'):done()
			:done()
			:tag('data'):attr('source', 'FireRate')
				:tag('label'):wikitext(weapon.Type == 'Melee' and '[[Attack Speed]]' or '[[Fire Rate]]'):done()
				:tag('default'):wikitext(attack(weapon, 'FireRate')):done()
			:done()
			:tag('data'):attr('source', 'Spool')
				:tag('label'):wikitext('[[Fire Rate#Auto-Spool Weapons|Spool Up Rate]]'):done()
				:tag('default'):wikitext(weapon.Spool):done()
			:done()
			:tag('data'):attr('source', 'Accuracy')
				:tag('label'):wikitext('[[Accuracy]]'):done()
				:tag('default'):wikitext(attack(weapon, 'Accuracy')):done()
			:done()
			:tag('data'):attr('source', 'Magazine')
				:tag('label'):wikitext('[[Ammo#Magazine Capacity|Magazine Size]]'):done()
				:tag('default'):wikitext(weapon.Magazine):done()
			:done()
			:tag('data'):attr('source', 'MaxAmmo')
				:tag('label'):wikitext('[[Ammo#Ammo Maximum|Max Ammo]]'):done()
				:tag('default'):wikitext(weapon.MaxAmmo):done()
			:done()
			:tag('data'):attr('source', 'Reload')
				:tag('label'):wikitext('[[Reload Speed|Reload Time]]'):done()
				:tag('default'):wikitext(format(attack(weapon, 'Reload'), 's')):done()
			:done()
			:tag('data'):attr('source', 'Zoom')
				:tag('label'):wikitext('[[Zoom]]'):done()
				:tag('default'):wikitext(weapon.Zoom and table.concat(weapon.Zoom, '<br />')):done()
			:done()
			:tag('data'):attr('source', 'SniperComboReset')
				:tag('label'):wikitext('[[Sniper Rifle|Combo Decay]]'):done()
				:tag('default'):wikitext(format(weapon.SniperComboReset, 's')):done()
			:done()
			:tag('data'):attr('source', 'SniperComboMin')
				:tag('label'):wikitext('[[Sniper Rifle|Combo Min]]'):done()
				:tag('default'):wikitext(format(weapon.SniperComboMin, ' shots')):done()
			:done()
			:tag('data'):attr('source', 'ComboDur')
				:tag('label'):wikitext('[[Melee|Combo Duration]]'):done()
				:tag('default'):wikitext(format(weapon.ComboDur, 's')):done()
			:done()
			:tag('data'):attr('source', 'BlockAngle')
				:tag('label'):wikitext('[[Melee#Blocking|Block Angle]]'):done()
				:tag('default'):wikitext(format(weapon.BlockAngle, '°')):done()
			:done()
			:tag('data'):attr('source', 'FollowThrough')
				:tag('label'):wikitext('[[Melee#Follow_Through|Follow Through]]'):done()
				:tag('default'):wikitext(weapon.FollowThrough and 100*weapon.FollowThrough..'%'):done()
			:done()
			:tag('data'):attr('source', 'Disposition')
				:tag('label'):wikitext('[[Riven_Mods#Disposition|Disposition]]'):done()
				:tag('default'):wikitext(dispo):done()
			:done()
		:done()
		
		local horiz, elem, total, plur, plurDT, attackData
		for attack, name in pairs(attacks) do
			if weapon[attack] then
				attackData = weapon[attack]
				elem = nil
				plur = 0
				for dt, dmg in pairs(attackData.Damage) do
					if plur < dmg then plur = dmg; plurDT = dt end
					if dt ~= 'Impact' and dt ~= 'Puncture' and dt ~= 'Slash' then
						elem = dt
					end
				end
				
				total = (override(args[attack..'Impact']) or attackData.Damage.Impact or 0) +
					(override(args[attack..'Puncture']) or attackData.Damage.Puncture or 0) +
					(override(args[attack..'Slash']) or attackData.Damage.Slash or 0)
					
				horiz = mw.html.create('group'):attr('layout', 'horizontal')
					:tag('data'):attr('source', attack..'Impact'):css({
						['height'] = '30px',
						['padding'] = '0',
						['text-align'] = 'center',
					})
						:tag('default'):wikitext(attackData.Damage.Impact and proc('Impact')..attackData.Damage.Impact):done()
					:done()
					:tag('data'):attr('source', attack..'Puncture')
						:tag('default'):wikitext(attackData.Damage.Puncture and proc('Puncture')..attackData.Damage.Puncture):done()
					:done()
					:tag('data'):attr('source', attack..'Slash')
						:tag('default'):wikitext(attackData.Damage.Slash and proc('Slash')..attackData.Damage.Slash):done()
					:done()
				if elem then
					horiz:tag('data'):attr('source', attack..'Element')
						:tag('default'):wikitext(attackData.Damage[elem] and proc(elem)..attackData.Damage[elem]):done()
					:done()
					total = total + (override(args[attack..elem]) or attackData.Damage[elem])
				end
				
				infobox:tag('group'):attr('collapse', 'open')
					:tag('header'):wikitext(attackData.AttackName or name):done()
					:node(horiz)
					:tag('data'):attr('source', attack..'Total')
						:tag('label'):wikitext('[[Damage|Total Damage]]'):done()
						:tag('default'):wikitext(total..' ('..proc(plurDT)..string.format('%.2f', 100*plur/total)..'%)'):done()
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
						:tag('label'):wikitext(weapon.Type == 'Melee' and '[[Attack Speed]]' or '[[Fire Rate]]'):done()
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
						:tag('default'):wikitext(format(attackData.PelletCount, attackData.PelletCount and ' ('..(total/attackData.PelletCount)..' per '..(attackData.PelletName or 'Pellet')..')')):done()
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
							'100% damage to '..attackData.Falloff.StartRange..'m<br />'..
							100*(1 - (attackData.Falloff.Reduction or 1))..'% damage past '..attackData.Falloff.EndRange..'m'):done()
					:done()
					:tag('data'):attr('source', attack..'AmmoCost')
						:tag('label'):wikitext('Ammo Cost'):done()
						:tag('default'):wikitext(attackData.AmmoCost):done()
					:done()
				:done()
			end
		end
		
		local slamRadial, slide, stance
		if override(args.SlamRadialDamage) or weapon.SlamRadialDamage then
			if override(args.SlamRadialElement) or weapon.SlamRadialElement then
				slamRadial = proc(weapon.SlamRadialElement)..(override(args.SlamRadialDamage) or weapon.SlamRadialDamage)
			else
				slamRadial = override(args.SlamRadialDamage) or weapon.SlamRadialDamage
			end
		end
		
		if override(args.SlideAttack) or weapon.SlideAttack then
			if override(args.SlideElement) or weapon.SlideElement then
				slide = proc(weapon.SlideElement)..(override(args.SlideAttack) or weapon.SlideAttack)
			else
				slide = override(args.SlideDamage) or weapon.SlideAttack
			end
		end
		
		if weapon.Type == 'Melee' then
			stance = weapon.StancePolarity and polarity(weapon.StancePolarity) or 'None'
		end
		
		infobox:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Heavy Attack'):done()
			:tag('data'):attr('source', 'HeavyAttack')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Heavy Damage]]'):done()
				:tag('default'):wikitext(weapon.HeavyAttack):done()
			:done()
			:tag('data'):attr('source', 'WindUp')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Wind-up]]'):done()
				:tag('default'):wikitext(format(weapon.WindUp, 's')):done()
			:done()
			:tag('data'):attr('source', 'HeavySlamAttack')
				:tag('label'):wikitext('[[Melee#Heavy Attack|Slam Damage]]'):done()
				:tag('default'):wikitext(weapon.HeavySlamAttack):done()
			:done()
			:tag('data'):attr('source', 'HeavySlamRadius')
				:tag('label'):wikitext('Slam Radius'):done()
				:tag('default'):wikitext(format(weapon.HeavySlamRadius, 'm')):done()
			:done()
			:tag('data'):attr('source', 'HeavyRadialDmg')
				:tag('label'):wikitext('Radial Damage'):done()
				:tag('default'):wikitext(weapon.HeavyRadialDmg):done()
			:done()
		:done()
		
		:tag('group'):attr('collapse', 'open')
			:tag('header'):wikitext('Slam Attack'):done()
			:tag('data'):attr('source', 'SlamAttack')
				:tag('label'):wikitext('[[Melee#Slam Attack|Slam Damage]]'):done()
				:tag('default'):wikitext(weapon.SlamAttack):done()
			:done()
			:tag('data'):attr('source', 'SlamRadius')
				:tag('label'):wikitext('Slam Radius'):done()
				:tag('default'):wikitext(format(weapon.SlamRadius, 'm')):done()
			:done()
			:tag('data'):attr('source', 'SlamRadialDamage')
				:tag('label'):wikitext('Radial Damage'):done()
				:tag('default'):wikitext(slamRadial):done()
			:done()
			:tag('data'):attr('source', 'SlamRadialProc')
				:tag('label'):wikitext('Radial Forced Proc'):done()
				:tag('default'):wikitext(weapon.SlamRadialProc):done()
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
				:tag('default'):wikitext(weapon.SyndicateEffect):done()
			:done()
			:tag('data'):attr('source', 'Augment')
				:tag('label'):wikitext('[[Weapon Augments|Augments]]'):done()
				:tag('default'):wikitext(weapon.Augment):done()
			:done()
			:tag('data'):attr('source', 'StancePolarity')
				:tag('label'):wikitext('[[Stance|Stance Polarity]]'):done()
				:tag('default'):wikitext(stance):done()
			:done()
			:tag('data'):attr('source', 'ExilusPolarity')
				:tag('label'):wikitext('[[Exilus Weapon Adapter|Exilus Polarity]]'):done()
				:tag('default'):wikitext(weapon.ExilusPolarity and polarity(weapon.ExilusPolarity) or 'None'):done()
			:done()
			:tag('data'):attr('source', 'Polarities')
				:tag('label'):wikitext('[[Polarity|Polarities]]'):done()
				:tag('default'):wikitext(pols(weapon.Polarities)):done()
			:done()
			:tag('data'):attr('source', 'Users')
				:tag('label'):wikitext('Users'):done()
				:tag('default'):wikitext(users):done()
			:done()
			:tag('data'):attr('source', 'Introduced')
				:tag('label'):wikitext('Introduced'):done()
				:tag('default'):wikitext('{{ver|'..weapon.Introduced..'}}'):done()
			:done()
			:tag('data'):attr('source', 'Variants')
				:tag('label'):wikitext('Variants'):done()
				:tag('default'):wikitext(weapon.Family and family):done()
			:done()
		:done()

	return frame:preprocess(tostring(infobox))
end
}
