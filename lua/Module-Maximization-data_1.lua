local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end,};
local Data = {
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate:<span style="display: none" data-name="HEAD_MULT" data-expr="HEAD_RATE 3 * 100 HEAD_RATE - + as%"></span>', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='WEAK_TO_SLASH', cont='Enemy is weak to '..Tooltips.full('Slash', 'DamageTypes')..'?', type='checkbox'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
			{name='SEEKING_SHURIKEN', cont=Tooltips.full('Seeking Shuriken', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Base damage:' ,                                    {name='BASE_DMG', expr='STR 750 %of HEAD_MULT * SHURIKENS * 1.5 1 WEAK_TO_SLASH if *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG +'}},
			{'Armor reduction:',                                 {expr='STR 70 %of SEEKING_SHURIKEN *', suff='%'}},
			{'Armor reduction duration:',                        {expr='DUR 8 %of SEEKING_SHURIKEN *', suff='s'}},
			{Tooltips.full('Energy', 'Stats'),                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TP_AUG', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] kills:', {expr='DUR 5 %of TP_AUG *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats'), {expr='35 COST *'}},
		}
	},
	['Teleport']={
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage bonus:', {expr='STR 200 %of', suff='%'}},
			{'Range:', {expr='RNG 60 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats'), {expr='25 COST *'}},
		},
	},
	['Blade Storm']={
		ins={
			{name='MELEE_DMG_BONUS', cont='[[Melee damage]] modifier:', type='number', default='100'},
			{name='FINISHER_DMG_BONUS', cont='[[Finisher damage]] modifier:', type='number', default='100'},
			{name='COMBO_MULTI', cont='[[Combo multiplier]]', type='range-R', min='1', max='12', value='1'},
			{name='IS_INVISIBLE', cont='Is Ash [[invisible]]?', type='checkbox'},
			{name='RISING_STORM', cont=Tooltips.full('Rising Storm', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{Tooltips.full('Finisher', 'DamageTypes')..' damage:', {expr=[[
				MELEE_DMG_BONUS FINISHER_DMG_BONUS
				STR 1500 %of %of %of COMBO_MULTI *
			]]}},
			{'Range:', {expr='RNG 50 %of', suff='m'}},
			{'Bonus Combo:', {expr='STR 4 %of RISING_STORM *', suff='/attack'}},
			{Tooltips.full('Energy', 'Stats'), {expr='12 COST * 2 1 IS_INVISIBLE if /', suff='/enemy'}},
		}
	}
};
return Data;
