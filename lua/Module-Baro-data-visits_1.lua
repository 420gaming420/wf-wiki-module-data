-- Indexing Baro offerings data by visit
-- TODO: Apparently Orokin Catalysts are not offered by Baro during TennoCon visits so update 
-- the module to exclude this from TennoCon visits.
local PcBaroVisitsData = {}
-- Note that Baro visits started before Nintendo Switch build was released (November 12, 2018)
-- Also console visits are four weeks behind
local ConsoleBaroVisitsData = {}
local TennoConBaroVisitsData = {}

local Lang = mw.language.new('en')	-- Using for parsing dates
local BaroData = mw.loadData('Module:Baro/data')['Items']

local TENNOCON_DATES = { '2018-07-07', '2019-07-06', '2020-07-11', '2020-08-01', '2021-07-17', '2022-07-16' }
local INAROS_QUEST_PC_INTRO = Lang:formatDate('U', '2016-03-04')
local INAROS_QUEST_CONSOLE_INTRO = Lang:formatDate('U', '2016-04-07')
local FAE_EPHEMERA_INTRO = Lang:formatDate('U', '2020-01-31')	-- Only available on console

for itemName, itemData in pairs(BaroData) do
	for _, date in pairs(itemData['PcOfferingDates'] or {}) do
		if (PcBaroVisitsData[date] == nil) then
			PcBaroVisitsData[date] = {}
		end
		-- Storing data as keys mapped to a dummy value to ensure
		-- that entries are not duplicated and for data to be organized in
		-- ascending order when processed table contents are dumped onto /doc
		PcBaroVisitsData[date][itemName] = true
	end
	for _, date in pairs(itemData['ConsoleOfferingDates'] or {}) do
		if (ConsoleBaroVisitsData[date] == nil) then
			ConsoleBaroVisitsData[date] = {}
		end
		ConsoleBaroVisitsData[date][itemName] = true
	end
end

-- Adding evergreen offerings
-- On release of U18.5, Baro was made available outside his usual visit for one
-- week to sell only the Sands of Inaros quest blueprint so players can get Inaros
-- on his release
PcBaroVisitsData['2016-03-04'] = { ['Sands of Inaros Blueprint'] = true }
for date, offeringTable in pairs(PcBaroVisitsData) do
	if (Lang:formatDate('U', date) >= INAROS_QUEST_PC_INTRO) then
		offeringTable['Sands of Inaros Blueprint'] = true
	end
end

for date, offeringTable in pairs(ConsoleBaroVisitsData) do
	local unixTime = Lang:formatDate('U', date)
	if (unixTime >= INAROS_QUEST_CONSOLE_INTRO) then
		offeringTable['Sands of Inaros Blueprint'] = true
	end
	if (unixTime >= FAE_EPHEMERA_INTRO) then
		offeringTable['Fae Path Ephemera'] = true
	end
end

for _, tennoconDate in pairs(TENNOCON_DATES) do
	TennoConBaroVisitsData[tennoconDate] = {}
	local unixTime = Lang:formatDate('U', tennoconDate)
	for date, offeringTable in pairs(PcBaroVisitsData) do
		-- Every TennoCon, Baro brings in all offerings he has sold before that
		-- TennoCon date
		if (Lang:formatDate('U', date) < unixTime) then
			for itemName, _ in pairs(offeringTable) do
				TennoConBaroVisitsData[tennoconDate][itemName] = true	
			end
		end
	end
end

return {
	ConsoleBaroVisits = ConsoleBaroVisitsData,
	PcBaroVisits = PcBaroVisitsData,
	TennoConBaroVisits = TennoConBaroVisitsData
}
