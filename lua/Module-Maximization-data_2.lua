local Tooltips = setmetatable({},{__index=function(self,fun) return function(...)
	local out = {}
	local n_i = 1
	local args; if select('#',...)==1 and type(...)=='table' then args=... else args={...} end
	for k, v in pairs(args) do
		if k == n_i then
			n_i=n_i+1
			table.insert(out, v)
		else
			table.insert(out, k..'='..v)
		end
	end
	return '{{#invoke:Tooltip|'..fun..'|'..table.concat(out, '|')..'}}'
end end})

--- takes multiple tables and returns a combined one, used to merge GenericIns with specific ability ins
local function merge(...) 
	local res = {};
	for _, ins in ipairs({...}) do
		for __, v in ipairs(ins) do
			table.insert(res, v);
		end
	end
	return res;
end 

local GenericIns = {
	ModdableMelee = {
		{name='MELEE_DMG_MOD', cont='[[Melee damage]] modifier:', type='number', default='100'},
		{name='ELEMENT_DMG_MOD', cont='[[Elemental damage]] modifier:', type='number', default='0'},
		{name='FACTION_DMG_MOD', cont='[[Faction damage]] modifier:', type='number', default='100'},
		{name='FINISHER_DMG_MOD', cont='[[Finisher damage]] modifier:', type='number', default='100'},
		{name='COMBO_MULT', cont='[[Combo multiplier]]:', type='range-R', min='1', max='12', value='1'},
	},
};

-- this contains mappings for what we couldn't pull from preexisting modules
local AbilitySets = {};

