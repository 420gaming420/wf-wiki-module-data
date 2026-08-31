---	'''Ability/infobox''' builds the infobox on ability pages and adds the 
--	appropriate category pages.<br />
--
--	@module		ability
--	@alias		p
--	@author		[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:Ability/data]]
--	@require	[[Module:Tooltips]]
--	@require	[[Module:Version]]
--	@release	stable
--	

-- TODO: Fix code formatting so Module:Docbunto can properly generate documentation page
local AbilityData = mw.loadData([[Module:Ability/data]])
local Tooltips = require([[Module:Tooltips]])
local Version = require([[Module:Version]])
local TextIcons = require([[Module:TextIcons]])

--Stuff that should go elsewhere
--TODO!
local function byRank(r0, r1, r2, r3)
	return ('<span style="border-bottom:1px dotted;" title="%s / %s / %s / %s">%s</span>'):format(r0, r1, r2, r3, r3)
end
-- TODO: Rename v key to vals or values and u key to units for readability
local drains = {
	['Aegis Storm'  ] = { {v=true}, {v=25, u='/s'}, {v=25, u='/s/enemy'}, {v=50, u='/dodge'}, },
	['Airburst'     ] = { {v=true}, {v=-25, u=' in air'}, }, -- WIP?
	['Artemis Bow'  ] = { {v=true}, {v=15, u='/shot'}, },
	['Balefire'     ] = { {v=true}, {v=100, u='/shot'}, {v=200, u='/charge shot'} },
	['Blade Storm'  ] = { {v=true}, {v='6-12', u='/mark'}, },
	['Danse Macabre'] = { {v=true}, {v='20-40', u='/s'}, },
	['Desecrate'    ] = { {v=true}, {v=10, u='/corpse'}, },
	['Effigy'       ] = { {v=true}, {v=10, u='/s'}, },
	['Elude'        ] = { {v=true}, {v=2.5, u='/s'}, },
	['Exalted Blade'] = { {v=true}, {v=2.5, u='/s'}, {v=25, u='/slide'}, },
	['Exalted Ironbride'] = { {v=true}, {v=2.5, u='/s'}, },
	-- ['Exalted Shadow'] = { {v=1, u='% well/s'}, }, -- WIP
	['Glory on High'] = { {v=true}, {v=5, u='/s'}, {v=25, u='/alt fire'}, },
	['Gloom'        ] = { {v=true}, {v='.75-7.5', u='/s'}, },
	['Guard Mode'   ] = { {v=true}, {v=5, u='/s'}, },
	['Haven'        ] = { {v=true}, {v=5, u='/s/ally'}, {v=25, u='/s/enemy'}, },
	['Hysteria'     ] = { {v=true}, {v='5', u='/s'}, },
	['Immolation'   ] = { {v=true}, {v='<hr/>', u='<small>when at max heat:</small>'}, {v='1t', u='/s<sup>-2</sup><br>t = time at max heat in seconds'}, }, -- WIP? too long?
	['Inferno'      ] = { {v=true}, {v=10, u='/enemy<br/>(max 10x)'}, }, -- WIP?
	['Mach Rush'    ] = { {v=true}, {v=12.5, u='/s'}, },
	['Mass Vitrify' ] = { {v=true}, {v='3-5', u='/s'}, },
	['Mend & Maim'  ] = { {v=true}, {v=3.5, u='/s'}, },
	['Navigator'    ] = { {v=true}, {v=3, u='/s'}, {v=2, u='/s<sup>2</sup>'}, },--:gsub('%^([0-9-]+)','<sup>%1</sup>')
	['Neutralize'   ] = { {v=true}, {v=10, u='/shot'}, {v=20, u='/alt fire'} },
	['Noctua'       ] = { {v=true}, {v=2, u='/shot'}, },
	['Pacify & Provoke'] = { {v=true}, {v=byRank(1.5,1.25,1,.5), u='/s/enemy'}, {v=byRank(5,4.33,3.66,3), u='/ability'}, },
	['Peacemaker'   ] = { {v=true}, {v=15, u='/s'}, },
	['Penumbra'     ] = { {v=true}, {v=5, u='/s'}, },
	['Primal Fury'  ] = { {v=true}, {v=5, u='/s'}, },
	['Prism'        ] = { {v=true}, {v=10, u='/s'}, },
	['Prowl'        ] = { {v=true}, {v='1-3', u='/s'}, },
	['Razorwing'    ] = { {v=true}, {v=5, u='/s'}, },
	['Renewal'      ] = { {v=true}, {v=3.5, u='/s'}, },
	['Silken Stride'] = { {v=true}, {v=5, u='/s'}, },
	['Sol Gate'     ] = { {v=true}, {v='12-24', u='/s'}, },
	['Sound Quake'  ] = { {v=true}, {v=byRank(25,18,15,12), u='/s'}, },
	['Spectral Scream'] = { {v=true}, {v=3, u='/s'}, },
	['Tail Wind'    ] = { {v=true}, {v=-12.5, u=' (airborne)'}, {v=5, u='/s hovering'}, }, -- WIP
	['Undertow'     ] = { {v=true}, {v=6, u='/s'}, {v=5, u='/grab'}, {v=5, u='/m'--[[eter']]}, },
	['Warding Grace'] = { {v=true}, {v=10, u='/s'}, },
}
local specialWeap = {
	--Exalted Shadow
	['/WraithReaperAbility']={nil,[=[
[[File:RavenousWraithMod.png|200px|left]]
{{main|Ravenous Wraith}}
{{#lst:Ravenous Wraith|intro}}
{{StanceTable|Name=Ravenous Wraith}}]=]},
	--Razorwing
	['/FairyFlightAbility']={[=[
[[File:DexPixia.png|200px|left]]
{{main|Dex Pixia}}
{{#lst:Dex Pixia|intro}}<hr style=\"clear:both;border-style:dashed\"/>
{{#lsth:Dex Pixia|Characteristics}}

<hr style="clear:both"/>

[[File:diwata.png|200px|left]]
{{main|Diwata}}
{{#lst:Diwata|intro}}<hr style=\"clear:both;border-style:dashed\"/>
{{#lsth:Diwata|Characteristics}}]=],"[[File:RazorwingMod.png|200px|left]]"--\n{{StanceTable|Name=Razorwing}}"
	},
	--Slash Dash
	['/SlashDashNewAbility']={[=[
[[File:ExaltedBladeWeapon.png|200px|left]]
{{main|Exalted Blade (Weapon)}}
{{#lst:Exalted Blade (Weapon)|intro}}]=],nil
	},
}


return {
---	Builds the horizontal ability infobox.
--	@function	p.buildInfobox
--	@param		{table} frame Frame object
--	@return		{string} Wikitext of box
buildInfobox = function(frame)
	local args = frame.args or frame
	
	local name = args.name ~= '' and args.name --or mw.text.decode(frame:getTitle()):gsub('_',' '):gsub('and','&')--:gsub("'",'')
	local onpage = name == mw.text.decode(mw.title.getCurrentTitle().text):gsub(' (Ability)', '')
	-- local conclave = false and mw.loadData [[Module:Ability/Conclave/data]]
	local ability = AbilityData.Ability[name] or AbilityData.Archived[name]
	if not ability then error('buildInfobox: No ability "'..(name or '<'..type(name)..'>')..'" found in [[Module:Ability/data]]') end
	local link = args.link or ability.Link or name

	-- ability.Name, ability.InternalName unused
	local cardImage, gameImage = ability.CardImage, ability.Icon
	local link = ability.Link
	local version = ability.Introduced
	-- local costType, cost, drain = ability.CostType, ability.Cost, nil
	local hotkey, description = ability.Key, ability.Description
	local subsumable = ability.Subsumable
	local cardOnly = --[[args.cardonly and args.cardonly~='' or--]] not onpage

	--TODO:auto?
	local sub = (args.sub or ''):gsub('%[%[(Ability [SDRE][a-z]+)|<span style="[^"]+">[A-Z][a-z]+</span>%]%]',Tooltips'Stats''full')
	:gsub('<span style="color:white;">Misc</span>','<b style="color:white;border-bottom:1px dotted;" title="Stats unlisted in-game, not affected by Mods">Misc</b>')
	local strength, duration, range, efficiency, misc = args.strength, args.duration, args.range, args.efficiency, args.misc
	local info, attributes, tips, max, bugs, interactions, helminth, localization = args.info, args.attributes, args.tips, args.max, args.bugs, args.interactions, args.helminth, args.localization
	-- drain = args.drain
	
	-- TODO: AbilityDurationBuff.png is a flat white icon and needs to be inverted on light theme
	local costIcon=({energy='EnergyOrb.png', time='AbilityDurationBuff.png', shield='IconShield.png', mutation='MutationGauge.png'})[ability.CostType or 'energy']
	local drain = drains[name] or { { v=true }, }
	for i, v in ipairs(drain) do
		if v.v==true then v.v=ability.Cost end
		drain[i] = (v.u and '' or '[[File:'..costIcon..'|24px|link='..(ability.CostType or 'energy'):gsub('^.', string.upper)..']]')..
			('[[%s|<b style="font-size:16px;">%s<small>%s</small></b>]]')
			:format(v.u and v.u:find('/s') and 'Channeled Abilities' or 'Ability Efficiency', v.v, (v.u or '') )
	end
	drain = table.concat(drain,'<br/>+'):gsub('<br/>%+(%[%[[^<]-<[^>]->)%-', '<br/>-%1')
	if drain:find('>0[<small>/b]+]]$') then drain = '' end
	
	-- TODO: Decouple code into a separate module dedicated to parsing text icon strings into Tooltips
	-- or image equivalents as seen on [[Text Icons]]; could be implemented as a string.format() function
	-- using text between angle brackets as format specifiers or dedicate a module for a custom templating language
	-- on the wiki
	description = TextIcons.getIcon(description,{class='icon'})

	local augment = {}
	for i,v in ipairs(ability.Augments or {}) do
		table.insert(augment, ("[[File:%sMod.png|200px|left]]\n"):format(v:gsub(' ', ''))
			..frame:expandTemplate{title='main',args={v}}
			.."\n"..frame:callParserFunction('#lst',v,'intro')
			.."\n"..frame:callParserFunction('#lsth',v,'Stats')
		)
	end
	augment = table.concat(augment, '\n\n<hr style="clear:both"/>\n\n')

	local weapon, stance = nil, nil
	local abilityid=ability.InternalName and ability.InternalName:match('/%w+$') or '<no InternalName>'
	if ability.Weapon then -- TODO: missing any? all stances correct?
		local weappagename = ability.Weapon == name and ability.Weapon..' (Weapon)' or ability.Weapon
		weapon = ("[[File:%s.png|200px|left]]\n{{main|%s}}\n{{#lst:%s|intro}}<hr style=\"clear:both;border-style:dashed\"/>\n{{#lsth:%s|Characteristics}}")
			:format(weappagename:gsub("[' ()]",''), weappagename, weappagename, weappagename)
			-- TODO: Could add a key to M:Ability/data to map stances to Exalted Weapons/abilities
		if not ({
				['/RangerBowAbility']=true,
				['/IronFrameBlastAbility']=true,
				['/GunFuAbility']=true,
				['/PagemasterBookAbility']=true,
				['/EntratiMechSwordAbility']=true,-- archmelee has no stance
				['/FairyFlightAbility']=true,-- two exalted weapons is difficult; plus diwata's Razorwing stance has no page
				['/WraithReaperAbility']=true,-- Shadow Claws use Ravenous Wraith stance
				['/ChoirEruptAbility']=true,
				['/TempleGuitarAbility']=true,
				['/FrumentariusSniperAbility']=true,
				['/NinjaStormAbility']=true,--Pseudo-Exalted
				['/BrawlerPunchAbility']=true,--Pseudo-Exalted
				['/GlassShankAbility']=true,--Pseudo-Exalted
				['/KhoraCrackAbility']=true,--Pseudo-Exalted
				['/SlashDashNewAbility']=true,--Pseudo-Exalted
			})[abilityid] then
			stance = ("[[File:%sStanceMod.png|200px|left]]\n{{main|%s (Stance)}}\n{{#lst:%s (Stance)|intro}}\n{{StanceTable|Name=%s}}")
				:format(name:gsub("[' ]", ''), name, name, name)
		end
	end
	--todo these in another place
	weapon = weapon or (specialWeap[abilityid] or {})[1] or mw.log('weapon fail: '..abilityid) or weapon
	stance = stance or (specialWeap[abilityid] or {})[2] or mw.log('stance fail: '..abilityid) or stance

	local function tab(s, c)
		return c and c ~= '' and ('|-|%s=<b style="display:none;">%s<br />\n</b>\n%s'):format(s, s, c) or ''
	end

	-- todo? c: Ability Weapons, Line Of Sight Abilities, One-Handed Abilities, Stealth Abilities, Toggled Abilities, Two-Handed Abilities
	local categories = { 'Warframe Abilities', ability.Powersuit, insert = table.insert}
	if args.special or args.damage then
		categories:insert('Pages using deprecated terms')
		strength = strength or args.damage
	end
	-- TODO: Should add a key to M:Ability/data that specifies ability has drain instead of relying on string finds
	if drain:find('/s<') then categories:insert('Channeled Abilities') end
	if drain == ''      then categories:insert('Free Abilities') end
	if weapon           then categories:insert('Exalted Weapon') end
	-- TODO: Remove these debugging categories when they are not needed
	if args.drain ~= '' and args.drain then
		categories:insert('Ability with Drain parameter')
	end
	if args.description and args.description:find('Drain') then
		--categories:insert('desc param mentions drain')
		--[[
		Absorb
		Aegis Storm
		Artemis Bow
		Conclave:Defy
		Danse Macabre
		Effigy
		Elude
		Exalted Blade
		Exalted Ironbride
		Exalted Shadow
		Haven
		Hysteria
		Immolation
		Mach Rush
		Mass Vitrify
		Mend & Maim
		Pacify & Provoke
		Peacemaker
		Penumbra
		Primal Fury
		Prism
		Prowl
		Razorwing
		Renewal
		Sandstorm
		Scarab Swarm
		Sol Gate
		Sound Quake
		Spectral Scream
		Tail Wind
		Undertow
		Warding Grace
		World On Fire
		]]
		if not drains[name] then
			description=args.description
			categories:insert('desc param override')
		end
	end
	if conclave then
		categories = {'PvP','PvP Abilities'}
	end
	categories = '[[Category:'..table.concat(categories,']][[Category:')..']]'..Version._getVersionCategory(version)

--deprecated:  special  damage
--TODO:
-- drain
-- sub 
-- strength duration range efficiency misc
-- info attributes 
-- weapon stance 
-- tips max bugs
	
	-- TODO: Refactor these inline stylings to a CSS class for ability infoboxes
	local abilityStats = sub and sub ~= '' and
'|width=30% style="padding-right: 6px; font-size: 14px; vertical-align: top;"|<div class="tabber-borderless">'..frame:callParserFunction('#tag:tabber',sub)..'</div>\n\n|-\n|\n|-\n|\n|-\n'
or ([=[
|width=30%% style="padding-right: 6px; font-size: 14px; border-bottom:1px solid;"|'''%s:'''<span style="float:right; font-size:12px;">%s</span>
|-
| style="padding-right: 6px; font-size: 14px; border-bottom:1px solid;"|'''%s:'''<span style="float:right; font-size:12px;">%s</span>
|-
| style="padding-right: 6px; font-size: 14px;"|'''%s:'''<span style="float:right; font-size:12px;">%s</span>
|-
%s
%s]=]):format(
Tooltips.full{'Ability Strength', 'Stats', r='Strength'}, strength ~= '' and strength or 'N/A',
Tooltips.full{'Ability Duration', 'Stats', r='Duration'}, duration ~= '' and duration or 'N/A',
Tooltips.full{'Ability Range',    'Stats', r='Range'   }, range    ~= '' and range    or 'N/A',

efficiency ~= '' and efficiency and ([=[| style="padding-right: 6px; font-size: 14px; border-top:1px solid;" |'''%s:'''
<span style="float:right;font-size:12px;">%s</span>
|-]=]):format(Tooltips.full{'Ability Efficiency', 'Stats', r='Efficiency'}, efficiency) or '',

misc ~= '' and misc and ([=[| style="padding-right: 6px; font-size: 14px; border-top:1px solid;" |
<b style="border-bottom:1px dotted;" title="Stats unlisted in-game, not affected by Mods">Misc</b>:
<span style="float:right;font-size:12px;">%s</span>
|-]=]):format(misc) or '',

nil)
	
	local keybindLink = ([=[[[Key Bindings|<b style="position:relative; background-color:#272727; color:white; 
padding:1px calc(.81ch - 1px); border:solid #aaadb4; border-width:2px 3px 4px 2px; border-radius:5px; 
font-size:12px;">%s</b>]]]=]):format(hotkey ~= '' and hotkey or 'N/A')
	
-- TODO: Break up this string into local functions/variables for readability
	return ([=[
{| class="ability-box" style="width:100%%;"
|-
|rowspan=5 style="width: 0;"|[[File:%s|150px|link=%s]]
|rowspan=5 style="width: auto; text-align: center; max-width: 20%%;"|[[File:%s|x50px|link=%s|class=light-invert]]<br />%s<br />%s
|rowspan=5|<span id="%s" style="position: relative; top: -125px; height: 0px;"></span><b>%s</b><br/>
%s
<hr />
%s
%s
%s
|-
|}
<div id="mw-customcollapsible-%s" class="tabber-borderless mw-collapsible %s">%s</div>
<div class="mw-customtoggle-%s button-c">
[[File:Expand.svg|30px|link=#%s|Expand/Collapse|class=rotate-c defColor]]
</div>
%s]=]):format(
cardImage or 'Panel.png', link or name,
gameImage or 'UnidentifiedItem.png', link or name, keybindLink, drain,
name, Tooltips.text { { 'Ability', name, link, _data=ability } },
description ~= '' and description or "''No description available.''",
'Introduced in '..Version._getVersionLink(version),
abilityStats,
subsumable and [=[| style="padding-right:6px; font-size:14px; font-weight:bold; border-top:1px solid;"|[[Helminth#Ability Replacement|Subsumable to Helminth]]
|-]=] or '',
-- Content inside custom collapsible element
-- Changing the order here will change the order of the tabs
-- Left side is the name that will displayed for users 
name:gsub(' ', '_'), cardOnly and 'mw-collapsed' or '',
frame:callParserFunction('#tag:tabber',''
..tab('Info', info)
..tab('Attributes', attributes)
..tab(abilityid=='/FairyFlightAbility' and 'Weapons' or 'Weapon', weapon)
..tab('Stance', stance)
..tab('Kit Interactions', interactions)
..tab('Helminth', helminth)
..tab('Augment', augment)
..tab('Tips & Tricks', tips)
-- ..tab('Maximization', max)	-- Deprecated since 2022 (see [[User_blog:Cephalon_Scientia/Sunsetting_of_Maximization_Calculators]])
..tab('Bugs', bugs)
..tab('Localization', localization)
),
name:gsub(' ', '_'), name,
-- Content below custom collapsible element
onpage and categories or '',
nil)
--[[
.. (onpage and "parameter description: "..(args.description or 'none').."\n\npls add a drain param if there's drain on that\n\n"..[=[
<div align="center">
	<div class="mw-customtoggle-AbilParams" style="cursor:pointer; position:relative; width:85%; background: linear-gradient(#768993, #55646d); 
	display:inline-block; padding:0px 2px; margin:2px; line-height:20px; color:white; font-size:13px;border-radius: 3px;
	">View Param List<span style="position:absolute; left:5px;">&#9662;</span><span style="position:absolute;right:5px;">&#9662;</span>
	</div>
</div>
<div id="mw-customcollapsible-AbilParams" class="mw-collapsible mw-collapsed" style="display:flow-root;">
]=]..(function(args)local t={i=table.insert}for k,v in pairs(args)do t:i('=='..k..'==')t:i(v)end return table.concat(t,'\n')end)(args)..'</div>' or '')
]]--
end
}
