local Tooltips = setmetatable({},{__index=function(self,fun) return function(...)
	local out = {}
	local n_i = 1
	for k, v in pairs( select('#',...)>1 and {...} or (...) ) do
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

local Data = {
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:<span style="display: none" data-name="HEAD_MULT" data-expr="HEAD_RATE 3 * 100 HEAD_RATE - + as%"></span>', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Slash', 'DamageTypes')..' damage:' ,                                    {name='BASE_DMG_ASH_1', expr='STR 750 %of HEAD_MULT * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG_ASH_1 %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG_ASH_1 +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:',                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TP_AUG', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
			{name='SMOKE_AUG', cont=Tooltips.full('Smoke Shadow', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] kills:', {expr='DUR 5 %of TP_AUG *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{'Smoke Shadow duration:', {expr='DUR 12 %of 0 SMOKE_AUG if', suff='s'}},
			{'Smoke Shadow radius:', {expr='RNG 15 %of 0 SMOKE_AUG if', suff='m'}},
			{'Critical Chance bonus:', {expr='150 0 SMOKE_AUG if', suff='%'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='35 COST *'}},
		}
	},
	['Teleport']={
		ins={
			{name='TP_AUG', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{'[[Parkour Velocity]] bonus:', {expr='30 0 TP_AUG if', suff='%'}},
			{'Teleport Rush duration:', {expr='DUR 12 %of 0 TP_AUG if', suff='s'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins=merge(
			GenericIns.ModdableMelee, {
			{name='IS_INVISIBLE', cont='Ash is [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'}}
		),
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {name='BASE_DMG_ASH_4', expr=[[
				FACTION_DMG_MOD MELEE_DMG_MOD FINISHER_DMG_MOD STR 
				1500 %of %of %of %of COMBO_MULT *
			]]}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED_DMG', expr='FACTION_DMG_MOD 43.75 BASE_DMG_ASH_4 %of %of', suff='/s'}},
			{'Elemental damage:', {name='ELEMENT_DMG', expr='ELEMENT_DMG_MOD BASE_DMG_ASH_4 %of'}},
			{'Total damage:', {name='TOTAL_DMG', expr='BASE_DMG_ASH_4 ELEMENT_DMG + BLEED_DMG 9 * +'}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Combo:', {expr='STR 4 %of RISING_STORM * 3 +', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats')..' cost:', {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	}
};
return Data;
