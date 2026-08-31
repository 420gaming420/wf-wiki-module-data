---
title: "Module:Emptylord"
wiki_url: "https://wiki.warframe.com/w/Module/Emptylord"
wiki_timestamp: "2025-11-28T10:36:48Z"
---

*Documentation for this module may be created at [Module:Emptylord/doc](/w/Module:Emptylord/doc?action=edit&redlink=1 "Module:Emptylord/doc (page does not exist)")*

```lua
local p = {}
local data = mw.loadData("Module:Emptylord/data")

local valid_includes = {
	["all"] = true,
	["official"] = true,
	["custom"] = true,
	["retired"] = true
}

-- Normalises filter input
local function normaliseInclude(val)
	if not val then return "all" end
	val = mw.text.trim(mw.ustring.lower(val))
	if valid_includes[val] then return val else return "all" end
end

function join(delim, ...)
    local out = {}
    for _, v in ipairs({...}) do
        if v and v ~= "" then
            table.insert(out, v)
        end
    end
    return table.concat(out, delim)
end

function p.getAbility(frame)
	local args = frame.args or {}
	local wf = args[1]
	local ability = args[2]

	if not wf or not ability then
		return "''Missing Warframe or ability''"
	end

	-- trim and normalize ability name
	ability = mw.text.trim(tostring(ability))
	
	-- check Warframe exists
	local wfData = data[wf]
	if not wfData then
		return string.format("''No data for Warframe: %s''", wf)
	end

	-- check Ability exists
	local abilityData = wfData.abilities[ability]
	if not abilityData then
		return string.format("''%s has no ability named %s''", wf, ability)
	end

	-- build output
	local out = {}
	
	local abilityID = abilityData.revised_name or ability
	
	if abilityData.ability_icon and abilityData.ability_icon ~= false then 
		abilityID = "[[File:" .. abilityData.ability_icon .. "|42px|class=icon notpageimage|link=]] " .. abilityID
	end
	
	if abilityData.exalted and abilityData.exalted ~= false and abilityData.exalted ~= "" then
		abilityID = abilityID .. " (Exalted " .. abilityData.exalted ..")"
	end
	
	table.insert(out, '

#### ' .. abilityID .. '

')
	
	local description = abilityData.revised_desc or abilityData.live_desc or "Unchanged."
	if description ~= "" then
		table.insert(out, "{{quote|" .. description .. "}}")
	end

	return frame:preprocess(table.concat(out, "\n"))
end

function p.helminth_list(frame)
	-- Collect all matching augments
	local out = {"{{User:Emptylord/Collection/Ability start}}"}
	local notes = 0
	local credits = 0
	
	for wfName, wfData in pairs(data) do
		if wfData.abilities then
			for abilityName, abilityData in pairs(wfData.abilities) do
				local augments = abilityData.augments
				if type(augments) == "table" then
					for augName, aug in pairs(augments) do
						if type(aug) == "table" and aug.helminth == true and not aug.retired then
							
							-- Build the augment entry
							table.insert(out, "{{User:Emptylord/Collection/Augment|" .. augName)
							
							-- image: use Warframe icon if present
							if wfData.icon then
							    table.insert(out, "|image=" .. tostring(wfData.icon))
							
							    -- restrictions with icon
							    table.insert(out,
							        "|restrictions=[[File:" .. wfData.icon .. "|22px|class=icon notpageimage|link=]] " .. wfName
							        .. (aug.restrict and (", " .. tostring(aug.restrict)) or "")
							    )
							
							else
							    -- restrictions without icon
							    table.insert(out,
							        "|restrictions=" .. wfName
							        .. (aug.restrict and (", " .. tostring(aug.restrict)) or "")
							    )
							end
							
							table.insert(out, "|polarity=" .. tostring(aug.polarity or "Zenurik"))
							table.insert(out, "|availability=" .. tostring(aug.mod_avail or "Cooperative"))
							table.insert(out, "|drain=" .. tostring(aug.drain or "6 / 7 / 8 / 9"))

							-- Optional fields
							if aug.aura       then table.insert(out, "|aura=" .. tostring(aug.aura)) end
							if aug.exilus     then table.insert(out, "|exilus=" .. tostring(aug.exilus)) end
							if aug.haptics    then table.insert(out, "|haptics=" .. tostring(aug.haptics)) end
							if aug.posture    then table.insert(out, "|posture=" .. tostring(aug.posture)) end
							if aug.stance     then table.insert(out, "|stance=" .. tostring(aug.stance)) end
							if aug.trait      then table.insert(out, "|trait=" .. tostring(aug.trait)) end
							if aug.set        then table.insert(out, "|set=" .. tostring(aug.set)) end
							if aug.coop       then table.insert(out, "|coop=" .. tostring(aug.coop)) end
							
							table.insert(out, "|helminth=" .. abilityName .. " Subsume")
							table.insert(out, "|description=" .. tostring(aug.description or "missing"))

							if aug.credit     then table.insert(out, "|credit=" .. tostring(aug.credit)) end
							if aug.footnote   then table.insert(out, "|note=" .. tostring(aug.footnote)) end

							table.insert(out, "|official=" .. tostring(aug.official or false))
							table.insert(out, "|volume=" .. tostring(aug.volume or "missing"))

							if aug.revised    then table.insert(out, "|revised=" .. tostring(aug.revised)) end

							table.insert(out, "}}")

							if aug.footnote then notes = notes + 1 end
							if aug.credit   then credits = credits + 1 end
						end
					end
				end
			end
		end
	end

	table.insert(out, "{{User:Emptylord/Collection/Ability end}}")

	if notes > 0 then
		table.insert(out, "Editor notes")
		table.insert(out, '')
	end

	if credits > 0 then
		table.insert(out, "Credits")
		table.insert(out, '')
	end

	return frame:preprocess(table.concat(out, "\n"))
end

function p.augment_list(frame)
	local args = frame.args or {}
	local wf = args[1]
	local ability = args[2]
	local include = normaliseInclude(args.include)
	local count = 0

	if not wf or not ability then
		return "''Missing Warframe or ability''"
	end

	-- trim and normalize ability name
	ability = mw.text.trim(tostring(ability))
	-- check Warframe exists
	local wfData = data[wf]
	if not wfData then
		return string.format("''No data for Warframe: %s.''", wf)
	end

	-- check Ability exists
	local abilityData = wfData.abilities[ability]
	if not abilityData then
		return string.format("''%s has no ability named %s.''", wf, ability)
	end
	
	-- If augments is missing or empty, report no augments
	local augments = abilityData.augments
	if type(augments) ~= "table" then
	    return string.format("''%s has no augments for %s.''", wf, ability)
	end

	local hasAugments = false
	for _, aug in pairs(augments) do
	    if type(aug) == "table" then
	        hasAugments = true
	        break
	    end
	end

	if not hasAugments then
	    return string.format("''%s has no augments for %s.''", wf, ability)
	end

	-- collect and sort augment names alphabetically
	local keys = {}
	
	for augName in pairs(augments) do
		table.insert(keys, augName)
	end
	table.sort(keys)

	-- build output
	local out = {"{{User:Emptylord/Collection/Ability start}}"}
	local notes = 0
	local credits = 0
	
	for _, augName in ipairs(keys) do
		local aug = augments[augName]
		local avail = mw.ustring.lower(aug.mod_avail or "official")
		if (include == "all" or avail == include) and not aug.retired then
			-- Build the augment entry
			table.insert(out, "{{User:Emptylord/Collection/Augment|" .. augName)
			
			-- image: use Warframe icon if present
			if wfData.icon then 
				table.insert(out, "|image=" .. tostring(wfData.icon)) 
			end
			
			table.insert(out, "|polarity=" .. tostring(aug.polarity or "Zenurik"))
			table.insert(out, "|availability=" .. tostring(aug.mod_avail or "Cooperative"))
			table.insert(out, "|drain=" .. tostring(aug.drain or "6 / 7 / 8 / 9"))

			-- Optional fields
			if aug.aura       then table.insert(out, "|aura=" .. tostring(aug.aura)) end
			if aug.exilus     then table.insert(out, "|exilus=" .. tostring(aug.exilus)) end
			if aug.haptics    then table.insert(out, "|haptics=" .. tostring(aug.haptics)) end
			if aug.helminth   then table.insert(out, "|helminth=" .. tostring(aug.helminth)) end
			if aug.posture    then table.insert(out, "|posture=" .. tostring(aug.posture)) end
			if aug.stance     then table.insert(out, "|stance=" .. tostring(aug.stance)) end
			if aug.trait      then table.insert(out, "|trait=" .. tostring(aug.trait)) end
			if aug.set        then table.insert(out, "|set=" .. tostring(aug.set)) end
			if aug.coop       then table.insert(out, "|coop=" .. tostring(aug.coop)) end

			table.insert(out, "|description=" .. tostring(aug.description or "missing"))

			if aug.credit     then table.insert(out, "|credit=" .. tostring(aug.credit)) end
			if aug.footnote   then table.insert(out, "|note=" .. tostring(aug.footnote)) end

			table.insert(out, "|official=" .. tostring(aug.official or false))
			table.insert(out, "|volume=" .. tostring(aug.volume or "missing"))

			if aug.revised    then table.insert(out, "|revised=" .. tostring(aug.revised)) end
			if aug.restrict   then table.insert(out, "|restrictions=" .. tostring(aug.restrict)) end

			table.insert(out, "}}")

			if aug.footnote then notes = notes + 1 end
			if aug.credit   then credits = credits + 1 end
			count = count + 1
		end
	end
	table.insert(out, "{{User:Emptylord/Collection/Ability end}}")
	
	if count == 0 then
		table.insert(out, "''" .. wf .. " has no augments for " .. ability .. ".''")
	end
	
	if notes>0 then 
		table.insert(out, 'Editor notes')
		table.insert(out, '')
	end
	
	if credits>0 then 
		table.insert(out, 'Credits')
		table.insert(out, '')
	end
		
	return frame:preprocess(table.concat(out, "\n"))
end

function p.augment_list_by_volume(frame)
	local args = frame.args or {}
	local targetVolume = tostring(args.volume or "")

	if targetVolume == "" then
		return "''Missing volume parameter''"
	end

	-- Collect & sort Warframe names
	local wfKeys = {}
	for wfName in pairs(data) do
		table.insert(wfKeys, wfName)
	end
	table.sort(wfKeys)

	local out = {"{{User:Emptylord/Collection/Ability start}}"}
	local notes = 0
	local credits = 0

	-- Warframes to skip entirely
	local skip = { Equinox = true }

	for _, wfName in ipairs(wfKeys) do
		if not skip[wfName] then
			local wfData = data[wfName]
			if wfData and wfData.abilities then

				----------------------------------------------------------------
				-- SORT ABILITIES BY HOTKEY
				----------------------------------------------------------------
				local abilityKeys = {}
				for abilityName in pairs(wfData.abilities) do
					table.insert(abilityKeys, abilityName)
				end

				table.sort(abilityKeys, function(a, b)
					local A = wfData.abilities[a].hotkey
					local B = wfData.abilities[b].hotkey

					local numA = tonumber(A)
					local numB = tonumber(B)

					if numA and numB then
						return numA < numB
					elseif numA then
						return true
					elseif numB then
						return false
					else
						return tostring(A) < tostring(B)
					end
				end)

				----------------------------------------------------------------
				-- PROCESS EACH ABILITY
				----------------------------------------------------------------
				for _, abilityName in ipairs(abilityKeys) do
					local ability = wfData.abilities[abilityName]
					local augments = ability and ability.augments

					if augments then
						------------------------------------------------------------
						-- SORT AUGMENTS
						------------------------------------------------------------
						local augKeys = {}
						for augName in pairs(augments) do
							table.insert(augKeys, augName)
						end
						table.sort(augKeys)

						------------------------------------------------------------
						-- PROCESS AUGMENTS
						------------------------------------------------------------
						for _, augName in ipairs(augKeys) do
							local aug = augments[augName]

							-- Normalize values we compare to targetVolume
							local vol     = tostring(aug.volume  or "")
							local revised = tostring(aug.revised or "")
							local retired = tostring(aug.retired or "")

							if vol == targetVolume or revised == targetVolume or retired == targetVolume then

								----------------------------------------------------
								-- BUILD WF ID STRING
								----------------------------------------------------
								local wfID
								if wfData.icon and wfData.icon ~= false then
									wfID = "[[File:" .. wfData.icon .. "|32px|class=icon notpageimage|link=]] " .. wfName
								else
									wfID = wfName
								end

								----------------------------------------------------
								-- BUILD ABILITY ID STRING
								----------------------------------------------------
								local abilityID = ability.revised_name or abilityName
								if ability.ability_icon and ability.ability_icon ~= false then
									abilityID = "[[File:" .. ability.ability_icon .. "|20px|class=icon notpageimage|link=]] " .. abilityID
								end

								----------------------------------------------------
								-- ADD AUGMENT ENTRY
								----------------------------------------------------
								table.insert(out, "{{User:Emptylord/Collection/Augment|" .. augName)

								-- General fields
								if wfData.icon and wfData.icon ~= false then
									table.insert(out, "|image=" .. wfData.icon)
								end

								table.insert(out, "|polarity=" .. tostring(aug.polarity or "Zenurik"))
								table.insert(out, "|availability=" .. tostring(aug.mod_avail or "Cooperative"))
								table.insert(out, "|drain=" .. tostring(aug.drain or "6 / 7 / 8 / 9"))

								-- Optional fields
								if aug.aura       then table.insert(out, "|aura=" .. tostring(aug.aura)) end
								if aug.exilus     then table.insert(out, "|exilus=" .. tostring(aug.exilus)) end
								if aug.haptics    then table.insert(out, "|haptics=" .. tostring(aug.haptics)) end
								if aug.helminth   then table.insert(out, "|helminth=" .. tostring(aug.helminth)) end
								if aug.posture    then table.insert(out, "|posture=" .. tostring(aug.posture)) end
								if aug.stance     then table.insert(out, "|stance=" .. tostring(aug.stance)) end
								if aug.trait      then table.insert(out, "|trait=" .. tostring(aug.trait)) end
								if aug.set        then table.insert(out, "|set=" .. tostring(aug.set)) end
								if aug.coop       then table.insert(out, "|coop=" .. tostring(aug.coop)) end

								-- Description with ability icon
								table.insert(out, "|description=" ..
									abilityID ..
									" augment: " ..
									tostring(aug.description or "missing"))

								-- Footnotes & credits
								if aug.credit   then table.insert(out, "|credit=" .. tostring(aug.credit)); credits = credits + 1 end
								if aug.footnote then table.insert(out, "|note=" .. tostring(aug.footnote)); notes = notes + 1 end

								-- Metadata
								table.insert(out, "|official=" .. tostring(aug.official or false))
								table.insert(out, "|volume=" .. tostring(aug.volume or "missing"))
								if aug.revised then table.insert(out, "|revised=" .. tostring(aug.revised)) end
								if aug.retired then table.insert(out, "|retired=" .. tostring(aug.retired)) end
								if aug.restrict then table.insert(out, "|restrictions=" .. tostring(aug.restrict)) end

								table.insert(out, "}}")
							end
						end
					end
				end
			end
		end
	end

	----------------------------------------------------------------
	-- CLOSE COLLECTION
	----------------------------------------------------------------
	table.insert(out, "{{User:Emptylord/Collection/Ability end}}")

	if notes > 0 then
		table.insert(out, "Editor notes")
		table.insert(out, '')
	end

	if credits > 0 then
		table.insert(out, "Credits")
		table.insert(out, '')
	end

	return frame:preprocess(table.concat(out, "\n"))
end
function p.augment_tier_list(frame)
	local tier_map = {}
	local total_custom = 0
	local helminth_custom = 0
	local revised_augments = 0
	local revised_abilities = 0
	local contributors = {}

	local skip = { 
		["Equinox's Day Aspect"] = true,
		["Equinox's Night Aspect"] = true,
	}

	-- helper to trim whitespace
	local function trim(s)
		return (s:gsub("^%s+", ""):gsub("%s+$", ""))
	end

	-- split comma-separated contributors, ignoring commas inside parentheses
	local function split_contributors(s)
	    local results = {}
	    for name in s:gmatch("[^,]+") do
	        name = mw.text.trim(name)
	        if name ~= "" then
	            table.insert(results, name)
	        end
	    end
	    return results
	end

	-- iterate all Warframes
	for wfName, wfData in pairs(data) do
		if not skip[wfName] then
			local custom_count = 0

			if wfData.abilities then
				for _, ability in pairs(wfData.abilities) do
					if ability.augments then
						if ability.revised_desc then 
							revised_abilities = revised_abilities + 1 
						end

						for _, augment in pairs(ability.augments) do
							if not augment.retired and augment.official == false then
								custom_count = custom_count + 1
								total_custom = total_custom + 1
								if wfName == "Helminth" or augment.helminth then
									helminth_custom = helminth_custom + 1
								end
							else
								if not augment.retired and augment.official == true and augment.revised then
									revised_augments = revised_augments + 1
								end
							end

							-- handle contributors from credit field (corrected counter)
							if augment.credit then
								for _, name in ipairs(split_contributors(augment.credit)) do
									if name ~= "" then
										contributors[name] = (contributors[name] or 0) + 1
									end
								end
							end
						end
					end
				end
			end

			-- store Warframe name in tier_map by custom_count
			tier_map[custom_count] = tier_map[custom_count] or {}
			table.insert(tier_map[custom_count], wfName)
		end
	end

	-- find max augment count
	local max_count = 0
	for count in pairs(tier_map) do
		if count > max_count then 
			max_count = count 
		end
	end

	-- build HTML table
	local out = {}
	table.insert(out, ';Totals')
	table.insert(out, '* New Augments: ' .. total_custom .. ' (' .. (total_custom - helminth_custom) .. ' excluding Helminth)')
	table.insert(out, '* Revised Official Augments: ' .. revised_augments)
	table.insert(out, '* Revised Abilities: ' .. revised_abilities)
	
	local total_unique_contributors = 0
	for _ in pairs(contributors) do 
		total_unique_contributors = total_unique_contributors + 1 
	end

	table.insert(out, '* Other Contributors: ' .. total_unique_contributors)
	table.insert(out, "

")

	-- build Credits line
	if total_unique_contributors > 0 then
	    local contrib_list = {}

	    -- collect names
	    for name in pairs(contributors) do
	        table.insert(contrib_list, name)
	    end

	    table.sort(contrib_list)

	    for _, name in ipairs(contrib_list) do
	        local count = contributors[name]
	        table.insert(out, "* " .. name .. " (x" .. count .. ")")
	    end
	end

	table.insert(out, "

")

	table.insert(out, '

')
	table.insert(out, "| Augments | Warframes |
| --- | --- |
")

	for i = max_count, 0, -1 do
		local wfs = tier_map[i] or {}
		table.sort(wfs)

		local wfs_html = {}
		for _, wfName in ipairs(wfs) do
			local wfData = data[wfName]
			if wfData.official == true then
				if wfData.icon then
					table.insert(wfs_html, "[[File:" .. wfData.icon .. "|42px|class=icon notpageimage|link=]] " .. wfName)
				else
					table.insert(wfs_html, wfName)
				end
			end
		end

		table.insert(out, "| " .. i .. " | " .. table.concat(wfs_html, " • ") .. " |
")
	end

	table.insert(out, "

")

	return frame:preprocess(table.concat(out, "\n"))
end

return p
```

