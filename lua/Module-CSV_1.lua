---	cerial.lua
--	
--	Copyright 2018 wesley werner <[email&#160;protected]>
--	This program is free software: you can redistribute it and/or modify
--	it under the terms of the GNU General Public License as published by
--	the Free Software Foundation, either version 3 of the License, or
--	any later version.
--	This program is distributed in the hope that it will be useful,
--	but WITHOUT ANY WARRANTY; without even the implied warranty of
--	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--	GNU General Public License for more details.
--	You should have received a copy of the GNU General Public License
--	along with this program. If not, see http://www.gnu.org/licenses/.
--	Serialize a Lua table into a CSV-like string.
--	Handles standard types and circular table references.
--	Does not serialize user data, functions or up-values.
--	
--	Usage:
--	* local cerial = require("Module:CSV")
--	* local cerialstring = cerial.encode(table)
--	* local reconstructed = cerial.decode(cerialstring)
--	
--	Performance vs pickle over 10000 encodes
--	* cerial:
--	** serialized to 365 bytes
--	** real	0m0.854s
--	** user	0m0.852s
--	** sys	0m0.000s
--	* pickle:
--	** serialized to 463 bytes
--	** real	0m0.740s
--	** user	0m0.740s
--	** sys	0m0.004s
--	
--	Modified from original: https://gist.github.com/wesleywerner/3f1e3a64079d81511084925c465eb34d
--	
--	@module		csv
--	@alias		cerial
--	@author		[https://gist.github.com/wesleywerner wesleywerner]
--	@release	stable
--	

local cerial = { }
local tablerefs = { }
local sortedrefs = { }

function string.starts(String, Start)
	return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String, End)
	return End=='' or string.sub(String,-string.len(End))==End
end

local function escapeCSV(s)
	if string.find(s, '[,"]') then
		s = '"' .. string.gsub(s, '"', '""') .. '"'
	end
	return s
end

local function fromCSV(s)
	s = s .. ','		-- ending comma
	local t = {}		-- table to collect fields
	local fieldstart = 1

	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(s, '^"', fieldstart) then
			local a, c
			local i  = fieldstart
			repeat
				-- find closing quote
				a, i, c = string.find(s, '"("?)', i+1)
			until c ~= '"'	-- quote not followed by quote?
			if not i then error('unmatched "') end
			local f = string.sub(s, fieldstart+1, i-1)
			table.insert(t, (string.gsub(f, '""', '"')))
			fieldstart = string.find(s, ',', i) + 1
		else
			-- unquoted; find next comma
			local nexti = string.find(s, ',', fieldstart)
			table.insert(t, string.sub(s, fieldstart, nexti-1))
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(s)

	-- remove blanks
	for n, l in ipairs(t) do
		if l:len() == 0 then
			table.remove(t, n)
		end
	end

  return t

end

function cerial.encode(target)

	tablerefs = { }
	sortedrefs = { }
	cerial.getRefs(target)
	local headers = cerial.headers()
	local details = cerial.details()
	return headers .. details

end

function cerial.decode(target)

	function splitlines(str)
		local t = {}
		local function helper(line)
			table.insert(t, line)
			return ""
		end
		helper((str:gsub("(.-)\r?\n", helper)))
		return t
	end

	local lines = splitlines(target)

	decodedrefs = { }
	local headers = { }

	for lineno, line in ipairs(lines) do

		-- split csv
		local fields = fromCSV(line)

		-- first field is record indicator
		local refno = tonumber(fields[1])

		-- build tables and headers
		for fieldno, fieldvalue in ipairs(fields) do

			-- build column names
			if refno == 0 then

				if fieldno == 1 then
					-- create a table reference
					table.insert(decodedrefs, { })
					table.insert(headers, { })
				else
					-- record column name
					table.insert(headers[#headers], fieldvalue)
				end

			end

		end

		-- process columns
		for fieldno, fieldvalue in ipairs(fields) do

			-- build column names
			if refno > 0 and fieldno > 1 then

				local columnname = headers[refno][fieldno - 1]

				-- assign field value
				local startref = string.starts(fieldvalue, "[")
				local endref = string.ends(fieldvalue, "]")

				-- use column index if a number, the name otherwise
				local parsedname = tonumber(columnname) or columnname

				if startref and endref then
					local subrefno = tonumber(fieldvalue:sub(2, -2))
					decodedrefs[refno][parsedname] = decodedrefs[subrefno]
					--print("link",parsedname,decodedrefs[subrefno], subrefno)
				else
					-- parse value as number
					local parsedvalue = tonumber(fieldvalue) or fieldvalue
					decodedrefs[refno][parsedname] = parsedvalue
				end

			end

		end

	end

	return decodedrefs[1]

end

function cerial.headers()

	local lines = { }

	-- headers
	for n, ref in ipairs(sortedrefs) do

		local items = { "00" }

		for k, v in pairs(ref) do
			table.insert(items, k)
		end

		table.insert(lines, table.concat(items, ","))

	end

	return table.concat(lines, "\n").."\n"

end

function cerial.details()

	local lines = { }

	for n, ref in ipairs(sortedrefs) do

		local refno = tablerefs[ref]
		local items = { string.format("%.2d", refno) }

		for k, v in pairs(ref) do
			local subref = tablerefs[v]
			if subref then
				table.insert(items, string.format("[%.2d]", subref))
			else
				table.insert(items, escapeCSV(tostring(v)))
			end
		end

		table.insert(lines, table.concat(items, ","))

	end

	return table.concat(lines, "\n").."\n"

end

function cerial.getRefs(target)

	local counter = 1
	local complete = false

	tablerefs[target] = counter
	counter = counter + 1

	-- root references
	for k, v in pairs(target) do
		if type(v) == "table" then
			if not tablerefs[v] then
				tablerefs[v] = counter
				counter = counter + 1
			end
		end
	end

	-- subtable references
	while not complete do
		complete = true
		for rv, rk in pairs(tablerefs) do
			for k, v in pairs(rv) do
				if type(v) == "table" then
					if not tablerefs[v] then
						complete = false
						tablerefs[v] = counter
						counter = counter + 1
					end
				end
			end
		end
	end

	-- sorted ref list
	for v, k in pairs(tablerefs) do
		sortedrefs[k] = v
	end

end

return cerial
