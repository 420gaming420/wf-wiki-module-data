---	'''Database''' contains helper methods for creating and maintaining <code>/data</code>
--	subpages on the wiki that act as databases.
--	
--	For convention, we will use MongoDB's terminology for NoSQL-like databases and
--	mapping them to wiki equilvalents:
--	* Database - a <code>/data</code> subpage containing data in the form of Lua tables
--	* Collection - a Lua table that contains data entries of a similar category
--	* Document - a Lua table entry, the basic unit of data
--	
--	A database can have multiple collections and a collection can have multiple documents.
--	Likewise, a <code>/data</code> subpage can have multiple Lua tables that can have multiple data entries.
--	
--	In most cases, when viewing <code>/data</code> contents as a tree structure, 
--	a "database" refers to the Level 1 (root) table, a "collection" refers to Level 2 table(s),
--	and a "document" refers to any tables from Level 3 and beyond (nested table entries).
--	
--	For example:
--	` return {
--		["Collection 1 Name"] = {
--			["Document 1 Index"] = {
--				SomeKey = 1,
--				AnotherKey = { "Some Data" }
--			},
--			["Document 2 Index"] = {
--				SomeKey = 2,
--				AnotherKey = { "More Data" }
--			}
--		},
--		["Collection 2 Name"] = {
--			["Document 3 Index"] = {
--				SomeKey = 3,
--				DifferentKey = true
--			}
--		}
--	}`
--	
--	@module			database
--	@alias			p
--	@author			[[User:Cephalon Scientia]]
--	@attribution	
--	@require		
--	@release		beta
--	

local p = {}

-- TODO: Could honestly just be used to update metatables of database tables (__index metamethod) but the issue is that
-- would require all mw.loadData() calls be replaced with require(). Or make a new database class that contains these indexes
-- and instantiate database objects in all /data subpages

---	Adding an index key to table entries. Key to be indexed by must exist in all table entries and not have a nil value.
--	@function		p._createIndex
--	@param			{table} database A Lua table in a <code>/data</code> subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to; 
--											if collection does not exist, creates a new table in database
--	@param			{string} indexKey Key to be indexed by; must not be a key nested within a table value in a document
--	@return			{table} Updated database with new indexes
function p._createIndex(database, collectionNames, indexKey)
	assert(database ~= nil and collectionNames ~= nil and indexKey ~= nil, 
			'p.createIndex(database, collectionNames, indexKey): all arguments must not be nil')
	assert(type(database) == "table", 'p.createIndex(database, collectionNames, indexKey): database must be a table')
	assert(type(collectionNames) == "table", 'p.createIndex(database, collectionNames, indexKey): collectionNames must be a table')
	assert(type(indexKey) == "string", 'p.createIndex(database, collectionNames, indexKey): indexKey must be a string')
	
	for _, collectionName in ipairs(collectionNames) do
		if (database[collectionName] == nil) then
			database[collectionName] = {}
		end
		for _, document in ipairs(database[collectionName]) do
			local indexValue = document[indexKey]
			assert(indexValue ~= nil, 
					'p.createIndex(database, collectionNames, indexKey): "'..indexKey..'" key missing for '..mw.dumpObject(document))
			
			-- If index key contains an array-like table value, all table elements will be valid indexes
			-- to document
			for _, value in ipairs(type(indexValue) == 'table' and indexValue or { indexValue }) do
				database[collectionName][value] = document
			end
		end
	end
	return database
end

---	Adding another index key that maps InternalNames to table entries for
--	module use. Direct invokes from articles should index by localized name.
--	@function		p._indexByInternalName
--	@param			{table} database A Lua table in a <code>/data</code> subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to
--	@return			{table} Updated database with new indexes
function p._indexByInternalName(database, collectionNames)
	return p._createIndex(database, collectionNames, "InternalName")
end

---	Adding another index key that maps Names to table entries for
--	article use.
--	@function		p._indexByLocalizedName
--	@param			{table} database A Lua table in a <code>/data</code> subpage
--	@param			{table} collectionNames A table of collection names to only add new indexes to
--	@return			{table} Updated database with new indexes
function p._indexByLocalizedName(database, collectionNames)
	return p._createIndex(database, collectionNames, "Name")
end

return p
