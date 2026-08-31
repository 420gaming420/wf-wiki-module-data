---	'''Vendors''' stores offerings data from vendors and NPCs.<br />
--	
--	
--	@module		vendors
--	@alias		p
--	@author			[[User:Cephalon Scientia|Cephalon Scientia]]
--	@attribution	[[User:Falterfire|Falterfire]]
--	@attribution	[[User:Flaicher|Flaicher]]
--	@image			
--	@require		[[Module:Vendors/data]]
--	@require		[[Module:Tooltips]]
--	@release		stable
--	

--	in VendorData["Vendors"]["Vendor Name"].Offerings
local OFFERING_NAME_COL = 1	-- Name of the offering
local OFFERING_TYPE_COL = 2	-- Type of offering
local OFFERING_COST_COL = 3	-- The reputation cost for the offering
local OFFERING_QUANTITY_COL = 4	-- The item quantity in a single purchase

local p = {}

local VendorData = mw.loadData('Module:Vendors/data').Vendors
local Tooltip = require('Module:Tooltips')
local Lang = mw.language.getContentLanguage()

---	Builds lists of sources with vendors where an item can be purchased from.
--	Used in infobox builders such as [[Module:Mods/infobox]]
--	@function		p._buildVendorSourceStrings
--	@param			{string} name Name of item
--	@return			{string} List of vendor sources in wikitext
function p._buildVendorSourceStrings(name)
	local vendors, vendorList = {}, {}
	
	for _, vendorEntry in pairs(VendorData) do
		for _, offering in ipairs(vendorEntry.Offerings) do
			if offering[OFFERING_NAME_COL] == name then
				local rankReq = offering['Prereq']
				rankReq = vendorEntry['Ranks'] and
						'Rank '..rankReq..': '..vendorEntry['Ranks'][rankReq] or nil	-- Name of syndicate rank
				
				local quantity = offering[OFFERING_QUANTITY_COL] or 1
				
				local cost = offering[OFFERING_COST_COL]
				-- If there are multiple currencies required to purchase an item
				-- of if item uses a different currency than rest of vendor's offerings
				if (type(cost) == 'table') then
					local temp = {}
					for currencyName, amount in pairs(cost) do
						table.insert(temp, Tooltip.icon(currencyName, 'Resources')..' '..amount)
					end
					cost = table.concat(temp, ', ')
				else
					cost = Tooltip.icon(vendorEntry.Currency, 'Resources')..' '..cost
				end
				
				table.insert(vendors,
					{
						Name = vendorEntry.Name,
						Link = vendorEntry.Link,
						Cost = cost,
						Quantity = quantity,
						Rank = rankReq
					} )
				break	-- Can break early b/c we assume no vendor will sell the same item at different prices
			end
		end
	end

	table.sort(vendors, function(a, b)
			if a.Cost == b.Cost then return a.Name < b.Name end
			return a.Cost < b.Cost
		end)

	for _, vendor in ipairs(vendors) do
		table.insert(vendorList, ('[[%s|%s]]%s&nbsp;%s for x%s')
				:format(vendor.Link, vendor.Name, vendor.Rank and ' ('..vendor.Rank..')' or '', vendor.Cost, vendor.Quantity)
		)
	end
	
	return table.concat(vendorList, '<br />')
end

---	Builds a list of offerings sold by a particular NPC vendor. (Not stable and unfinished)
--	@function		p.offeringsList
--	@param			{table} frame Frame object with first argument being the name of vendor as stored in M:Vendors/data
--	@return			{string} Wikitext of resultant list
function p.offeringsList(frame)
	local vendorName = frame.args[1]
	
	-- TODO: May use T:SynOfferBox after custom mobile spreadsheets are available so these match
	-- desktop view's styling
	local parentDiv = '<gallery spacing="small">' -- '<div class="flex-container" style="justify-content: space-evenly;">'
	local offeringsList = { parentDiv }
	
	local vendor = VendorData[vendorName]
	local vendorOfferings = vendor.Offerings
	local vendorRanks = vendor.Ranks
	local primaryCurrency = vendor.Currency	-- Unused for now; will eventually move away from T:SynOfferBox
	
	for _, offering in pairs(vendorOfferings) do
		local name = offering[OFFERING_NAME_COL]
		local rankReq = offering['Prereq']
		rankReq = rankReq and 'Rank '..rankReq..': '..vendorRanks[rankReq] or ''
		
		-- TODO: Either standardize image file names so we can construct them from just item name
		-- or use M:Tooltips to pull the image name from the database corresponding to the item's item type
		-- TODO: May use T:SynOfferBox after custom mobile spreadsheets are available so these match
		-- desktop view's styling
		-- local offeringBox = string.format('{{SynOfferBox|%s.png|%s|%s|%s|%s|blueprint=%s}}', 
		-- 		name:gsub('%s+', ''),
		-- 		name,
		-- 		name,	-- Link to article
		-- 		offering[OFFERING_COST_COL],	-- Cost
		-- 		rankReq,
		-- 		(offering[OFFERING_TYPE_COL] == 'Blueprint') and 't' or ''
		-- 	)
		local offeringBox = string.format('%s.png|link=%s|[[%s|%s]]%s<br />%s<br />(%s)',
				name:gsub('%s+', ''),
				name,
				name,
				name,
				(offering[OFFERING_TYPE_COL] == 'Blueprint') and ' Blueprint' or '',
				Lang:formatNum(offering[OFFERING_COST_COL]),
				rankReq
			)
		table.insert(offeringsList, offeringBox)
	end
	
	table.insert(offeringsList, '</gallery>')-- '</div>')
	
	return frame:preprocess(table.concat(offeringsList, '\n'))
end

---	Builds a list of [[Varzia]] relics offerings for display on her page and on [[Aya]].
--	At the time of writing this function is merely an excuse to put Varzia's relics *somewhere* into Lua 
--	so that it can be queried later on the relic own page.
--
--	Ideally, this should handle all the offerings, but as the comment at the top of [[Module:Vendors/data]]
--	alludes, that is blocked on creating a sort of database for the offerings images. So maybe some other time.
--	@function	p.varziaOfferings
--	@param		{table} Frame object with no extra requirements
--	@return		{string} Wikitext of the resultant list
function p.varziaRelicOfferings(frame)
	local offerings = VendorData["Varzia"].Offerings
	-- Put them into temporary tables first for negligible performance gain
	local relics = {}
	for _, offer in ipairs(offerings) do
		if offer[OFFERING_TYPE_COL] == "Relic" then
			table.insert(relics, string.format("*{{Relic|%s}}", offer[OFFERING_NAME_COL]) )
		end
	end
	local out = table.concat(relics, "<br />\n")
	return frame:preprocess(out)
end

return p
