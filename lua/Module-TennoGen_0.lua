--- '''TennoGen''' stores [[TennoGen]] cosmetics information.<br/>
--	
--	On this Wiki, TennoGen is used in: 
--	* [[Module:Gallery]]
--	* [https://wiki.warframe.com/w/Special:WhatLinksHere?hidelinks=1&target=Module%3ATennoGen&namespace=0 Pages that `&#123;{#invokes:}}` this module]
--	
--	@module		tennogen
--	@alias		p
--	@author		
--	@image		Tennogenlogo.png
--	@require	[[Module:Table]]
--  @require    [[Module:Cosmetics/data/signa]]
--	@require	[[Module:TennoGen/data]]
--	@release	stable
--	

local p = {}
local Table = require [[Module:Table]]
local TennoGenData = mw.loadData [[Module:TennoGen/data]]
local SyandanaData = mw.loadData [[Module:Cosmetics/data/syandana]]
local SignaData = mw.loadData [[Module:Cosmetics/data/signa]]
local FacialAccessoryData = mw.loadData [[Module:Cosmetics/data/facialaccessory]]

-- List every data source you want the gallery to pull from here
local dataSources = {
	TennoGenData,
	SyandanaData,
	SignaData,
	FacialAccessoryData
}

---	Builds a gallery for a specific TennoGen cosmetic type.
--	@function		p.buildTennoGenGallery
--	@param			{string} cosmeticType Cosmetic type
--	@return			{string} Gallery of a specific cosmetic type in wikitext
function p.buildTennoGenGallery(frame)
	local cosmeticType = frame.args[1]
	local gallery = '<gallery captionposition="below" captionalign="center" hideaddbutton="true" spacing="small" position="center" bordersize="none">'
	local galleryTable = {}
	
	-- For more advanced formatting when parsing through values
	local func = {
		getArtists = (function(Entry)
			if Entry.Artists == nil or Entry.Artists[1] == nil then
				return "??"
			end
			local artists = ""
			for _, artistName in ipairs(Entry.Artists) do
				artists = artists .. artistName .. " and "
			end
			-- Removing extra " and "
			return string.sub(artists, 1, #artists - 5)
		end),
		getRound = (function(Entry)
			if Entry.Round == "Polycount" or Entry.Round == "Weapons Skin Contest" then
				return Entry.Round
			else
				return "Round " .. Entry.Round
			end
		end),
		getPcPrice = (function(Entry) 
			if string.find(Entry.PcPrice, "%$") == nil then
				return "{{pc|" .. Entry.PcPrice .. "}}"
			else
				return "'''" .. Entry.PcPrice .. "'''"
			end
		end),
		getConsolePrice = (function(Entry)
			if Entry.ConsolePrice == "N/A" or Entry.ConsolePrice == nil then
				return "N/A"
			else
				return "{{pc|" .. Entry.ConsolePrice .. "}}"
			end
		end)
	}
	
	for _, DataSource in ipairs(dataSources) do
		for name, Entry in Table.skpairs(DataSource) do
			if Entry.Type == cosmeticType then
				-- Inserting table data in the order that they appear in a gallery entry
				table.insert(galleryTable, ("%s|link=%s|'''[[%s]]'''<br>Designed by %s<br>'''%s'''<br>%s ''(PC)''<br>%s ''(Console)''"):format(
					Entry.Image,
					name,
					Entry.Link,
					func.getArtists(Entry),
					func.getRound(Entry),
					func.getPcPrice(Entry),
					func.getConsolePrice(Entry)
				))
			end
		end
	end
	
	gallery = gallery .. table.concat(galleryTable, "\n") .. "\n</gallery>"
	return frame:preprocess(gallery)
end
return p
