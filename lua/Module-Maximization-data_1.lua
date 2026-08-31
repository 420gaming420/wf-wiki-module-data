local Tooltips = { full=function(a, b) return '{{#invoke:Tooltip|full|'..a..'|'..b..'}}'end,};
local Data = {
	['Shuriken']={
		ins={
			{name='HEAD', type='checkbox', cont='Headshot?'},
			{name='ASH', type='checkbox', value='checked', cont="Ash's [[Ash/Abilities#Passive|passive]]?"},
			{cont='Shurikens:', name='SHURIKENS', type='range-R', min='1', max='5', value='1'},
		},
		outs={
			{'Base damage:' ,                                    {name='BASE_DMG', expr='ASH STR 750 %of 3 1 HEAD if * SHURIKENS *'}},
			{Tooltips.full('Bleed', 'DamageTypes')..' [[DoT]]:', {name='BLEED', expr='43.75 35 ASH if BASE_DMG %of', suff='/s'}},
			{'Total damage:',                                    {expr='BLEED 9 6 ASH if * BASE_DMG +'}},
			{Tooltips.full('Energy', 'Stats'),                   {expr='25 COST *'}},
		}
	},
	['Smoke Screen']={
		ins={},
		outs={
			{'Duration:', {expr='12 DUR *', suff='seconds'}},
			{'Radius:', {expr='10 RNG *', suff='meters'}},
			{Tooltips.full('Energy', 'Stats'), {expr='35 COST *'}},
		}
	}
};
return Data;
