---
title: "Module:Factions/data"
wiki_url: "https://wiki.warframe.com/w/Module/Factions/data"
wiki_timestamp: "2026-06-18T11:15:58Z"
---

Database for [WARFRAME](/w/WARFRAME "WARFRAME")'s [Factions](/w/Factions "Factions").

## Faction Entry Schema

[[edit source](/w/Module:Factions/data/doc?action=edit&section=T-1 "Edit section's source code: Faction Entry Schema")]

```lua
	["Faction Name"] = {
		Description = "Faction Description",
		Image = "FactionName.png",
		Introduced = "31",
		Link = "Link Name",
		Name = "Faction Name",
	},
```

| Key/Column Name | Data Type | Required? | Explanation/Description | Example(s) |
| --- | --- | --- | --- | --- |
| `Description` | String | ✔️ | Description of faction as seen in-game | `"Support and rewards for Tenno fighting in active operations."` |
| `Image` | String | ✔️ | Image file name of the faction icon as uploaded to the wiki. Preferably using the "FactionName.png" naming convention. | `"SteelMeridian.png"` |
| `Introduced` | String | ✔️ | The game version in which the faction was first introduced in the global build of [WARFRAME](/w/WARFRAME "WARFRAME") | `"30.5"` or `"Specters of the Rail"` |
| `Link` | String | ✔️ | Page/article link to the faction on the wiki | `"The Holdfasts"` |
| `Name` | String | ✔️ | Name of faction | `"Arbiters of Hexis"` |

---

