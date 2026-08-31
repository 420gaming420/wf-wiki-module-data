--- '''MasteryRank''' is a helper module for constructing wikitables pertaining to
--	[[Mastery Rank]] and [[Clan]] affinity.<br />
--  
--  On this Wiki, MasteryRank is used in:
--	* [[Template:MasteryTable]]
--	* [[Template:ClanAffinityTable]]
--  
--  @module		masteryrank
--  @alias		p
--  @author		[[User:FINNER|FINNER]]
--	@attribution [[User:Synthtech|Synthtech]]
--	@attribution [[User:Cephalon Scientia|Cephalon Scientia]]
--  @image		Mastery Info New.png
--	@require	[[w:c:dev:Module:Arguments|Module:Arguments]]
--  @require	[[Module:Version]]
--  @require	[[Module:Math]]
--  @release	stable
--  

local p = {}

local Version = require("Module:Version")
local Math = require("Module:Math")
local Args = require("Dev:Arguments")

-- number of weapons that can go up to R40 (Kuva Weapons, Tenet Weapons, and Paracesis)
local RANK_40_WEAPONS_COUNT = 19 + 12 + 1
local MASTERY_CLASSES = {
	"Unranked", "Initiate", "Novice", "Disciple", "Seeker", 
	"Hunter", "Eagle", "Tiger", "Dragon", "Sage", "Master", 
	"Legendary"
}
local MASTERY_TITLES = { "Gold ", "", "Silver " }

local function getMasteryRank(totalXp)
	local rank, tillNext
	-- When total XP exceeds or equal to MR30, XP calculation for Legendary ranks will be comprised of
	-- two equations: 2500 * (MR before Legendary)^2 and 147500 * Legendary rank #
	if (totalXp >= (2500 * 30 ^ 2)) then
		local legendaryRank = math.floor((totalXp - (2500 * math.pow(30, 2))) / 147500)	-- Subtract total XP @ MR30
		rank = 30 + legendaryRank	-- MR30 + Legendary rank #
		tillNext = Math.formatnum((2500 * math.pow(30, 2)) + (147500 * (legendaryRank + 1)) - totalXp)
	else
		rank = math.floor(math.pow(totalXp / 2500, 0.5))
		tillNext = Math.formatnum(2500 * math.pow(rank + 1, 2) - totalXp)
	end
	
	local i = math.ceil(rank / 3) + 1
	local j = math.mod(rank, 3) + 1
	local class = MASTERY_CLASSES[i]
	local title = MASTERY_TITLES[j]

	if rank == 29 then
		title = "Middle "
	elseif rank == 30 then
		title = "True "
	elseif rank == 0 or rank > 30 or title == nil then
		class = class.." "..(rank - 30)	-- For the number in Legendary ranks
		title = ""
	end
	
	local rankNext = rank + 1
	i = math.ceil(rankNext / 3) + 1
	j = math.mod(rankNext, 3) + 1
	local classNext = MASTERY_CLASSES[i]
	local titleNext = MASTERY_TITLES[j]

	if rank > 30 or title == nil then
		classNext = classNext.." "..(rankNext - 30)
		titleNext = ""
	elseif rankNext == 29 then
		titleNext = "Middle "
	elseif rankNext == 30 then
		titleNext = "True "
	end

	return '<span style="border-bottom: 1px dotted;" title="MR'..rank..' ('..title..class..'); '..tillNext..' Mastery until MR'..rankNext..' ('..titleNext..classNext..')">[?]</span>'
end

local function getClanRank(totalXp)
	local ranks = {
		10000, 34000, 69000, 114000, 168000, 231000, 302000, 381000, 
		468000, 563000, 665000, 774000, 891000
	}
	local rank

	for i, rankXp in ipairs(ranks) do
		if totalXp < rankXp then
			rank = i - 1
			break
		end
	end

	if rank == nil then
		rank = 13
	end

	local str = ""
	if rank < 13 then
		local tillNext = Math.formatnum(ranks[rank + 1] - totalXp)
		str = '<span style="border-bottom: 1px dotted;" title="Rank '..rank..', ('..tillNext..' Affinity until next rank)">[?]</span>'
	else
		str = '<span style="border-bottom: 1px dotted;" title="Rank '..rank..'">[?]</span>'
	end

	return str
