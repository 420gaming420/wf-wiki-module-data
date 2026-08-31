local StatObject = require('Module:StatObject')

StatObject.default = {
	-- Getter functions:
	-- Arrays of default values and format strings
	key = { 'Default Value', '%.2f format' },
    
	-- Can generate values/formatting with functions
	-- 'val, ...' is the return from map[1]
	key = { function(obj) end, function(self, val, ...) end },
    
	-- If format is a table the return values will be passed to each function/format string
	-- in the same order they are returned (nil is a pass-through)
	key = {
		function(obj) return a, b, c, d end,
		{ function(self, val) return val end, '%s', nil, '%d', sep = '' }
	},
    
	-- Can omit second entry, can omit table
	key = 'Default Value',
    
	-- nil means default get (same as omitting)
	key = nil,
    
    -- Add additional key-value pairs below to define raw getters and format getter functions for data
    -- To use the getters use StatObject.statRead(dataEntry, key) and StatObject.statFormat(dataEntry, key)
}

local ModData = mw.loadData('Module:Mods/data')		-- Importing sample database

StatObject.statRead(ModData['Serration'], 'Name')	-- Example of getting the raw Name value of Serration mod entry
StatObject.statFormat(ModData['Serration'], 'Name')	-- Example of getting the formatted Name value of Serration mod entry
-- Can also use StatObject.default to define computed/derived fields from raw data
