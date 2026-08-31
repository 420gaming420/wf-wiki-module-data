local p = {}

local Table = require('Module:Table')
local Tooltip = require('Module:Tooltips')
local Lang = mw.language.new('en')	-- Using for parsing dates and number formatting
local BaroData = mw.loadData('Module:Baro/data')['Items']

---	Builds Baro's offering history wikitable as seen on [[Baro Ki'Teer/Trades]]
--	@function		p.buildOfferingHistoryTable
--	@param			{table} frame Frame object; first argument being platform ("PC" or "Consoles") and
--							the second being the year in which items were first being sold by Baro or "All"
--							for all years
--	@return			{string} Wikitext of resultant wikitable
function p.buildOfferingHistoryTable(frame)
	local platform = frame.args[1]
	local year = frame.args[2] or 
			error('p.buildOfferingHistoryTable(frame): Must have pass in a non-empty argument representing year in which items were first being sold by Baro or "All" for all years')
	
	local dateKey = nil
	if (platform == 'PC') then
		dateKey = 'PcOfferingDates'
	elseif (platform == 'Consoles') then
		dateKey = 'ConsoleOfferingDates'
	else
		error('p.buildOfferingHistoryTable(frame): Invalid first argument; valid arguments are "PC" or "Consoles"')
	end
	
	local result = { [=[
{| class="listtable sortable" style="width:100%;" align="center"
|-
!width="20%"|Item
!width="15%"|Type
!width="30%" data-sort-type="number"|Cost
!width="35%"|Date(s) Offered
|-]=] }
	
	for item, itemData in pairs(BaroData) do
		local platformSpecificOfferingDates = itemData[dateKey]-- table of date strings
		local sharedPlatformOfferingDates = itemData['OfferingDates']
		
		-- Nil check needed for edge cases where an item is always offered such as Fae Ephemera
		-- or Sands of Inaros blueprint or when an item is not yet released on consoles
		
		-- Note that we are comparing strings for years
		if (
				(platformSpecificOfferingDates ~= nil and Lang:formatDate('Y', platformSpecificOfferingDates[1]) == year) or
				-- platformSpecificOfferingDates nil check needed for cases where an 
				-- item was released prior to platform-parity and has also 
				-- appeared in Baro's offerings post-platform-parity
				-- (This assumes that PcOfferingDates and ConsoleOfferingDates collections
				-- will contain dates that are before OfferingDates'; in other words,
				-- assume that dates are in ascending order thus first element will be first date
				-- when an item was first sold by Baro)
				(sharedPlatformOfferingDates ~= nil and platformSpecificOfferingDates == nil and Lang:formatDate('Y', sharedPlatformOfferingDates[1]) == year) or
				year == 'All'
			) then
			local itemImageAndName = ('[[File:%s|150px|link=%s]]<br />[[%s|%s]]')
					:format(itemData.Image, itemData.Link, itemData.Link, itemData.Name)
			local itemType = itemData.Type
			
			-- Note that not all items have a Ducat price tag attached
			local itemCost = Tooltip.icon('Credits', 'Resources')..Lang:formatNum(itemData.CreditCost)..
					(itemData.DucatCost and ' + '..Tooltip.icon('Orokin Ducats', 'Resources')..Lang:formatNum(itemData.DucatCost) or '')
			
			local itemDates = {}
			for _, date in ipairs(platformSpecificOfferingDates or {}) do
				table.insert(itemDates, Lang:formatDate('Y-m-d', date).. ' ('..platform..' only)')
			end
			for _, date in ipairs(sharedPlatformOfferingDates or {}) do
				table.insert(itemDates, Lang:formatDate('Y-m-d', date))
			end
			
			-- Sort date strings in ascending alphanumerical order after combining pre-parity and post-parity date offerings
			itemDates = table.concat(Table.sort(itemDates, function(a, b) return a < b end), '<br />')
			
			--[=[ Sample offering history table row	
			|[[File:PrimedContinuity.png|150px|link=Primed Continuity]]<br />[[Primed Continuity]]
			|Mod (Primed)
			|{{cc|100,000}} + {{dc|350}}
			|2014, December 12<br />2015, February 20<br />2015, November 27<br />2019, October 25<br />2020, February 28<br />2020, July 31<br />2021, February 12<br />2021, August 27
			|-
			]=]--
			
			table.insert(result, ([=[
|%s
|%s
|%s
|%s
|-]=]):format(itemImageAndName, itemType, itemCost, itemDates) )
		end
	end
	
	table.insert(result, '|}')
	return frame:preprocess(table.concat(result, '\n'))
end

return p
