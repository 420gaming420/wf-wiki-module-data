---
title: "Module:Acquisition/testcases"
wiki_url: "https://wiki.warframe.com/w/Module/Acquisition/testcases"
wiki_timestamp: "2021-08-06T08:35:08Z"
---

false

---

```lua
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
				'| rowspan=3 style="text-align:center" | 17 – 18 C Rotations\n'..
				'| rowspan=3 style="text-align:center" | 73 ± 21 C Rotations\n'..
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
				'|}

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki%27Teer|B]]) Denotes [[Baro Ki%27Teer]] Exclusive Void Relic

' },
			{ 'Name = Gram', (notFound:gsub('$1', 'Gram')) },
			{ 'Name = Gram|Prime = weapon|Blade|Handle',
				'{| style="width: 100%;" class="article-table" cellspacing="1" cellpadding="1" border="0" align="left" \n'..
				'|-\n'..
				'! style="text-align:center; width: 33.333333333333%" | Blueprint\n'..
				'! style="text-align:center; width: 33.333333333333%" | [[File:GenericWeaponPrimeBlade.png|x26px|Blade]]Blade\n'..
				'! style="text-align:center; width: 33.333333333333%" | [[File:GenericWeaponPrimeHilt.png|x26px|Handle]]Handle\n'..
				'|-\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | [[Neo Z8]] Uncommon  
[[Lith P2]] Uncommon ([[Prime Vault|V]])  
[[Meso N7]] Uncommon ([[Prime Vault|V]])  
[[Axi A8]] Uncommon ([[Prime Vault|V]])  
[[Axi O4]] Uncommon ([[Prime Vault|V]])  
[[Axi T5]] Uncommon ([[Prime Vault|V]])\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | [[Meso R4]] Common  
[[Lith N4]] Common ([[Prime Vault|V]])  
[[Lith S8]] Common ([[Prime Vault|V]])  
[[Lith W1]] Common ([[Prime Vault|V]])  
[[Meso M3]] Common ([[Prime Vault|V]])  
[[Meso S8]] Common ([[Prime Vault|V]])  
[[Axi A9]] Common ([[Prime Vault|V]])\n'..
				'| style="text-align:center; font-size:14px; padding: 6px 0px" | [[Axi G5]] Rare  
[[Neo G1]] Rare ([[Prime Vault|V]])  
[[Neo G2]] Rare ([[Prime Vault|V]])  
[[Axi G2]] Rare ([[Prime Vault|V]])  
[[Axi G3]] Rare ([[Prime Vault|V]])  
[[Axi G4]] Rare ([[Prime Vault|V]])\n'..
				'|}

Lith, Meso, Neo, and Axi refer to [[Void Relic]]s  |  ([[Prime Vault|V]]) Denotes [[Prime Vault|Vaulted]] Void Relics  |  ([[Baro Ki%27Teer|B]]) Denotes [[Baro Ki%27Teer]] Exclusive Void Relic

' },
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
				'| rowspan=1 style="text-align:center" | 135 ± 45 captures\n'..
				'|-\n'..
				'|}' },
		},
	},
};
```

