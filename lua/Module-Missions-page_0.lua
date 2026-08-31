---	'''Missions/page''' builds the mission pages.
--
--	@module		Missions
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		
--	@require	[[Module:Missions/infobox]]
--	@require	[[Module:Missions/data]]
--	@require	[[Module:DropTables]]
--	@release	stable
--	
local MissionInfobox = require([[Module:Missions/infobox]])
local MissionData = mw.loadData([[Module:Missions/data]])
local MissionTypesData = MissionData["MissionTypes"]
local DropTable = require([[Module:DropTables]])

return {
---	Builds mission node page.
--	@function		p.buildMissionPage
--	@param			{table} frame Frame object
--	@return			{string} Wikitext result of page
buildMissionPage = function(frame)
	local infobox = MissionInfobox.buildInfobox(frame)
	
	local name = mw.text.decode(frame.args["Name"])
	local missionEntry = MissionData.by.Name[name][1]
	frame.args[1] = missionEntry.DropTableAlias
	
	-- Rare instance of using protected call b/c some missions don't have reward table associated
	-- asserts are in upstream functions to catch missing reward table entries or misnamed reward table aliases
	local success1, rewardTable = pcall(DropTable.getRewardTable, frame)
	local success2, relatedMissionsWithSameRewards = pcall(DropTable.getMissionList, frame)
	
	frame.args[1] = missionEntry.ExtraDropTableAlias
	local success3, extraRewardTable = pcall(DropTable.getRewardTable, frame)
	
	frame.args[1] = missionEntry.CacheDropTableAlias
	local success4, cacheRewardTable = pcall(DropTable.getRewardTable, frame)
	
	local pageTemplate = [=[
%s
'''%s''' is %s [[%s|%s]] [[Mission]] node on [[%s]].
__TOC__
==Mission Rewards==
%s
===Similar Missions With Same Reward Pool===
%s

==Extra End-Of-Mission Reward==
%s

==[[Resource Cache]] Rewards==
%s

==Mission Transmissions==
See [[%s]].]=]

	return pageTemplate:format(
			infobox, 
			name, missionEntry.Type:match'^[AEIOUaeiou]' and 'an' or 'a', MissionTypesData[missionEntry.Type].Link, missionEntry.Type, missionEntry.Planet,
			success1 and rewardTable or 'No end-of-mission or rotation reward table associated.',
			success2 and relatedMissionsWithSameRewards or 'N/A',
			success3 and extraRewardTable or 'No extra end-of-mission reward associated.',
			success4 and cacheRewardTable or 'No [[Resource Cache]] reward table associated.',
			missionEntry.Quotes and missionEntry.Quotes or 'No mission transmissions associated.'
		)
end
}