end

local function buildMasteryTable(...)
	local argTable = Args.getArgs(...)
	
	-- Mapping keys to base mastery xp at max rank 
	-- (excluding rank 40 weapons which are edge cases)
	local baseMasteryXp = {
		warframes = 6000,
		plexus = 6000,
		primaries = 3000,
		secondaries = 3000,
		melee = 3000,
		kitguns = 3000,
		amps = 3000,
		houndWeapons = 3000,
		kubrows = 6000,
		kavats = 6000,
		predasite = 6000,
		vulpaphyla = 6000,
		moas = 6000,
		hounds = 6000,
		sentinels = 6000,
		sentinelWeapons = 3000,
		archwings = 6000,
		archGuns = 3000,
		archMelees = 3000,
		kDrives = 6000,
		necramechs = 8000,
		junctions = 1000,
		intrinsics = 15000,
	}
	
	-- error(mw.dumpObject(argTable))
	
	-- Returns a tuple of the category count and total mastery XP within that category
	local masteryTableRow = function(category, additionalXp)
		additionalXp = additionalXp and additionalXp or 0
		local count = argTable[category] or error('buildMasteryTable(...): invalid category "'..category..'"')
		local baseXp = baseMasteryXp[category] or error('buildMasteryTable(...): invalid category "'..category..'"')
		-- Base xp per fully maxed item * number of items in category
		local totalXp = baseXp * count
		return count, Math.formatnum(totalXp + additionalXp)
	end
	
	local tHeader = string.format([[
		{| class="article-table" style="margin:1em auto;"
		! style="text-align:center;" | Category
		! style="text-align:left;"   | Count
		! style="text-align:left;"   | Mastery
		|+ <small><span style="text-transform:uppercase; color:var(--positive-text-color);">Last updated: <span style="text-decoration:underline;">%s</span>&nbsp;(%s)</span></small>
		|-
	]], argTable['ver'] and Version.getVersionLink(argTable['ver']) or 'N/A', argTable['platform'] or 'N/A')

	local tRows = ([=[
		| [[Warframes]] || %s || %s
		|-
		| [[:Category:Primary Weapons|Primaries]] || %s || %s
		|-
		| [[:Category:Secondary Weapons|Secondaries]] || %s || %s
		|-
		| [[:Category:Melee Weapons|Melee]]<br />(including [[Zaw]]s)|| %s || %s
		|-
		| [[Kitgun]]s || %s || %s
		|-
		| colspan=3 |
		|-
		| Normal [[Planet|Missions]] (nodes + [[Junction]]s) || %s (%s + %s) || %s (%s + %s)
		|-
		| [[The Steel Path]] (nodes + [[Junction]]s) || %s (%s + %s) || %s (%s + %s)
		|-
		| [[Intrinsics]] || %s || %s
		|-
		| [[Plexus]] || %s || %s
		|-
		| colspan=3 |
		|-
		| [[Sentinel]]s || %s || %s
		|-
		| [[:Category:Robotic Weapons|Robotic Weapons]] || %s || %s
		|-
		| [[Hound]] Weapons || %s || %s
		|-
		| [[Kubrow]]s || %s || %s
		|-
		| [[Kavat]]s || %s || %s
		|-
		| [[Predasite]]s || %s || %s
		|-
		| [[Vulpaphyla]]s || %s || %s
		|-
		| [[MOA (Companion)|MOA]]s || %s || %s
		|-
		| [[Hound]]s || %s || %s
		|-
		| colspan=3 |
		|-
		| [[Archwing]]s || %s || %s
		|-
		| [[Archwing|Arch-Guns]] || %s || %s
		|-
		| [[Archwing|Arch-Melees]] || %s || %s
		|-
		| [[Amp]]s || %s || %s
		|-
		| [[K-Drive]]s || %s || %s
		|-
		| [[Necramech]]s || %s || %s
		|-
		]=]):format(
			masteryTableRow('warframes'),
			masteryTableRow('primaries', (11 * 1000) + (4 * 1000)),	-- Extra XP for R40 Kuva/Tenet weapons
			masteryTableRow('secondaries', (5 * 1000) + (4 * 1000)),	-- Extra XP for R40 Kuva/Tenet weapons
			masteryTableRow('melee', (1 * 1000) + (4 * 1000) + 1000),	-- Extra XP for R40 Kuva/Tenet weapons and Paracesis
			masteryTableRow('kitguns'),
			argTable['missions'] + argTable['junctions'], argTable['missions'], argTable['junctions'], Math.formatnum(argTable['missionsXp'] + 1000 * argTable['junctions']), argTable['missionsXp'], 1000 * argTable['junctions'],
			argTable['missions'] + argTable['junctions'], argTable['missions'], argTable['junctions'], Math.formatnum(argTable['missionsXp'] + 1000 * argTable['junctions']), argTable['missionsXp'], 1000 * argTable['junctions'],
			-- argument #22
			masteryTableRow('intrinsics'),
			masteryTableRow('plexus'),
			masteryTableRow('sentinels'),
			masteryTableRow('sentinelWeapons'),
			masteryTableRow('houndWeapons'),
			masteryTableRow('kubrows'),
			masteryTableRow('kavats'),-- argument #35 + #36, error is here for some reason
			masteryTableRow('predasite'),
			masteryTableRow('vulpaphyla'),
			masteryTableRow('moas'),
			masteryTableRow('hounds'),
			masteryTableRow('archwings'),
			masteryTableRow('archGuns', (2 * 1000)),	-- Extra XP for R40 Kuva weapons
			masteryTableRow('archMelees'),
			masteryTableRow('amps'),
			masteryTableRow('kDrives'),
			masteryTableRow('necramechs')
		)
	
	-- Missions and junctions needed to be counted twice, once for normal star chart and second time for Steel Path
	local totalCount = argTable['missions'] + argTable['junctions']
	for argName, value in pairs(argTable) do
		if (argName ~= 'platform' and argName ~= 'ver' and 
				argName ~= 'missionsXp' and argName ~= 'exclusives' and 
				argName ~= 'exclusivesXp') then
			totalCount = totalCount + value
		end
	end
	
	-- Missions and junctions needed to be counted twice, once for normal star chart and second time for Steel Path
	local totalXp = (argTable['missionsXp'] * 2) + (argTable['junctions'] * 1000) + (1000 * RANK_40_WEAPONS_COUNT)
	
	for key, baseXp in pairs(baseMasteryXp) do
		totalXp = totalXp + (argTable[key] * baseXp)
	end
	
	-- local masteryRank = getMasteryRank(totalXp)
	-- local MRNoExclusive = getMasteryRank(totalXp - argTable['exclusivesXp'])

	-- local tFooter = string.format([=[
	-- 	! Total !! %d !! %s<sup>%s</sup>
	-- 	|-
	-- 	! Minus [[Exclusive Mastery|Exclusives]] !! %d !! %s<sup>%s</sup>
	-- 	|-
	-- 	|}
	-- 	]=], 
	-- 	totalCount, Math.formatnum(totalXp), masteryRank,
	-- 	totalCount - argTable['exclusives'], Math.formatnum(totalXp - argTable['exclusivesXp']), MRNoExclusive
	-- )

	return tHeader..tRows--..tFooter
