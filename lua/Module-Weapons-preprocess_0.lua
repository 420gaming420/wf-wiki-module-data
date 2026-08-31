---	Generates a preprocessed subset of weapon stat data stored on the wiki for 
--	purposes of weapon stat ranking and categorization as seen on many Characteristics
--	sections of weapon articles.
--	
--	@module		weapons/preprocess
--	@alias		p
--	@author		[[User:FINNER|FINNER]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@require	[[Module:Weapons]]
--	@require	[[Module:Weapons/data]]
--	@require	[[Module:Table]]
--	@release	stable
--	
local p = {}

-- Editor note: If you want to add new stats to compare against, update the statValues variable
-- with the appropriate [[Module:Weapons]] getter function
local Weapons = require([[Module:Weapons]])
local WeaponData = require([[Module:Weapons/data]])
local skpairs = require([[Module:Table]]).skpairs

---	Defines percentile ranges for binning stat values.
--	@table		p.PERCENTILES
--	@description	Percentiles in decimal form from highest to smallest
p.PERCENTILES = { 0.9, 0.75, 0.6, 0.525, 0.45, 0.3, 0.15 }

---	Defines labels for percentile ranges for binning stat values.
--	@table		p.PERCENTILE_LABELS
--	@description	Percentile bin labels from highest to smallest
p.PERCENTILE_LABELS = { "Very high", "High", "Above average", "Average", "Below average", "Low", "Very low" }

local subData = nil

-- Weapon slots to create percentiles for
local WEAPON_SLOTS = {
	'Primary',
	'Secondary',
	'Melee',
	'Archgun (Atmosphere)',
	'Archmelee',
	'Robotic',
	-- 'Amp',
	-- 'Railjack Armament',
	-- 'Beast',
}

-- Weapon classes to create percentiles for
-- Omitting weapon classes that have less than 5 weapons (small sample size)
local WEAPON_CLASSES = {
	['Primary'] = {
		-- Primary (ignoring Arm-Cannon and Exalted Weapons)
		['Bow'] = true,
		['Crossbow'] = true,	-- They act more like rifles so can also compare against rifles
		['Launcher'] = true,
		['Rifle'] = true,
		['Shotgun'] = true,
		['Sniper Rifle'] = true,
		['Speargun'] = true,
	},
	['Secondary'] = {
		-- Secondary (ignoring Crossbow, Dual Shotguns, Tome, and Exalted Weapons)
		['Dual Pistols'] = true,
		['Pistol'] = true,
		['Shotgun Sidearm'] = true,
		['Thrown'] = true,
	},
	['Melee'] = {
		-- Melee (ignoring Assault Saw, Bayonet, Dual Nikanas, Heavy Scythe, Nunchaku, Rapier)
		['Blade and Whip'] = true,
		['Claws'] = true,
		['Dagger'] = true,
		['Dual Daggers'] = true,
		['Dual Swords'] = true,
		['Fist'] = true,
		['Glaive'] = true,
		['Gunblade'] = true,
		['Hammer'] = true,
		['Heavy Blade'] = true,
		['Machete'] = true,
		['Nikana'] = true,
		['Polearm'] = true,
		['Scythe'] = true,
		['Sparring'] = true,
		['Staff'] = true,
		['Sword and Shield'] = true,
		['Sword'] = true,
		['Tonfa'] = true,
		['Two-Handed Nikana'] = true,
		['Warfan'] = true,
		['Whip'] = true,
	}
}

-- Trigger types to create percentiles for
-- Omitting trigger types that have less than 5 weapons (small sample size)
-- Omitting melee because they all have the same "trigger type" (basically semi-auto)
-- if we ignore alt-fires and unique mechanics
local WEAPON_TRIGGER_TYPES = {
	['Primary'] = {
		['Launcher'] = {
			['Semi-Auto'] = true,
		},
		['Rifle'] = {
			['Auto'] = true,
			['Auto-Spool'] = true,
			['Burst'] = true,
			['Held'] = true,
			['Semi-Auto'] = true,
		},
		['Shotgun'] = {
			['Auto'] = true,
			['Semi-Auto'] = true,
		},
		['Sniper Rifle'] = {
			['Semi-Auto'] = true,
		},
	},
	['Secondary'] = {
		['Dual Pistols'] = {
			['Auto'] = true,
			['Semi-Auto'] = true,
		},
		['Pistol'] = {
			['Auto'] = true,
			['Held'] = true,
			['Semi-Auto'] = true,
		},
		['Shotgun Sidearm'] = {
			['Semi-Auto'] = true,
		},
		['Thrown'] = {
			['Auto'] = true,
		},
	},
}

---	Computes percentile bins and top3 rankings from collected stat data.
--	Called for both overall per-slot stats and per-class-within-slot stats.
--	Using standard linear quantile interpolation algorithm for smoother bin boundary values.
--	Note: Modifies top3Data table in place during top3 filtering.
--	@function		computePercentilesAndRankings
--	@param			{table} statVals Stat values: {stat_k -> {[atk_i] -> {val -> count}}}
--	@param			{table} top3Data Top3 candidates: {stat_k -> {[atk_i] -> {val -> {names...}}}}
--	@param			{table} atkCounts Attack counts: {[atk_i] -> total_count}
--	@returns		{table} Result with .Attacks[atk_i].Percentiles and .Attacks[atk_i].Top3
local function computePercentilesAndRankings(statVals, top3Data, atkCounts)
	local percentiles = {}
	for stat_k, top3_atk_i in pairs(top3Data) do
		percentiles[stat_k] = percentiles[stat_k] or {}
		for atk_i, stat_val in ipairs(statVals[stat_k]) do
			local flat_vals = {}
			for val, val_count in pairs(stat_val) do
				for c = 1, val_count do
					table.insert(flat_vals, val)
				end
			end

			table.sort(flat_vals)
			local N = #flat_vals
			percentiles[stat_k][atk_i] = percentiles[stat_k][atk_i] or {}

			if N > 0 then
				for _, P in ipairs(p.PERCENTILES) do
					if N == 1 then
						table.insert(percentiles[stat_k][atk_i], flat_vals[1])
					else
						-- Linear interpolation (PERCENTILE.INC/NumPy/R-type-7)
						local rank = P * (N - 1) + 1
						local lower = math.floor(rank)
						local upper = math.ceil(rank)
						local val
						if lower == upper then
							val = flat_vals[lower]
						else
							val = flat_vals[lower] + (rank - lower) * (flat_vals[upper] - flat_vals[lower])
						end
						table.insert(percentiles[stat_k][atk_i], val)
					end
				end
			end
		end

		for atk_i, top3_val in ipairs(top3_atk_i) do
			local first, second, third = -math.huge, -math.huge, -math.huge
			for val, names in pairs(top3_val) do
				if val==0 or val==math.huge then
					--skip
				elseif val > first then
					third, second, first = second, first, val
				elseif val > second then
					third, second = second, val
				elseif val > third then
					third = val
				end
			end
			-- top3_val[first ].Place = 'first'
			-- top3_val[second].Place = 'second'
			-- top3_val[third ].Place = 'third'
			for val, names in pairs(top3_val) do
				if val ~= first and val ~= second and val ~= third then
					top3_val[val] = nil
				else
					names.Place = val == first and 'First' or (val == second and 'Second' or 'Third')
				end
			end
		end
	end

	-- Build result table with Attacks[atk_i].Percentiles and Attacks[atk_i].Top3
	local result = { Attacks = {} }
	local max_atk = 0
	for stat_k, top3_atk_i in pairs(top3Data) do
		for atk_i in ipairs(top3_atk_i) do
			if atk_i > max_atk then max_atk = atk_i end
		end
	end

	for i = 1, max_atk do
		result.Attacks[i] = {
			Percentiles = {},
			Top3 = {},
		}
		for stat, t in pairs(percentiles) do
			if t and t[i] and #t[i] > 0 then
				result.Attacks[i].Percentiles[stat] = {}
				for j, val in ipairs(t[i]) do
					result.Attacks[i].Percentiles[stat][j] = val
				end
				if top3Data[stat] and top3Data[stat][i] then
					result.Attacks[i].Top3[stat] = {}
					for j, val in pairs(top3Data[stat][i]) do
						result.Attacks[i].Top3[stat][j] = val
					end
				end
			end
		end
	end

	return result
end

---	Processes weapon stat data to find out percentile values and top 3 rankings.
--	@function		p._ppData
--	@returns		{table} Processed data in form of Lua table
function p._ppData()
	-- This function call is expensive so if subData is already initialized and 
	-- proliferated with data, just return the result. No need to recompute again
	-- if already called before within the same #invoke session.
	if subData ~= nil then
		return subData
	end
	subData = {}
	
	for _, slot in ipairs(WEAPON_SLOTS) do
		local statValues = {
			-- Keys correspond to keys of stat-getters in [[Module:Weapons]]
			TotalDamage = {},
			Multishot = {},
			CritChance = {},
			AvgCritCount = {},
			CritMultiplier = {},
			StatusChance = {},
			AvgProcCount = {},
			FireRate = {},
			-- EffectiveFireRate = {},
			FalloffEnd = {},
			FalloffRate = {},
		}
		-- Melee vs. Gun exclusive stats
		if slot == 'Melee' or slot == 'Archmelee' then
			statValues.AvgDmgWithAnimSpeedMulti = {}
			statValues.MeleeRange = {}
			
			if slot == 'Melee' then
				statValues.FollowThrough = {}
				statValues.BlockAngle = {}
			end
		else
			statValues.AvgShotDmg = {}
			statValues.BurstDps = {}
			statValues.SustainedDps = {}
			statValues.LifetimeDmg = {}
			statValues.BaseDps = {}
			statValues.MagDmg = {}
			statValues.Magazine = {}
			statValues.ShotsPerMag = {}
			statValues.AmmoMax = {}
			statValues.AmmoPickup = {}
			statValues.ReloadSpeed = {}
			statValues.Accuracy = {}	-- Note that using accuracy value is not as accurate (haha) as using the inverse of MinSpread or inverse of MaxSpread
		end
		-- These weapon slots don't have Riven Mods associated
		if not (slot == 'Archgun (Atmosphere)' or slot == 'Archmelee') then
			statValues.Disposition = {}
		end

		local top3 = {}

		local attack_count = {}

		-- Per-class tracking structures (parallel to overall statValues/top3/attack_count)
		local classTracking = {}  -- classTracking[className] = { statValues, top3, attack_count }
		-- Per-trigger type tracking too
		local triggerTracking = {}	-- triggerTracking[className][triggerName] = { statValues, top3, attack_count }
		
		for name, weapon in pairs(WeaponData[slot]) do
			if not weapon._IgnoreEntry and weapon.Slot == slot then
				subData[slot] = subData[slot] or {}
				--[[
				subData[slot][weapon.Class] = subData[slot][weapon.Class] or {}
				local temp = subData[slot][weapon.Class]

				if weapon.Trigger:find('/') then
					temp.Hybrid = temp.Hybrid or {}
					table.insert(temp.Hybrid, {Name = name, Family = weapon.Family or name, Image = weapon.Image or 'Panel.png'})
				else
					temp[weapon.Trigger] = temp[weapon.Trigger] or {}
					table.insert(temp[weapon.Trigger], {Name = name, Family = weapon.Family or name, Image = weapon.Image or 'Panel.png'})
				end
				--]]

				-- Set up per-class tracking for this weapon if its class is in WEAPON_CLASSES
				local classAccumulator = nil
				-- Set up per-trigger type tracking if trigger type is in WEAPON_TRIGGER_TYPES
				local triggerAccumulator = nil
				
				if WEAPON_CLASSES[slot] and WEAPON_CLASSES[slot][weapon.Class] then
					local className = weapon.Class
					if not classTracking[className] then
						classTracking[className] = {
							statValues = {},
							top3 = {},
							attack_count = {},
						}
						-- Initialize with the same stat keys as the overall statValues
						for stat_k in pairs(statValues) do
							classTracking[className].statValues[stat_k] = {}
						end
					end
					classAccumulator = classTracking[className]
					
					if WEAPON_TRIGGER_TYPES[slot] and WEAPON_TRIGGER_TYPES[slot][weapon.Class] and 
						WEAPON_TRIGGER_TYPES[slot][weapon.Class][weapon.Trigger] then
						local triggerName = weapon.Trigger
						triggerTracking[className] = triggerTracking[className] or {}
						if not triggerTracking[className][triggerName] then
							triggerTracking[className][triggerName] = {
								statValues = {},
								top3 = {},
								attack_count = {},
							}
							-- Initialize with the same stat keys as the overall statValues
							for stat_k in pairs(statValues) do
								triggerTracking[className][triggerName].statValues[stat_k] = {}
							end
						end
						triggerAccumulator = triggerTracking[className][triggerName]
					end
				end
				
				for atk_i, attack in ipairs(weapon.Attacks) do
					-- Increment attack #
					attack_count[atk_i] = (attack_count[atk_i] or 0) + 1
					if classAccumulator then
						classAccumulator.attack_count[atk_i] = (classAccumulator.attack_count[atk_i] or 0) + 1
					end
					if triggerAccumulator then
						triggerAccumulator.attack_count[atk_i] = (triggerAccumulator.attack_count[atk_i] or 0) + 1
					end
					for stat_k, stat_t in pairs(statValues) do
						local val = Weapons._getValue(weapon, stat_k, atk_i)
						local n_val = tonumber(val)
						-- Check self equality to skip processing NaN values
						if n_val and n_val == n_val and n_val ~= math.huge and n_val ~= -math.huge then
							-- Stat comparison are against weapons of the same slot and their attacks
							-- with the same index as stored in M:Weapons/data
							stat_t[atk_i] = stat_t[atk_i] or {} -- stat_val
							stat_t[atk_i][n_val] = (stat_t[atk_i][n_val] or 0) + 1 -- val_count

							top3[stat_k] = top3[stat_k] or {} -- top3_atk_i
							top3[stat_k][atk_i] = top3[stat_k][atk_i] or {} -- top3_val
							top3[stat_k][atk_i][n_val] = top3[stat_k][atk_i][n_val] or {} -- names
							table.insert(top3[stat_k][atk_i][n_val], name)

							-- Also collect into per-class tracking
							if classAccumulator then
								classAccumulator.statValues[stat_k][atk_i] = classAccumulator.statValues[stat_k][atk_i] or {}
								classAccumulator.statValues[stat_k][atk_i][n_val] = (classAccumulator.statValues[stat_k][atk_i][n_val] or 0) + 1

								classAccumulator.top3[stat_k] = classAccumulator.top3[stat_k] or {}
								classAccumulator.top3[stat_k][atk_i] = classAccumulator.top3[stat_k][atk_i] or {}
								classAccumulator.top3[stat_k][atk_i][n_val] = classAccumulator.top3[stat_k][atk_i][n_val] or {}
								table.insert(classAccumulator.top3[stat_k][atk_i][n_val], name)
							end
							
							-- Also collect into per-trigger type tracking
							if triggerAccumulator then
								triggerAccumulator.statValues[stat_k][atk_i] = triggerAccumulator.statValues[stat_k][atk_i] or {}
								triggerAccumulator.statValues[stat_k][atk_i][n_val] = (triggerAccumulator.statValues[stat_k][atk_i][n_val] or 0) + 1

								triggerAccumulator.top3[stat_k] = triggerAccumulator.top3[stat_k] or {}
								triggerAccumulator.top3[stat_k][atk_i] = triggerAccumulator.top3[stat_k][atk_i] or {}
								triggerAccumulator.top3[stat_k][atk_i][n_val] = triggerAccumulator.top3[stat_k][atk_i][n_val] or {}
								table.insert(triggerAccumulator.top3[stat_k][atk_i][n_val], name)
							end
						end
					end
				end
			end
		end

		-- Compute overall percentiles and top3 rankings for this slot
		local overallResult = computePercentilesAndRankings(statValues, top3, attack_count)
		subData[slot] = subData[slot] or {}
		subData[slot].Attacks = overallResult.Attacks

		-- Compute per-class percentiles and top3 rankings
		for className, classAccumulator in pairs(classTracking) do
			local classResult = computePercentilesAndRankings(classAccumulator.statValues, classAccumulator.top3, classAccumulator.attack_count)
			if next(classResult.Attacks) then
				subData[slot].Classes = subData[slot].Classes or {}
				subData[slot].Classes[className] = classResult
			end
			
			-- Compute per-trigger type percentiles and top3 rankings
			local triggersForClass = triggerTracking[className] or {}
			for triggerName, triggerAccumulator in pairs(triggersForClass) do
			    local triggerTypeResult = computePercentilesAndRankings(triggerAccumulator.statValues, triggerAccumulator.top3, triggerAccumulator.attack_count)
			    if next(triggerTypeResult.Attacks) then
			        subData[slot].Classes = subData[slot].Classes or {}
			        subData[slot].Classes[className] = subData[slot].Classes[className] or classResult
			        subData[slot].Classes[className].TriggerTypes = subData[slot].Classes[className].TriggerTypes or {}
			        subData[slot].Classes[className].TriggerTypes[triggerName] = triggerTypeResult
			    end
			end
		end
	end
	
	return subData
end

---	Dumps a preprocessed table of weapon stats and info to copy into M:Weapons/ppdata.
--	Invoked on [[Module:Weapons/ppdata/doc]].
--	@function		p.ppData
--	@param			{table} frame Frame object
--	@returns		{string} ppdata preprocessed wikitext string in Lua table formatting
function p.ppData(frame)
	local str = { '<pre>' }
	local data = mw.dumpObject(p._ppData()):gsub('table#%d+ %{', '%{')
			:gsub('%-nan', 'nil'):gsub('    ', '	'):gsub('inf', 'math.huge')	-- Note: replacing 4 spaces with one tab
			-- :gsub('"math.huge"', 'math.huge'):gsub('"%-math.huge"', '-math.huge')
	table.insert(str, 'return '..data..'\n')
	table.insert(str, '</pre>')

	return frame:preprocess(table.concat(str, '\n'))
end

---	Appends attack percentile and top3 data to a string table for display.
--	Used by printPPData for both overall and per-class breakdowns.
--	@function		appendAttackDisplay
--	@param			{table} str String accumulator table
--	@param			{table} attacksPPdata Attacks data array with Percentiles and Top3
--	@param			{number} atkHeadingLevel Heading level (number of '=' signs) for attack index headings
--	@param			{string} top3Markup Wikitext markup for the "Top 3" sub-heading
--	@param			{string} percentileColumns Pre-formatted percentile column headers
--	@param			{string} rankingFormatString Format string for ranking entries
local function appendAttackDisplay(str, attacksPPdata, atkHeadingLevel, top3Markup, percentileColumns, rankingFormatString)
	local atkHeading = string.rep('=', atkHeadingLevel)
	for attackIndex, attackPPdata in ipairs(attacksPPdata) do
		table.insert(str, atkHeading..'Attack Index '..attackIndex..atkHeading)

		-- Percentile bins wikitable
		table.insert(str, ([=[{| class="wikitable sortable"
! Percentiles !! %s
|-]=]):format(percentileColumns))

		for stat_k, data in skpairs(attackPPdata['Percentiles']) do
			table.insert(str, '| <code>'..stat_k..'</code> || '..table.concat(data, ' || ')..'\n|-')
		end

		table.insert(str, '|}')

		-- Top 3 highest values within a stat category
		table.insert(str, '\n'..top3Markup..'\n')
		for stat_k, data in skpairs(attackPPdata['Top3']) do
			local temp = {}
			for topValue, weaponNamesAndRanking in pairs(data) do
				table.insert(temp,
						string.format(
							rankingFormatString,
							weaponNamesAndRanking['Place'],
							-- Multiple weapons can have the same ranking for a particular stat
							table.concat(weaponNamesAndRanking, ', '),
							topValue
					)
				)
			end
			table.sort(temp)
			table.insert(str, '<code>'..stat_k..'</code>:\n'..table.concat(temp, '\n'))
		end

		table.insert(str, '\n\n')
	end
end

---	Dumps a preprocessed table of weapon stats and info in human-readable format
--	Invoked on [[Module:Weapons/ppdata/doc]].
--	@function		p.printPPData
--	@param			{table} frame Frame object
--	@returns		{string} ppdata preprocessed wikitext string wrapped around pre tag
function p.printPPData(frame)
	local str = { }
	local ppData = p._ppData()
	
	-- E.g. "* First place is Braton (1.5)"
	local rankingFormatString = '* %s place is %s (%s)'
	
	local percentileColumns = table.concat(p.PERCENTILES, ' !! ')
	
	for slot, collection in pairs(ppData) do
		table.insert(str, '='..slot..'=')

		-- Overall slot percentiles and top 3
		appendAttackDisplay(str, collection['Attacks'], 2, "'''Top 3'''", percentileColumns, rankingFormatString)

		-- Per-class percentiles and top 3
		if collection['Classes'] then
			table.insert(str, '==By Weapon Class==')
			for className, classData in skpairs(collection['Classes']) do
				table.insert(str, '==='..className..'===')
				appendAttackDisplay(str, classData['Attacks'], 4, "'''Top 3'''", percentileColumns, rankingFormatString)
				
				-- Per-trigger type percentiles and top 3
				if classData['TriggerTypes'] then
					table.insert(str, '====By Trigger Type====')
					for triggerName, triggerData in skpairs(classData['TriggerTypes']) do
						table.insert(str, '====='..triggerName..'=====')
						appendAttackDisplay(str, triggerData['Attacks'], 6, "'''Top 3'''", percentileColumns, rankingFormatString)
					end
				end
			end
		end
		
		table.insert(str, '\n')
	end
	
	return frame:preprocess(table.concat(str, '\n'))
end

return p