local Data = {
	AbilitySets = AbilitySets,
	-- Ash
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:<span style="display: none" data-name="HEAD_MULT" data-expr="HEAD_RATE 3 * 100 HEAD_RATE - + as%"></span>', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:' ,                                    {name='SHURIKEN_BASE_DMG', expr='STR 750 %of HEAD_MULT * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' DoT:', {name='BLEED', expr='43.75 35 ASH if SHURIKEN_BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * SHURIKEN_BASE_DMG +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:',                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TELEPORT_RUSH', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
			{name='SMOKE_SHADOW', cont=Tooltips.full('Smoke Shadow', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] kills:', {expr='DUR 5 %of TELEPORT_RUSH *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{'Critical Chance bonus:', {expr='150 0 SMOKE_SHADOW if', suff='%'}},
			{'Smoke Shadow duration:', {expr='DUR 12 %of 0 SMOKE_SHADOW if', suff='s'}},
			{'Smoke Shadow radius:', {expr='RNG 15 %of 0 SMOKE_SHADOW if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='35 COST *'}},
		}
	},
	['Teleport']={
		ins={
			{name='TELEPORT_RUSH', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{'[[Parkour Velocity]] bonus:', {expr='30 0 TELEPORT_RUSH if', suff='%'}},
			{'Teleport Rush duration:', {expr='DUR 12 %of 0 TELEPORT_RUSH if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='IS_INVISIBLE', cont='Ash is [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'}
		}),
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {name='BLADE_STORM_BASE_DMG', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD FINISHER_DMG_MOD STR 
				1500 %of %of %of %of COMBO_MULT *
			]]}},
			{Tooltips.full('Bleed', 'DamageTypes')..' DoT:', {name='BLEED_DMG', expr='FACTION_DMG_MOD 43.75 BLADE_STORM_BASE_DMG %of %of', suff='/s'}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BLADE_STORM_BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BLADE_STORM_BASE_DMG ELEMENT_DMG + BLEED_DMG 9 * +'}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Combo:', {expr='STR 4 %of RISING_STORM * 3 +', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	},
	-- Atlas
	['Landslide']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='PUNCH_NUMBER', cont='Punch number:', type='range-R', min='1', max='3', default='1'},
			{name='RUBBLE_HEAP', cont=Tooltips.full('Rubble Heap', 'Mods').." and '''1400''' Rubble?", type='checkbox'},
			{name='PATH_OF_STATUES', cont=Tooltips.full('Path of Statues', 'Mods')..'?', type='checkbox'}
		}),
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {name='BASE_DMG', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD STR 100 0 RUBBLE_HEAP if + 350 %of %of %of COMBO_MULT *
			]]}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG ELEMENT_DMG +'}},
			{'Range:', {expr='12 24 RUBBLE_HEAP if', suff='m'}},
			{'Punch radius:', {expr='RNG 4 2 6 3 8 PUNCH_NUMBER 3 v_match:= %of', suff='m'}},
			{'Path duration:', {name='PATH_DUR', expr='DUR 12 %of 0 PATH_OF_STATUES if ', suff='s'}},
			{'Petrify duration:', {expr='PATH_DUR 2 /', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 0 { 1 2 2 3 4 PUNCH_NUMBER 3 v_match:= / COST } RUBBLE_HEAP if run *'}},
		}
	},
	['Tectonics']={
		ins={
			{name='ATLAS_ARMOR', cont="Atlas' "..Tooltips.full('Armor', 'Stats')..':', default='475', min='0'},
			{name='ABSORBED_DAMAGE', cont='Absorbed damage:', min='0', default='0'},
		},
		outs={
			{'Bulwark health:', {expr='ATLAS_ARMOR 5 * 1500 + STR %of ABSORBED_DAMAGE +'}},
			{'Bulwark inflicted'..Tooltips.full('Slash', 'DamageTypes')..' damage multiplier:', {expr='STR 1 %of', suff='%', fmt='2sig'}},
			{'Boulder rolling '..Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 600 %of'}},
			{'Boulder explosion '..Tooltips.full('Puncture', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Boulder explosion radius:', {expr='RNG 5 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}},
		}
	},
	['Petrify']={
		ins={
			{name='ORE_GAZE_AUGMENT', cont=Tooltips.full('Ore Gaze', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Rumbler health restored:', {expr='STR 100 %of', suff='%'}},
			{'Petrify duration:', {expr='DUR 20 %of', suff='s'}},
			{'Targeting cone range:', {expr='RNG 14 %of', suff='m'}},
			{'Chance to drop additional loot when killed:', {expr='STR 25 %of 0 ORE_GAZE_AUGMENT if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}},
		}
	},
	-- Banshee
	['Sonic Boom']={
		ins={
			{name='SONIC_SIPHON', cont=Tooltips.full('Sonic Siphon', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{Tooltips.full('Armor', 'Stats')..' reduction:', {expr='STR 70 %of 100 min', suff='%'}},
			{'Push Force:', {expr='STR 5 %of'}},
			{'Range:', {expr='RNG 15 %of', suff='m'}},
			{'Sonic Siphon '..Tooltips.full('Armor', 'Stats')..' bonus:', {expr='STR 50 %of 0 SONIC_SIPHON if 1500 min', suff='/hit'}},
			{'Hits required for 1500 '..Tooltips.full('Armor', 'Stats')..':', {expr='30 STR as% / ceil 0 SONIC_SIPHON if'}},
			{'Sonic Siphon duration:', {expr='DUR 20 %of', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Sonar']={
		ins={},
		outs={
			{'Damage multiplier:', {expr='STR 5 %of'}},
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 35 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Silence']={
		ins={
			{name='SAVAGE_SILENCE', cont=Tooltips.full('Savage Silence', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{'Duration:', {expr='DUR 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 20 %of', suff='m'}},
			{'[[Finisher damage]] modifier:', {expr='STR 300 %of 0 SAVAGE_SILENCE if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Sound Quake']={
		ins={
			{name='GASEOUS_QUAKE', cont=Tooltips.full('Gaseous Quake', 'Mods')..'?', type='checkbox'},
			{name='GASEOUS_QUAKE_DURATION', cont='Seconds spent channeling Gaseous Quake:', min='0', default='0'}
		},
		outs={
			{Tooltips.full('Blast', 'DamageTypes')..' or '..Tooltips.full('Gas', 'DamageTypes')..' damage:', {name='SOUND_QUAKE_BASE_DMG', expr='STR 200 %of 2.75 GASEOUS_QUAKE_DURATION 10 min ^ 1 GASEOUS_QUAKE if *'}},
			{Tooltips.full('Gas Cloud', 'DamageTypes')..' damage:', {expr='0.5 SOUND_QUAKE_BASE_DMG * 0 GASEOUS_QUAKE if'}},
			{'Zone duration:', {expr='DUR 6.25 25 GASEOUS_QUAKE if %of', suff='s'}},
			{'Radius:', {expr='RNG 20 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 75 GASEOUS_QUAKE if COST *'}},
			{Tooltips.full('Energy', 'Stats')..' drain:', {expr='16 DRAIN * 1.2 GASEOUS_QUAKE_DURATION ^ * 0 GASEOUS_QUAKE if'}}
		}
	},
	-- Citrine
	['Fractured Blast']={
		ins={
			{name='FRACTURED_BLAST_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' and '..Tooltips.full('Slash', 'DamageTypes')..' damage:', {name='FRACTURED_BLAST_BASE_DMG', expr='STR 250 500 FRACTURED_BLAST_INFUSED if %of'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' damage:', {expr='0.35 FRACTURED_BLAST_BASE_DMG *'}},
			{'[[Health Orb]] drop chance:', {expr='STR 25 50 FRACTURED_BLAST_INFUSED if %of', suff='%'}},
			{'[[Energy Orb]] drop chance:', {expr='STR 10 20 FRACTURED_BLAST_INFUSED if %of', suff='%'}},
			{'Range:', {expr='RNG 14 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Preserving Shell']={
		ins={},
		outs={
			{'Initial damage reduction:', {expr='STR 40 %of 90 min', suff='%'}},
			{'Damage reduction per kill:', {expr='STR 3 %of', suff='%/kill'}},
			{'Damage reduction per assist:', {expr='STR 1 %of', suff='%/assist'}},
			{'Duration:', {expr='DUR 25 %of', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Prismatic Gem']={
		ins={
			{name='PRISMATIC_COMPANION', cont=Tooltips.full('Prismatic Companion', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..', '..Tooltips.full('Cold', 'DamageTypes')..', '..Tooltips.full('Electricity', 'DamageTypes')..' and '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {name='PRISMATIC_GEM_BASE_DMG', expr='STR 1000 %of'}},
			{Tooltips.full('Ignite', 'DamageTypes')..', '..Tooltips.full('Tesla Chain', 'DamageTypes')..' and '..Tooltips.full('Poison', 'DamageTypes')..' damage:', {expr='0.5 PRISMATIC_GEM_BASE_DMG *'}},
			{'[[Status Chance]] bonus:', {expr='STR 100 %of', suff='%'}},
			{'[[Status Duration]] bonus:', {expr='DUR 50 0 PRISMATIC_COMPANION if + 100 %of', suff='%'}},
			{'Duration:', {expr='DUR 50 0 PRISMATIC_COMPANION if + 30 %of', suff='s'}},
			{'Radius:', {expr='RNG 15 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Crystallize']={
		ins={
			{name='RECRYSTALIZE', cont=Tooltips.full('Recrystalize', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Impact', 'DamageTypes')..' damage:', {expr='STR 500 %of'}},
			{'Duration:', {expr='DUR 8 %of', suff='s'}},
			{'Range:', {expr='RNG 30 %of', suff='m'}},
			{'Recrystalize radius:', {expr='RNG 16 %of 0 RECRYSTALIZE if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='100 COST *'}}
		}
	},
	-- Narin
	['Neote']={
		ins={},
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' damage:' , {name='BASE_NEOTE_DMG', expr='STR 400 %of', suff='/hit'}},
			{'Total '..Tooltips.full('Cold', 'DamageTypes')..' damage:', {expr='BASE_NEOTE_DMG 5 *'}},
			{'Range:', {expr='RNG 12 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		}
	},
	['Naraemagi']={
		ins={
			{name='NUM_COLD_STATUS_ABSORBED', cont=Tooltips.full('Cold', 'DamageTypes')..' procs absorbed:', default='1', min='0'},
		},
		outs={
			{Tooltips.full('Shield', 'Stats')..' or '..Tooltips.full('Overguard', 'DamageTypes')..':', {expr='STR 75 %of NUM_COLD_STATUS_ABSORBED *', suff='/'..Tooltips.full('Cold', 'DamageTypes')..' proc'}},
			{'Radius:', {expr='RNG 14 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}},
		}
	},
	['Hakchum']={
		ins={},
		outs={
			{Tooltips.full('Cold', 'DamageTypes')..' Landing damage:' , {expr='STR 1000 %of'}},
			{Tooltips.full('Cold', 'DamageTypes')..' DoT:' , {expr='STR 100 %of', suff='/s'}},
			{Tooltips.full('Cold', 'DamageTypes')..' Damage Vulnerability:' , {expr='STR 150 %of', suff='%'}},
			{'Ice storm duration:', {expr='DUR 10 %of', suff='s'}},
			{'Ice storm radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}},
		}
	},
	['Nurinarim']={
		ins={
			{name='COLD_STATUS_COUNT', cont='Number of '..Tooltips.full('Cold', 'DamageTypes')..' procs on enemy: ', type='range-R', min='1', max='10', default='1'},
			{name='ENEMY_IS_MARKED', cont='Enemy is marked?', type='checkbox'},
		},
		outs={
			{'Ice aura '..Tooltips.full('Cold', 'DamageTypes')..' damage:' , {expr='STR 500 %of', suff='/s'}},
			{'Icy Slash'..Tooltips.full('Cold', 'DamageTypes')..'  damage:' , {expr='STR 20000 %of 2 1 ENEMY_IS_MARKED if *'}},
			{'Frozen enemy explosion '..Tooltips.full('Cold', 'DamageTypes')..' damage:' , {expr='STR 10000 %of 2 1 ENEMY_IS_MARKED if *'}},
			{'Max duration:', {expr='DUR 15 %of', suff='s'}},
			{'Ice aura radius:', {expr='RNG 8 %of', suff='m'}},
			{'Frozen enemy explosion radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Shield', 'Stats')..' stripped:', {expr='5 COLD_STATUS_COUNT *', suff='%'}},
			{Tooltips.full('Armor', 'Stats')..' stripped:', {expr='5 COLD_STATUS_COUNT *', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		}
	},
	-- Nidus
	['Virulence']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='TEEMING_VIRULENCE', cont=Tooltips.full('Teeming Virulence', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Puncture', 'DamageTypes')..' contact damage:', {expr='STR 200 %of 1 MUTATION_STACKS + *'}},
			{Tooltips.full('Viral', 'DamageTypes')..' lingering damage:', {expr='STR 100 %of 1 MUTATION_STACKS + *'}},
			{'Lingering field duration:', {expr='DUR 5 %of', suff='s'}},
			{'Length:', {expr='RNG 16 %of', suff='m'}},
			{'Primary Weapon Critical Chance bonus:', {expr='STR 200 %of 0 TEEMING_VIRULENCE if', suff='%'}},
			{'Teeming Virulence duration:', {expr='DUR 15 %of 0 TEEMING_VIRULENCE if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {name='VIRULENCE_COST', expr='40 COST *'}},
			{Tooltips.full('Energy', 'Stats')..' restored:', {expr='VIRULENCE_COST 4 /', suff='/hit'}}
		}
	},
	['Larva']={
		ins={
			{name='LARVA_BURST', cont=Tooltips.full('Larva Burst', 'Mods')..'?', type='checkbox'},
			{name='LARVA_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'Mutation Stack chance:', {expr='0 STR 50 %of LARVA_INFUSED if 100 min', suff='%'}},
			{'Duration:', {expr='DUR 7 %of', suff='s'}},
			{'Grab radius:', {expr='RNG 8 12 LARVA_INFUSED if %of', suff='m'}},
			{Tooltips.full('Toxin', 'DamageTypes')..' damage:', {name='LARVA_BURST_BASE_DMG', expr='STR 600 %of 0 LARVA_BURST if', suff='/enemy'}},
			{Tooltips.full('Poison', 'DamageTypes')..' damage:', {expr='0.5 LARVA_BURST_BASE_DMG *', suff='/enemy'}},
			{'Larva Burst radius:', {expr='RNG 8 %of 0 LARVA_BURST if'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Parasitic Link']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='PARASITIC_VITALITY', cont=Tooltips.full('Parasitic Vitality', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Ability Strength', 'Stats')..' multiplier:', {expr='STR 0.25 %of 1 +'}},
			{'Damage multiplier:', {expr='STR 0.25 %of 1 +'}},
			{'Damage redirection:', {expr='STR 50 %of 90 min', suff='%'}},
			{'Duration:', {expr='DUR 60 %of', suff='s'}},
			{'Ally maximum range:', {expr='RNG 40 %of', suff='m'}},
			{'Enemy maximum range:', {expr='RNG 20 %of', suff='m'}},
			{'Health bonus:', {expr='STR 4 MUTATION_STACKS * %of 0 PARASITIC_VITALITY if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Ravenous']={
		ins={
			{name='MUTATION_STACKS', cont='Mutation Stacks:', type='range-R', min='0', max='500', default='0'},
			{name='INSATIABLE', cont=Tooltips.full('Insatiable', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Health', 'Stats')..' regeneration:', {expr='STR 75 %of', suff='/s'}},
			{'Duration:', {expr='DUR 40 %of', suff='s'}},
			{'Field radius:', {expr='RNG 8 %of', suff='m'}},
			{'Maggot '..Tooltips.full('Blast', 'DamageTypes')..' damage:', {expr='STR 150 %of 1 MUTATION_STACKS + *'}},
			{'Maggot '..Tooltips.full('Toxin', 'DamageTypes')..' damage:', {expr='10 1 MUTATION_STACKS + *'}},
			{'Maggot explosion radius:', {expr='RNG 4 %of', suff='m'}},
			{'Bonus Mutation Stack chance:', {expr='STR 60 %of 0 INSATIABLE if', suff='%'}}
		}
	},
	-- Uriel
	['Infernalis']={
		ins={
			{name='INFERNUM', cont=Tooltips.full('Infernum', 'Mods')..'?', type='checkbox'}
		},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage on cast:', {name='INFERNALIS_CAST_BASE_DMG', expr='STR 1500 %of'}},
			{'Cast '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_CAST_BASE_DMG *'}},
			{Tooltips.full('Heat', 'DamageTypes')..' aura damage:', {name='INFERNALIS_AURA_BASE_DMG', expr='STR 250 %of', suff='/s'}},
			{'Aura '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_AURA_BASE_DMG *'}},
			{'Duration:', {expr='DUR 35 %of', suff='s'}},
			{'Aura radius:', {expr='RNG 2 %of', suff='m'}},
			{'Catenach chain damage:', {expr='STR 100 %of', suff='/s'}},
			{'Catenach chain '..Tooltips.full('Slow', 'DamageTypes')..':', {expr='STR 50 %of 95 min', suff='%'}},
			{'Catenach chain duration:', {expr='DUR 10 %of', suff='s'}},
			{'Catenach chain range:', {expr='RNG 6 %of', suff='m'}},
			{'Infernum '..Tooltips.full('Heat', 'DamageTypes')..' contact damage:', {expr='STR 1500 %of 0 INFERNUM if'}},
			{'Infernum '..Tooltips.full('Heat', 'DamageTypes')..' radial damage:', {name='INFERNALIS_INFERNUM_RADIAL_DMG', expr='STR 1500 %of 0 INFERNUM if'}},
			{'Infernum '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 INFERNALIS_INFERNUM_RADIAL_DMG *'}},
			{'Infernum empowerment duration:', {expr='DUR 5 %of 0 INFERNUM if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}}
		}
	},
	['Remedium']={
		ins={
			{name='REMEDIUM_MAX_HEALTH', cont='Maximum '..Tooltips.full('Health', 'Stats'), default='666'},
			{name='REMEDIUM_INFUSED', cont='[[Infused]]?', type='checkbox'}
		},
		outs={
			{'Self healing percentage:', {name='REMEDIUM_HEALING', expr='STR 35 50 REMEDIUM_INFUSED if %of', suff='%'}},
			{'Self healing total:', {expr='REMEDIUM_HEALING REMEDIUM_MAX_HEALTH %of'}},
			{'Gulphagor latch damage:', {expr='0 STR 750 %of REMEDIUM_INFUSED if', suff='/tick'}},
			{'Latched target [[Health Orb]] drop chance:', {expr='0 STR 300 %of REMEDIUM_INFUSED if', suff='%'}},
			{'Latched target [[Energy Orb]] drop chance:', {expr='0 STR 100 %of REMEDIUM_INFUSED if', suff='%'}},
			{'Gulphagor '..Tooltips.full('Heat', 'DamageTypes')..' field damage:', {name='GULPHAGOR_FIELD_DMG', expr='0 STR 200 %of REMEDIUM_INFUSED if', suff='/tick'}},
			{'Gulphagor '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 GULPHAGOR_FIELD_DMG *'}},
			{'Gulphagor field duration:', {expr='0 DUR 10 %of REMEDIUM_INFUSED if', suff='s'}},
			{'Gulphagor field radius:', {expr='0 RNG 4 %of REMEDIUM_INFUSED if', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='50 COST *'}}
		}
	},
	['Demonium']={
		ins={},
		outs={
			{Tooltips.full('Heat', 'DamageTypes')..' damage:', {expr='STR 250 %of'}},
			{'[[Damage Vulnerability]]:', {expr='STR 50 %of', suff='%'}},
			{'Duration:', {expr='DUR 5 %of', suff='s'}},
			{'Explosion radius:', {expr='RNG 6 %of', suff='m'}},
			{'Vythelas Rune [[Fire Rate]] bonus:', {expr='STR 30 %of', suff='%'}},
			{'Vythelas Rune '..Tooltips.full('Heat', 'DamageTypes')..' damage bonus:', {expr='STR 30 %of', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
	['Brimstone']={
		ins={},
		outs={
			{'Initial '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='BRIMSTONE_BASE_DMG', expr='STR 750 %of', suff='/tick'}},
			{'Initial '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 BRIMSTONE_BASE_DMG *'}},
			{'Maximum '..Tooltips.full('Heat', 'DamageTypes')..' damage:', {name='BRIMSTONE_MAX_DMG', expr='10 BRIMSTONE_BASE_DMG *', suff='/tick'}},
			{'Maximum '..Tooltips.full('Ignite', 'DamageTypes')..' damage:', {expr='0.5 BRIMSTONE_MAX_DMG *'}},
			{'Duration:', {expr='DUR 10 %of', suff='s'}},
			{'Radius:', {expr='RNG 15 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='75 COST *'}}
		}
	},
};
return Data;
