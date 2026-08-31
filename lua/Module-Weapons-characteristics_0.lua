---	Submodule for handling Characteristics section on weapon articles.
--	Used mainly for advantages and disadvantages strings. See [[Braton#Characteristics]] for sample output. 
--	
--	@module		weapons/characteristics
--	@alias		p
--	@author		[[User:FINNER]]
--	@release	stable
--	@require	[[Module:String]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Weapons/ppdata]]
--	

local p = {}

local trim = require('Module:String').trim
local tooltip = require 'Module:Tooltips' 'Weapons' 'full'
local Weapon = require('Module:Weapons')
local Arguments = require('Module:Arguments')
local ppData = mw.loadData('Module:Weapons/ppdata')

---	Builds string of weapons ranked in nth place.
--	@function		behind
--	@param			{table} data
--	@param			{string} place - "First", "Second", or "Third"
--	@param			{string} slot
--	@returns		{string} String of weapon names
local function behind(data, place, slot)
	local weapons = {}
	for _, weapDict in pairs(data) do
		if weapDict.Place == place then
			for _, weapName in ipairs(weapDict) do
				table.insert(weapons, tooltip(weapName))
			end
			break
		end
	end
	if #weapons < 3 then
		return table.concat(weapons, ' and ')
	end
	weapons[#weapons] = 'and ' .. weapons[#weapons]
	return table.concat(weapons, ', ')
end

-- Computes the percentile rank of a stat value using a table of percentile → boundary value pairs.
-- Accounts for skewed percentile boundaries when multiple percentiles share the same value.
local function percentileFromTable(statValue, points)
    -- points: array of {p=val, v=val}, sorted by p descending
	
	-- If top and bottom boundary are the same, entire region is flat, return 0.5
	if points[1].v == points[#points].v then
		return 0.5
	end
	
    -- Above top boundary
    if statValue >= points[1].v then
        return points[1].p
    end

    -- Below bottom boundary
    local last = points[#points]
    if statValue <= last.v then
        return last.p
    end

    -- Between boundaries
    for i = 1, #points - 1 do
        local a = points[i]
        local b = points[i + 1]

        -- Flat region: same value across percentiles → take best (higher p)
        if a.v == b.v and statValue >= a.v then
            return a.p
        end

        -- Normal descending values: v decreases as p decreases
        -- interpolate between distinct values
        if statValue <= a.v and statValue >= b.v and a.v ~= b.v then
            local t = (statValue - b.v) / (a.v - b.v)  -- 0..1
            return b.p + t * (a.p - b.p)
        end
    end

    -- Fallback (shouldn't hit if data is consistent)
    return last.p
end

-- Determine category, based on [[WARFRAME Wiki:Stat Comparison/Percentiles]]
local function categorizeFromPercentile(p)
	if p <= 0.15 then
		return "Very low"
	elseif p <= 0.30 then
		return "Low"
	elseif p <= 0.45 then
		return "Below average"
	elseif p < 0.60 then
		return "Average"
    elseif p < 0.75 then
		return "Above average"
	elseif p < 0.90 then
		return "High"
    else
		return "Very high"
	end
end

local function categorizeInterpolated(statValue, statName, boundaryValues, label, displayAdvantagesOnly)
	local p = percentileFromTable(statValue, boundaryValues)
	
	local category = categorizeFromPercentile(p)
	
	if displayAdvantagesOnly then
		if category == "Above average" or category == "High" or category == "Very high" then
			 return ("**%s %s (%s)"):format(category, statName, label)
		end
    elseif category == "Very low" or category == "Low" or category == "Below average" then
		return ("**%s %s (%s)"):format(category, statName, label)
	end
	return nil
end

---	Builds string of advantages or disadvantages of a weapon.
--	Percentiles categorization:
--	* 90-100% - "Very high"
--	* 75-90% - "High"
--	* 60-75% - "Above average"
--	* 45-60% - Average, doesn't display anything
--	* 30-45% - "Below average"
--	* 15-30% - "Low"
--	* 0-15% - "Very low"
--	@function		p.advantages
--	@param			{table} frame Frame object
--	@returns		{string} str preprocessed wikitext string
function p.advantages(frame)
	local args = Arguments.getArgs(frame)
	local name = mw.text.decode(args['Name'])	-- Need to decode special characters in weapon name
	local weaponClass = args['Class']
	local triggerType = args['Trigger']
	local editorContent =  args[1]	-- Additional notes as defined by editors outside of automated stat comparison
	local isAdv = (not(args['Dis']) and args['Dis'] ~= '') and true or false
	local weapon = Weapon._getWeapon(name)
	local slot = weapon.Slot
	
	local headerText = string.format(
		'<b>%s over other %s %s %s weapons (excluding modular weapons):</b>',
		(isAdv and 'Advantages' or 'Disadvantages'),
		slot,
		(triggerType ~= nil and triggerType or ''),
		(weaponClass ~= nil and weaponClass or '')
	)
	
	-- TODO: May try to not hard code percentiles here and just fetch the percentile table from
	-- [[Module:Weapons/preprocess]]
	local percentileLegendSpan = mw.html.create('span')
		:css('border-bottom', '1px dotted #808080')
		:css('padding', '0em')
		:attr('title', 'Percentiles: "Very low" = 0-15%, "Low" = 15-30%, "Below average" = 30-45%, "Above average" = 60-75%, "High" = 75-90%, "Very high" = 90-100%')
		:wikitext(headerText)

	local str = { tostring(percentileLegendSpan), editorContent }
	
	local atts, attacks, data, stats = {}, {}, {}, {}
	for i, attack in ipairs(weapon.Attacks) do
		local attackCharacteristics = { '*' .. attack.AttackName .. '<small> (wiki attack index ' .. i .. ')</small>' }
		
		atts = {
			CritChance = "crit chance",
			CritMultiplier = "crit multiplier",
			TotalDamage = "total damage",
			FireRate = "fire rate",
			StatusChance = "status chance",
		}
		if attack.Falloff or weapon.Falloff then
			atts.FalloffEnd = "maximum falloff distance"
			atts.FalloffRate = "active falloff slope"
		end
		if (weapon.Multishot and weapon.Multishot > 1) or (attack.Multishot and attack.Multishot > 1) then
			atts.Multishot = "multishot"
			atts.AvgCritCount = "average number of crits per shot"
			atts.AvgProcCount = "average number of procs per shot"
		end
		if slot == 'Melee' or slot == 'Archmelee' then
			atts.AvgDmgWithAnimSpeedMulti = "damage × attack speed"
			atts.FireRate = "attack speed"
			atts.MeleeRange = "attack range"
			
			if slot == 'Melee' then
				atts.FollowThrough = "follow through"
				atts.BlockAngle = "block angle"
			end
		else
			atts.AvgShotDmg = "[[Average Damage per Shot|damage per shot]]"
			atts.BurstDps = "[[Burst DPS|burst DPS]]"
			atts.SustainedDps = "[[Sustained DPS|sustained DPS]]"
			atts.Magazine = "magazine size"
			atts.AmmoMax = "ammo max"
			atts.AmmoPickup = "ammo pickup"
			atts.ReloadSpeed = "reload speed"
			atts.Accuracy = "accuracy"
		end
		if slot ~= 'Archgun (Atmosphere)' and slot ~= 'Archmelee' and weapon.Class ~= 'Exalted Weapon' then
			atts.Disposition = "disposition"
		end
		
		stats = {}
		
		ppAttack = nil
		if weaponClass ~= nil then
			if triggerType ~= nil then
				ppAttack = ppData[slot].Classes[weaponClass].TriggerTypes[triggerType].Attacks[i] or {Top3 = {}, Percentiles = {}}
			else
				ppAttack = ppData[slot].Classes[weaponClass].Attacks[i] or {Top3 = {}, Percentiles = {}}
			end
		else 
			ppAttack = ppData[slot].Attacks[i] or {Top3 = {}, Percentiles = {}}
		end
	
		data = ppAttack.Top3
		for statKey, u in pairs(data) do
			if atts[statKey] then
				local label = Weapon._getValue(weapon, statKey, i)
				
				if label == nil then
					error('p.advantages(frame):' .. ' label cannot be nil for key "' .. statKey .. '" and entry '.. mw.dumpObject(weapon))
				end
				
				stats[statKey] = label	-- Storing stat value for later when finding out what percentile it falls under
				temp = u['' .. label]	-- Seeing if calculated stat matches any top 3 entries in ppData
				
				label = Weapon._getFormattedValue(weapon, statKey, i)
				
				if temp and temp.Place and isAdv then
					if temp.Place == 'First' then
						table.insert(attackCharacteristics, ('**Highest %s (%s)'):format(atts[statKey], label) )
					elseif temp.Place == 'Second' then
						table.insert(attackCharacteristics, ('**Second highest %s (%s) behind %s'):format(atts[statKey], label, behind(u, 'First', slot) ) )
					elseif temp.Place == 'Third' then
						table.insert(attackCharacteristics, ('**Third highest %s (%s) behind %s'):format(atts[statKey], label, behind(u, 'Second', slot) ) )
					end
					atts[statKey] = nil
				end
			end
		end
		
		data = ppAttack.Percentiles
		for statKey, statName in pairs(atts) do
			if data[statKey] then
				
				local label
				-- Label is not necessarily the same as statKey. For example, we want readers to 
				-- see "1.15x animation speed" instead of "1.15 attacks/sec" for the FireRate key of a melee weapon
				if (statKey == 'ReloadSpeed') then
					label = Weapon._getFormattedValue(weapon, 'Reload', i)
				elseif (statKey == 'FireRate' and Weapon._getValue(weapon, 'IsMelee')) then
					label = Weapon._getFormattedValue(weapon, 'AttackSpeed', i)
				elseif (statKey == 'Accuracy') then
					label = Weapon._getFormattedValue(weapon, 'MinSpread', i) .. ' to '.. Weapon._getFormattedValue(weapon, 'MaxSpread', i)
				else
					label = Weapon._getFormattedValue(weapon, statKey, i)
				end
			
				local statValue = stats[statKey]
				if (statValue == nil) then
					error('p.advantages(frame): statValue is nil, cannot compare against a nil value; must be a number value')
				end
				
				-- Data validation; ideally we should perform it at data level instead of logic level, but
				-- due to how we store data on the wiki, we have limited tooling to support this (e.g. no data definition language)
				for i = 1, 7, 1 do
					if (data[statKey][i] == nil) then
						error(mw.dumpObject(data[statKey]))
					end
				end
				
				local boundaryValues = {
					{ p = 0.9, v = data[statKey][1] },
					{ p = 0.75, v = data[statKey][2] },
					{ p = 0.6, v = data[statKey][3]} ,
					{ p = 0.525, v = data[statKey][4]} ,
					{ p = 0.45, v = data[statKey][5] },
					{ p = 0.3, v = data[statKey][6] },
					{ p = 0.15, v = data[statKey][7] },
				}
				local statCategoryStr = categorizeInterpolated(statValue, statName, boundaryValues, label, isAdv)
				if statCategoryStr ~= nil then
					table.insert(attackCharacteristics, statCategoryStr)
				end
			end
		end
		
		-- If no distinct advantange/disadvantage is added
		if (#attackCharacteristics == 1) then
			table.insert(str, attackCharacteristics[1]..(isAdv and '\n**No numerical advantages.' or '\n**No numerical disadvantages.'))
		else
			table.insert(str, table.concat(attackCharacteristics, '\n'))
		end
	end
	
	str = table.concat(str, '\n')
	return frame:preprocess(str)
end

return p
