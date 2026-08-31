---	'''DependencyGraph''' outputs a module dependency graph of this wiki's modules
--	using the [[wikipedia:DOT (graph description language)|DOT language]].<br /> 
--	
--	Requires [[community:Help:DynamicPageList|Extension:DynamicPageList]] enabled on your wiki.
--	
--	Recommended layout algorithms for rendering resultant DOT file:
--	* <code>fdp</code>/<code>sfdp</code> - useful for viewing entire codebase w/ clustering of module families
--	* <code>circo</code> - circular layout, useful for finding modules/submodules with the fewest dependencies
--	
--	See https://www.rdocumentation.org/packages/Rgraphviz/versions/2.16.0/topics/GraphvizLayouts
--	for more details on these layout algorithms.
--	
--	@module		dependencygraph
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		EN WARFRAME Wiki Dependency Graph.png
--	@require	[[Module:Table]]
--	@release	beta
--	

-- TODO: Module names inside documentation is being treated as dependencies even though
-- they may not be actual dependencies. Somehow get the strings within mw.loadData() and require()
-- functions instead to use as a module's actual dependencies. Note on limitations of Lua patterns.

-- @todo Explore way to output to GraphML format or convert DOT to GraphML to import into yED Graph Editor
local p = {}
-- TODO: If porting this module to the Dev wiki for global use, remove this import and directly implement
-- any used functions here
local Table = require('Module:Table')
local MODULE_LOCALIZATION = mw.site.namespaces[828].name
local MODULE_NAME_PATTERN = MODULE_LOCALIZATION..':[%a%d. /]+'
local DEV_MODULE_NAME_PATTERN = 'Dev:[%w /]+'
-- Capturing all possible characters that can be in a import function call,
-- includes possible characters in Module page name as well as Lua tokens
local POSSIBLE_CHAR_PATTERN = '[%w%[%]()\'" :/.=]+'
-- TODO: There are still false positives with require() and mw.loadData() statements that
-- are commented out
local IMPORT_STATEMENT_PATTERNS = { 'require'..POSSIBLE_CHAR_PATTERN, 'mw.loadData'..POSSIBLE_CHAR_PATTERN }
local DEV_WIKI_URL = 'https://dev.fandom.com/wiki/'

--- Denotes whether or not clustering of nodes will occur
--	@member			{boolean} p.enableClusters
p.enableClusters = false	-- By default, clustering of submodules with their main modules is disabled

--- Returns a set of this wiki's module pages.
--	@function		getModuleSet
--	@param			{string} dplResult HTML of result returned by DPL parser function
--	@returns		{table} Set of module page names on this wiki
local function getModuleSet(dplResult)
	local moduleSet = {}
	for moduleName in mw.ustring.gmatch(dplResult, MODULE_NAME_PATTERN) do
		-- Ignoring documentation subpages
		if (string.find(moduleName, '/doc') == nil) then
			moduleSet[moduleName] = 0
		end
	end
	return moduleSet
end

--- Returns a table of each module's dependencies.
--	@function		getModuleDependencies
--	@param			{string} moduleSet Set of module page names on this wiki
--	@returns		{table} Map of modules and their dependencies inside a set
local function getModuleDependencies(moduleSet)
	local moduleDependencies = {}	-- mapping modules with their dependencies
	
	-- Initializing table entries
	for moduleName, _ in pairs(moduleSet) do
		-- Ignoring documentation subpages
		moduleDependencies[moduleName] = {}
	end
	
	-- Finding dependencies
	for moduleName, _ in Table.skpairs(moduleSet) do
		local moduleCode = mw.title.new(moduleName):getContent()
		assert(moduleCode ~= nil, '"'..moduleName..'" does not exist\n'..mw.dumpObject(moduleDependencies))
		-- Define a Lua module dependency as one that is imported using
		-- require() or mw.loadData() functions
		-- First, find all import statements in module code
		for _, importStatementPattern in ipairs(IMPORT_STATEMENT_PATTERNS) do
			for importStatement in mw.ustring.gmatch(moduleCode, importStatementPattern) do
				-- Second, extract the module names from import statements
				for dependency in mw.ustring.gmatch(importStatement, MODULE_NAME_PATTERN) do
					moduleDependencies[moduleName][dependency] = 0
				end
				-- For modules imported from Dev wiki
				for dependency in mw.ustring.gmatch(importStatement, DEV_MODULE_NAME_PATTERN) do
					moduleDependencies[moduleName][dependency] = 0
				end
			end
		end
	end
	return moduleDependencies