end

--- Builds total Mastery table.
--	@function		p.buildMasteryTable
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildMasteryTable(frame)
	assert(frame and frame.args ~= nil, 'p.buildMasteryTable(frame): must pass the number of items in each category')
	return buildMasteryTable(frame.args)
end

local function buildClanAffinityTable(...)
	local argTable = Args.getArgs(...)

	local tHeader = string.format([[
		{| class="article-table" style="margin:1em auto;"
		! style="text-align:center;" | Category
		! style="text-align:left;"   | Count
		! style="text-align:left;"   | Affinity
		|+ <small><span style="text-transform:uppercase; color:var(--positive-text-color);">Last updated: <span style="text-decoration:underline;">%s</span></span></small>
		|-
	]], argTable['ver'] and Version.getVersionLink(argTable['ver']) or 'N/A')

	local tRows = string.format([=[
		| [[Warframes]] || %d || %s
		|-
		| [[Weapons]] || %d || %s
		|-
		| [[Companions]] || %d || %s
		|-
		| [[Archwing]]s || %d || %s
		|-
		| [[Archwing|Arch-Guns]] || %d || %s
		|-
		| [[Archwing|Arch-Melees]] || %d || %s
		|-
		| [[Pigment]]s || %d || %s
		|-
		| Backdrops || %d || %s
		|-
		| [[Orbiter Segments]] || %d || %s
		|-
		| [[Resources]] || %d || %s
		|-
		| [[Gear]] || %d || %s
		|-
		| Upgrades || %d || %s
		|-
		| [[Dojo#Rooms_and_Decorations|Rooms]] || %d || %s
		|-
		| [[Solar Rail (Dark Sectors)|Solar Rail]] Construction || %d || %s
		|-
		]=],
		argTable['warframes'], Math.formatnum(9500 * (argTable['warframes'] - 1) + 4500), -- Yareli
		argTable['weapons'], Math.formatnum(3000 * (argTable['weapons'] - 6) + 36000), -- Hema, Lenz, Kreska, Ocucor, Battacor, Ghoulsaw
		argTable['companions'], Math.formatnum(3000 * argTable['companions']),
		argTable['archwings'], Math.formatnum(7500 * argTable['archwings']),
		argTable['archGuns'], Math.formatnum(3000 * (argTable['archGuns'] - 1) + 5000), -- Grattler
		argTable['archMelees'], Math.formatnum(3000 * (argTable['archMelees'] - 1) + 5000), -- Knux
		argTable['pigments'], Math.formatnum(1000 * argTable['pigments']),
		argTable['backdrops'], Math.formatnum(1000 * argTable['backdrops']),
		argTable['segments'], Math.formatnum(6000 * argTable['segments']),
		argTable['resources'], Math.formatnum(2000 * (argTable['resources'] - 1) + 3000), -- Synthula
		argTable['gear'], Math.formatnum(3000 * (argTable['gear'] - 1) + 2000), -- Infested Catalyst
		argTable['upgrades'], Math.formatnum(5000 * argTable['upgrades']),
		argTable['rooms'], Math.formatnum(10000 * (argTable['rooms'] - 4) + 60000), -- Temple, Dueling Room, Obstacle Course + Architect
		argTable['solarRail'], Math.formatnum(17000 * argTable['solarRail'])
	)

	local total = 0
	for argName, value in pairs(argTable) do
		if (argName ~= 'platform' and argName ~= 'ver') then
			total = total + value
		end
	end

	local totalXp = 9500*(argTable['warframes']-1) + 3000*((argTable['weapons']-6) + argTable['companions'] + (argTable['archGuns']-1)
		+ (argTable['archMelees']-1) + (argTable['gear']-1)) + 7500*argTable['archwings'] + 1000*argTable['pigments'] + 1000*argTable['backdrops']
		+ 6000*argTable['segments'] + 2000*(argTable['resources']-1) + 5000*argTable['upgrades'] + 10000*(argTable['rooms']-4) + 17000*argTable['solarRail']
		+ 115500
	local clanRank = getClanRank(totalXp)
	local clanRankExclusive = getClanRank(totalXp - 20000)

	local tFooter = string.format([=[
		! Total !! %d !! %s<sup>%s</sup>
		|-
		! Minus Exclusives !! %d !! %s<sup>%s</sup>
		|-
		|}
		]=],
		total, Math.formatnum(totalXp), clanRank,
		total - 2, Math.formatnum(totalXp - 20000), clanRankExclusive
	)

	return tHeader..tRows..tFooter
end

--- Builds total Clan affinity table.
--	@function		p.buildClanAffinityTable
--	@param			{table} frame
--	@return			{string} Resultant table in wikitext
function p.buildClanAffinityTable(frame)
	assert(frame and frame.args ~= nil, 'p.buildClanAffinityTable(frame): must pass the number of items in each category')
	return buildClanAffinityTable(frame.args)
end

return p
