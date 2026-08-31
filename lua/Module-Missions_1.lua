---	'''Missions''' stores the [[Star Chart]]'s node data.<br />
--	
--	On this Wiki, Missions is used in:
--	* [[Template:MissionTable]]
--	
--	@module		missions
--	@alias		p
--	@author		[[User:Falterfire|Falterfire]] (original)
--	@author		[[User:Gigamicro|Gigamicro]] (rework/refactor)
--	@attribution	[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Croquemorttime|Croquemorttime]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:FINNER|FINNER]]
--	@attribution	[[User:Twilight053|Twilight053]]
--	@image		StarChartU29afterHeartOfDeimosWithPath.jpg
--	@require	[[Module:Missions/data]]
--	@require	[[Module:Table]]
--	@require	[[Module:Math]]
--	@release	stable
--	

--By [[User:Gigamicro|u:gigamicro]] ([[User talk:Giga Martin|talk]]) at 23:59, September 16, 2020 (UTC)

--Use:
-- {{#invoke:Missions|getMissions|missionname1|missionname2|...}} (e.g. {{#i:M|getMissions|Tessera|Oro}} )
-- {{#i:M|Var|Val}} (e.g. {{#i:M|Planet|Venus|expanded=yes}} )
-- {{#i:M||Val}} (e.g. {{#i:M||Venus|expanded=yes}} )
-- {{#i:M|Select|Var=Val|Var2=Val2|expanded=yes|partmatch=yes}} (e.g. {{#i:M|Select|Planet=Venus|Type=Capture|expanded=yes}} )

-- possible variables (case sensitive):
-- p.__listVars() or {{#invoke:Missions|listVars}} 

local p = {}

local MissionData = mw.loadData( [[Module:Missions/data]] )
local Table = require( [[Module:Table]] )
local Math = require( [[Module:Math]] )

local function linkType(missionType)
	assert(MissionData["MissionTypes"][missionType] ~= nil, 
			'linkType(missionType): missionType "'..missionType..'" is missing from [[Module:Missions/data]]')
	return '[['..MissionData["MissionTypes"][missionType].Link..']]'
end

local function getMissions(compareFunction)
	local data = {}
	for i, m in ipairs(MissionData["MissionDetails"]) do
		if(compareFunction(m)) then
			table.insert(data, m)
		end
	end
	return data
end

---	Debug function to list out variables/keys used in <code>/data</code>
--	@function		p.__listVars
--	@return			{string} String list of keys
function p.__listVars()
	local result = {}
	for i, v in ipairs(MissionData.vars) do table.insert(result, v) end
	return table.concat(result, '\n')
end

---	Display missions in a wikitable format.
--	@function		Missions
--	@param			{table} data Table from <code>/data</code>
--	@param			{table} Header Table with mixed table entries containing wikitable 
--							column name and a cell function that formats the contents of column cells
--	@param			{string} suffix Footnote to append below wikitable
--	@return			{string} Resultant wikitext of wikitable
local function Missions(data, Header, suffix)
	if not data then error ("bad argument #1 to 'Missions' (table expected, got "..type(data)..")", 2) end
	if not Header then error ("bad argument #2 to 'Missions' (table expected, got "..type(Header)..")", 2) end
	local tHeader = '{| border="0" cellpadding="0" cellspacing="0" style="'..(Header.tablestyle or '')..'" class="wikitable sortable '..(Header.tableclass or '')..'" '..(Header.tablemeta or '')..'\n|-'
	
	for i, v in ipairs(Header) do
		tHeader = tHeader..'\n!'..v[1]
	end
	
	local tBody = ''
	for i, mission in ipairs(data) do
		tBody = tBody..'\n|-'..(Header.rowmeta and Header:rowmeta(mission) or '')..'\n'
		for ii, obj in ipairs(Header) do
			tBody = tBody..'|'..obj:cell(mission)..(#Header > ii and '|' or '')
		end
	end
	
	return tHeader..tBody..(suffix or '').."\n|}"
end

---	Display few missions in a wikitable format.
--	@function		Missions
--	@param			{table} data Table from <code>/data</code>
--	@param			{table} Header Table with mixed table entries containing 
--							{string} wikitable column width as a percentage, {string} column name, 
--							and a {function} cell function that formats the contents of column cells
--	@param			{string, table} properties Contains the names of wikitable properties mapped to a value
--	@return			{string} Resultant wikitext of wikitable
local function FewMissions(data, Header, properties)
	if type(data) ~= 'table' then error ("bad argument #1 to 'FewMissions()' (table expected, got "..type(data)..")", 2) end
	if type(Header) ~= 'table' then error ("bad argument #2 to 'FewMissions()' (table expected, got "..type(Header)..")", 2) end
	if type(properties) ~= 'table' then properties = { properties } end
	-- Get the value of the wikitable property as passed in by properties argument
	-- or fallback to a default value when calling properties(prop, default)
	setmetatable(properties, { __call = function(self, prop, default) return properties[prop] or default end })
	
	local tHeader = {
		'{| class="wikitable sortable '..(Header.tableclass or '')..'" style="max-width: ',
		properties('max-width', '700px'),
		'; text-align: center;" cellpadding="',
		properties('cellpadding', '3'),
		'" cellspacing="',
		properties('cellspacing', '2'),
		'" '..(Header.tablemeta or '')..' |-'
	}
	
	for i, v in ipairs(Header) do
		table.insert(tHeader,'\n! style="width:'..v[1]..'%;" | '..v[2])
	end
	
	local tBody = ''
	
	for i, mission in ipairs(data) do
		tBody = tBody..'\n|-'..(Header.rowmeta and Header:rowmeta(mission) or '')
		for ii, h in ipairs(Header) do tBody = tBody..h:cell(mission) end
	end
	
	return table.concat(tHeader)..tBody..'\n|}'
end

---	Builds wikitable of missions based on their node names.
--	`{{#invoke:Missions|getMissionTable|missionname1|missionname2|...}}`
--	@function		p.getMissionTable
--	@param			{table} frame Frame object with names of mission nodes as arguments
--	@return			{string} Resultant wikitext of wikitable
function p.getMissionTable(frame)
	local data = {}
	frame = frame:getParent() or frame
	for i, missionName in ipairs(frame.args or frame) do
		if (missionName ~= '') then
			table.insert(data, MissionData.by.Name[missionName][1])
		end
	end
	return FewMissions(data, {
		{'15', 'Target', cell = function(this, mission)
			if(mission.FactionImage) then
				return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))..'|class=dark-invert|x64px]]'
			else
				return '\n|['..'[File:Panel.png|64px]]'
			end
		end},
		{'20', 'Planet', cell = function(this, mission)
			return '\n|['..'['..mission.Planet..']]'
		end},
		{'15', 'Name', cell = function(this, mission)
			return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
		end},
		{'15', 'Type', cell = function(this, mission)
			return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'15', 'Level', cell = function(this, mission)
			return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
		end},
		{'20', 'Tile Set', cell = function(this, mission)
			return '\n|['..'['..mission.Tileset..']]'
		end},
	}, { ['max-width'] = '400px', ['cellpadding'] = '1' })
end

---	Sorts out missions for general call.
--	@function		MissionsBy
--	@param			{string} B key name of table entries as seen in <code>/data</code>
--	@param			{any} M value of key name
--	@return 		{string} Resultant wikitext of wikitable
local function MissionsBy(B, M)
	M = M or (( { IsArchwing = true, IsDarkSector = true, IsCrossfire = true } )[B])--val
	-- TODO: Refactor so code is more human-readable
	return Missions(MissionData.by[B][M] or {}, ({
			--put custom tables here
			Type = {
				{'Planet', cell = function(this, mission)
					return '[['..mission.Planet..']]'
				end},
				{'Mission Name', cell = function(this, mission)
					return "[["..mission.Link.."|"..mission.Name.."]]"..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
				end},
				{'Faction', cell = function(this, mission)
					local enemyTemp = {}
					for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
						table.insert(enemyTemp, '[['..enemy..']]')
					end
					return table.concat(enemyTemp, '/')
				end},
				{'[[Credit Reward]]', cell = function(this, mission)
					return mission.CreditReward and Math.formatnum(mission.CreditReward) or 0
				end},
				{'Addtional Credit Reward', cell = function(this, mission)
					return mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0
				end},
				{'Wiki\'s [[Module:DropTables/data|DropTableAlias]]', cell = function(this, mission)
					return '<code>'..(mission.DropTableAlias or '')..'</code>' or mission.Type
				end},
				{'data-sort-type="number"|Level', cell = function(this, mission)
					return mission.MinLevel..' - '..mission.MaxLevel
				end},
				{'Tileset', cell = function(this, mission)
					return '[['..mission.Tileset..']]'
				end},
			},
			IsDarkSector = {
				{'Planet', cell = function(this, mission)
					return '[['..mission.Planet..']]'
				end},
				{'Mission Name', cell = function(this, mission)
					return "[["..mission.Link.."|"..mission.Name.."]]"
				end},
				{'Type', cell = function(this, mission)
					return linkType(mission.Type)
				end},
				{'data-sort-type="number"|[[Credit Reward]]', cell = function(this, mission)
					return Math.formatnum(mission.CreditReward)
				end},
				{'data-sort-type="number"|Additional Credit Reward', cell = function(this, mission)
					return Math.formatnum(mission.AdditionalCreditReward)
				end},
				{'data-sort-type="number"|Level', cell = function(this, mission)
					return mission.MinLevel..' - '..mission.MaxLevel
				end},
				{'data-sort-type="number"|Resource Drop Chance Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSResourceBonus)
				end},
				{'data-sort-type="number"|Affinity Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSXPBonus)
				end},
				{'data-sort-type="number"|Weapon Affinity Bonus', cell = function(this, mission)
					return Math.percentage(mission.DSWeaponBonus)..' on '..mission.DSWeapon
				end},
			},
		})[B] or {
			{'Planet', cell = function(this, mission)
				return '[['..mission.Planet..']]'
			end},
			{'Mission Name', cell = function(this, mission)
				return "[["..mission.Link.."|"..mission.Name.."]]"
			end},
			{'Type', cell = function(this, mission)
				return linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'Faction', cell = function(this, mission)
				local enemyTemp = {}
				for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
					table.insert(enemyTemp, '[['..enemy..']]')
				end
				return table.concat(enemyTemp, '/')
				
			end},
			{' data-sort-type="number"|Level', cell = function(this, mission)
				return mission.MinLevel..' - '..mission.MaxLevel
			end},
			{' data-sort-type="number"|Mastery', cell = function(this, mission)
				return mission.MasteryExp
			end},
		}, "\n|+There are a total of "..Table.size(MissionData.by[B][M] or {})..(({
			--['Node'] = M.." Missions.",--name
			--['Boss'] = M.." Missions.",
			--['Pic'] = M.." Missions.",--single match
			['IsArchwing'] = " [[Archwing]] Missions.",
			['IsDarkSector'] = " [[Dark Sector]] Missions.",
			['IsCrossfire'] = " [[Crossfire]] Missions.",--assume true
			
			['FighterMaxLevel'] = (' max level %s Missions.'):format(tostring(M)),
			['MaxLevel'	] = (' max level %s Missions.'):format(tostring(M)),
			['FighterMinLevel'] = (' min level %s Missions.'):format(tostring(M)),
			['MinLevel'] = (' min level %s Missions.'):format(tostring(M)),--unlikely but whatever
			
			['Enemy'] = (' Missions against the %s'):format(tostring(M)),
			['Tier'] = (' %s-tier Missions'):format(tostring(M)),
			['Planet'] = (' Missions on %s'):format(tostring(M)),
			['Tileset'] = (' Missions on the %s Tile Set'):format(tostring(M)),
			['Type'] = (' %s Missions'):format(tostring(M)),
			['Drops'] = (' Missions that drop %s'):format(tostring(M)),
			['MasteryExp'] = (' Missions worth %s xp'):format(tostring(M))
			
			--['DSWeapon'] = M.." Missions.",
			--['DSResourceBonus'] = M.." Missions.",
			--['DSXPBonus'] = M.." Missions.",
			--['DSWeaponBonus'] = M.." Missions.",--unlikely to be used (numbers)
			
			--['Other'] = M.." Missions.",--name of map variants (letters, letter/letter/letter)
		})[B] or ' '..M..' '..B..' Missions')
	)
end

---	Sorts out missions for general call.
--	@function		MissionsBy
--	@param			{string} B key name of table entries as seen in <code>/data</code>
--	@param			{any} M value of key name
--	@return 		{string} Resultant wikitext of wikitable
local function FewMissionsBy(B, M)
	M = M or (( { IsArchwing = true, IsDarkSector = true, IsCrossfire = true } )[B])--val
	
	local Header = ({
		--column { width%, title, cell constructor }
		Planet = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy) == 'table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'20', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', '[[Tile Set]]', cell = function(this, mission)
				return '\n||['..'['..mission.Tileset..']]'
			end},
			{'5', 'Mastery Point', cell = function(this, mission)
				return '\n|data-store-value="'..mission.MasteryExp..'" data-store-currency="Mastery Point"'
				..' class="sell-col" data-sort-value="'..mission.MasteryExp..'"|'..mission.MasteryExp
			end},
			{'20', 'Internal Name', cell = function(this, mission)
				return '\n| <code>'..mission.InternalName..'</code>'
			end},
			{'5', 'Hidden Node', cell = function(this, mission)
				return '\n| '..(mission.IsHidden and '✔️' or '❌')
			end},
			tablemeta = 'data-tableid="missions"',
			tableclass = 'lighttable store-table',
			rowmeta = function(this, mission)
				return 'data-rowid="'..mission.InternalName..'"'
			end,
		},
		Tileset = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Planet', cell = function(this, mission)
				return '\n| ['..'['..mission.Planet..']]'
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n| ['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'25', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n| '..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n| '..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
		},
		Type = {
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n|['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'20', 'Planet', cell = function(this, mission)
				return '\n|['..'['..mission.Planet..']]'
			end},
			{'20', 'Name', cell = function(this, mission)
				return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'20', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', 'Tile Set', cell = function(this, mission)
				return '\n|['..'['..mission.Tileset..']]'
			end},
		},
		})[B] or 
		{
			{'15', 'Target', cell = function(this, mission)
				if (mission.FactionImage) then
					return '\n| ['..'[File:'..(mission.FactionImage or mission.Pic)
					..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))
					..'|class=dark-invert|x64px]'..']'
				else
					return '\n| ['..'[File:Panel.png|64px]'..']'
				end
			end},
			{'15', 'Planet', cell = function(this, mission)
				return '\n| ['..'['..mission.Planet..']]'
			end},
			{'15', 'Name', cell = function(this, mission)
				return '\n| ['..'['..mission.Link..'|'..mission.Name..']]'
			end},
			{'15', 'Type', cell = function(this, mission)
				return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
			end},
			{'15', 'Level', cell = function(this, mission)
				return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
			end},
			{'15', '[[Credit Reward]]', cell = function(this, mission)
				return '\n|'..(mission.CreditReward and Math.formatnum(mission.CreditReward) or 0)
			end},
			{'15', 'Additional Credit Reward', cell = function(this, mission)
				return '\n|'..(mission.AdditionalCreditReward and Math.formatnum(mission.AdditionalCreditReward) or 0)
			end},
			{'25', 'Tile Set', cell = function(this, mission)
				return '\n|['..'['..mission.Tileset..']]'
			end},
		}--default
	
	-- Adding additional columns for Empyrean missions
	local proximaTable = { ['Skirmish']=true,
		['Earth Proxima']=true, ['Venus Proxima']=true,
		['Saturn Proxima']=true, ['Neptune Proxima']=true,
		['Pluto Proxima']=true, ['Veil Proxima']=true,
	}
	if proximaTable[M] then
		local b = 0
		for i, v in ipairs(Header) do
			if v[2] == 'Level' then
				b = i
				break
			end
		end
		table.insert(Header, b, {
			'10', 'Fighter Level', cell = function(this, mission)
					return '\n|'..mission.FighterMinLevel..' - '..mission.FighterMaxLevel
			end})
		--edit other section widths?
		--Header[b-1][1]=Header[b-1][1]-0 ..''
		Header[b + 1][1] = '10'--Header[b+1][1]-10 ..''
		table.insert(Header, {
			'5', 'Max Fighters', cell = function(this, mission)
					return '\n|'..mission.MaxFighters
			end})
		table.insert(Header, {
			'5', 'Max Crewships', cell = function(this, mission)
					return '\n|'..mission.MaxCrewships
			end})
		table.insert(Header, {
			'5', 'Other Objective', cell = function(this, mission)
					return '\n|'..mission.Objectives..(mission.ObjectiveDetails and ' ('..mission.ObjectiveDetails..')' or '') 
			end})
	end--railjack
	if ({ ['Assassination']=true })[M] then
		local b = 0;
		for i, v in ipairs(Header) do
			if v[2] == 'Level' then
				b = i + 1
				break
			end
			b = i
		end
		table.insert(Header, b, {
			'15', 'Rewards', cell = function(this, mission)
				local numDrops = Table.size(mission.Drops)
				local r = ''
				for i, v in ipairs(mission.Drops)do
					r = r..(numDrops == i and numDrops > 1 and '& ' or '')..'['..'['..v..']'..']'..(numDrops ~= i and numDrops > 2 and ', ' or ' ')
				end
				return '\n|'..r
			end})
		--edit other section widths?
		Header[b - 1][1] = Header[b - 1][1] - 0 ..''
		Header[b + 1][1] = Header[b + 1][1] - 0 ..''
	end--rewards
	
	return FewMissions(MissionData.by[B][M], Header)
end

-- Each key in M:Missions/data will automatically have its own invokable function that calls
-- either FewMissionsBy(key, frame.args[1]) or MissionsBy(key, frame.args[1])
-- e.g. {{#invoke:Missions|Var|Val}}
for k in pairs(MissionData.by) do
	p[k] = function(frame) 
		return (((frame.args['expanded']) and FewMissionsBy or MissionsBy))(k, frame.args[1])
	end
end

---	Display certain types of missions in a wikitable format based on argument passed
--	`{{#invoke:Missions|auto|Val}}`
--	(e.g. `{{#invoke:Missions|auto|Venus}}` for list of Venus nodes or 
--	`{{#invoke:Missions|auto|Survival}}` for list of Survival nodes)
--	@function		p.auto
--	@param			{table} frame Frame object
--	@return			{string} Resultant wikitext of wikitable
function p.auto(frame)
	return p[MissionData.dictionary[frame.args[1]]](frame)
	--return (((frame.args['expanded']) and FewMissionsBy or MissionsBy))(MissionData.dictionary[frame.args[1]], frame.args[1])
end

---	Returns a wikitable with mission nodes fitting multiple search criteria.
-- `{{#invoke:Missions|Select|Var=Val|Var2=Val2|expanded=yes|partmatch=yes}}`
--	(e.g. `{{#invoke:Missions|Select|Type=Survival|Planet=Venus}}` returns wikitable of Survival mission nodes on Venus)
--	@function		p.Select
--	@param			{table} frame Frame object with named arguments representing key names of entries in <code>/data</code>
--	@return 		{string} Resultant wikitext of wikitable
function p.Select(frame)
	local args = frame.args or frame
	local expanded = args.expanded and args.expanded ~= '' or false
	local partMatch = args.partmatch and args.partmatch ~= '' --and 'true' or 'false'
	local merge = {}
	pcall(function() local tableNames = {} end)	-- TODO: Why is this wrapped around a pcall()?
	--local gargs = {}
	for k,v in pairs(args) do
		if Table.contains(MissionData.vars, k) then
			-- Handle boolean conversion for true/false strings
			if v == 'true' or v == 'false' then
				v = (v == 'true')
			else
				pcall(function() v = v + 0 end)
			end
			table.insert(merge, MissionData.by[k][v])
			pcall(function() table.insert(tableNames, k) end)
		end
	end
	
	-- TODO: Remove mw.log()s
	--max loops: largest by-table if partmatch; smallest otherwise
	--merge = {{mission,mission},{mission,mission}}
	-- [[
	local data = {}
	do 
		--merge down
		local i = #merge
		mw.log(i, 'tables')
		while i > 1 do
			pcall(function() tableNames[i - 1] = tableNames[i]..' & '..tableNames[i - 1]
			mw.log(tableNames[i - 1] or '')end)
			
			merge[i - 1] = (function(a, b)
				--merge a and b
				local ai, bi = 1, 1
				local r = {}
				while a[ai] and b[bi] do
					--same mission? add it, increment both
					if a[ai] == b[bi] then
						mw.log(ai, bi, 'match')--,a[ai].Id,b[bi].Id)
						table.insert(r, a[ai])
						ai, bi = ai + 1, bi + 1
					else
						--catch up earlier one
						if a[ai].Id > b[bi].Id then
							mw.log(ai, bi, 'b', a[ai].Id, b[bi].Id)
							if partMatch then table.insert(r, b[bi]) end
							bi=bi+1
						else
							mw.log(ai, bi, 'a', a[ai].Id, b[bi].Id)
							if partMatch then table.insert(r, a[ai]) end
							ai = ai + 1
						end
					end
				end
				if partMatch then 
				while a[ai] do
					mw.log(ai, bi, 'a')
					table.insert(r, a[ai])
					ai = ai + 1
				end
				while b[bi] do
					mw.log(ai, bi, 'b')
					table.insert(r, b[bi])
					bi = bi + 1
				end
				end
				return r
			end)(merge[i], merge[i - 1])
			merge[i] = nil
			i = i - 1
		end
		data = merge[1]
	end
	
	return (({ [false] = function(data) return Missions(data, {
		{'Planet', cell = function(this, mission)
			return '[['..mission.Planet..']]'
		end},
		{'Mission Name', cell = function(this, mission)
			return "[["..mission.Link.."|"..mission.Name.."]]"
		end},
		{'Type', cell = function(this, mission)
			return linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'Faction', cell = function(this, mission)
			local enemyTemp = {}
			for _, enemy in ipairs(type(mission.Enemy) == 'table' and mission.Enemy or {mission.Enemy}) do
				table.insert(enemyTemp, '[['..enemy..']]')
			end
			return table.concat(enemyTemp, '/')
			
		end},
		{' data-sort-type="number"|Level', cell = function(this, mission)
			return mission.MinLevel..' - '..mission.MaxLevel
		end},
		{' data-sort-type="number"|Mastery', cell = function(this, mission)
			return mission.MasteryExp
		end},
	}) end, [true] = function(data) return FewMissions(data, {
		{'15', 'Target', cell = function(this, mission)
			if(mission.FactionImage) then
				return '\n|['..'[File:'..(mission.FactionImage or mission.Pic)..'|link='..(mission.Boss or (type(mission.Enemy)=='table' and 'Crossfire' or mission.Enemy))..'|class=dark-invert|x64px]]'
			else
				return '\n|['..'[File:Panel.png|64px]]'
			end
		end},
		{'20', 'Planet', cell = function(this, mission)
			return '\n|['..'['..mission.Planet..']]'
		end},
		{'15', 'Name', cell = function(this, mission)
			return '\n|['..'['..mission.Link..'|'..mission.Name..']]'
		end},
		{'15', 'Type', cell = function(this, mission)
			return '\n|'..linkType(mission.Type)..(mission.IsDarkSector and " ([[Dark Sector]])" or '')
		end},
		{'15', 'Level', cell = function(this, mission)
			return '\n|'..mission.MinLevel..' - '..mission.MaxLevel
		end},
		{'20', 'Tile Set', cell = function(this, mission)
			return '\n|['..'['..mission.Tileset..']]'
		end},
	}) end })[expanded])(data)
end

---	Returns a highlight table with mission nodes paired with their mastery points.
--  Single Planet: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|planet=Mercury}}`
--  All Missions: `{{#invoke:Missions|all_mastery|tableid=All Mission Completion Checklist}}`
--  With Table Class: `{{#invoke:Missions|all_mastery|tableid=Mercury Completion Checklist|tableclass=mw-collapsible|planet=Mercury}}`
--	@function		p.all_mastery
--	@param			{table} frame Frame object with named arguments representing key names of entries in <code>/data</code>
--	@return 		{string} Resultant wikitext of wikitable
function p.all_mastery(frame)
	local missionDetails = MissionData.MissionDetails
	local filteredMissions = {}
	
	-- Filters out hub, relays, and conclave missions by default.
	for _, mission in ipairs(missionDetails) do
		if 
			mission.Type ~= "Hub" and 
			mission.Type ~= "Relay" and 
			mission.Type ~= "Conclave" 
		then
	        table.insert(filteredMissions, mission)
	    end
	end
	missionDetails = filteredMissions
	
	-- Filter by planet if applicable
	if frame.args.planet and frame.args.planet ~= "" then
		local filteredByPlanet = {}
		
		for _, mission in ipairs(missionDetails) do
			if 
				mission.Planet == frame.args.planet and 
				mission.Type ~= "Hub" and
				mission.Type ~= "Relay" and
				mission.Type ~= "Conclave"
			then
				table.insert(filteredByPlanet, mission)
			end
		end
		
		missionDetails = filteredByPlanet
	end
	
	-- Sort mission details by name
	table.sort(missionDetails, function(a, b)
	    return a.Name < b.Name
	end)
	
	-- If planet is provided, return different table.
	return Missions(missionDetails, {
		{'Mission Name', cell = function(this, mission)
			return "[["..mission.Link.."|"..mission.Name.."]]"
		end},
		{'data-sort-type="number"|Mastery', cell = function(this, mission)
				return 'data-store-value="'..mission.MasteryExp..'" data-store-currency="Mastery Point"'
				..' class="sell-col" data-sort-value="'..mission.MasteryExp..'"|'..mission.MasteryExp
		end},
		tableclass = 'lighttable store-table '..(frame.args.tableclass or ''),
		tablestyle = (frame.args.tablestyle or ''),
		tablemeta = 'data-tableid="'..(frame.args.tableid or 'missions')..'"',
		rowmeta = function(this, mission)
			return 'data-rowid="'..mission.InternalName..'"'
		end,
	})
end

return p