end

--- Builds a map of each main module's subpages.
--	@function		getModuleSubpageMap
--	@param			{table} moduleSet Set of modules on this wiki including submodules
--	@returns		{table} Map of main modules' root text to a table of the full names of their submodules (including main module)
local function getModuleSubpageMap(moduleSet)
	local subpageMap = {}
	for moduleName, _ in Table.skpairs(moduleSet) do
		local title = mw.title.new(moduleName)
		local rootText = title['rootText']
		if (subpageMap[rootText] == nil) then
			subpageMap[rootText] = {}
		end
		table.insert(subpageMap[rootText], moduleName)
	end
	return subpageMap
end

--- Builds a directed graph visualization in the form of a DOT file.
--	@function		buildDOTOutput
--	@param			{table} moduleDependencies Map of modules and their dependencies
--	@param			{table} subpageMap Map of main modules and their submodules
--	@returns		{string} DOT output
local function buildDOTOutput(moduleDependencies, subpageMap)
	local dotResult = { 'strict digraph G {' }
	local nodeTemplate = '\t"%s" [label="%s\\n# dep.: %d", URL&#61;"%s"]'
	
	-- Initializing nodes
	for moduleName, dependencies in Table.skpairs(moduleDependencies) do
		local canonicalUrl = tostring(mw.uri.canonicalUrl(moduleName))
		local dependencyCount = Table.size(dependencies)
		table.insert(dotResult, string.format(nodeTemplate, moduleName, moduleName, dependencyCount, canonicalUrl))
	end
	
	if (p.enableClusters) then
		-- Adding clusters based on root text (e.g. "Module:Weapons" and "Module:Weapons/data"
		-- will be in the same cluster since they both have "Weapons")
		for rootText, subpages in Table.skpairs(subpageMap) do
			local moduleSubpages = { '\tsubgraph "cluster_'..rootText..'" {' }
			for _, subpage in Table.skpairs(subpages) do
				table.insert(moduleSubpages, '"'..subpage..'"')
			end
			table.insert(moduleSubpages, '}')
			table.insert(dotResult, table.concat(moduleSubpages, ' '))
		end
	end
	
	-- Adding graph edges
	for moduleName, dependencies in Table.skpairs(moduleDependencies) do
		local graphEdges = { '\t"'..moduleName..'" -> {' }
		for dependency, _ in pairs(dependencies) do
			table.insert(graphEdges, '"'..dependency..'"')
			
			-- Adding additional nodes of modules from dev wiki as DPL will not 
			-- get them since they are not located on this wiki
			if (string.find(dependency, 'Dev:') ~= nil) then
				local canonicalUrl = DEV_WIKI_URL..string.gsub(dependency, 'Dev:', 'Module:')
				-- Dev modules have 0 dependencies from this wiki
				table.insert(dotResult, string.format(nodeTemplate, dependency, dependency, 0, canonicalUrl))
			end
		end
		table.insert(graphEdges, '}')
		table.insert(dotResult, table.concat(graphEdges, ' '))
	end
	
	table.insert(dotResult, '}')
	return table.concat(dotResult, '\n')
end

--- Entry point of program.
--	@function		p.main
--	@param			{table} frame Frame object
--	@returns		{string} Preformatted text of resultant DOT graph
function p.main(frame)
	-- Any argument assigned to "cluster" when module invoked will enable clustering
	p.enableClusters = (frame.args['cluster'] and true)
	-- TODO: Replace the below statement with call of Extension:DynamicPageListEngine's
	-- mw.ext.dpl.getPages() if extension is available on your wiki, ignore this 
	-- TODO otherwise
	local dplResult = mw.getCurrentFrame():preprocess('{{#dpl:|namespace='..MODULE_LOCALIZATION..'}}')
	local moduleSet = getModuleSet(dplResult)
	local subpageMap = getModuleSubpageMap(moduleSet)
	local moduleDependencies = getModuleDependencies(moduleSet)
	return '<pre>\n'..buildDOTOutput(moduleDependencies, subpageMap)..'\n</pre>'
end

return p
