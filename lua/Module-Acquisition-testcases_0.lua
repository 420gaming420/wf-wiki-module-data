--  
local Error = require('Dev:User error');
local notFound = Error('Item "$1" not found or may have an error in [[Module:Acquisition/data]][[Category:Broken Acquisition]]');

return {
	buildTable = {
		options = {
			mode = 'invocation',
			nowiki = false,
		},
		tests = {
			{ nil, 'bad argument #1 to \'upper\' (string expected, got nil)', {err = true} },
			{ '', 'bad argument #1 to \'upper\' (string expected, got nil)', {err = true}  },
			{ 'Name = Ash',
				'{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left" \n'..
				'|-\n'..
				'! style="width: 27.5%;" | Drop \n'..
				'! style="text-align:center" | Chance \n'..
				'! style="text-align:center" | Expected \n'..
				'! style="text-align:center" | Nearly Guaranteed \n'..
				'|-\n'..
				'| Chassis Blueprint\n'..
				'| style="text-align:center" | 10.26%\n'..
				'| rowspan=3 style="text-align:center" | 17&nbsp;&ndash;&nbsp;18 C Rotations\n'..
				'| rowspan=3 style="text-align:center" | 73&nbsp;&#177;&nbsp;21 C Rotations\n'..
				'|-\n'..
				'| Neuroptics Blueprint\n'..
				'| style="text-align:center" | 10.26%\n'..
				'|-\n'..
				'| Systems Blueprint\n'..
				'| style="text-align:center" | 10.53%\n'..
				'|-\n'..
				'|}' },
			{ 'Name = Name = Ash|Prime = t|Neuroptics|Chassis|Systems',
				'{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left" \n'..
				'|-\n'..
				'! style="text-align:center; width: 25%" | Blueprint\n'..
				'! style="text-align:center; width: 25%" | [[File:PrimeHelmet.png|x26px|link=Warframe Neuroptics]]Neuroptics\n'..
				'! style="text-align:center; width: 25%" | [[File:PrimeChassis.png|x26px|link=Warframe Chassis]]Chassis\n'..
				'! style="text-align:center; width: 25%" | [[File:PrimeSystems.png|x26px|link=Warframe Systems]]Systems\n'..
				'|-\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | \n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | \n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | \n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | \n'..
				'|}<div style="text-align: center;"><i>Lith, Meso, Neo, and Axi refer to [[Void Relic]]s&nbsp;&nbsp;|&nbsp;&nbsp;([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics&nbsp;&nbsp;|&nbsp;&nbsp;([[Baro Ki%27Teer|B]]) Denotes [[Baro Ki%27Teer]] Exclusive Void Relic</i></div>' },
			{ 'Name = Gram', (notFound:gsub('$1', 'Gram')) },
			{ 'Name = Gram|Prime = weapon|Blade|Handle',
				'{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left" \n'..
				'|-\n'..
				'! style="text-align:center; width: 33.333333333333%" | Blueprint\n'..
				'! style="text-align:center; width: 33.333333333333%" | [[File:GenericWeaponPrimeBlade.png|x26px|Blade]]Blade\n'..
				'! style="text-align:center; width: 33.333333333333%" | [[File:GenericWeaponPrimeHilt.png|x26px|Handle]]Handle\n'..
				'|-\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | <span class="relic-tooltip" data-param="Neo Z8">[[Neo Z8]]</span> Uncommon<br/><span class="relic-tooltip" data-param="Lith P2">[[Lith P2]]</span> Uncommon ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Meso N7">[[Meso N7]]</span> Uncommon ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi A8">[[Axi A8]]</span> Uncommon ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi O4">[[Axi O4]]</span> Uncommon ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi T5">[[Axi T5]]</span> Uncommon ([[Prime Vault|V]])\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | <span class="relic-tooltip" data-param="Meso R4">[[Meso R4]]</span> Common<br/><span class="relic-tooltip" data-param="Lith N4">[[Lith N4]]</span> Common ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Lith S8">[[Lith S8]]</span> Common ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Lith W1">[[Lith W1]]</span> Common ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Meso M3">[[Meso M3]]</span> Common ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Meso S8">[[Meso S8]]</span> Common ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi A9">[[Axi A9]]</span> Common ([[Prime Vault|V]])\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | <span class="relic-tooltip" data-param="Axi G5">[[Axi G5]]</span> Rare<br/><span class="relic-tooltip" data-param="Neo G1">[[Neo G1]]</span> Rare ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Neo G2">[[Neo G2]]</span> Rare ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi G2">[[Axi G2]]</span> Rare ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi G3">[[Axi G3]]</span> Rare ([[Prime Vault|V]])<br/><span class="relic-tooltip" data-param="Axi G4">[[Axi G4]]</span> Rare ([[Prime Vault|V]])\n'..
				'|}<div style="text-align: center;"><i>Lith, Meso, Neo, and Axi refer to [[Void Relic]]s&nbsp;&nbsp;|&nbsp;&nbsp;([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics&nbsp;&nbsp;|&nbsp;&nbsp;([[Baro Ki%27Teer|B]]) Denotes [[Baro Ki%27Teer]] Exclusive Void Relic</i></div>' },
			{ 'Name = Arcane Energize',
				'{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left" \n'..
				'|-\n'..
				'! style="width: 27.5%;" | Drop \n'..
				'! style="text-align:center" | Chance \n'..
				'! style="text-align:center" | Expected \n'..
				'! style="text-align:center" | Nearly Guaranteed \n'..
				'|-\n'..
				'| Arcane\n'..
				'| style="text-align:center" | 5%\n'..
				'| rowspan=1 style="text-align:center" | 20 captures\n'..
				'| rowspan=1 style="text-align:center" | 135&nbsp;&#177;&nbsp;45 captures\n'..
				'|-\n'..
				'|}' },
		},
	},
};
