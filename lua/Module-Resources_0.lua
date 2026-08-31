---	'''Resources''' contains all of [[WARFRAME]]'s [[Resources]] data.<br />
--	
--	@module		resources
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		Resource_Orange.png
--	@release	stable
--	

local ResourceData = mw.loadData('Module:Resources/data')

local p = {}

--- attempt of {{ResourceNav}}
function p.Nav(frame)
	local arrangement={
		{'Starchart', 'Empyrean', 'Miscellaneous', 'Plains of Eidolon', 'Orb Vallis', 'Cambion Drift', 'Zariman'},
		Starchart={
			{'Common','Uncommon','Rare','Research','Navigation','Special'},
			Common={},
			Uncommon={},
			Rare={},
			Research={},
			Navigation={},
			Special={},
		},
		Empyrean={
			{'Common','Uncommon','Rare','Special'},
			Common={},
			Uncommon={},
			Rare={},
			Special={},
		},
		Miscellaneous={
			{'Quests','Plants','Events',link=true,head=true},
			Quests={},
			Plants={},
			Events={},
		},
		['Plains of Eidolon']={
			{'','Mining','Fishing',link=true,head=true},
			['']={
				{'Common','Uncommon','Rare','[[Sentient]]','[[Narmer]]','Event'},
				Common={},
				Uncommon={},
				Rare={},
				['[[Sentient]]']={},
				['[[Narmer]]']={},
				Event={},
			},
			Mining={
				{'Metals\n(Red Veins)','Gems\n(Blue Veins)'},
				['Metals\n(Red Veins)']={},
				['Gems\n(Blue Veins)']={},
			},
			Fishing={
				{'Spoils','Parts','Junk'},
				['Spoils']={},
				['Parts']={},
				['Junk']={},
			},
		},
		['Orb Vallis']={
			{'','Mining','Fishing',link=true,head=true},
			['']={
				{'Common','Bonds','Systems','[[Toroid]]','[[Narmer]]','Event'},
				Common={},
				Bonds={},
				Systems={},
				['[[Toroid]]']={},
				['[[Narmer]]']={},
				Event={},
			},
			Mining={
				{'Ores\n(Red Veins)','Gems\n(Blue Veins)'},
				['Ores\n(Red Veins)']={},
				['Gems\n(Blue Veins)']={},
			},
			Fishing={
				{'Spoils','Parts','Junk'},
				['Spoils']={},
				['Parts']={},
				['Junk']={},
			},
		},
		['Cambion Drift']={
			{'','Mining','Fishing',link=true,head=true},
			['']={
				{'Common','Rare','Residue','[[Tokens]]','[[Orokin Matrix]]','[[Necramech]]'},
				Common={},
				Rare={},
				Residue={},
				['[[Tokens]]']={},
				['[[Orokin Matrix]]']={},
				['[[Necramech]]']={},
			},
			Mining={
				{'Minerals\n(Yellow Lesions)','Gems\n(Blue Lesions)'},
				['Minerals\n(Yellow Lesions)']={},
				['Gems\n(Blue Lesions)']={},
			},
			Fishing={
				{'Spoils','Parts'},
				['Spoils']={},
				['Parts']={},
			},
		},
		Zariman={
			{'Common','Uncommon','Rare','[[Voidplume]]','Temporary'},
			Common={},
			Uncommon={},
			Rare={},
			['[[Voidplume]]']={},
			Temporary={},
		},
	}
end

return p
