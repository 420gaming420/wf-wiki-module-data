--	
local VehicleData = mw.loadData([[Module:Vehicles/data]])

local Math = require([[Module:Math]])
local Tooltip = require([[Module:Tooltips]])
local Version = require([[Module:Version]])
local InfoboxBuilder = require([[Module:InfoboxBuilder]])
local Table = require([[Module:Table]])
local Lang = mw.language.new('en')	-- Using for number formatting

local function override(arg)
	return arg and arg..'[[Category:InfoboxOverride]]'
end

	--TODO: "Usable Areas" table (line 80) also needs to include planets, missionNames and tileSets, but idk how to include all those in one without excluding any of the others

return {
buildInfobox = function(frame)
	local args = frame.args
	local name = args['Name']
	local vehicle = nil
	
	vehicle = VehicleData.Vehicles[name]
	
	assert(vehicle ~= nil, 'p.buildInfobox(frame): Missing "'..name..'" entry in [[Module:Vehicles/data]]')
	
	local SmallPortrait = ''
	if vehicle['SmallPortrait'] ~= nil then
		SmallPortrait = '[[File:'..vehicle['SmallPortrait']..'|x40px]] '
	end
	
	local planets, tileSets, missionNames, missions = {}, {}, {}, {}
	
	for _, planet in ipairs(vehicle.Planets or {}) do
		table.insert(planets, '[['..planet..']]')
	end
	for _, tileSet in ipairs(vehicle.TileSets or {}) do
		table.insert(tileSets, '[['..tileSet..']]')
	end
	for _, mission in ipairs(vehicle.Missions or {}) do
		table.insert(missions, '[['..mission..']]')
	end
	table.sort(planets)
	table.sort(tileSets)
	table.sort(missions)
	
	local vehicleArmor = vehicle.Armor or 'Inherited from rider'

	local vehicleEnergy = vehicle.Energy or 'Inherited from rider'
	
	local vehicleHealth = vehicle.Health or 'Inherited from rider'

	local vehicleShield = vehicle.Shield or 'Inherited from rider'

	local Infobox = InfoboxBuilder('WARFRAME Wiki:L10n/general.json', 'WARFRAME Wiki:L10n/warframes.json', 'WARFRAME Wiki:L10n/meta.json')
		:title(name..'[[Category:'..name..']][[Category:Vehicles]]')
		:image(vehicle.Image or 'UnidentifiedItem.png')
		:group()
			:caption('CodexSecret', vehicle.CodexSecret and '[[Codex|%s]][[Category:Codex Secret]]' or nil, 'codex-secret')
			:caption('UpdateInfoboxData', '[[Module:vehicles/data|📝 %s]]', 'update-infobox-data')
		:done()
		
		:group():header('%s', 'description')
			:caption('Description', vehicle.Description and vehicle.Description)
		:done()

		:group():header('Usable Areas', 'usable-areas')
			:row('Areas', '[[Mission|Areas]]', (missions and missions[1]) and table.concat(missions, ', '))
		:done()
		
		if vehicle.Abilities and vehicle.Abilities[1] then
		Infobox=Infobox:group():header('%s', 'abilities')
			:row('Ability1', '%s', vehicle.Abilities[1] and Tooltip.full(vehicle.Abilities[1], 'Ability'), 'first-ability')
			:row('Ability2', '%s', vehicle.Abilities[2] and Tooltip.full(vehicle.Abilities[2], 'Ability'), 'second-ability')
			:row('Ability3', '%s', vehicle.Abilities[3] and Tooltip.full(vehicle.Abilities[3], 'Ability'), 'third-ability')
			:row('Ability4', '%s', vehicle.Abilities[4] and Tooltip.full(vehicle.Abilities[4], 'Ability'), 'fourth-ability')
		:done() 
		else 
		Infobox=Infobox:group():header('%s', 'abilities')
			:row('Abilities', '%s', 'None', 'abilities')
		:done() 
		end Infobox=Infobox
		
		:group():header('%s', 'general-information')
			:row('Custom Variants', '{{text||Custom Variants|hover=If the Vehicle has custom buildable variants with potentially different stats.|cursor=help}}', vehicle.HasCustomVariants and 'Yes' or 'No', 'custom-variants')
			:row('Moddable', '{{text||Moddable|hover=If the Vehicle is able to be equipped with mods.|cursor=help}}', vehicle.IsModdable and 'Yes' or 'No', 'moddable')
			:row('Health', '[[Health|%s]]', vehicleHealth, 'health')
			:row('Shield', '[[Shield|%s]]', vehicleShield, 'shields')
			:row('Armor', '[[Armor|%s]]', vehicleArmor, 'armor')
			:row('Energy', '[[Energy Capacity|%s]]', vehicleEnergy, 'energy')
			:row('Speed', '[[Sprint Speed|Speed]]', vehicle.Speed and ''..(Lang:formatNum(vehicle.Speed))..' m/s', 'speed')
			:row('Boost Speed', '{{text||Boost Speed|hover=Speed when sprinting/boosting.|cursor=help}}', vehicle.Boost and ''..(Lang:formatNum(vehicle.Boost))..' m/s', 'boost-speed')
			:row('Introduced', '%s', vehicle.Introduced and Version._getVersionLink(vehicle.Introduced)..Version._getVersionCategory(vehicle.Introduced), 'introduced')
		:done()
		
		:group():header('Summoning', 'summoning')
			:row('Summoning Abilities', '[[Abilities|Summoning Abilities]]', vehicle.SummonAbility[1] and '{{A|'..(vehicle.SummonAbility[1])..'}}', 'summoning-abilities')
			:row('Summoning Gear Items', '[[Equipment#Gear|Summoning Gear Items]]', vehicle.SummonGear[1] and '{{Gear|'..(vehicle.SummonGear[1])..'}}', 'summoning-gear-items')
		:done()

	return frame:preprocess(tostring(Infobox))
end
}
