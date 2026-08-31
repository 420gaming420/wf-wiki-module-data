---	'''Version''' stores all build versions of [[WARFRAME]] based on their update/hotfix designation.<br />
--	
--	On this Wiki, Version is used in:
--	* [[Template:Ver]]
--	* [[Template:Ver/Lu]]
--	
--	@module		version
--	@alias		p
--	@author		[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Gigamicro|gigamicro]]
--	@image		Launcher (English Version).png
--	@require	[[Module:Version/data]]
--	@require	[[Module:String]]
--	@release	stable
--	

local p = {}

local VersionData = require[[Module:Delay]].mw.loadData[[Module:Version/data]]

---	Creates a wikitext link based on the build version string.
--	@function		sanShort
--	@param			{string} name A plaintext name or abbreviation of a named update (e.g. "Vanilla", "The Silver Grove", "SilGro")
--	@return			{string} Wikitext link of update page
--	@local
local sanShort;sanShort = setmetatable({--put this in the data maybe
	['VANILLA'] = 'U0',
	['WEAPON BALANCE'] = 'U7.2.1',
		['WB'] = 'U7.2.1',
	['LUNARO'] = '18.15',
	['SPECTERS OF THE RAIL'] = '18.16',
		['SOTR'] = '18.16',
	['THE SILVER GROVE'] = '18.17',
		['SILGRO'] = '18.17',
		['TSG'] = '18.17',
	['THE VACUUM WITHIN'] = '18.18',
		['TVW'] = '18.18',
	['THE INDEX PREVIEW'] = '18.19',
		['INDEX PREVIEW'] = '18.19',
		['TIP'] = '18.19',
	['RECURRING NIGHTMARES'] = '18.20',
		['RN'] = '18.20',
	['RECURRING DREAMS'] = '18.21',
		['RD'] = '18.21',
},{
	__call = function(self, name)
		return name:upper():gsub('^%a[A-Z ]+', self)
		--gsub(s,pattern,t) will use matches as indices to table t, which are then replaced with the value at that index
		--eg, ('qweasd'):gsub('[ws]',{w='s',s='w'}) == 'qseawd'
	end,
	__index = function(self, index)
		return rawget(self, index) or (
			rawget(self, index:sub(1, -2)) or --trailing space
			error('No number found for '..index)
		)..'.'
	end,
})

---	Creates a wikitext link based on the build version string.
--	@function		shortToLink
--	@param			{string} ver Build version string (e.g. "U27.0", "H22.5.1", "31.0.2", "Vanilla", "The Silver Grove", "SilGro", "TVW ")
--	@return			{string} Wikitext link of update page
function p.shortToLink(ver)
	if ver.args then ver = ver.args[1] end
	-- "H1.2.3" -> "H" "1.2.3" "1"
	local buildType, alias, parent = sanShort(ver):match('([UhuH]?)((%d+)[0-9.]*)')
	-- alias = alias:gsub('^(%d+%.%d+)%.[0.]+$', '%1')
	alias = alias:gsub('%.[0.]+$', '')
	buildType = ({ U='Update', H='Hotfix' })[buildType:upper()] or 
		(alias:find('%.%d+%.') and 'Hotfix' or 'Update')
	return ('[[Update %d#%s %s|%s %s]]'):format(parent, buildType, alias, buildType, alias)
end

---	Gets the category page link associated with that version.
--	@function		p._getVersionCategory
--	@param			{string} name Version alias (e.g. 'U26' or 'H30.3.5')
--	@return			{table} Version entry as seen in <code>/data</code>
function p._getVersionCategory(name)
	assert(name ~= nil, 'p._getVersionCategory(name): name cannot be nil, must put in a version name')
	
	if (name == 'Vanilla' or name == '0') then
		return '[[Category:Vanilla]][[Category:Closed Beta]]'
	elseif (name == 'TBA') then
		return '[[Category:Upcoming content]]'
	end
	
	local Version = p._getVersion(name)
	-- The number before the decimal point is the first mainline update that starts with that number
	local updateNum = string.gsub(Version['Parent'], '(.+)%.(.+)', '%1')
	
	cbt = ''
	-- If parent update alias lesser than 7, that means update was a closed beta one
	if (tonumber(updateNum) < 7) then
		cbt = '[[Category:Closed Beta]]'
	end
	
	return '[[Category:Update '..updateNum..']]'..cbt
