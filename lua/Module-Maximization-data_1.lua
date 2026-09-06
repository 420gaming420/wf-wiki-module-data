local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end,};
local Data = {
	['Shuriken']={
		ins={
			{name='HEAD_RATE', cont='Headshot rate (%):<span style="display: none" data-name="HEAD_MULT" data-expr="HEAD_RATE 3 * 100 HEAD_RATE - + as%"></span>', type='range-R'},
			{name='SHURIKENS', cont='Shurikens:', type='range-R', min='1', max='5', value='1'},
			{name='ASH', cont="Ash's [[Ash/Abilities#Passive|passive]]?", type='checkbox', value='checked'},
		},
		outs={
			{'Base damage:' ,                                    {name='BASE_DMG', expr='STR 750 %of HEAD_MULT * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG +'}},
			{Tooltips.full('Energy', 'Stats'),                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={
			{name='TP_AUG', cont=Tooltips.full('Teleport Rush', 'Mods')..'?', type='checkbox'},
		},
		outs={
			{'Duration:', {expr='DUR 12 %of', suff='s'}},
			{'Extension on [[Finisher]] Kills:', {expr='DUR 5 %of TP_AUG *', suff='s'}},
			{'Radius:', {expr='RNG 10 %of', suff='m'}},
			{Tooltips.full('Energy', 'Stats'), {expr='35 COST *'}},
		}
	}
};
return Data;
