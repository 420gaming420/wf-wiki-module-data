---	Contains comparison string builders to be used on weapon articles under 
--	Characteristics sections. Invoked on [[Template:WeaponComparison]].
--	
--	@module		weapons/compare
--	@alias		p
--	@attribution		[[User:Cephalon Scientia]]
--	@attribution		[[User:Falterfire]]
--	@attribution		[[User:Flaicher]]
--	@attribution		[[User:Gigamicro]]
--	@attribution		[[User:Trajos]]
--	@require			[[Module:Weapons]]
--	@require			[[Module:DamageTypes]]
--	@require			[[Module:Tooltips]]
--	@require			[[Module:Table]]
--	@release			stable
--	

local p = {}

local Weapon = require('Module:Weapons')	-- Using p._getWeapon(), p._statRead() and p._statFormat()
local DamageType = require('Module:DamageTypes')	-- Using p.iterationOrderArray
local Tooltip = require('Module:Tooltips')	-- Using p.full()
local Table = require('Module:Table')	-- Using p.size()

---	Builds comparison string between two values.
--	@function		compareStr
--	@param			{table} weap1 A table used to find the comparing values
--	@param			{table} atk1 A table used to find the comparing values
--	@param			{table} weap2 A table used to find the comparing values
--	@param			{table} atk2 A table used to find the comparing values
--	@param			{string} valName Name of statistic that values represent (e.g. "Critical Damage")
--	@param			{string} var Name of statistic that values are (e.g. "CritDamage")
--	@param[opt]		{table}  compareAdjs Two element table that contains the greater than and less than comparative adjectives (e.g. {"Higher", "Lower", "Different"}) 
--	@param[opt]		{string} prefix What to start the comparison string with if you want to increase the bullet level (e.g. "***")
--	@returns		{string} Resultant wikitext of comparison string (e.g. '**Higher Critical Damage (1.2x vs. 1.1x)')
local function compareStr(weap1, atk1, weap2, atk2, valName, var, compareAdjs, prefix)
	local val1, val2 = Weapon._statRead(weap1, atk1, var), Weapon._statRead(weap2, atk2, var)
	if (val1 == val2) or (val1 ~= val1) or (val2 ~= val2) or not (val1 and val2) then
		return ''
	end

	if type(val1) == 'table' then
		local a, b = val1, val2
		val1, val2 = Table.size(val1), Table.size(val2)
		if val1 == val2 and not (function()
			for k, v in pairs(a) do
				if b[k] ~= v then
					return true
				end
			end
		end)() then
			return ''
		end
	end

	local adj = compareAdjs
	if type(compareAdjs) == 'table' or not compareAdjs then
		adj = (compareAdjs or { "Higher", "Lower", "Different" })[
			val1 > val2 and 1 or
			val1 < val2 and 2 or
			val1 == val2 and 3 or 0--unnecessary catch?
		] or error('compareStr: vals are without compare: '..mw.dumpObject{ val1=val1, val2=val2, compareAdjs=compareAdjs, adj=adj })
		-- local bigWord, smallWord = table.unpack(compareAdjs or {"Higher","Lower"})
		-- adj = bigWord~=smallWord and adj>0 and (bigWord or "Higher") or (smallWord or "Lower")
	end

	return ('%s %s %s (%s vs. %s)'):format(prefix or '**', adj, valName, Weapon._statFormat(weap1, atk1, var), Weapon._statFormat(weap2, atk2, var))
end