end

---	Gets a version by name or by alias, case insensitive.
--	@function		p.getVersion
--	@param			{string} name
--	@return			{table} Version entry as seen in <code>/data</code>
function p._getVersion(name)
	assert(name ~= nil, 'p._getVersion(name): name cannot be nil, must put in a version name')
	local versionEntry = VersionData['Versions'][name] or VersionData['Aliases'][name]
	if (versionEntry ~= nil) then return versionEntry end
	error('p._getVersion(name): Version name or alias"'..name..'" not found (add to [[Module:Version/data]] if needed)')
end

---	Gets a version's link.
--	@function		p.getVersionLink
--	@param			{table} frame
--	@return			{string} Wikitext of version article link
function p.getVersionLink(frame)
	local name = frame.args ~= nil and frame.args[1] or frame
	local color = frame.args ~= nil and frame.args.color or nil
	local short = frame.args ~= nil and frame.args.short or "false"
	return p._getVersionLink(name, color, short)
end

---	Gets a version's link.
--	@function		p._getVersionLink
--	@param			{string} name
--	@param			{string} color
--	@param			{string} short
--	@return			{string} Wikitext of version article link
function p._getVersionLink(name, color, short)
	local Version = p._getVersion(name:gsub('^%s*(.+?)%s*$','%1'))
	local name = ''
	local date = ''
	
	if short ~= nil and string.upper(short) == "TRUE" then
		name = Version.ShortName
	else
		name = Version.Name
		date = ' ('..Version.Date..')'
	end
	
	assert(Version ~= nil, 'p._getVersionLink(name, color, short): version name "'..name..'" not found (add to [[Module:Version/data]] if needed)')
	
	if color ~= nil then
		return "[["..Version.Link.."|<span style=\"color:"..color..";\">"..name.."</span>]]"..date
	end
	return "[["..Version.Link.."|"..name.."]]"..date
end

---	Gets a version's date.
--	@function		p._getVersionDate
--	@param			{string} name
--	@return			{string} ISO date
function p._getVersionDate(name)
	local Version = p._getVersion(name)
	assert(Version ~= nil, 'p._getVersionDate(name): version name "'..name..'" not found (add to [[Module:Version/data]] if needed)')
	return Version.Date
end

