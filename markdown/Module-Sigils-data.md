---
title: "Module:Sigils/data"
wiki_url: "https://wiki.warframe.com/w/Module/Sigils/data"
wiki_timestamp: "2026-09-03T20:58:31Z"
---

Database for [Sigils](/w/Sigils "Sigils").

## Sigil Entry Schema

[[edit source](/w/Module:Sigils/data/doc?action=edit&section=T-1 "Edit section's source code: Sigil Entry Schema")]

```lua
	["Sigil Name"] = {
		Description = "Sigil description",
		Image = "SigilName.png",
		Name = "Sigil Name",
		Link = "Article Name",
		SellPrice = 1000,
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| Description | String | ✔️ | In-game item description | `"A sigil representing prestige gained with the Ostron."` |
| Image | String | ✔️ | Image file name of the sigil as seen in in-game menus | `"LeapingThrasherSigil.png"` |
| Name | String | ✔️ | Name of sigil as seen in-game | `"Bloodshed Sigil"` |
| Link | String | ✔️ | Page/article link to the related article on the wiki | `"Stalker"` |
| SellPrice | Number | ❌ | Sigil's selling price in [Credits](/w/Credits "Credits") | `1000` |

## Sigil Data

[[edit source](/w/Module:Sigils/data/doc?action=edit&section=T-2 "Edit section's source code: Sigil Data")]

---

```lua
return {
	["10 Year Anniversary Community Sigil"] = {
		Description = "A sigil celebrating 10 years of Warframe, created by kedemel.",
		Image = "10YearAnniversaryCommunitySigil(SxWhite).png",
		Name = "10 Year Anniversary Community Sigil"
	},
	["2-For-1 Sigil"] = {
		Image = "2-For-1Sigil(SxWhite).png",
		Name = "2-For-1 Sigil",
		Description = "A sigil representing prestige gained with The Hex.",
		Link = "Sigils#The Hex"
	},
	["Accord Sigil"] = {
		Image = "AccordSigil(SxWhite).png",
		Name = "Accord Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Acolyte Sigil"] = {
		Image = "AcolyteSigil(SxWhite).png",
		Name = "Acolyte Sigil",
		Description = "Never forget those who would defile the Tenno ways.",
		Link = "Sigils#Event Sigils"
	},
	["Alad V Sigil"] = {
		Description = "A sigil depicting Alad V.",
		Image = "AladVSigil(SxWhite).png",
		Name = "Alad V Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Ambition Sigil"] = {
		Image = "AmbitionSigil(SxWhite).png",
		Name = "Ambition Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Ambulas Reborn Sigil"] = {
		Image = "AmbulasRebornEmblem.png",
		Name = "Ambulas Reborn Sigil",
		Description = "A sigil commemorating the fight against the Ambulas incursion.",
		Link = "Sigils#Event Sigils"
	},
	["Ambulas Sigil"] = {
		Description = "A sigil depicting the Ambulas.",
		Image = "AmbulasSigil(SxWhite).png",
		Name = "Ambulas Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Arbiters of Hexis Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "ArbitersofHexisSigil(SxWhite).png",
		Name = "Arbiters of Hexis Sigil",
		Link = "Sigils#Arbiters of Hexis"
	},
	["Archon Nira Sigil"] = {
		Description = "A sigil depicting one of Erra’s Archon monstrosities.",
		Image = "ArchonNiraSigil(SxWhite).pnf",
		Name = "Archon Nira Sigil",
	},
	["Armada Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "ArmadaSigil(SxWhite).png",
		Name = "Armada Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Armored Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "ArmoredSigil(SxWhite).png",
		Name = "Armored Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Ascrien Sigil"] = {
		Description = "Peer deep into this entrancing sigil.",
		Image = "AscrienSigil.png",
		Name = "Ascrien Sigil",
		Link = "Sigils#Nightwave"
	},
	["Aspirant Sigil"] = {
		Description = "Show your dedication to the truth of Aspirant Zorba with this sigil.",
		Image = "AspirantSigil(SxWhite).png",
		Name = "Aspirant Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Assassin Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "AssassinSigil(SxWhite).png",
		Name = "Assassin Sigil",
		Link = "Sigils#Red Veil"
	},
	["Atomic Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "AtomicSigil(SxWhite).png",
		Name = "Atomic Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Atramentum Sigil"] = {
		Description = "Keep the memory of the Shadowgrapher and Operation: Atramentum close with this sigil.",
		Image = "AtramentumSigil(SxWhite).png",
		Name = "Atramentum Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Awakened Luna Sigil"] = {
		Image = "AwakenedLunaSigil(SxWhite).png",
		Name = "Awakened Luna Sigil",
		Description = "Wake to a new light.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Awakening Sigil"] = {
		Image = "AwakeningSigil(SxWhite).png",
		Name = "Awakening Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Awareness Sigil"] = {
		Image = "AwarenessSigil(SxWhite).png",
		Name = "Awareness Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Banshee Soprana Sigil"] = {
		Image = "BansheeDeluxeSigil(SxWhite).png",
		Name = "Banshee Soprana Sigil",
		Description = "Wear Banshee Soprana's sigil with pride.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Belly of the Beast Sigil"] = {
		Description = "A sigil for the Tenno who played their part in Operation: Belly of the Beast.",
		Image = "BellyOfTheBeastEmblem(ExWhite).png",
		Name = "Belly of the Beast Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Bending Will Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "BendingWillSigil(SxWhite).png",
		Name = "Bending Will Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Big Bytes Pizza Sigil"] = {
		Image = "BigBytesPizzaSigil(SxWhite).png",
		Name = "Big Bytes Pizza Sigil",
		Description = "Give your fellow Tenno a case of the munchies with Slice-Z from Big Bytes Pizza.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Bird 3 Sigil"] = {
		Image = "Bird3Sigil(SxWhite).png",
		Name = "Bird 3 Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Blade and Gun Sigil"] = {
		Image = "BladeAndGun.png",
		Name = "Blade and Gun Sigil",
		Description = "Awarded to dedicated members within the Warframe community.",
		Link = "Sigils#Community Event Sigils"
	},
	["Blades Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "BladesSigil(SxWhite).png",
		Name = "Blades Sigil",
		Link = "Sigils#Red Veil"
	},
	["Bloodshed Sigil"] = {
		Image = "BloodiedSigil.png",
		Name = "Bloodshed Sigil",
		Description = "With this sigil, damage will leave you blood-soaked, while in Captura your Warframe stands wreathed in the gore of its enemies. Honor the Maiden of Death by donning her traditional garb.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Bloom Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "BloomSigil(SxWhite).png",
		Name = "Bloom Sigil",
		Link = "Sigils#New Loka"
	},
	["Bounty Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "BountySigil(SxWhite).png",
		Name = "Bounty Sigil",
		Link = "Sigils#New Loka"
	},
	["Broadsword Past/Future Sigil"] = {
		Description = "Display the faces of leadership with this sigil.",
		Image = "BroadswordPastFutureSigil(SxWhite).png",
		Name = "Broadsword Past/Future Sigil",
		Link = "Sigils#New Loka"
	},
	["Buried Debts Sigil"] = {
		Image = "BuriedDebtsSigil(SxWhite).png",
		Name = "Buried Debts Sigil",
		Description = "For those who have performed great works, safeguarding Fortuna against the ravages of Exploiter and her thermia fractures.",
		Link = "Sigils#Event Sigils"
	},
	["Calculating Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "CalculatingSigil(SxWhite).png",
		Name = "Calculating Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Capala Jade Sigil"] = {
		Image = "CapalaJadeSigil(SxWhite).png",
		Name = "Capala Jade Sigil",
		Link = "Sigils#XBox One Bundle Sigils"
	},
	["Capital Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "CapitalSigil(SxWhite).png",
		Name = "Capital Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Cavia Assistant Sigil"] = {
		Image = "CaviaAssistantSigil(SxWhite).png",
		Name = "Cavia Assistant Sigil",
		Description = "A sigil representing prestige gained with the Cavia.",
		Link = "Sigils#Cavia"
	},
	["Cavia Colleague Sigil"] = {
		Image = "CaviaColleagueSigil(SxWhite).png",
		Name = "Cavia Colleague Sigil",
		Description = "A sigil representing prestige gained with the Cavia.",
		Link = "Sigils#Cavia"
	},
	["Cavia Illuminate Sigil"] = {
		Image = "CaviaIlluminateSigil(SxWhite).png",
		Name = "Cavia Illuminate Sigil",
		Description = "A sigil representing prestige gained with the Cavia.",
		Link = "Sigils#Cavia"
	},
	["Cavia Researcher Sigil"] = {
		Image = "CaviaResearcherSigil(SxWhite).png",
		Name = "Cavia Researcher Sigil",
		Description = "A sigil representing prestige gained with the Cavia.",
		Link = "Sigils#Cavia"
	},
	["Cavia Scholar Sigil"] = {
		Image = "CaviaScholarSigil(SxWhite).png",
		Name = "Cavia Scholar Sigil",
		Description = "A sigil representing prestige gained with the Cavia.",
		Link = "Sigils#Cavia"
	},
	["Cephalon Simaris Sigil"] = {
		Image = "CephalonSimarisSigil(SxWhite).png",
		Name = "Cephalon Simaris Sigil",
		Description = "Sigil depicting the Sanctuary Warden, Cephalon Simaris.",
		Link = "Sigils#Cephalon Simaris Sigils"
	},
	["Cephalon Suda Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "CephalonSudaSigil(SxWhite).png",
		Name = "Cephalon Suda Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Chairman Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "ChairmanSigil(SxWhite).png",
		Name = "Chairman Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Champion Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "ChampionSigil(SxWhite).png",
		Name = "Champion Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Chillwave Sigil"] = {
		Description = "Beat the heat with this unique Sigil.",
		Image = "ChillwaveSigil(SxWhite).png",
		Name = "Chillwave Sigil",
	},
	["Choice Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "ChoiceSigil(SxWhite).png",
		Name = "Choice Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Citrine Sigil"] = {
		Description = "Pay adulation to Citrine and her last wish with this exclusive sigil.",
		Image = "CitrineSigil(SxWhite).png",
		Name = "Citrine Sigil",
	},
	["Clarity Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "ClaritySigil(SxWhite).png",
		Name = "Clarity Sigil",
		Link = "Sigils#New Loka"
	},
	["Community of Tenno"] = {
		Image = "CommunityOfTenno(SxWhite).png",
		Name = "Community of Tenno",
		Description = "Dedicated to the amazing Warframe community.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Conclave Sigil"] = {
		Image = "ConclaveSigil(SxWhite).png",
		Name = "Conclave Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Condrix Sigil"] = {
		Image = "CondrixSigil(SxWhite).png",
		Name = "Condrix Sigil",
		Description = "A sigil depicting a Sentient Condrix.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Conquera Sigil"] = {
		Image = "ConqueraSigil.png",
		Name = "Conquera Sigil",
		Description = "Wear the Sigil as a symbol of support in the fight to conquer a disease that touches us all.",
		Link = "Sigils#Event Sigils"
	},
	["Conquera United Sigil"] = {
		Image = "ConqueraUnitedSigil.png",
		Name = "Conquera United Sigil",
		Description = "Display this Sigil and stand united in support of the Quest To Conquer Cancer.",
		Link = "Sigils#Event Sigils"
	},
	["Converted Coda Sigil"] = {
		Image = "ConvertedCodaSigil(SxWhite).png",
		Name = "Converted Coda Sigil",
		Description = "The show must go on. This sigil marks the conversion of a hostile Technocyte Coda into a Techrot friend.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Covert Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "CovertSigil(SxWhite).png",
		Name = "Covert Sigil",
		Link = "Sigils#Red Veil"
	},
	["Cull Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "CullSigil(SxWhite).png",
		Name = "Cull Sigil",
		Link = "Sigils#Red Veil"
	},
	["Cycle Five Sigil"] = {
		Image = "PS4FiveYearSigil(SxWhite).png",
		Name = "Cycle Five Sigil",
		Link = "Sigils#PS4 Anniversary Sigils"
	},
	["Cycle Four Sigil"] = {
		Image = "CycleFourSigil(SxWhite).png",
		Name = "Cycle Four Sigil",
		Link = "Sigils#PS4 Anniversary Sigils"
	},
	["Cycle One Sigil"] = {
		Image = "CycleOneSigil(SxWhite).png",
		Name = "Cycle One Sigil",
		Link = "Sigils#PS4 Anniversary Sigils"
	},
	["Cycle Three Sigil"] = {
		Image = "CycleThreeSigil(SxWhite).png",
		Name = "Cycle Three Sigil",
		Link = "Sigils#PS4 Anniversary Sigils"
	},
	["Cycle Two Sigil"] = {
		Image = "CycleTwoSigil(SxWhite).png",
		Name = "Cycle Two Sigil",
		Link = "Sigils#PS4 Anniversary Sigils"
	},
	["Cycuta Prime Sigil"] = {
		Image = "PrimeAccessSarynSigil.png",
		Name = "Cycuta Prime Sigil",
		Description = "This ancient glyph was the focus of an ancient Tenno meditation ritual.",
		Link = "Sigils#Prime Access Sigils"
	},
	["Cyte-09 Target Sigil"] = {
		Image = "Cyte-09TargetSigil(SxWhite).png",
		Name = "Cyte-09 Target Sigil",
		Description = "Lock onto your target with this Sigil that honors Cyte-09."
	},
	["Dante's Noctua Sigil"] = {
		Image = "Dante'sNoctuaSigil(SxWhite).png",
		Name = "Dante's Noctua Sigil",
		Description = "A sigil depicting Dante's treasured Tome."
	},
	["Day of the Dead Sigil"] = {
		Image = "DayoftheDeadSigil(SxWhite).png",
		Name = "Day of the Dead Sigil",
		Link = "Sigil#Tactical Alert Sigils",
		Description = "A morbidly festive sigil."
	},
	["Deca Heirloom Sigil"] = {
		Image = "DecaHeirloomSigil.png",
		Name = "Deca Heirloom Sigil",
		Description = "A sigil that celebrates the Tenno’s loyalty and dedication."
	},
	["Defiance Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "DefianceSigil(SxWhite).png",
		Name = "Defiance Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Diligence Sigil"] = {
		Image = "DiligenceSigil(SxWhite).png",
		Name = "Diligence Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Directives Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "DirectivesSigil(SxWhite).png",
		Name = "Directives Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Disciple Sigil"] = {
		Image = "DiscipleSigil.png",
		Name = "Disciple Sigil",
		Link = "Sigils#Founder Sigils"
	},
	["Discipline Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "DisciplineSigil(SxWhite).png",
		Name = "Discipline Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Discovery Sigil"] = {
		Image = "DiscoverySigil(SxWhite).png",
		Name = "Discovery Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Discretion Sigil"] = {
		Image = "DiscretionSigil(SxWhite).png",
		Name = "Discretion Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["DJ Shockwave Sigil"] = {
		Image = "DJShockwaveSigil(SxWhite).png",
		Name = "DJ Shockwave Sigil",
		Description = "A sigil commemorating when Amir took over the airwaves as DJ Shockwave.",
		Link = "Sigils#Nightwave"
	},
	["Dog Days Sigil"] = {
		Image = "DogDaysIcon.png",
		Name = "Dog Days Sigil",
		Description = "Beat the heat with this unique Sigil.",
		Link = "Sigils#Tactical Alert Sigils"
	},
	["Drippy Dog Days Sigil"] = {
		Image = "DrippyDogDaysSigil(SxWhite).png",
		Name = "Drippy Dog Days Sigil",
		Description = "Beat the heat like it's 1999 with this Drippy sigil!"
	},
	["Drippy Sigil"] = {
		Image = "DrippySigil(SxWhite).png",
		Name = "Drippy Sigil",
		Description = "Party like it's 1999 with this Drippy Sigil!",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Drippy Splash Sigil"] = {
		Description = "This Drippy sigil adds a little splash and a lot of drip.",
		Image = "DrippySplashSigil(SxWhite).png",
		Name = "Drippy Splash Sigil"
	},
	["Dropkick Drahk Sigil"] = {
		Description = "The Drahk is poised for the takedown.",
		Image = "DropkickDrahkSigil(SxWhite).png",
		Name = "Dropkick Drahk Sigil"
	},
	["Eight Claw Sigil"] = {
		Description = "Commemorate the fight against Neci Rusalka for the throne of Duviri during Operation: Eight Claw with this sigil.",
		Image = "EightClawSigil(SxWhite).png",
		Name = "Eight Claw Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Ember Heirloom Sigil"] = {
		Image = "EmberHeirloomSigil.png",
		Name = "Ember Heirloom Sigil",
		Description = "A sigil that celebrates Ember's legacy.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Emissary Sigil"] = {
		Image = "EmissarySigil.png",
		Name = "Emissary Sigil",
		Description = "Display the mark of Arlo's devoted with this Sigil.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Empathy Sigil"] = {
		Image = "EmpathySigil(SxWhite).png",
		Name = "Empathy Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Empyrean Sigil"] = {
		Image = "EmpyreanSigil(SxWhite).png",
		Name = "Empyrean Sigil",
		Description = "The same sigil that was proudly worn by Old War Railjack crews.",
		Link = "Sigils#Platinum Pack Sigils"
	},
	["Enlightenment Sigil"] = {
		Image = "EnlightenmentSigil(SxWhite).png",
		Name = "Enlightenment Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Entrati Acquaintance Sigil"] = {
		Image = "EntratiAcquaintanceSigil(SxWhite).png",
		Name = "Entrati Acquaintance Sigil",
		Description = "A sigil representing prestige gained with the Entrati.",
		Link = "Sigils#Entrati"
	},
	["Entrati Associate Sigil"] = {
		Image = "EntratiAssociateSigil(SxWhite).png",
		Name = "Entrati Associate Sigil",
		Description = "A sigil representing prestige gained with the Entrati.",
		Link = "Sigils#Entrati"
	},
	["Entrati Family Sigil"] = {
		Image = "EntratiFamilySigil(SxWhite).png",
		Name = "Entrati Family Sigil",
		Description = "A sigil representing prestige gained with the Entrati.",
		Link = "Sigils#Entrati"
	},
	["Entrati Friend Sigil"] = {
		Image = "EntratiFriendSigil(SxWhite).png",
		Name = "Entrati Friend Sigil",
		Description = "A sigil representing prestige gained with the Entrati.",
		Link = "Sigils#Entrati"
	},
	["Entrati Stranger Sigil"] = {
		Image = "EntratiStrangerSigil(SxWhite).png",
		Name = "Entrati Stranger Sigil",
		Description = "A sigil representing prestige gained with the Entrati.",
		Link = "Sigils#Entrati"
	},
	["Eskhatos Necraloid Sigil"] = {
		Image = "EskhatosNecraloidSigil(SxWhite).png",
		Name = "Eskhatos Necraloid Sigil",
		Description = "A sigil bearing a twisted yet familiar visage.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Eternal Stasis Sigil"] = {
		Image = "EternalStasisSigil(SxWhite).png",
		Name = "Eternal Stasis Sigil",
		Description = "Commemorates the beginning of the long-sleep.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Evergreen Sigil"] = {
		Image = "EvergreenSigil(SxWhite).png",
		Link = "Sigil#Tactical Alert Sigils",
		Name = "Evergreen Sigil",
	},
	["Exclusive Sigil"] = {
		Image = "PS4ExclusiveSigil(SxWhite).png",
		Name = "Exclusive Sigil",
		Link = "Sigils#PS4 Bundle Sigils"
	},
	["False Profit Sigil"] = {
		Image = "FalseProfitSigil(SxWhite).png",
		Name = "False Profit Sigil",
		Description = "This sigil commemorates the Tenno victory over the machinations of Nef Anyo.",
		Link = "Sigils#Event Sigils"
	},
	["Festive Sigil"] = {
		Image = "FestiveSigil(SxWhite).png",
		Name = "Festive Sigil",
		Description = "A sigil containing a festive design.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Fibonacci Sigil"] = {
		Image = "FibonacciSigil(SxWhite).png",
		Name = "Fibonacci Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Fractal Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "FractalSigil(SxWhite).png",
		Name = "Fractal Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Freedom Fighter Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "FreedomFighterSigil(SxWhite).png",
		Name = "Freedom Fighter Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Freedom Sigil"] = {
		Image = "FreedomSigil(SxWhite).png",
		Name = "Freedom Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Fresh Slice Sigil"] = {
		Image = "FreshSliceSigil(SxWhite).png",
		Name = "Fresh Slice Sigil",
		Description = "A sigil representing prestige gained with The Hex.",
		Link = "Sigils#The Hex"
	},
	["Gaia Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "GaiaSigil(SxWhite).png",
		Name = "Gaia Sigil",
		Link = "Sigils#New Loka"
	},
	["Gantulyst Sigil"] = {
		Description = "An imprint of a fallen Gantulyst.",
		Image = "GantulystSigil(SxWhite).png",
		Name = "Gantulyst Sigil",
		Link = "Sigils#Enemy Drop Sigils",
	},
	["Gilded Clan Sigil"] = {
		Description = "This sigil is worn by the members united within a Clan.",
		Image = "ClanSigilGilded(SxLight).png",
		Link = "Sigil#Event Sigils",
		Name = "Gilded Clan Sigil",
	},
	["Glaring Sigil"] = {
		Image = "GlaringSigil(SxWhite).png",
		Name = "Glaring Sigil",
		Description = "A sigil representing your Kavat allegiance.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Glassmaker Sigil"] = {
		Image = "GlassmakerSigil(SxWhite).png",
		Name = "Glassmaker Sigil",
		Description = "A sigil commemorating your grim descent into the madness of the Glassmaker.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Glyphed Clan Sigil"] = {
		Description = "This sigil is worn by the members united within a Clan.",
		Image = "ClanSigilGlyphed(SxLight).png",
		Link = "Sigil#Event Sigils",
		Name = "Glyphed Clan Sigil",
	},
	["Grand Master Sigil"] = {
		Image = "GrandMasterSigil.png",
		Name = "Grand Master Sigil",
		Link = "Sigils#Founder Sigils"
	},
	["Grasp Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "GraspSigil(SxWhite).png",
		Name = "Grasp Sigil",
		Link = "Sigils#Arbiters of Hexis"
	},
	["Grim Grin Naberus Sigil"] = {
		Image = "GrimGrinNaberusSigil(SxWhite).png",
		Name = "Grim Grin Naberus Sigil",
		Link = "Sigil#Event Sigils",
		Description = "A morbidly festive Naberus sigil."
	},
	["Growth Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "GrowthSigil(SxWhite).png",
		Name = "Growth Sigil",
		Link = "Sigils#New Loka"
	},
	["Grustrag Sigil"] = {
		Description = "A sigil depicting the emblem of the Grustrag Three.",
		Image = "GrustragSigil(SxWhite).png",
		Name = "Grustrag Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Guide of the Lotus"] = {
		Image = "LotusGuideBadge.png",
		Name = "Guide of the Lotus",
		Description = "Awarded to Tenno who assist the Lotus by helping other Tenno.",
		Link = "Sigils#Other Sigils"
	},
	["Guiding Path Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "GuidingPathSigil(SxWhite).png",
		Name = "Guiding Path Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Hemocyte Sigil"] = {
		Image = "HemocyteSigil(SxWhite).png",
		Name = "Hemocyte Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Hexan Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "HexanSigil(SxWhite).png",
		Name = "Hexan Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Holdfasts Angel Sigil"] = {
		Image = "HoldfastsAngelSigil(SxWhite).png",
		Name = "Holdfasts Angel Sigil",
		Description = "A sigil representing prestige gained with the Holdfasts.",
		Link = "Sigils#The Holdfasts"
	},
	["Holdfasts Fallen Sigil"] = {
		Image = "HoldfastsFallenSigil(SxWhite).png",
		Name = "Holdfasts Fallen Sigil",
		Description = "A sigil representing prestige gained with the Holdfasts.",
		Link = "Sigils#The Holdfasts"
	},
	["Holdfasts Guardian Sigil"] = {
		Image = "HoldfastsGuardianSigil(SxWhite).png",
		Name = "Holdfasts Guardian Sigil",
		Description = "A sigil representing prestige gained with the Holdfasts.",
		Link = "Sigils#The Holdfasts"
	},
	["Holdfasts Seraph Sigil"] = {
		Image = "HoldfastsSeraphSigil(SxWhite).png",
		Name = "Holdfasts Seraph Sigil",
		Description = "A sigil representing prestige gained with the Holdfasts.",
		Link = "Sigils#The Holdfasts"
	},
	["Holdfasts Watcher Sigil"] = {
		Image = "HoldfastsWatcherSigil(SxWhite).png",
		Name = "Holdfasts Watcher Sigil",
		Description = "A sigil representing prestige gained with the Holdfasts.",
		Link = "Sigils#The Holdfasts"
	},
	["Hostile Mergers Sigil"] = {
		Image = "HostileMergersSigil(SxWhite).png",
		Name = "Hostile Mergers Sigil",
		Description = "This sigil commemorates the Tenno victory over the machinations of Alad V and his Amalgam Project.",
		Link = "Sigils#Event Sigils"
	},
	["Hot & Fresh Sigil"] = {
		Image = "Hot&FreshSigil(SxWhite).png",
		Name = "Hot & Fresh Sigil",
		Description = "A sigil representing prestige gained with The Hex.",
		Link = "Sigils#The Hex"
	},
	["Hounding Kubrow Sigil"] = {
		Image = "HoundingKubrowSigil(SxWhite).png",
		Name = "Hounding Kubrow Sigil",
		Link = "Sigil#Event Sigils",
		Description = "Be the predator, not the prey."
	},
	["Humanity Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "HumanitySigil(SxWhite).png",
		Name = "Humanity Sigil",
		Link = "Sigils#New Loka"
	},
	["Hunter Sigil"] = {
		Image = "HunterSigil.png",
		Name = "Hunter Sigil",
		Link = "Sigils#Founder Sigils"
	},
	["Hydrolyst Sigil"] = {
		Description = "An imprint of a fallen Hydrolyst.",
		Image = "HydrolystSigil(SxWhite).png",
		Name = "Hydrolyst Sigil",
		Link = "Sigils#Enemy Drop Sigils",
	},
	["Hyena Sigil"] = {
		Description = "A sigil depicting the Hyena Pack.",
		Image = "HyenaPackSigil(SxWhite).png",
		Name = "Hyena Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Imminent Eclipse Sigil"] = {
		Image = "ImminentEclipseSigil(SxWhite).png",
		Name = "Imminent Eclipse Sigil",
		Description = "Captures the moment when the darkness overcomes the light.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Inktober Sigil"] = {
		Image = "InktoberGlyph.png",
		Name = "Inktober Sigil",
		Description = "A sigil awarded for Inktober.",
		Link = "Sigils#Event Sigils"
	},
	["Insight Sigil"] = {
		Image = "InsightSigil(SxWhite).png",
		Name = "Insight Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Jackal Sigil"] = {
		Description = "A sigil depicting the Jackal.",
		Image = "JackalSigil(SxWhite).png",
		Name = "Jackal Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000
	},
	["Jade Ophanim Sigil"] = {
		Description = "A sigil depicting Jade’s Ophanim gaze.",
		Image = "JadeOphanimSigil(SxWhite).png",
		Name = "Jade Ophanim Sigil",
	},
	["Kahl's Fortitude Sigil"] = {
		Description = "Loyalty can inspire courage.",
		Image = "Kahl'sFortitudeSigil(SxWhite).png",
		Name = "Kahl's Fortitude Sigil",
	},
	["Kela De Thaym Sigil"] = {
		Description = "A sigil depicting Kela De Thaym.",
		Image = "KelaDeThaymSigil(SxWhite).png",
		Name = "Kela De Thaym Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000
	},
	["Kickback Sigil"] = {
		Description = "High speed movement can leave its mark. Gauss Moto's signature sigil.",
		Image = "KickbackSigil.png",
		Name = "Kickback Sigil",
		Link = "Sigils#Deluxe Sigils"
	},
	["Koumei Ito Sigil"] = {
		Description = "Invoke the weaver of fate.",
		Image = "KoumeiItoSigil(SxWhite).png",
		Name = "Koumei Ito Sigil"
	},
	["Kumuda Sigil"] = {
		Image = "KumudaSigil(SxWhite).png",
		Name = "Kumuda Sigil",
		Description = "Pay respect to The Lotus with this elegant sigil.",
		Link = "Sigils#Platinum Pack Sigils"
	},
	["Labyrinth Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "LabyrinthSigil(SxWhite).png",
		Name = "Labyrinth Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Leaping Thrasher Sigil"] = {
		Image = "LeapingThrasherSigil(SxWhite).png",
		Name = "Leaping Thrasher Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		Description = "A sigil depicting a Leaping Thrasher.",
		SellPrice = 1000,
	},
	["Lech Kril Sigil"] = {
		Description = "A sigil depicting Lieutenant Lech Kril.",
		Image = "LechKrilSigil(SxWhite).png",
		Name = "Lech Kril Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Leftovers Sigil"] = {
		Image = "LeftoversSigil(SxWhite).png",
		Name = "Leftovers Sigil",
		Description = "A sigil representing prestige gained with The Hex.",
		Link = "Sigils#The Hex"
	},
	["Legacy Mastery Sigil"] = {
		Description = "This legacy sigil represents the pinnacle of mastery within the Tenno.",
		Image = "LegacyMasterySigil.png",
		Name = "Legacy Mastery Sigil",
	},
	["Lephantis Sigil"] = {
		Description = "A sigil depicting the Lephantis.",
		Image = "LephantisSigil(SxWhite).png",
		Name = "Lephantis Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Lesion Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "LesionSigil(SxWhite).png",
		Name = "Lesion Sigil",
		Link = "Sigils#Red Veil"
	},
	["Lift Together Sigil"] = {
		Image = "LiftTogetherSigil(SxWhite).png",
		Name = "Lift Together Sigil",
		Description = "A sigil depicting the mark of Solaris United.",
		Link = "Sigils#Event Sigils"
	},
	["Lotus Deliverance Sigil"] = {
		Image = "LotusDeliveranceSigil(SxWhite).png",
		Name = "Lotus Deliverance Sigil",
		Description = "Remembers the one who awakens.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Lunar Renewal Horse Sigil"] = {
		Image = "LunarRenewalHorseSigil(SxRed).png",
		Name = "Lunar Renewal Horse Sigil",
		Description = "Gallop into the coming year with the freedom of the loyal horse.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Lunar Renewal Ox Sigil"] = {
		Image = "LunarRenewalOxSigil(SxRed).png",
		Name = "Lunar Renewal Ox Sigil",
		Description = "Celebrate the new lunar year with the power of the noble ox.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Lunar Renewal Prowl Sigil"] = {
		Image = "LunarRenewalProwlSigil(SxRed).png",
		Name = "Lunar Renewal Prowl Sigil",
		Description = "Face the coming year with the boldness of the legendary tiger.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Lunar Renewal Snake Sigil"] = {
		Description = "Transform in the coming year with the intuition of the elegant snake.",
		Image = "LunarRenewalSnakeSigil(SxRed).png",
		Name = "Lunar Renewal Snake Sigil",
	},
	["Lunar Renewal Soar Sigil"] = {
		Description = "Soar into the coming year with the power of the honourable dragon.",
		Image = "LunarRenewalSoarSigil(SxRed).png",
		Name = "Lunar Renewal Soar Sigil",
	},
	["Lunar Renewal Swift Sigil"] = {
		Image = "LunarRenewalSwiftSigil(SxRed).png",
		Name = "Lunar Renewal Swift Sigil",
		Description = "Celebrate Lunar Renewal with the kind heart of the gentle rabbit.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Lunar Renewal Tiger Sigil"] = {
		Image = "LunarRenewalTigerSigil(SxRed).png",
		Name = "Lunar Renewal Tiger Sigil",
		Description = "Celebrate the Lunar Renewal with the bravery of the legendary tiger.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Lynx Sigil"] = {
		Description = "A sigil depicting the Lynx.",
		Image = "LynxSigil(SxWhite).png",
		Name = "Lynx Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Maelstrom Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "MaelstromSigil(SxWhite).png",
		Name = "Maelstrom Sigil",
		Link = "Sigils#Red Veil"
	},
	["Malevolent Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "MalevolentSigil(SxWhite).png",
		Name = "Malevolent Sigil",
		Link = "Sigils#Red Veil"
	},
	["Manifold Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "ManifoldSigil(SxWhite).png",
		Name = "Manifold Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Master Sigil"] = {
		Image = "MasterSigil.png",
		Name = "Master Sigil",
		Link = "Sigils#Founder Sigils"
	},
	["Mastery Sigil"] = {
		Image = "MasterySigilR.png",
		Name = "Mastery Sigil",
		Description = "This sigil represents the pinnacle of mastery within the Tenno.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Mesa Heirloom Sigil"] = {
		Image = "MesaHeirloomSigil.png",
		Name = "Mesa Heirloom Sigil",
		Description = "Mesa Heirloom's sigil warns outlaws their time has come.",
		Link = "Sigils#Purchasable Sigils",
	},
	["Monquis Sigil"] = {
		Description = "This is a unique sigil depicting a mysterious creature of ancient Earth.",
		Image = "MonquisSigil(SxWhite).png",
		Name = "Monquis Sigil",
	},
	["Multivariate Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "MultivariateSigil(SxWhite).png",
		Name = "Multivariate Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Narmer Eye Sigil"] = {
		Description = "Don this symbol of Ballas' twisted Narmer plan.",
		Image = "NarmerEyeSigil(SxWhite).png",
		Name = "Narmer Eye Sigil",
	},
	["Nava Sigil"] = {
		Image = "NavaSigil(SxWhite).png",
		Name = "Nava Sigil",
		Description = "Pay respect to The Lotus with this elegant sigil.",
		Link = "Sigils#Platinum Pack Sigils"
	},
	["Necraloid Agnesis Sigil"] = {
		Image = "NecraloidAgnesisSigil(SxWhite).png",
		Name = "Necraloid Agnesis Sigil",
		Description = "A sigil representing prestige gained with the Necraloid.",
		Link = "Sigils#Necraloid"
	},
	["Necraloid Modus Sigil"] = {
		Image = "NecraloidModusSigil(SxWhite).png",
		Name = "Necraloid Modus Sigil",
		Description = "A sigil representing prestige gained with the Necraloid.",
		Link = "Sigils#Necraloid"
	},
	["Necraloid Odima Sigil"] = {
		Image = "NecraloidOdimaSigil(SxWhite).png",
		Name = "Necraloid Odima Sigil",
		Description = "A sigil representing prestige gained with the Necraloid.",
		Link = "Sigils#Necraloid"
	},
	["Necraloid Sigil"] = {
		Image = "NecraloidSigil(SxWhite).png",
		Name = "Necraloid Sigil",
		Description = "Are you as wormed as the others?"
	},
	["Nef Anyo Sigil"] = {
		Image = "NefAnyoSigil(SxWhite).png",
		Name = "Nef Anyo Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["New Loka Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "NewLokaSigil(SxWhite).png",
		Name = "New Loka Sigil",
		Link = "Sigils#New Loka"
	},
	["Nightwave Sigil"] = {
		Image = "NightwaveEmblem.png",
		Name = "Nightwave Sigil",
		Description = "For the Sleepless, the Dreamers.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Nistlebrush Sigil"] = {
		Image = "NistlebrushSigil(SxWhite).png",
		Link = "Sigil#Tactical Alert Sigils",
		Name = "Nistlebrush Sigil",
	},
	["Obsidian Corvus Sigil"] = {
		Image = "ObsidianCorvusSigil(SxWhite).png",
		Name = "Obsidian Corvus Sigil",
		Link = "Sigils#PS4 Bundle Sigils"
	},
	["Obsidian Indra Sigil"] = {
		Image = "ObsidianIndraSigil(SxWhite).png",
		Name = "Obsidian Indra Sigil",
		Link = "Sigils#PS4 Bundle Sigils"
	},
	["Obsidian Sigil"] = {
		Image = "ObsidianSigil(SxWhite).pmg",
		Name = "Obsidian Sigil",
		Link = "Sigils#PS4 Bundle Sigils"
	},
	["Old Blood Sigil"] = {
		Image = "OldBloodSigil(SxWhite).png",
		Name = "Old Blood Sigil",
		Description = "The sigil of one who has bested an inhuman adversary born of the Old Blood: a Kuva Lich.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Operation Orphix Venom Sigil"] = {
		Description = "A sigil for veterans of Operation Orphix Venom.",
		Image = "OperationOrphixVenomSigil(SxWhite).png",
		Name = "Operation Orphix Venom Sigil",
	},
	["Opportunity Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "OpportunitySigil(SxWhite).png",
		Name = "Opportunity Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Optimum Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "OptimumSigil(SxWhite).png",
		Name = "Optimum Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Oracle Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "OracleSigil(SxWhite).png",
		Name = "Oracle Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Orowyrm's Rage Sigil"] = {
		Image = "Orowyrm'sRageSigil(SxWhite).png",
		Name = "Orowyrm's Rage Sigil",
		Description = "A sigil reminiscent of the elemental Orowyrm.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Ostron Community Sigil"] = {
		Image = "Ostron CommunityGlyph.png",
		Name = "Ostron Community Sigil",
		Description = "A symbol of Ostron appreciation.",
		Link = "Sigils#Event Sigils"
	},
	["Ostron Kin Sigil"] = {
		Image = "OstronKinSigil(SxWhite).png",
		Name = "Ostron Kin Sigil",
		Description = "A sigil representing prestige gained with the Ostron.",
		Link = "Sigils#Ostron"
	},
	["Ostron Offworlder Sigil"] = {
		Image = "OstronOffworlderSigil(SxWhite).png",
		Name = "Ostron Offworlder Sigil",
		Description = "A sigil representing prestige gained with the Ostron.",
		Link = "Sigils#Ostron"
	},
	["Ostron Surah Sigil"] = {
		Image = "OstronSurahSigil(SxWhite).png",
		Name = "Ostron Surah Sigil",
		Description = "A sigil representing prestige gained with the Ostron.",
		Link = "Sigils#Ostron"
	},
	["Ostron Trusted Sigil"] = {
		Image = "OstronTrustedSigil(SxWhite).png",
		Name = "Ostron Trusted Sigil",
		Description = "A sigil representing prestige gained with the Ostron.",
		Link = "Sigils#Ostron"
	},
	["Ostron Visitor Sigil"] = {
		Image = "OstronVisitorSigil(SxWhite).png",
		Name = "Ostron Visitor Sigil",
		Description = "A sigil representing prestige gained with the Ostron.",
		Link = "Sigils#Ostron"
	},
	["Pack Leader Sigil"] = {
		Image = "PackLeaderSigil(SxWhite).png",
		Name = "Pack Leader Sigil",
		Description = "A sigil representing your Kubrow allegiance.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Pattern Match Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "PatternMatchSigil(SxWhite).png",
		Name = "Pattern Match Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Perception Sigil"] = {
		Image = "PerceptionSigil(SxWhite).png",
		Name = "Perception Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Perrin Sequence Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "PerrinSequenceSigil(SxWhite).png",
		Name = "Perrin Sequence Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Phoenix Coronet Sigil"] = {
		Description = "Celebrate 2017 Chinese Rooster Year, a symbol of our glory",
		Image = "PhoenixCoronetSigil(SxWhite).png",
		Name = "Phoenix Coronet Sigil",
	},
	["Phased Clan Sigil"] = {
		Image = "ClanSigilPhased.png",
		Name = "Phased Clan Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Phorid Sigil"] = {
		Description = "A sigil depicting the Phorid.",
		Image = "PhoridSigil(SxWhite).png",
		Name = "Phorid Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Pizza Party Sigil"] = {
		Image = "PizzaPartySigil(SxWhite).png",
		Name = "Pizza Party Sigil",
		Description = "A sigil representing prestige gained with The Hex.",
		Link = "Sigils#The Hex"
	},
	["Potential Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "PotentialSigil(SxWhite).png",
		Name = "Potential Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Primate Sigil"] = {
		Description = "Celebrate the New Year by adorning this sigil!",
		Image = "PrimateSigil(SxWhite).png",
		Name = "Primate Sigil",
	},
	["Prisma Lotus Bloom Sigil"] = {
		Image = "PrismaLotusBloomSigil(SxWhite).png",
		Name = "Prisma Lotus Bloom Sigil",
		Description = "From Baro Ki'Teer comes this arboreal reimagining of the Lotus' signature symbol.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Prisma Lotus Flame Sigil"] = {
		Image = "PrismaLotusFlameSigil(SxWhite).png",
		Name = "Prisma Lotus Flame Sigil",
		Description = "From Baro Ki'Teer comes this fiery reimagining of the Lotus' signature symbol.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Prisma Lotus Sigil"] = {
		Image = "PrismaLotusSigil(SxWhite).png",
		Name = "Prisma Lotus Sigil",
		Description = "From Baro Ki'Teer comes this stylish reimagining of the Lotus' signature symbol.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Prisma Sigil"] = {
		Image = "PrismaSigil(SxWhite).png",
		Name = "Prisma Sigil",
		Description = "This exclusive sigil features Prisma color gradients for maximum customization.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Prisma Thrax Sigil"] = {
		Image = "PrismaThraxSigil(SxWhite).png",
		Name = "Prisma Thrax Sigil",
		Description = "From Baro Ki'Teer comes this stylish reimagining of the legendary king, Dominus Thrax.",
		Link = "Sigils#Baro Ki'Teer Sigils"
	},
	["Progress Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "ProgressSigil(SxWhite).png",
		Name = "Progress Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Prominence Sigil"] = {
		Image = "ProminenceSigil.png",
		Name = "Prominence Sigil",
		Description = "A sigil depicting bold geometric patterns.",
		Link = "Sigils#Twitch Game Store and Twitch Prime Sigils"
	},
	["Protectorate Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "ProtectorateSigil(SxWhite).png",
		Name = "Protectorate Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Prudence Sigil"] = {
		Image = "PrudenceSigil(SxWhite).png",
		Name = "Prudence Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Purity Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "PuritySigil(SxWhite).png",
		Name = "Purity Sigil",
		Link = "Sigils#New Loka"
	},
	["Query Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "QuerySigil(SxWhite).png",
		Name = "Query Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Quick Steel Sigil"] = {
		Image = "QuickSteelSigil(SxWhite).png",
		Name = "Quick Steel Sigil",
		Description = "A symbol of pride for those that braved blade and star in The Conclave.",
		Link = "Sigils#Event Sigils"
	},
	["Quills Adherent Sigil"] = {
		Image = "QuillsAdherentSigil(SxWhite).png",
		Name = "Quills Adherent Sigil",
		Description = "A sigil representing prestige gained with the Quills.",
		Link = "Sigils#The Quills"
	},
	["Quills Architect Sigil"] = {
		Image = "QuillsArchitectSigil(SxWhite).png",
		Name = "Quills Architect Sigil",
		Description = "A sigil representing prestige gained with the Quills.",
		Link = "Sigils#The Quills"
	},
	["Quills Instrument Sigil"] = {
		Image = "QuillsInstrumentSigil(SxWhite).png",
		Name = "Quills Instrument Sigil",
		Description = "A sigil representing prestige gained with the Quills.",
		Link = "Sigils#The Quills"
	},
	["Quills Mote Sigil"] = {
		Image = "QuillsMoteSigil(SxWhite).png",
		Name = "Quills Mote Sigil",
		Description = "A sigil representing prestige gained with the Quills.",
		Link = "Sigils#The Quills"
	},
	["Quills Observer Sigil"] = {
		Image = "QuillsObserverSigil(SxWhite).png",
		Name = "Quills Observer Sigil",
		Description = "A sigil representing prestige gained with the Quills.",
		Link = "Sigils#The Quills"
	},
	["Raptor Sigil"] = {
		Description = "A sigil depicting the Raptor.",
		Image = "RaptorSigil(SxWhite).png",
		Name = "Raptor Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Rathuum Sigil"] = {
		Image = "RathuumSigil(SxWhite).png",
		Name = "Rathuum Sigil",
		Description = "A sigil commemorating the liberation of defectors from the Grineer.",
		Link = "Sigils#Event Sigils"
	},
	["Raya Orbitus Sigil"] = {
		Image = "RayaOrbitusSigil(SxWhite).png",
		Name = "Raya Orbitus Sigil",
		Description = "Display the elegant lines of the cosmos with this Raya series sigil.",
		Link = "Sigils#Nightwave"
	},
	["Rebellion Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "RebellionSigil(SxWhite).png",
		Name = "Rebellion Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Rebirth Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "RebirthSigil(SxWhite).png",
		Name = "Rebirth Sigil",
		Link = "Sigils#New Loka"
	},
	["Red Veil Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "RedVeilSigil(SxWhite).png",
		Name = "Red Veil Sigil",
		Link = "Sigils#Red Veil"
	},
	["Revelation Sigil"] = {
		Image = "RevelationSigil(SxWhite).png",
		Name = "Revelation Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Rhino Heirloom Sigil"] = {
		Image = "RhinoHeirloomSigil.png",
		Name = "Rhino Heirloom Sigil",
		Description = "A sigil that celebrates Rhino's legacy.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Rhino Palatine Sigil"] = {
		Image = "RhinoDeluxeSigil(SxWhite).png",
		Name = "Rhino Palatine Sigil",
		Description = "Pay homage to warriors of a more chivalrous time with this sigil.",
		Link = "Sigils#Event Sigils"
	},
	["Rift Sigil"] = {
		Image = "EnergySigil(SxWhite).png",
		Name = "Rift Sigil",
		Link = "Sigil#Tactical Alert Sigils",
		Description = "This sigil is laced with energy from the Void."
	},
	["Rift Walker Prime Sigil"] = {
		Image = "PrimeAccessSigilLimbo.png",
		Name = "Rift Walker Prime Sigil",
		Description = "The signature sigil of Limbo Prime.",
		Link = "Sigils#Prime Access Sigils"
	},
	["Road Rash Sigil"] = {
		Description = "This sigil won't just buff out.",
		Image = "RoadRashSigil.png",
		Name = "Road Rash Sigil",
		Link = "Sigils#Deluxe Sigils",
	},
	["Ruin Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "RuinSigil(SxWhite).png",
		Name = "Ruin Sigil",
		Link = "Sigils#Red Veil"
	},
	["Sacrifice Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "SacrificeSigil(SxWhite).png",
		Name = "Sacrifice Sigil",
		Link = "Sigils#New Loka"
	},
	["Sargas Ruk Sigil"] = {
		Description = "A sigil depicting General Sargas Ruk.",
		Image = "SargusRukSigil(SxWhite).png",
		Name = "Sargas Ruk Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Saturn Six Sigil"] = {
		Image = "SaturnSixEmblem.png",
		Name = "Saturn Six Sigil",
		Description = "The mark of an outlaw, once locked away six leagues deep in the gas.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Scar Sigil"] = {
		Image = "ScarSigil(SxWhite).png",
		Name = "Scar Sigil",
		Description = "A memento for those who have awoken from the Second Dream.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Scars of Arbitration Sigil"] = {
		Image = "ScarsofArbitrationSigil(SxWhite).png",
		Name = "Scars of Arbitration Sigil",
		Description = "Bear the scars earned in deadly Arbitrations.",
		Link = "Sigils#Arbitration Sigils"
	},
	["Scorcher Sigil"] = {
		Description = "Beat the heat with this unique Sigil.",
		Image = "ScorcherSigil(SxWhite).png",
		Name = "Scorcher Sigil",
	},
	["Seal of Honoring"] = {
		Image = "SealOfHonoring(SxWhite).png",
		Name = "Seal of Honoring",
		Link = "Sigils#XBox One Anniversary Sigils"
	},
	["Seal of Honoring II"] = {
		Image = "SealOfHonoringII.png",
		Name = "Seal of Honoring II",
		Link = "Sigils#XBox One Anniversary Sigils"
	},
	["Seal of Honoring III"] = {
		Image = "SealOfHonoringIII.png",
		Name = "Seal of Honoring III",
		Link = "Sigils#XBox One Anniversary Sigils"
	},
	["Seal of Honoring IV"] = {
		Image = "SealOfHonoringIV.png",
		Name = "Seal of Honoring IV",
		Link = "Sigils#XBox One Anniversary Sigils"
	},
	["Searching Sigil"] = {
		Description = "A sigil representing prestige gained with Cephalon Suda.",
		Image = "SearchingSigil(SxWhite).png",
		Name = "Searching Sigil",
		Link = "Sigils#Cephalon Suda"
	},
	["Seed Sigil"] = {
		Description = "A sigil representing prestige gained with New Loka.",
		Image = "SeedSigil(SxWhite).png",
		Name = "Seed Sigil",
		Link = "Sigils#New Loka"
	},
	["Shroud of Dynar Sigil Sigil"] = {
		Image = "ShroudofDynarSigil(SxWhite).png",
		Name = "Shroud of Dynar Sigil Sigil",
		Link = "Sigil#Event Sigils",
		Description = "A morbidly festive sigil."
	},
	["Sisterhood Sigil"] = {
		Image = "SisterhoodSigil(SxWhite).png",
		Name = "Sisterhood Sigil",
		Description = "A mark of respect for the Sisters of Parvos.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Snake Sigil"] = {
		Description = "This distinctive serpentine sigil adds venomous menace to any Warframe.",
		Image = "SnakeSigil.png",
		Name = "Snake Sigil",
	},
	["Solar Flare Sigil"] = {
		Image = "SolarFlareSigil(SxWhite).png",
		Name = "Solar Flare Sigil",
		Description = "Represents an incredible and untamed power.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Solaris United Cove Sigil"] = {
		Image = "SolarisUnitedCoveSigil(SxWhite).png",
		Name = "Solaris United Cove Sigil",
		Description = "A sigil representing prestige gained with the Solaris United.",
		Link = "Sigils#Solaris United"
	},
	["Solaris United Doer Sigil"] = {
		Image = "SolarisUnitedDoerSigil(SxWhite).png",
		Name = "Solaris United Doer Sigil",
		Description = "A sigil representing prestige gained with the Solaris United.",
		Link = "Sigils#Solaris United"
	},
	["Solaris United Old Mate Sigil"] = {
		Image = "SolarisUnitedOldMateSigil(SxWhite).png",
		Name = "Solaris United Old Mate Sigil",
		Description = "A sigil representing prestige gained with the Solaris United.",
		Link = "Sigils#Solaris United"
	},
	["Solaris United Outworlder Sigil"] = {
		Image = "SolarisUnitedOutworlderSigil(SxWhite).png",
		Name = "Solaris United Outworlder Sigil",
		Description = "A sigil representing prestige gained with the Solaris United.",
		Link = "Sigils#Solaris United"
	},
	["Solaris United Rapscallion Sigil"] = {
		Image = "SolarisUnitedRapscallionSigil(SxWhite).png",
		Name = "Solaris United Rapscallion Sigil",
		Description = "A sigil representing prestige gained with the Solaris United.",
		Link = "Sigils#Solaris United"
	},
	["Somber Stalker Sigil"] = {
		Image = "SomberStalkerSigil(SxWhite).png",
		Name = "Somber Stalker Sigil",
		Link = "Sigil#Event Sigils",
		Description = "From the shadows."
	},
	["Splash and Dash Sigil"] = {
		Description = "Beat the heat with this unique Sigil.",
		Image = "SplashAndDashSigil(SxWhite).png",
		Name = "Splash and Dash Sigil",
	},
	["Splashdown Sigil"] = {
		Description = "Refresh yourself with this unique sigil.",
		Image = "SplashdownSigil(SxWhite).png",
		Name = "Splashdown Sigil",
	},
	["Stalker Sigil"] = {
		Description = "A sigil depicting the emblem of the Stalker.",
		Image = "StalkerSigil(SxWhite).png",
		Name = "Stalker Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Stalker Smoke Screen Sigil"] = {
		Image = "StalkerSmokeScreenSigil(SxWhite).png",
		Name = "Stalker Smoke Screen Sigil",
		Description = "Who do you hunt, Shadow?.",
		Link = "Sigils#Nightwave Sigils"
	},
	["Static Reactor Prime Sigil"] = {
		Image = "StaticReactorPrimeSigil.png",
		Name = "Static Reactor Prime Sigil",
		Description = "Paired with this sigil, a Warframe will flicker and flash like a thunderhead.",
		Link = "Sigils#Twitch Game Store and Twitch Prime Sigils"
	},
	["Steel Meridian Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "SteelMeridianSigil(SxWhite).png",
		Name = "Steel Meridian Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Stoka Jade Sigil"] = {
		Description = "A next-generation sigil for your Warframe.",
		Image = "StokaJadeSigil(SxWhite).png",
		Name = "Stoka Jade Sigil ",
	},
	["Strategy Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "StrategySigil(SxWhite).png",
		Name = "Strategy Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Succession Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "SuccessionSigil(SxWhite).png",
		Name = "Succession Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Surpassing Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "SurpassingSigil(SxWhite).png",
		Name = "Surpassing Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Synergy Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "SynergySigil(SxWhite).png",
		Name = "Synergy Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["Tagfer Sigil"] = {
		Image = "TagferSigil(SxWhite).png",
		Name = "Tagfer Sigil",
		Link = "Sigils#Event Sigils"
	},
	["Temple Sigil"] = {
		Description = "A sigil celebrating Temple and their music.",
		Image = "TempleSigil(SxWhite).png",
		Name = "Temple Sigil",
	},
	["Tenno Chronicler Sigil"] = {
		Image = "TennoChroniclerSigil.png",
		Name = "Tenno Chronicler Sigil",
		Description = "A special sigil worn only by a select few Tenno.",
		Link = "Sigils#Other Sigils"
	},
	["Tenno Live Sigil"] = {
		Image = "TennoLiveSigil(SxWhite).png",
		Name = "Tenno Live Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["Tenno Luminary Sigil"] = {
		Image = "TennoLuminarySigil(SxWhite).png",
		Name = "Tenno Luminary Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["Tenno Translator Sigil"] = {
		Image = "TranslatorSigil(SxWhite).png",
		Name = "Tenno Translator Sigil",
		Description = "An exclusive Sigil worn only by Tenno Translators.",
		Link = "Sigils#Other Sigils"
	},
	["TennoCon 2016 Sigil"] = {
		Image = "TennoCon2016Sigil(SxWhite).png",
		Name = "TennoCon 2016 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2017 Sigil"] = {
		Image = "TennoCon2017Sigil(SxWhite).png",
		Name = "TennoCon 2017 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2018 Sigil"] = {
		Image = "TennoCon2018Sigil(SxWhite).png",
		Name = "TennoCon 2018 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2019 Sigil"] = {
		Image = "Tennocon2019Sigil(SxWhite).png",
		Name = "TennoCon 2019 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2020 Sigil"] = {
		Image = "Tennocon2020Sigil(SxWhite).png",
		Name = "TennoCon 2020 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2021 Sigil"] = {
		Image = "Tennocon2021Sigil(SxWhite).png",
		Name = "TennoCon 2021 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2022 Sigil"] = {
		Image = "Tennocon2022Sigil(SxWhite).png",
		Name = "TennoCon 2022 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2023 Sigil"] = {
		Image = "Tennocon2023Sigil(SxWhite).png",
		Name = "TennoCon 2023 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2024 Sigil"] = {
		Image = "Tennocon2024Sigil(SxWhite).png",
		Name = "TennoCon 2024 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2025 Sigil"] = {
		Image = "Tennocon2025Sigil(SxWhite).png",
		Name = "TennoCon 2025 Sigil",
		Link = "Sigils#Live Event Sigils"
	},
	["TennoCon 2026 Sigil"] = {
		Description = "Bestowed upon those who joined together in celebration at TennoCon 2026.",
		Image = "Tennocon2026Sigil(SxWhite).png",
		Link = "Sigils#Live Event Sigils",
		Name = "TennoCon 2026 Sigil"
	},
	["TennoGen Decennial Sigil"] = {
		Image = "TennoGenDecennialSigil(SxWhite).png",
		Name = "TennoGen Decennial Sigil",
		Description = "A sigil commemorating ten years of TennoGen artistry.",
		Link = "Sigils#Event Sigils"
	},
	["TennoGen Sigil"] = {
		Image = "TennoGenSigil(SxWhite).png",
		Name = "TennoGen Sigil",
		Link = "Sigils#Other Sigils"
	},
	["TennoVIP East Sigil"] = {
		Description = "A sigil for VIP Tenno",
		Image = "TennoVIPEastSigil(SxWhite).png",
		Link = "Sigils#Live Event Sigils",
		Name = "TennoVIP East Sigil"
	},
	["TennoVIP 2025 Sigil"] = {
		Description = "A sigil for VIP Tenno.",
		Image = "TennoVIP2025Sigil(SxWhite).png",
		Link = "Sigils#Live Event Sigils",
		Name = "TennoVIP 2025 Sigil"
	},
	["TennoVIP 2026 Sigil"] = {
		Description = "A sigil for VIP Tenno.",
		Image = "TennoVIP2026Sigil(SxWhite).png",
		Link = "Sigils#Live Event Sigils",
		Name = "TennoVIP 2026 Sigil"
	},
	["Teralyst Prominence Sigil"] = {
		Image = "TeralystProminenceSigil(SxWhite).png",
		Name = "Teralyst Prominence Sigil",
		Description = "A bold sigil depicting a Sentient Teralyst.",
		Link = "Sigils#Event Sigils"
	},
	["Teralyst Sigil"] = {
		Description = "A sigil depicting a Sentient Teralyst.",
		Image = "TeralystSigil(SxWhite).png",
		Name = "Teralyst Sigil",
		Link = "Sigils#Enemy Drop Sigils",
	},
	["Tessellations Sigil"] = {
		Description = "A sigil representing prestige gained with the Perrin Sequence.",
		Image = "TessellationsSigil(SxWhite).png",
		Name = "Tessellations Sigil",
		Link = "Sigils#Perrin Sequence"
	},
	["The Index Sigil"] = {
		Image = "TheIndexSigil(SxWhite)).png",
		Name = "The Index Sigil",
		Description = "A memento of The Index.",
		Link = "Sigils#Event Sigils"
	},
	["Threat Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "ThreatSigil(SxWhite).png",
		Name = "Threat Sigil",
		Link = "Sigils#Red Veil"
	},
	["Tolling Sigil"] = {
		Image = "TollingSigil(SxWhite).png",
		Link = "Sigil#Tactical Alert Sigils",
		Name = "Tolling Sigil",
	},
	["Trailer Entrant Sigil"] = {
		Image = "TrailerEntrantSigil(SxWhite).png",
		Name = "Trailer Entrant Sigil",
		Description = "Participatory prize for the Tenno's Greatest Trailer contest.",
		Link = "Sigils#Community Event Sigils"
	},
	["Truth Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "TruthSigil(SxWhite).png",
		Name = "Truth Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Tyl Regor Sigil"] = {
		Description = "A sigil depicting Tyl Regor.",
		Image = "TylRegorSigil(SxWhite).png",
		Name = "Tyl Regor Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Unity Sigil"] = {
		Image = "UnitySigil(SxWhite).png",
		Name = "Unity Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Unyielding Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "UnyieldingSigil(SxWhite).png",
		Name = "Unyielding Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Uprising Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "UprisingSigil(SxWhite).png",
		Name = "Uprising Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Valkyr Heirloom Sigil"] = {
		Image = "ValkyrHeirloomSigil.png",
		Name = "Valkyr Heirloom Sigil",
		Description = "A sigil that celebrates Valkyr's legacy.",
		Link = "Sigils#Purchasable Sigils"
	},
	["Vanquished Coda Sigil"] = {
		Image = "VanquishedCodaSigil(SxWhite).png",
		Name = "Vanquished Coda Sigil",
		Description = "The show’s over. This sigil marks the end of a Technocyte Coda’s career of music and mayhem.",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Vaporis Sigil"] = {
		Description = "The touch of alchemy leaves its mark, permeating the entire body. Lavos Khymia’s signature sigil.",
		Image = "VaporisSigil.png",
		Name = "Vaporis Sigil",
		Link = "Sigils#Deluxe Sigils",
	},
	["Vauban Heirloom Schema Sigil"] = {
		Image = "VaubanHeirloomSchemaSigil.png",
		Name = "Vauban Heirloom Schema Sigil",
		Description = "A sigil that celebrates Vauban’s ingenuity.",
	},
	["Vauban Heirloom Sigil"] = {
		Image = "VaubanHeirloomSigil.png",
		Name = "Vauban Heirloom Sigil",
		Description = "A sigil that celebrates Vauban's legacy.",
		Link = "Sigils#Purchasable Sigils",
	},
	["Vay Hek Sigil"] = {
		Description = "A sigil depicting Councilor Vay Hek.",
		Image = "VayHekSigil(SxWhite).png",
		Name = "Vay Hek Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Velorum Prime Sigil"] = {
		Image = "VelorumPrimeSigil.png",
		Name = "Velorum Prime Sigil",
		Description = "Champions of the Orokin were allowed to wear this Sigil as proof of their loyalty.",
		Link = "Sigils#Prime Access Sigils"
	},
	["Ventkids Glinty Sigil"] = {
		Image = "VentkidsGlintySigil(SxWhite).png",
		Name = "Ventkids Glinty Sigil",
		Description = "A sigil representing prestige gained with the Ventkids.",
		Link = "Sigils#Ventkids"
	},
	["Ventkids Logical Sigil"] = {
		Image = "VentkidsLogicalSigil(SxWhite).png",
		Name = "Ventkids Logical Sigil",
		Description = "A sigil representing prestige gained with the Ventkids.",
		Link = "Sigils#Ventkids"
	},
	["Ventkids Primo Sigil"] = {
		Image = "VentkidsPrimoSigil(SxWhite).png",
		Name = "Ventkids Primo Sigil",
		Description = "A sigil representing prestige gained with the Ventkids.",
		Link = "Sigils#Ventkids"
	},
	["Ventkids Proper Felon Sigil"] = {
		Image = "VentkidsProperFelonSigil(SxWhite).png",
		Name = "Ventkids Proper Felon Sigil",
		Description = "A sigil representing prestige gained with the Ventkids.",
		Link = "Sigils#Ventkids"
	},
	["Ventkids Whozit Sigil"] = {
		Image = "VentkidsWhozitSigil(SxWhite).png",
		Name = "Ventkids Whozit Sigil",
		Description = "A sigil representing prestige gained with the Ventkids.",
		Link = "Sigils#Ventkids"
	},
	["Verv Sigil"] = {
		Description = "A compelling badge of honor for the Tenno.",
		Image = "VervSigil.png",
		Name = "Verv Sigil",
	},
	["Vigilance Sigil"] = {
		Description = "A sigil representing prestige gained with the Steel Meridian.",
		Image = "VigilanceSigil(SxWhite).png",
		Name = "Vigilance Sigil",
		Link = "Sigils#Steel Meridian"
	},
	["Viscera Sigil"] = {
		Description = "A sigil representing prestige gained with the Red Veil.",
		Image = "VisceraSigil(SxWhite).png",
		Name = "Viscera Sigil",
		Link = "Sigils#Red Veil"
	},
	["Void Gate Sigil"] = {
		Image = "VoidGateSigil(SxWhite).png",
		Name = "Void Gate Sigil",
		Description = "Recalls the place that lies between two realities.",
		Link = "Sigils#Daily Tribute Milestone Sigils"
	},
	["Volition Sigil"] = {
		Image = "VolitionSigil(SxWhite).png",
		Name = "Volition Sigil",
		Link = "Sigils#Conclave Sigils"
	},
	["Vor Sigil"] = {
		Description = "A sigil depicting Captain Vor.",
		Image = "VorSigil(SxWhite).png",
		Name = "Vor Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Vox Solaris Agent Sigil"] = {
		Image = "VoxSolarisAgentSigil(SxWhite).png",
		Name = "Vox Solaris Agent Sigil",
		Description = "A sigil representing prestige gained with the Vox Solaris.",
		Link = "Sigils#Vox Solaris"
	},
	["Vox Solaris Hand Sigil"] = {
		Image = "VoxSolarisHandSigil(SxWhite).png",
		Name = "Vox Solaris Hand Sigil",
		Description = "A sigil representing prestige gained with the Vox Solaris.",
		Link = "Sigils#Vox Solaris"
	},
	["Vox Solaris Instrument Sigil"] = {
		Image = "VoxSolarisInstrumentSigil(SxWhite).png",
		Name = "Vox Solaris Instrument Sigil",
		Description = "A sigil representing prestige gained with the Vox Solaris.",
		Link = "Sigils#Vox Solaris"
	},
	["Vox Solaris Operative Sigil"] = {
		Image = "VoxSolarisOperativeSigil(SxWhite).png",
		Name = "Vox Solaris Operative Sigil",
		Description = "A sigil representing prestige gained with the Vox Solaris.",
		Link = "Sigils#Vox Solaris"
	},
	["Vox Solaris Shadow Sigil"] = {
		Image = "VoxSolarisShadowSigil(SxWhite).png",
		Name = "Vox Solaris Shadow Sigil",
		Description = "A sigil representing prestige gained with the Vox Solaris.",
		Link = "Sigils#Vox Solaris"
	},
	["Will Sigil"] = {
		Description = "A sigil representing prestige gained with the Arbiter of Hexis.",
		Image = "WillSigil(SxWhite).png",
		Name = "Will Sigil",
		Link = "Sigils##Arbiters of Hexis"
	},
	["Winter Solstice Sigil"] = {
		Image = "WinterSolsticeSigil(SxWhite).png",
		Name = "Winter Solstice Sigil",
		Description = "A festive sigil.",
		Link = "Sigils#Community Event Sigils"
	},
	["Wreath Sigil"] = {
		Image = "WreathSigil(SxWhite).png",
		Link = "Sigil#Tactical Alert Sigils",
		Name = "Wreath Sigil",
	},
	["Wukong Qitian Sigil"] = {
		Description = "Show due respect for Wukong Qitian’s power and cunning with this sigil.",
		Image = "WukongQitianSigil(SxWhite).png",
		Name = "Wukong Qitian Sigil",
		Link = "Sigils#Purchasable Sigils",
	},
	["Yareli Aquablade Sigil"] = {
		Description = "A sigil depicting Yareli's deadly Aquablades.",
		Image = "YareliAquabladeSigil(SxWhite).png",
		Name = "Yareli Aquablade Sigil",
	},
	["Year of The Rooster Sigil"] = {
		Description = "New Year commemorative badge of a Golden Rooster",
		Image = "YearofTheRoosterSigil(SxWhite).png",
		Name = "Year of The Rooster Sigil",
	},
	["Zanuka Sigil"] = {
		Description = "A sigil depicting the emblem of the Zanuka Hunter.",
		Image = "ZanukaSigil(SxWhite).png",
		Name = "Zanuka Sigil",
		Link = "Sigils#Enemy Drop Sigils",
		SellPrice = 1000,
	},
	["Zariman Sigil"] = {
		Description = "Represent the Zariman spirit of comradery and ingenuity.",
		Image = "ZarimanSigil(SxWhite).png",
		Name = "Zariman Sigil",
	},
}
```