---	Builds damage comparison string between two attacks.
--	@function		damageComparisonStr
--	@param			{table} Attack1 Attack used for comparison
--	@param			{table} Attack2 Attack used to compare the first attack against
--	@returns		{string} Resultant wikitext of comparison string
local function damageComparisonStr(weap1, atk1, weap2, atk2)
	local result = {}
	for _, dt in ipairs(DamageType.iterationOrderArray) do
		result[#result+1] = compareStr(weap1, atk1, weap2, atk2, Tooltip.full(dt, 'DamageTypes').." damage", dt, nil, "***")
		-- local damage1 = ('%.2f'):format(Attack1.Damage[element] or 0)
		-- local damage2 = ('%.2f'):format(Attack2.Damage[element] or 0)
		-- result = result..bulidCompareString(damage1, damage2, Tooltip.full(element, 'DamageTypes').." damage", nil, nil, {"Higher", "Lower"}, "\n***")
	end
	return table.concat(result,'\n')
end

---	Builds comparison list between two weapons in PvE.
--	@function		p.buildComparison
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of comparison list
function p.buildComparison(frame, getConclave)
	local weapon1Name = frame.args[1] or ''
	local weapon2Name = frame.args[2] or ''

	assert(weapon1Name ~= '' and weapon2Name ~= '', 'p.buildComparison(frame): Must compare two weapons')

	local weap1 = Weapon._getWeapon(weapon1Name, getConclave)
	local weap2 = Weapon._getWeapon(weapon2Name, getConclave)

	local atk1 = Weapon._getAttack(weap1)
	local atk2 = Weapon._getAttack(weap2)
	
	local isMelee = Weapon._statRead(weap1, atk1, "IsMelee") or Weapon._statRead(weap2, atk1, "IsMelee")
	local isProjectile = Weapon._statRead(weap1, atk1, "ShotType") ~= nil or Weapon._statRead(weap2, atk1, "ShotType") ~= nil
	
	local result = {
		-- support method chaining w/ colon syntax
		insert = function(self, elem)
			table.insert(self, elem)
			return self
		end,
		insertCompare = function(self, ...)
			return self:insert(compareStr(weap1, atk1, weap2, atk2, ...))
		end
	}

	result:insert(("* %s (%s), compared to %s (%s):"):format(
		Tooltip.full(weapon1Name, 'Weapons'), Weapon._statRead(weap1, atk1, 'AttackName'),
		Tooltip.full(weapon2Name, 'Weapons'), Weapon._statRead(weap2, atk2, 'AttackName'),
	nil))

	local progenitorBonusNote = (
		Weapon._statRead(weap1, atk1, 'IsLichWeapon') or
		Weapon._statRead(weap2, atk1, 'IsLichWeapon') )
	and " (using max +60% [[Adversary System/Progenitor|Progenitor]] bonus if applicable)" or ""

	local progenitorExcludeNote = progenitorBonusNote=='' and ''
	or " (excluding any [[Adversary System/Progenitor|Progenitor]] bonus)"
	
	local baseDamageStr = (isMelee and not isProjectile) and "base damage" or "base damage per projectile"
	
	result
		-- TODO: Comparing differences in damage composition absent when base damage is equal
		:insert(compareStr(weap1, atk1, weap2, atk2, baseDamageStr, "BaseDamage"):gsub('^$','**Equal base damage')..progenitorExcludeNote)
		:insert(damageComparisonStr(weap1, atk1, weap2, atk2):gsub('^$','**Identical damage distribution'))
		:insertCompare("total damage"..progenitorBonusNote, "TotalDamageWithProgenBonus")
		:insertCompare("base [[critical chance]]", "CritChance")
		:insertCompare("base [[critical multiplier]]", "CritMultiplier")
		:insertCompare("base [[status chance]]", "StatusChance")
	
	if isMelee then
		result -- melee
			:insertCompare("melee [[range]]", "MeleeRange", {"Longer", "Shorter"})
			:insertCompare("[[attack speed]]", "AttackSpeed")
			:insertCompare("[[Melee Combo|Combo Duration]]", "ComboDur")
			:insertCompare("[[Block Angle]]", "BlockAngle")
			:insertCompare("[[Melee#Follow Through|Follow Through]]", "FollowThrough")
			:insertCompare("[[Stance]] Polarity", "StancePolarity", "Different")
	else
		result -- gun
			:insertCompare("[[Average Damage per Shot|average damage per tap]]"..progenitorBonusNote, "AvgTapDmg")
			:insertCompare("[[Burst DPS|burst DPS]]"..progenitorBonusNote, "BurstDps")
			:insertCompare("[[Sustained DPS|sustained DPS]]"..progenitorBonusNote, "SustainedDps")
			:insertCompare("starting [[Damage Falloff|damage falloff]] distance", "FalloffStart", {"Farther", "Closer"})
			:insertCompare("max [[Damage Falloff|damage falloff]] distance", "FalloffEnd", {"Farther", "Closer"})
			:insertCompare("max damage reduction at ending falloff distance", "FalloffReduction", {"Greater", "Lesser"})
			:insertCompare("[[fire rate]]", "FireRate")
			:insertCompare("[[multishot]]", "Multishot")
			:insertCompare("[[magazine]]", "Magazine", {"Larger", "Smaller"})
			-- TODO: Add support for value equality; e.g. rn it doesn't show "same ammo cost per shot"
			:insertCompare("ammo cost per shot", "AmmoCost", {"More", "Less", "Same"})
		
		-- Conditional check needed otherwise will be redundant with Magazine row
		if not (Weapon._statRead(weap1, atk1, 'AmmoCost') == 1 and Weapon._statRead(weap2, atk2, 'AmmoCost') == 1) then
			result:insertCompare("shots per magazine", "ShotsPerMag", {"More", "Fewer"})
		end
		
		result:insertCompare("[[Ammo Maximum|max ammo capacity]]", "AmmoMax", {"Larger", "Smaller"})
			:insertCompare("[[Ammo Pickup|ammo pickup count]]", "AmmoPickup", {"Larger", "Smaller"})
			:insertCompare("[[Reload|reload time]]", "Reload", {"Slower", "Faster"})
			:insertCompare("spool-up", "Spool", {"Slower", "Faster"})
			:insertCompare("[[Accuracy|accurate]]", "Accuracy", {"More", "Less"})
			:insertCompare("first-shot [[Spread|spread]]", "MinSpread", {"Wider", "Tighter"})
			:insertCompare("maximum [[Spread|spread]]", "MaxSpread", {"Wider", "Tighter"})
			:insertCompare("[[Projectile Speed|projectile speed]]", "ShotSpeed", {"Greater", "Lesser"})
	end
	
	result
		:insertCompare("[[Polarity|polarities]]", "Polarities", {"More", "Less", "Different"})
		:insertCompare("[[Mastery Rank]] required", "Mastery")
		:insertCompare("[[disposition]]", "Disposition")

	local se1, se2 = weap1.SyndicateEffect, weap2.SyndicateEffect
	if se1 and not se2 then
		result:insert("\n** Innate [["..se1.."]] effect")
	elseif se2 and not se1 then
		result:insert("\n** No innate [["..se2.."]] effect")
	elseif se1 and se2 and se1 ~= se2 then
		result:insert("\n** Different innate [[Syndicate Radial Effects|Syndicate Effect]] ([["..se1.."]] vs. [["..se2.."]])")
	end

	-- mw.log(mw.dumpObject{['M:Weapon cache']=cache})
	return table.concat(result, '\n'):gsub('\n\n+', '\n')..'[[Category:Automatic Comparison]]'
end

---	Builds comparison list between two weapons in PvP ([[Conclave]]).
--	@function		p.buildComparison
--	@param			{table} frame Frame object
--	@returns		{string} Resultant wikitext of comparison list
function p.buildConclaveComparison(frame)
	return p.buildComparison(frame, true)
end

return p