---	Creates a line for table of contents.
--	@function		getToCLine
--	@param			{string} parent Parent version
--	@return			{string} Wikitext of a line in the table of contents
local function getToCLine(parent)
	local prevParent = nil
	local result = ""
	local LinkTemp ={}
	
	-- TODO: Refactor so there is not many nested code blocks
	for j, Version in pairs(VersionData["Versions"]) do
		local bracket = "[["--reseting the brackets
		local bracket2 = "]]"
		
		if Version.Parent == parent then
			if prevParent == nil then --check if we've been here before
				if Version.ParentName ~= nil then
					result = "'''"..Version.ParentName..":''' "
				else
					result = "'''Update "..Version.Parent..":''' "
				end
			elseif prevParent ~= nil then --been here -> add spacer
				result = result.." • "
			end
			local shortname = string.upper(string.sub(Version.ShortName,1,1)) --getting the first letter
			if shortname == "U" or shortname == "V" then --bolding the link if Update or Vanilla
				bracket = "'''[["
				bracket2 = "]]'''"
			end
			LinkTemp = mw.text.split(Version.Link, "#", true)--since ToC is used on Update pages only, and only [[#"Header"|"Name"]] links work in edit mode -> split the link and use second part of it on the next line
			result = result..bracket.."#"..LinkTemp[2].."|"..Version.ShortName..bracket2
			prevParent = Version.Parent --for checking if been in this "if" yet
		elseif prevParent ~= nil then -- ->return result if parent switches. The data is ordered so there's no need to loop through the rest for nothing
			return result
		end
	end
	return result --required for the latest update as the previous return's "if" doesn't come up true as it reaches the end of the data
end

---	Gets all parent version strings of a certain update version
--	@function		getToCAllParents
--	@param			{string} parent Parent version (e.g. 0=Closed beta, 7=U7, 12=U12, etc.)
--	@return			{string} Wikitext
local function getToCAllParents(parent)
	local parents ={}
	local hash = {}
	local parentTemp = {}
	local result = ""
	for j, Version in pairs(VersionData["Versions"]) do
		if not hash[Version.Parent] then --if this Version.Parent isn't in table hash, then
			parentTemp = mw.text.split(Version.Parent, ".", true) --splitting the Parent to a temp table
			if parent == parentTemp[1] then --comparing the function input(parent) and the temp table's first string
				parents[#parents+1] = Version.Parent --if true, add the current V.Parent to table parents at position 1+current lenght
				hash[Version.Parent] = true --add V.Parent to table "hash" and assign value "true" to the V.Parent to prevent duplicate entries in table "parents"
			end
		end
	end
	return parents
end

---	Creates all lines for table of contents.
--	@function		p.getToCLines
--	@param			{table} frame
--	@return			{string} Wikitext of the table of contents
function p.getToCLines(frame)
	local parent = frame.args ~= nil and frame.args[1] or frame
	local result = ''
	local parents = getToCAllParents(parent)
	for i,v in pairs(parents) do
		result = result..getToCLine(v)
		if i < #parents then
			result = result.."<br>"
		end
	end
	assert(result ~= '', 'p.getToCLines(frame): Parent version "'..parent..'" is not a valid version')
	return result
end

---	Lists all versions of the game.
--	@function		p.getAllVersions
--	@param			{table} frame
--	@return			{string} Wikitext of version list
function p.getAllVersions(frame)
	local result = {}
	for i, v in pairs(VersionData["Versions"]) do
		table.insert('*'..p.getVersionLink(v.Name))
	end
	return table.concat(result, '\n')
end

---	Returns the latest version of the game.
--	@function		p.lastVersion
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of version
function p.lastVersion(frame)
	local color = frame.args["color"]
	local latestUpdate = VersionData["LatestVersion"]
	if color ~= nil then
		return '[['..latestUpdate.Link..'|<span style="color:'..color..';">'..latestUpdate.Name..'</span>]]'
	end
	return '[['..latestUpdate.Link..'|'..latestUpdate.Name..']]'..' ('..latestUpdate.Date..')'
end

---	Returns full wikitable of WARFRAME builds.
--	@function		p.fullVersionList
--	@param			{table} frame Frame object
--	@return			{string} Wikitext of resultant wikitable
function p.fullVersionList(frame)
	local result = { [[{| class="wikitable sortable stickyHeader autosort=7,d"
|-
! Version Name !! Parent Version !! Short Name !! Subtitle !! Aliases !! Is Mainline?
! Release Date !! Forum Link !! Forum Post Unix Timestamp !! Archive Link !! Archive Date
|-
]]
	}
	
	local resultRow = [=[| [[%s|%s]] || %s || %s || %s || %s || %s
| %s || %s || %s || %s || %s
|-	
]=]
	
	for _, version in pairs(VersionData.Versions) do
		local isMainline = version.Name:find('Update') and '✔️' or '❌'
		table.insert(result, resultRow:format(
				version.Link, version.Name, version.Parent, version.ShortName, version.Subtitle or '', 
				version.Aliases and table.concat(version.Aliases, ', ') or '', isMainline,
				version.Date, version.ForumLink, version.Timestamp, version.ArchiveLink, version.ArchiveDate
			)
		)
	end
	
	return table.concat(result, '')..'|}'
end

return p