```lua
return {
	["Tenno"] = {
		Description = "They were called Tenno. Warriors of blade and gun: masters of the Warframe armor. Those that survived the old war were left drifting among the ruins. Now they are needed once more.",
		Image = "TennoIcon.png",
		Introduced = "Vanilla",
		Link = "Tenno",
		Name = "Tenno",
	},
	["Grineer"] = {
		Description = "They say there is power in numbers - the Grineer are living proof. Wretched from centuries of cloning that has left their genetics in decay, this horde expands their vile empire through brute force, conquering anyone who tries to stop them.",
		Image = "IconGrineerOn.png",
		Introduced = "Vanilla",
		Link = "Grineer",
		Name = "Grineer",
	},
	["Grineer and Corpus"] = {
		Description = "",
		Image = "IconGrineerOrCorpus.png",
		Introduced = "32.3",
		Link = "Mirror Defense",
		Name = "Grineer and Corpus",
	},
	["Corpus"] = {
		Description = "The Corpus embody the cold vacuum of space - heartless and bent on taking anything left unprotected. Driven by profits, the Corpus Board’s small numbers are supplemented by their legion of robot proxies, optimized for quick and efficient destruction.",
		Image = "IconCorpusOn.png",
		Introduced = "Vanilla",
		Link = "Corpus",
		Name = "Corpus"
	},
	["Infested"] = {
		Description = "The Infestation is more than a disease - it is a horror of twisted flesh, monsters made into reality. The blight consumes its victims, transforming them into unrecognizable atrocities controlled by rabid impulse.",
		Image = "Infestation_w.svg",
		Introduced = "Vanilla",
		Link = "Infested",
		Name = "Infested",
	},
	["Corrupted"] = {
		Image = "IconOrokinOn.png",
		Introduced = "8",
		Link = "Corrupted",
		Name = "Corrupted",
	},
	["The Murmur"] = {
		Description = "Known by many names, The Murmur are the hands, feet, and eyes of The Indifference. They are attempting to break through Albrecht’s Laboratories into the Origin System - something Tenno will need to stop at all costs.",
		Image = "MurmurIcon.png",
		Introduced = "35",
		Link = "The Murmur",
		Name = "The Murmur",
	},
	["Orokin"] = {
		Description = "The highly revered Orokin civilization built sovereignty on a culture of art, technology and architecture. To prove oneself worthy of elevated social status, one must face Orokin trials in the golden and majestic Halls of Ascension. At one time a utopian society of omniscient leadership, the great Orokin Era ended in a divine realization of their own ignorance.",
		Image = "IconOrokinOn.png",
		Introduced = "8",
		Link = "Orokin",
		Name = "Orokin",
	},
	["Sentient"] = {
		Description = "Whispers from the Old War have begun to escape the deepest shadows. What terrible secret calls out to be discovered?",
		Image = "SentientFactionIcon.png",
		Introduced = "17",
		Link = "Sentient",
		Name = "Sentient",
	},
	["Narmer"] = {
		Description = "A nightmare is over. Finally we see clearly. Finally we speak freely. Savor the taste of liberty, my friends. Don't ever relax your vigilance. All as one. Future generations won't remember the Tenno oppression, but we do. We bear the scars, we mourn the dead, and we must never allow ourselves to forget. All as one.",
		Image = "IconNarmer.png",
		Introduced = "31",
		Link = "Narmer",
		Name = "Narmer",
	},
	["Wild"] = {
		Image = "IconWild.png",
		Introduced = "9.5",
		Link = "Wild",
		Name = "Wild",
	},
	["Syndicates"] = {
		Image = "ReputationLarge.png",
		Introduced = "15",
		Link = "Syndicates",
		Name = "Syndicates",
	},
	["Oddities"] = {
		Image = "FactionOddity.png",
		Introduced = "17",
		Link = "Oddities",
		Name = "Oddities",
	},
	["Stalker"] = {
		Description = "When the ninth beat rang a torrent of blood filled the stadium, loosed by Tenno blades. The drums, the Empire, fell silent forever. Now I hunt, dividing your numbers. Watching from that dark place, cataloguing your sins, I am the ghost of retribution. You may forget but you are not innocent.",
		Image = "StalkerSigil.png",
		Introduced = "7",
		Link = "Stalker",
		Name = "Stalker",
	},
	["Techrot"] = {
		Description = "Left to fester in Höllvania's underground, the rapidly mutating Infested has created all new threat varieties capable of wreaking havoc on the unprepared.",
		Image = "TechrotIcon.png",
		Introduced = "38",
		Link = "Techrot",
		Name = "Techrot",
	},
	["Scaldra"] = {
		Description = "Ruthless aggression was Höllvania's answer to the Techrot. Wielding highly corrosive Efervon, Scaldra soldiers now patrol the streets to purge any Infestation. With martial law now declared, the Scaldra have total control. Led by Major Neci Rusalka, her command brings the entire military might of Höllvania to bear against you.",
		Image = "ScaldraIcon.png",
		Introduced = "38",
		Link = "Scaldra",
		Name = "Scaldra",
	},
	["Anarchs"] = {
		Description = "",
		Image = "IconAnarchs.png",
		Introduced = "41",
		Link = "Anarchs",
		Name = "Anarchs",
	},
	["Crossfire"] = {
		Image = "InvasionIcon.png",
		Introduced = "10.5",
		Link = "Crossfire",
		Name = "Crossfire",
	},
	["Grineer or Corpus"] = {
		Image = "InvasionIcon.png",
		Introduced = "31.5",
		Link = "Zariman Ten Zero",
		Name = "Grineer or Corpus",
	},
	["Steel Meridian"] = {
		Description = "Led by a battle-hardened Grineer deserter, the Steel Meridian fight a guerrilla war against a vast enemy. They are sworn protectors of what little remains of the colonies.",
		Image = "SteelMeridianSigil.png",
		InternalName = "/Lotus/Syndicates/SteelMeridianSyndicate",
		Introduced = "15",
		Link = "Steel Meridian",
		Name = "Steel Meridian",
	},
	["Arbiters of Hexis"] = {
		Description = 'The dogmatic Arbiters seek a truth through discipline and practice. They reject the "Tenno" as Warrior mythology - a lie constructed to limit their potential.',
		Image = "ArbitersofHexisSigil.png",
		InternalName = "/Lotus/Syndicates/ArbitersSyndicate",
		Introduced = "15",
		Link = "Arbiters of Hexis",
		Name = "Arbiters of Hexis",
	},
	["Cephalon Suda"] = {
		Description = "A vast consciousness watching with a curious eye. Seemingly devoid of emotion Suda's thirst for knowledge and abhorrence of destruction can only be described as passionate.",
		Image = "CephalonSudaSigil.png",
		InternalName = "/Lotus/Syndicates/CephalonSudaSyndicate",
		Introduced = "15",
		Link = "Cephalon Suda",
		Name = "Cephalon Suda",
	},
	["The Perrin Sequence"] = {
		Description = "A collective of brilliant and powerful merchants, splintered from the Corpus. Their goal is to restore order by bringing prosperity and direction to the violent world they study.",
		Image = "PerrinSequenceSigil.png",
		InternalName = "/Lotus/Syndicates/PerrinSyndicate",
		Introduced = "15",
		Link = "The Perrin Sequence",
		Name = "The Perrin Sequence",
	},
	["Red Veil"] = {
		Description = "The Veil see corruption all around them. They are honour-bound to heal the system through a great and violent purge. No cost too great, no blood too precious.",
		Image = "RedVeilSigil.png",
		InternalName = "/Lotus/Syndicates/RedVeilSyndicate",
		Introduced = "15",
		Link = "Red Veil",
		Name = "Red Veil",
	},
	["New Loka"] = {
		Description = "Only through restoration of a pure humanity and the repopulation of Earth can the conflict end. The New Loka are worshippers of the human form and Earth, before its corruption.",
		Image = "NewLokaSigil.png",
		InternalName = "/Lotus/Syndicates/NewLokaSyndicate",
		Introduced = "15",
		Link = "New Loka",
		Name = "New Loka",
	},
	["Conclave"] = {
		Description = "A warrior only grows if they face the ultimate enemy. Themselves.",
		Image = "ConclaveSigil.png",
		InternalName = "/Lotus/Syndicates/ConclaveSyndicate",
		Introduced = "16",
		Link = "Conclave",
		Name = "Conclave",
	},
	["Cephalon Simaris"] = {
		Description = "Through synthesis we can rebuild and preserve. Create memory-immortals within this data oasis. Will you become enlightened Tenno? Will you hunt for me?",
		Image = "CephalonSimarisSigil.png",
		InternalName = "/Lotus/Syndicates/LibrarySyndicate",
		Introduced = "16",
		Link = "Cephalon Simaris",
		Name = "Cephalon Simaris",
	},
	["Baro Ki'Teer"] = {
		Image = "PrismaSigil.png",
		Introduced = "15.6",
		Link = "Baro Ki'Teer",
		Name = "Baro Ki'Teer",
	},
	["Ostron"] = {
		Description = "A tight knit band of merchants, hucksters and survivors, the Ostrons call Cetus their home. The town was built around an Orokin Tower, that both protects and nourishes them.",
		Image = "OstronSigil.png",
		InternalName = "/Lotus/Syndicates/Ostron/CetusSyndicate",
		Introduced = "22",
		Link = "Ostron",
		Name = "Ostron",
	},
	["The Quills"] = {
		Description = "A secretive order, loyal to the mysterious and reclusive 'Unum'. Some say their relationship to cause and effect is unnatural, their knowledge profane. When a Quill acts, things change.",
		Image = "TheQuillsSigil.png",
		InternalName = "/Lotus/Syndicates/Ostron/QuillsSyndicate",
		Introduced = "22",
		Link = "The Quills",
		Name = "The Quills",
	},
	["Solaris United"] = {
		Description = "Indentured workers to the Corpus; the indispensable backbone of the Corpus business model on Venus. Manning factories, rail tractors and mines they work to pay off the artificial bodies (rigs) they bought in order to work.",
		Image = "SolarisUnited1.png",
		InternalName = "/Lotus/Syndicates/Solaris/SolarisSyndicate",
		Introduced = "24",
		Link = "Solaris United",
		Name = "Solaris United",
	},
	["Vox Solaris"] = {
		Description = "Solaris United's core personnel operating under the name of that group's enigmatic and anonymous figurehead. SU is the public face of the struggle. Vox Solaris is something else entirely; something known only to Eudico... and the Quills.",
		Image = "VoxSolarisIcon.png",
		InternalName = "/Lotus/Syndicates/Solaris/VoxSyndicate",
		Introduced = "24",
		Link = "Vox Solaris (Syndicate)",
		Name = "Vox Solaris",
	},
	["Ventkids"] = {
		Description = "Hangin' with their logical fam in the ducts of Fortuna, the Ventkids get by stealing parts from the Corpus and running K-Drive races out on the Vallis. At night the ventways bang to the sound of skeg - to the chagrin of the locals.",
		Image = "VentkidsIcon.png",
		InternalName = "/Lotus/Syndicates/Solaris/VentKidsSyndicate",
		Introduced = "24",
		Link = "Ventkids",
		Name = "Ventkids",
	},
	["Entrati"] = {
		Description = "Heirs to the legacy of Albrecht Entrati, his powerful Orokin family encountered disaster, isolation and bitter division on Deimos. The arrival of the Tenno, beneficiaries of their Void research, may bring fresh hope - and a deeper understanding of the world that trapped their family.",
		Image = "EntratiIcon.png",
		InternalName = "/Lotus/Syndicates/Deimos/EntratiSyndicate",
		Introduced = "29",
		Link = "Entrati",
		Name = "Entrati",
	},
	["Necraloid"] = {
		Description = "While the Entrati family's cohort of lethal Necramechs succumbed to the corrupting influence of Deimos, Loid's shielding kept him sane, as well as preserving what was left of his 'passenger', the Cephalon Otak. Together they maintain a proud tradition of loyal service.",
		Image = "NecraloidIcon.png",
		InternalName = "/Lotus/Syndicates/Deimos/NecraloidSyndicate",
		Introduced = "29",
		Link = "Necraloid",
		Name = "Necraloid",
	},
	["The Holdfasts"] = {
		Description = "Granted a second existence through the mysterious power of the Void, the four Holdfasts struggle to keep their sanity and their vessel intact. The return of the Tenno may turn the tide.",
		Image = "TheHoldfastsIcon.png",
		InternalName = "/Lotus/Syndicates/Zariman/ZarimanSyndicate",
		Introduced = "31.5",
		Link = "The Holdfasts",
		Name = "The Holdfasts",
	},
	["Cavia"] ={
		Description = "Animals sent into the Void by Albrecht Entrati, the three surviving Cavia came back changed forever. They gained human intelligence, but could only speak incoherent Voidtongue until the Jahu Gargoyle made them intelligible. Despite what Albrecht did to them, they have resolved to assist his chosen Operator.",
		Image = "Cavia Syndicate Logo 1.png",
		InternalName = "/Lotus/Syndicates/EntratiLab/EntratiLabSyndicate",
		Introduced = "35",
		Link = "Cavia",
		Name = "Cavia"
	},
	["Kahl's Garrison"] = {
		Description = "Who help Grineer today? Not Queens. Not Vay Hek. Tenno and Blue Girl help brothers. Other brothers still have Veil. So Kahl break. This camp little. But soon, it get big. You see. Kahl not afraid. And now Kahl not alone.",
		Image = "GarrisonIcon.png",
		InternalName = "/Lotus/Syndicates/Kahl/KahlSyndicate",
		Introduced = "32",
		Link = "Kahl's Garrison",
		Name = "Kahl's Garrison"
	},
	["The Hex"] = {
		Description = "Formerly human operatives, the six members of the Hex were transformed into Protoframes by Albrecht Entrati. Filled with uncanny power and mourning their lost humanity, they continue their mission of mercy in beleaguered Höllvania.",
		Image = "HexIcon.png",
		InternalName = "/Lotus/Syndicates/Hex/HexSyndicate",
		Introduced = "38",
		Link = "The Hex (Syndicate)",
		Name = "The Hex"
	},
	["Operational Supply"] = {
		Description = "Support and rewards for Tenno fighting in active operations.",
		Image = "OperationSyndicateSigil.png",
		InternalName = "/Lotus/Syndicates/EventSyndicate",
		Introduced = "22.3",
		Link = "Operational Supply",
		Name = "Operational Supply",
	},
	["Nightwave"] = {
		Description = "Greed. Brutality. Oppression. True stories, all, and the System is full of them. Dreamers? You listening? The System needs you performing your good deeds for the day. Nora needs it. Needs you to act. To change things. Hear the news, Dreamers. Hear it, or be it. Your call. Because in Nora's System, no good act goes unrewarded. This is Nora Night. You're listening to Nightwave.",
		Image = "NightwaveSyndicate.png",
		InternalName = "/Lotus/Syndicates/RadioLegionSyndicate",
		Introduced = "24.3",
		Link = "Nightwave",
		Name = "Nightwave",
	},
	["Duviri"] ={
		Description = "",
		Image = "DuviriIcon.png",
		Introduced = "33",
		Link = "Duviri",
		Name = "Duviri"
	},
	["Nightcap"] ={
		Description = "Find Mushroom samples in the Deepmines",
		Image = "NightcapIcon.png",
		InternalName = "/Lotus/Syndicates/Nightcap/NightcapJournalSyndicate",
		Introduced = "40",
		Link = "Nightcap",
		Name = "Nightcap"
	},
	["Ash"] ={
		Description = "The keenest blade is a well-ordered mind. Equal parts killer and mentor, Ryoku gives voice to the silent assassin, Ash.",
		Image = "RyokuGeminiSkin.png",
		InternalName = "",
		Introduced = "43",
		Link = "Ryoku",
		Name = "Ash"
	},
	["Garuda"] ={
		Description = "Vena, the Wytch, emerges from a doomed future to put on a sadistic smile on Garuda. Revel in the blood of all those who stand against her.",
		Image = "VenaGeminiSkin.png",
		InternalName = "",
		Introduced = "43",
		Link = "Vena",
		Name = "Garuda"
	}
}
```

