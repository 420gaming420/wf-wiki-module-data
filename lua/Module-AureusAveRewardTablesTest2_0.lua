
--[[
Posted by AureusAve for testing purposes.
Sourced from Digital Extremes at https://n8k6e2y6.ssl.hwcdn.net/repos/hnfvc0o3jnfvc873njb03enrf56.html
Source read from at 2018-04-24 02:27:42 UTC

When reading the elements of the data table it is recommended to use the index functions provided.
Updates to this module may require altering the format of the entries and break references made to the
position of the fields of the elements.

Getting the source field of the first element in the sources table:

source = RewardTableData["sources"][1][ RewardTableData["sourceIndex"]["source"] ]

To improve the readability of code a prefered variable name, p, to refer to the index:

p = RewardTableData["sourceIndex"]
source = RewardTableData["sources"][1][ p["source"] ]

The specific reward table entries can be fetched from the rewardTables table.
To fetch the reward table entries for the second source listed:

p = RewardTableData["sourceIndex"]
rewards = RewardTableData["rewardSets"][ RewardTableData[2][ p["rewardSet"] ] ]

Elements in the RewardTabledata["rewardSets"] are tables with the following structure;

{
[subsource1]={
    {reward,probability},
    {reward,probability},
    {reward,probability},
    {reward,probability},
    ...
},
[subsource2]={
    {reward,probability},
    {reward,probability},
    {reward,probability},
    ...
},
...
}

The subsources in the table are analogous to the A, B, and C reward rotations.
Where a reward set contains only a single table, it is marked "A".

While efforts are made to verify the integrity of the data when parsed, before posting here, it is possible
that updates to the source material break the process or that flaws in the process to read and verify the data exist.
Should missing entries be found or if the data, here, is otherwise mangled, please contact the author
and refer to the missing/mangled data in this module, and to the section of the source where the data originated.
Time-permitting, the author will address the error.
]]

local RewardTableData = {
    ["sourcesIndex"]={
        ["category"]=1,
        ["source"]=2,
        ["rewardSet"]=3
    },
    ["sources"]={
        {"Missions:","Mercury/Apollodorus (Survival)","RewardSet001"},
        {"Missions:","Mercury/Lares (Defense)","RewardSet002"},
        {"Missions:","Mercury/Caloris (Rescue)","RewardSet003"},
        {"Missions:","Mercury/Elion (Capture)","RewardSet004"},
        {"Missions:","Mercury/Terminus (Caches)","RewardSet005"},
        {"Missions:","Mercury/Tolstoj (Assassination)","RewardSet006"},
        {"Missions:","Mercury/Odin (Interception)","RewardSet007"},
        {"Missions:","Mercury/Suisei (Spy)","RewardSet008"},
        {"Missions:","Venus/V Prime (Survival)","RewardSet001"},
        {"Missions:","Venus/Ishtar (Caches)","RewardSet005"},
        {"Missions:","Venus/Cytherean (Interception)","RewardSet007"},
        {"Missions:","Venus/Linea (Rescue)","RewardSet003"},
        {"Missions:","Venus/Fossa (Assassination)","RewardSet013"},
        {"Missions:","Venus/Unda (Spy)","RewardSet008"},
        {"Missions:","Venus/Malva (Survival)","RewardSet015"},
        {"Missions:","Venus/Venera (Capture)","RewardSet004"},
        {"Missions:","Venus/Tessera (Defense)","RewardSet002"},
        {"Missions:","Venus/Kiliken (Excavation)","RewardSet018"},
        {"Missions:","Venus/Romula (Defense)","RewardSet019"},
        {"Missions:","Venus/Montes (Exterminate)","RewardSet020"},
        {"Missions:","Earth/Mantle (Capture)","RewardSet004"},
        {"Missions:","Earth/Cambria (Spy)","RewardSet008"},
        {"Missions:","Earth/Everest (Excavation)","RewardSet018"},
        {"Missions:","Earth/Pacific (Rescue)","RewardSet003"},
        {"Missions:","Earth/Lith (Defense)","RewardSet002"},
        {"Missions:","Earth/Gaia (Interception)","RewardSet007"},
        {"Missions:","Earth/Cervantes (Caches)","RewardSet027"},
        {"Missions:","Earth/Oro (Assassination)","RewardSet028"},
        {"Missions:","Earth/Coba (Defense)","RewardSet019"},
        {"Missions:","Earth/Erpo (Mobile Defense)","RewardSet030"},
        {"Missions:","Earth/Tikal (Excavation)","RewardSet018"},
        {"Missions:","Mars/Spear (Defense)","RewardSet002"},
        {"Missions:","Mars/Alator (Interception)","RewardSet007"},
        {"Missions:","Mars/Arval (Spy)","RewardSet008"},
        {"Missions:","Mars/Augustus (Excavation)","RewardSet018"},
        {"Missions:","Mars/Ara (Capture)","RewardSet004"},
        {"Missions:","Mars/Martialis (Rescue)","RewardSet003"},
        {"Missions:","Mars/Kadesh (Defense)","RewardSet019"},
        {"Missions:","Mars/War (Assassination)","RewardSet039"},
        {"Missions:","Mars/Gradivus (Caches)","RewardSet005"},
        {"Missions:","Mars/Wahiba (Survival)","RewardSet041"},
        {"Missions:","Mars/Syrtis (Exterminate)","RewardSet020"},
        {"Missions:","Jupiter/Adrastea (Caches)","RewardSet043"},
        {"Missions:","Jupiter/Amalthea (Spy)","RewardSet044"},
        {"Missions:","Jupiter/Metis (Rescue)","RewardSet045"},
        {"Missions:","Jupiter/Io (Defense)","RewardSet046"},
        {"Missions:","Jupiter/Elara (Survival)","RewardSet047"},
        {"Missions:","Jupiter/Callisto (Interception)","RewardSet048"},
        {"Missions:","Jupiter/Themisto (Assassination)","RewardSet049"},
        {"Missions:","Jupiter/Sinai (Defense)","RewardSet019"},
        {"Missions:","Jupiter/Ananke (Capture)","RewardSet004"},
        {"Missions:","Jupiter/Galilea (Sabotage)","RewardSet052"},
        {"Missions:","Jupiter/Cameria (Survival)","RewardSet041"},
        {"Missions:","Saturn/Helene (Defense)","RewardSet046"},
        {"Missions:","Saturn/Titan (Survival)","RewardSet047"},
        {"Missions:","Saturn/Dione (Spy)","RewardSet044"},
        {"Missions:","Saturn/Tethys (Assassination)","RewardSet057"},
        {"Missions:","Saturn/Rhea (Interception)","RewardSet048"},
        {"Missions:","Saturn/Cassini (Capture)","RewardSet004"},
        {"Missions:","Saturn/Anthe (Rescue)","RewardSet060"},
        {"Missions:","Saturn/Numa (Rescue)","RewardSet045"},
        {"Missions:","Saturn/Calypso (Caches)","RewardSet043"},
        {"Missions:","Saturn/Pandora (Pursuit)","RewardSet063"},
        {"Missions:","Saturn/Cephalon Capture (Conclave)","RewardSet064"},
        {"Missions:","Saturn/Cephalon Capture (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/Team Annihilation (Conclave)","RewardSet064"},
        {"Missions:","Saturn/Team Annihilation (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/Annihilation (Conclave)","RewardSet064"},
        {"Missions:","Saturn/Annihilation (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/Lunaro Arena (Conclave)","RewardSet064"},
        {"Missions:","Saturn/Lunaro Arena (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/Piscinas (Survival)","RewardSet041"},
        {"Missions:","Saturn/Caracol (Defection)","RewardSet073"},
        {"Missions:","Saturn/(Variant) Cephalon Capture (Conclave)","RewardSet064"},
        {"Missions:","Saturn/(Variant) Cephalon Capture (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/(Variant) Team Annihilation (Conclave)","RewardSet076"},
        {"Missions:","Saturn/(Variant) Team Annihilation (Conclave) Extra","RewardSet064"},
        {"Missions:","Saturn/(Variant) Annihilation (Conclave)","RewardSet064"},
        {"Missions:","Saturn/(Variant) Annihilation (Conclave) Extra","RewardSet064"},
        {"Missions:","Uranus/Ariel (Capture)","RewardSet004"},
        {"Missions:","Uranus/Titania (Assassination)","RewardSet081"},
        {"Missions:","Uranus/Umbriel (Interception)","RewardSet048"},
        {"Missions:","Uranus/Ophelia (Survival)","RewardSet083"},
        {"Missions:","Uranus/Desdemona (Caches)","RewardSet084"},
        {"Missions:","Uranus/Rosalind (Spy)","RewardSet085"},
        {"Missions:","Uranus/Caliban (Rescue)","RewardSet060"},
        {"Missions:","Uranus/Ur (Defense)","RewardSet019"},
        {"Missions:","Uranus/Stephano (Defense)","RewardSet088"},
        {"Missions:","Uranus/Caelus (Interception)","RewardSet089"},
        {"Missions:","Uranus/Assur (Survival)","RewardSet090"},
        {"Missions:","Neptune/Galatea (Capture)","RewardSet004"},
        {"Missions:","Neptune/Proteus (Defense)","RewardSet088"},
        {"Missions:","Neptune/Triton (Rescue)","RewardSet060"},
        {"Missions:","Neptune/Despina (Excavation)","RewardSet083"},
        {"Missions:","Neptune/Salacia (Mobile Defense)","RewardSet030"},
        {"Missions:","Neptune/Psamathe (Assassination)","RewardSet096"},
        {"Missions:","Neptune/Laomedeia (Spy)","RewardSet085"},
        {"Missions:","Neptune/Yursa (Defection)","RewardSet098"},
        {"Missions:","Neptune/Kelashin (Survival)","RewardSet090"},
        {"Missions:","Neptune/Cephalon Capture (Conclave)","RewardSet064"},
        {"Missions:","Neptune/The Index: Endurance (Arena)","RewardSet101"},
        {"Missions:","Pluto/Outer Terminus (Defense)","RewardSet088"},
        {"Missions:","Pluto/Regna (Rescue)","RewardSet060"},
        {"Missions:","Pluto/Hydra (Capture)","RewardSet004"},
        {"Missions:","Pluto/Hades (Assassination)","RewardSet105"},
        {"Missions:","Pluto/Cypress (Caches)","RewardSet106"},
        {"Missions:","Pluto/Cerberus (Interception)","RewardSet107"},
        {"Missions:","Pluto/Palus (Survival)","RewardSet083"},
        {"Missions:","Pluto/Sechura (Defense)","RewardSet019"},
        {"Missions:","Pluto/Oceanum (Spy)","RewardSet085"},
        {"Missions:","Pluto/Hieracon (Excavation)","RewardSet083"},
        {"Missions:","Ceres/Thon (Caches)","RewardSet043"},
        {"Missions:","Ceres/Bode (Spy)","RewardSet044"},
        {"Missions:","Ceres/Lex (Capture)","RewardSet004"},
        {"Missions:","Ceres/Nuovo (Rescue)","RewardSet003"},
        {"Missions:","Ceres/Exta (Assassination)","RewardSet116"},
        {"Missions:","Ceres/Exta (Assassination) Extra","RewardSet117"},
        {"Missions:","Ceres/Casta (Defense)","RewardSet002"},
        {"Missions:","Ceres/Cinxia (Interception)","RewardSet007"},
        {"Missions:","Ceres/Draco (Survival)","RewardSet047"},
        {"Missions:","Ceres/Gabii (Survival)","RewardSet015"},
        {"Missions:","Ceres/Seimeni (Defense)","RewardSet019"},
        {"Missions:","Eris/Brugia (Rescue)","RewardSet060"},
        {"Missions:","Eris/Kala-Azar (Defense)","RewardSet088"},
        {"Missions:","Eris/Isos (Capture)","RewardSet004"},
        {"Missions:","Eris/Oestrus (Infested Salvage)","RewardSet126"},
        {"Missions:","Eris/Nimus (Survival)","RewardSet083"},
        {"Missions:","Eris/Akkad (Defense)","RewardSet019"},
        {"Missions:","Eris/Xini (Interception)","RewardSet107"},
        {"Missions:","Eris/Zabala (Survival)","RewardSet130"},
        {"Missions:","Eris/Naeglar (Caches)","RewardSet131"},
        {"Missions:","Sedna/Kappa (Spy)","RewardSet085"},
        {"Missions:","Sedna/Rusalka (Capture)","RewardSet004"},
        {"Missions:","Sedna/Vodyanoi (Arena)","RewardSet134"},
        {"Missions:","Sedna/Nakki (Arena)","RewardSet135"},
        {"Missions:","Sedna/Berehynia (Interception)","RewardSet107"},
        {"Missions:","Sedna/Selkie (Survival)","RewardSet083"},
        {"Missions:","Sedna/Kelpie (Caches)","RewardSet106"},
        {"Missions:","Sedna/Naga (Rescue)","RewardSet060"},
        {"Missions:","Sedna/Yam (Arena)","RewardSet134"},
        {"Missions:","Sedna/Merrow (Assassination)","RewardSet141"},
        {"Missions:","Sedna/Hydron (Defense)","RewardSet088"},
        {"Missions:","Sedna/Amarna (Survival)","RewardSet090"},
        {"Missions:","Sedna/Sangeru (Defense)","RewardSet019"},
        {"Missions:","Europa/Abaddon (Capture)","RewardSet004"},
        {"Missions:","Europa/Naamah (Assassination)","RewardSet146"},
        {"Missions:","Europa/Valefor (Excavation)","RewardSet047"},
        {"Missions:","Europa/Ose (Interception)","RewardSet048"},
        {"Missions:","Europa/Valac (Spy)","RewardSet044"},
        {"Missions:","Europa/Paimon (Defense)","RewardSet046"},
        {"Missions:","Europa/Orias (Rescue)","RewardSet045"},
        {"Missions:","Europa/Larzac (Defense)","RewardSet019"},
        {"Missions:","Europa/Cholistan (Excavation)","RewardSet083"},
        {"Missions:","Void/Hepit (Capture)","RewardSet004"},
        {"Missions:","Void/Taranis (Defense)","RewardSet002"},
        {"Missions:","Void/Stribog (Caches)","RewardSet156"},
        {"Missions:","Void/Ani (Survival)","RewardSet047"},
        {"Missions:","Void/Ukko (Capture)","RewardSet004"},
        {"Missions:","Void/Belenus (Defense)","RewardSet088"},
        {"Missions:","Void/Mot (Survival)","RewardSet160"},
        {"Missions:","Void/Marduk (Caches)","RewardSet161"},
        {"Missions:","Void/Mithra (Interception)","RewardSet107"},
        {"Missions:","Phobos/Stickney (Survival)","RewardSet001"},
        {"Missions:","Phobos/Skyresh (Capture)","RewardSet004"},
        {"Missions:","Phobos/Monolith (Rescue)","RewardSet003"},
        {"Missions:","Phobos/Kepler (Rush)","RewardSet166"},
        {"Missions:","Phobos/Gulliver (Defense)","RewardSet002"},
        {"Missions:","Phobos/Shklovsky (Spy)","RewardSet008"},
        {"Missions:","Phobos/Memphis (Defection)","RewardSet169"},
        {"Missions:","Phobos/Iliad (Assassination)","RewardSet170"},
        {"Missions:","Phobos/Zeugma (Survival)","RewardSet041"},
        {"Missions:","Derelict/Orokin Derelict Defense (Defense)","RewardSet172"},
        {"Missions:","Derelict/Orokin Derelict Sabotage (Caches)","RewardSet173"},
        {"Missions:","Derelict/Orokin Derelict Survival (Survival)","RewardSet174"},
        {"Missions:","Derelict/Orokin Derelict Assassinate (Assassination)","RewardSet175"},
        {"Missions:","Lua/Plato (Caches)","RewardSet176"},
        {"Missions:","Lua/Pavlov (Spy)","RewardSet177"},
        {"Missions:","Lua/Tycho (Survival)","RewardSet083"},
        {"Missions:","Lua/StöFler (Defense)","RewardSet088"},
        {"Missions:","Lua/Copernicus (Capture)","RewardSet004"},
        {"Missions:","Lua/Zeipel (Rescue)","RewardSet060"},
        {"Missions:","Kuva Fortress/Nabuk (Capture)","RewardSet004"},
        {"Missions:","Kuva Fortress/Taveuni (Survival)","RewardSet083"},
        {"Missions:","Kuva Fortress/Tamu (Defense)","RewardSet088"},
        {"Missions:","Kuva Fortress/Dakata (Caches)","RewardSet185"},
        {"Missions:","Kuva Fortress/Pago (Spy)","RewardSet186"},
        {"Missions:","Kuva Fortress/Garus (Rescue)","RewardSet060"},
        {"Relics:","Axi A1 Relic (Intact)","RewardSet188"},
        {"Relics:","Axi A1 Relic (Exceptional)","RewardSet189"},
        {"Relics:","Axi A1 Relic (Flawless)","RewardSet190"},
        {"Relics:","Axi A1 Relic (Radiant)","RewardSet191"},
        {"Relics:","Axi A2 Relic (Intact)","RewardSet192"},
        {"Relics:","Axi A2 Relic (Exceptional)","RewardSet193"},
        {"Relics:","Axi A2 Relic (Flawless)","RewardSet194"},
        {"Relics:","Axi A2 Relic (Radiant)","RewardSet195"},
        {"Relics:","Axi A3 Relic (Intact)","RewardSet196"},
        {"Relics:","Axi A3 Relic (Exceptional)","RewardSet197"},
        {"Relics:","Axi A3 Relic (Flawless)","RewardSet198"},
        {"Relics:","Axi A3 Relic (Radiant)","RewardSet199"},
        {"Relics:","Axi B1 Relic (Intact)","RewardSet200"},
        {"Relics:","Axi B1 Relic (Exceptional)","RewardSet201"},
        {"Relics:","Axi B1 Relic (Flawless)","RewardSet202"},
        {"Relics:","Axi B1 Relic (Radiant)","RewardSet203"},
        {"Relics:","Axi B2 Relic (Intact)","RewardSet204"},
        {"Relics:","Axi B2 Relic (Exceptional)","RewardSet205"},
        {"Relics:","Axi B2 Relic (Flawless)","RewardSet206"},
        {"Relics:","Axi B2 Relic (Radiant)","RewardSet207"},
        {"Relics:","Axi C1 Relic (Intact)","RewardSet208"},
        {"Relics:","Axi C1 Relic (Exceptional)","RewardSet209"},
        {"Relics:","Axi C1 Relic (Flawless)","RewardSet210"},
        {"Relics:","Axi C1 Relic (Radiant)","RewardSet211"},
        {"Relics:","Axi C2 Relic (Intact)","RewardSet212"},
        {"Relics:","Axi C2 Relic (Exceptional)","RewardSet213"},
        {"Relics:","Axi C2 Relic (Flawless)","RewardSet214"},
        {"Relics:","Axi C2 Relic (Radiant)","RewardSet215"},
        {"Relics:","Axi E1 Relic (Intact)","RewardSet216"},
        {"Relics:","Axi E1 Relic (Exceptional)","RewardSet217"},
        {"Relics:","Axi E1 Relic (Flawless)","RewardSet218"},
        {"Relics:","Axi E1 Relic (Radiant)","RewardSet219"},
        {"Relics:","Axi E2 Relic (Intact)","RewardSet220"},
        {"Relics:","Axi E2 Relic (Exceptional)","RewardSet221"},
        {"Relics:","Axi E2 Relic (Flawless)","RewardSet222"},
        {"Relics:","Axi E2 Relic (Radiant)","RewardSet223"},
        {"Relics:","Axi G1 Relic (Intact)","RewardSet224"},
        {"Relics:","Axi G1 Relic (Exceptional)","RewardSet225"},
        {"Relics:","Axi G1 Relic (Flawless)","RewardSet226"},
        {"Relics:","Axi G1 Relic (Radiant)","RewardSet227"},
        {"Relics:","Axi H1 Relic (Intact)","RewardSet228"},
        {"Relics:","Axi H1 Relic (Exceptional)","RewardSet229"},
        {"Relics:","Axi H1 Relic (Flawless)","RewardSet230"},
        {"Relics:","Axi H1 Relic (Radiant)","RewardSet231"},
        {"Relics:","Axi H2 Relic (Intact)","RewardSet232"},
        {"Relics:","Axi H2 Relic (Exceptional)","RewardSet233"},
        {"Relics:","Axi H2 Relic (Flawless)","RewardSet234"},
        {"Relics:","Axi H2 Relic (Radiant)","RewardSet235"},
        {"Relics:","Axi H3 Relic (Intact)","RewardSet236"},
        {"Relics:","Axi H3 Relic (Exceptional)","RewardSet237"},
        {"Relics:","Axi H3 Relic (Flawless)","RewardSet238"},
        {"Relics:","Axi H3 Relic (Radiant)","RewardSet239"},
        {"Relics:","Axi K1 Relic (Intact)","RewardSet240"},
        {"Relics:","Axi K1 Relic (Exceptional)","RewardSet241"},
        {"Relics:","Axi K1 Relic (Flawless)","RewardSet242"},
        {"Relics:","Axi K1 Relic (Radiant)","RewardSet243"},
        {"Relics:","Axi K2 Relic (Intact)","RewardSet244"},
        {"Relics:","Axi K2 Relic (Exceptional)","RewardSet245"},
        {"Relics:","Axi K2 Relic (Flawless)","RewardSet246"},
        {"Relics:","Axi K2 Relic (Radiant)","RewardSet247"},
        {"Relics:","Axi L1 Relic (Intact)","RewardSet248"},
        {"Relics:","Axi L1 Relic (Exceptional)","RewardSet249"},
        {"Relics:","Axi L1 Relic (Flawless)","RewardSet250"},
        {"Relics:","Axi L1 Relic (Radiant)","RewardSet251"},
        {"Relics:","Axi N1 Relic (Intact)","RewardSet252"},
        {"Relics:","Axi N1 Relic (Exceptional)","RewardSet253"},
        {"Relics:","Axi N1 Relic (Flawless)","RewardSet254"},
        {"Relics:","Axi N1 Relic (Radiant)","RewardSet255"},
        {"Relics:","Axi N2 Relic (Intact)","RewardSet256"},
        {"Relics:","Axi N2 Relic (Exceptional)","RewardSet257"},
        {"Relics:","Axi N2 Relic (Flawless)","RewardSet258"},
        {"Relics:","Axi N2 Relic (Radiant)","RewardSet259"},
        {"Relics:","Axi N3 Relic (Intact)","RewardSet260"},
        {"Relics:","Axi N3 Relic (Exceptional)","RewardSet261"},
        {"Relics:","Axi N3 Relic (Flawless)","RewardSet262"},
        {"Relics:","Axi N3 Relic (Radiant)","RewardSet263"},
        {"Relics:","Axi N4 Relic (Intact)","RewardSet264"},
        {"Relics:","Axi N4 Relic (Exceptional)","RewardSet265"},
        {"Relics:","Axi N4 Relic (Flawless)","RewardSet266"},
        {"Relics:","Axi N4 Relic (Radiant)","RewardSet267"},
        {"Relics:","Axi N5 Relic (Intact)","RewardSet268"},
        {"Relics:","Axi N5 Relic (Exceptional)","RewardSet269"},
        {"Relics:","Axi N5 Relic (Flawless)","RewardSet270"},
        {"Relics:","Axi N5 Relic (Radiant)","RewardSet271"},
        {"Relics:","Axi O1 Relic (Intact)","RewardSet272"},
        {"Relics:","Axi O1 Relic (Exceptional)","RewardSet273"},
        {"Relics:","Axi O1 Relic (Flawless)","RewardSet274"},
        {"Relics:","Axi O1 Relic (Radiant)","RewardSet275"},
        {"Relics:","Axi O2 Relic (Intact)","RewardSet276"},
        {"Relics:","Axi O2 Relic (Exceptional)","RewardSet277"},
        {"Relics:","Axi O2 Relic (Flawless)","RewardSet278"},
        {"Relics:","Axi O2 Relic (Radiant)","RewardSet279"},
        {"Relics:","Axi R1 Relic (Intact)","RewardSet280"},
        {"Relics:","Axi R1 Relic (Exceptional)","RewardSet281"},
        {"Relics:","Axi R1 Relic (Flawless)","RewardSet282"},
        {"Relics:","Axi R1 Relic (Radiant)","RewardSet283"},
        {"Relics:","Axi S1 Relic (Intact)","RewardSet284"},
        {"Relics:","Axi S1 Relic (Exceptional)","RewardSet285"},
        {"Relics:","Axi S1 Relic (Flawless)","RewardSet286"},
        {"Relics:","Axi S1 Relic (Radiant)","RewardSet287"},
        {"Relics:","Axi S2 Relic (Intact)","RewardSet288"},
        {"Relics:","Axi S2 Relic (Exceptional)","RewardSet289"},
        {"Relics:","Axi S2 Relic (Flawless)","RewardSet290"},
        {"Relics:","Axi S2 Relic (Radiant)","RewardSet291"},
        {"Relics:","Axi T1 Relic (Intact)","RewardSet292"},
        {"Relics:","Axi T1 Relic (Exceptional)","RewardSet293"},
        {"Relics:","Axi T1 Relic (Flawless)","RewardSet294"},
        {"Relics:","Axi T1 Relic (Radiant)","RewardSet295"},
        {"Relics:","Axi V1 Relic (Intact)","RewardSet296"},
        {"Relics:","Axi V1 Relic (Exceptional)","RewardSet297"},
        {"Relics:","Axi V1 Relic (Flawless)","RewardSet298"},
        {"Relics:","Axi V1 Relic (Radiant)","RewardSet299"},
        {"Relics:","Axi V2 Relic (Intact)","RewardSet300"},
        {"Relics:","Axi V2 Relic (Exceptional)","RewardSet301"},
        {"Relics:","Axi V2 Relic (Flawless)","RewardSet302"},
        {"Relics:","Axi V2 Relic (Radiant)","RewardSet303"},
        {"Relics:","Axi V3 Relic (Intact)","RewardSet304"},
        {"Relics:","Axi V3 Relic (Exceptional)","RewardSet305"},
        {"Relics:","Axi V3 Relic (Flawless)","RewardSet306"},
        {"Relics:","Axi V3 Relic (Radiant)","RewardSet307"},
        {"Relics:","Axi V4 Relic (Intact)","RewardSet308"},
        {"Relics:","Axi V4 Relic (Exceptional)","RewardSet309"},
        {"Relics:","Axi V4 Relic (Flawless)","RewardSet310"},
        {"Relics:","Axi V4 Relic (Radiant)","RewardSet311"},
        {"Relics:","Axi V5 Relic (Intact)","RewardSet312"},
        {"Relics:","Axi V5 Relic (Exceptional)","RewardSet313"},
        {"Relics:","Axi V5 Relic (Flawless)","RewardSet314"},
        {"Relics:","Axi V5 Relic (Radiant)","RewardSet315"},
        {"Relics:","Axi V6 Relic (Intact)","RewardSet316"},
        {"Relics:","Axi V6 Relic (Exceptional)","RewardSet317"},
        {"Relics:","Axi V6 Relic (Flawless)","RewardSet318"},
        {"Relics:","Axi V6 Relic (Radiant)","RewardSet319"},
        {"Relics:","Axi V7 Relic (Intact)","RewardSet320"},
        {"Relics:","Axi V7 Relic (Exceptional)","RewardSet321"},
        {"Relics:","Axi V7 Relic (Flawless)","RewardSet322"},
        {"Relics:","Axi V7 Relic (Radiant)","RewardSet323"},
        {"Relics:","Axi V8 Relic (Intact)","RewardSet324"},
        {"Relics:","Axi V8 Relic (Exceptional)","RewardSet325"},
        {"Relics:","Axi V8 Relic (Flawless)","RewardSet326"},
        {"Relics:","Axi V8 Relic (Radiant)","RewardSet327"},
        {"Relics:","Lith A1 Relic (Intact)","RewardSet328"},
        {"Relics:","Lith A1 Relic (Exceptional)","RewardSet329"},
        {"Relics:","Lith A1 Relic (Flawless)","RewardSet330"},
        {"Relics:","Lith A1 Relic (Radiant)","RewardSet331"},
        {"Relics:","Lith A2 Relic (Intact)","RewardSet332"},
        {"Relics:","Lith A2 Relic (Exceptional)","RewardSet333"},
        {"Relics:","Lith A2 Relic (Flawless)","RewardSet334"},
        {"Relics:","Lith A2 Relic (Radiant)","RewardSet335"},
        {"Relics:","Lith B1 Relic (Intact)","RewardSet336"},
        {"Relics:","Lith B1 Relic (Exceptional)","RewardSet337"},
        {"Relics:","Lith B1 Relic (Flawless)","RewardSet338"},
        {"Relics:","Lith B1 Relic (Radiant)","RewardSet339"},
        {"Relics:","Lith B2 Relic (Intact)","RewardSet340"},
        {"Relics:","Lith B2 Relic (Exceptional)","RewardSet341"},
        {"Relics:","Lith B2 Relic (Flawless)","RewardSet342"},
        {"Relics:","Lith B2 Relic (Radiant)","RewardSet343"},
        {"Relics:","Lith C1 Relic (Intact)","RewardSet344"},
        {"Relics:","Lith C1 Relic (Exceptional)","RewardSet345"},
        {"Relics:","Lith C1 Relic (Flawless)","RewardSet346"},
        {"Relics:","Lith C1 Relic (Radiant)","RewardSet347"},
        {"Relics:","Lith C2 Relic (Intact)","RewardSet348"},
        {"Relics:","Lith C2 Relic (Exceptional)","RewardSet349"},
        {"Relics:","Lith C2 Relic (Flawless)","RewardSet350"},
        {"Relics:","Lith C2 Relic (Radiant)","RewardSet351"},
        {"Relics:","Lith F1 Relic (Intact)","RewardSet352"},
        {"Relics:","Lith F1 Relic (Exceptional)","RewardSet353"},
        {"Relics:","Lith F1 Relic (Flawless)","RewardSet354"},
        {"Relics:","Lith F1 Relic (Radiant)","RewardSet355"},
        {"Relics:","Lith F2 Relic (Intact)","RewardSet356"},
        {"Relics:","Lith F2 Relic (Exceptional)","RewardSet357"},
        {"Relics:","Lith F2 Relic (Flawless)","RewardSet358"},
        {"Relics:","Lith F2 Relic (Radiant)","RewardSet359"},
        {"Relics:","Lith G1 Relic (Intact)","RewardSet360"},
        {"Relics:","Lith G1 Relic (Exceptional)","RewardSet361"},
        {"Relics:","Lith G1 Relic (Flawless)","RewardSet362"},
        {"Relics:","Lith G1 Relic (Radiant)","RewardSet363"},
        {"Relics:","Lith G2 Relic (Intact)","RewardSet364"},
        {"Relics:","Lith G2 Relic (Exceptional)","RewardSet365"},
        {"Relics:","Lith G2 Relic (Flawless)","RewardSet366"},
        {"Relics:","Lith G2 Relic (Radiant)","RewardSet367"},
        {"Relics:","Lith H1 Relic (Intact)","RewardSet368"},
        {"Relics:","Lith H1 Relic (Exceptional)","RewardSet369"},
        {"Relics:","Lith H1 Relic (Flawless)","RewardSet370"},
        {"Relics:","Lith H1 Relic (Radiant)","RewardSet371"},
        {"Relics:","Lith H2 Relic (Intact)","RewardSet372"},
        {"Relics:","Lith H2 Relic (Exceptional)","RewardSet373"},
        {"Relics:","Lith H2 Relic (Flawless)","RewardSet374"},
        {"Relics:","Lith H2 Relic (Radiant)","RewardSet375"},
        {"Relics:","Lith K1 Relic (Intact)","RewardSet376"},
        {"Relics:","Lith K1 Relic (Exceptional)","RewardSet377"},
        {"Relics:","Lith K1 Relic (Flawless)","RewardSet378"},
        {"Relics:","Lith K1 Relic (Radiant)","RewardSet379"},
        {"Relics:","Lith M1 Relic (Intact)","RewardSet380"},
        {"Relics:","Lith M1 Relic (Exceptional)","RewardSet381"},
        {"Relics:","Lith M1 Relic (Flawless)","RewardSet382"},
        {"Relics:","Lith M1 Relic (Radiant)","RewardSet383"},
        {"Relics:","Lith N1 Relic (Intact)","RewardSet384"},
        {"Relics:","Lith N1 Relic (Exceptional)","RewardSet385"},
        {"Relics:","Lith N1 Relic (Flawless)","RewardSet386"},
        {"Relics:","Lith N1 Relic (Radiant)","RewardSet387"},
        {"Relics:","Lith N2 Relic (Intact)","RewardSet388"},
        {"Relics:","Lith N2 Relic (Exceptional)","RewardSet389"},
        {"Relics:","Lith N2 Relic (Flawless)","RewardSet390"},
        {"Relics:","Lith N2 Relic (Radiant)","RewardSet391"},
        {"Relics:","Lith N3 Relic (Intact)","RewardSet392"},
        {"Relics:","Lith N3 Relic (Exceptional)","RewardSet393"},
        {"Relics:","Lith N3 Relic (Flawless)","RewardSet394"},
        {"Relics:","Lith N3 Relic (Radiant)","RewardSet395"},
        {"Relics:","Lith S1 Relic (Intact)","RewardSet396"},
        {"Relics:","Lith S1 Relic (Exceptional)","RewardSet397"},
        {"Relics:","Lith S1 Relic (Flawless)","RewardSet398"},
        {"Relics:","Lith S1 Relic (Radiant)","RewardSet399"},
        {"Relics:","Lith S2 Relic (Intact)","RewardSet400"},
        {"Relics:","Lith S2 Relic (Exceptional)","RewardSet401"},
        {"Relics:","Lith S2 Relic (Flawless)","RewardSet402"},
        {"Relics:","Lith S2 Relic (Radiant)","RewardSet403"},
        {"Relics:","Lith S3 Relic (Intact)","RewardSet404"},
        {"Relics:","Lith S3 Relic (Exceptional)","RewardSet405"},
        {"Relics:","Lith S3 Relic (Flawless)","RewardSet406"},
        {"Relics:","Lith S3 Relic (Radiant)","RewardSet407"},
        {"Relics:","Lith S4 Relic (Intact)","RewardSet408"},
        {"Relics:","Lith S4 Relic (Exceptional)","RewardSet409"},
        {"Relics:","Lith S4 Relic (Flawless)","RewardSet410"},
        {"Relics:","Lith S4 Relic (Radiant)","RewardSet411"},
        {"Relics:","Lith S5 Relic (Intact)","RewardSet412"},
        {"Relics:","Lith S5 Relic (Exceptional)","RewardSet413"},
        {"Relics:","Lith S5 Relic (Flawless)","RewardSet414"},
        {"Relics:","Lith S5 Relic (Radiant)","RewardSet415"},
        {"Relics:","Lith S6 Relic (Intact)","RewardSet416"},
        {"Relics:","Lith S6 Relic (Exceptional)","RewardSet417"},
        {"Relics:","Lith S6 Relic (Flawless)","RewardSet418"},
        {"Relics:","Lith S6 Relic (Radiant)","RewardSet419"},
        {"Relics:","Lith S7 Relic (Intact)","RewardSet420"},
        {"Relics:","Lith S7 Relic (Exceptional)","RewardSet421"},
        {"Relics:","Lith S7 Relic (Flawless)","RewardSet422"},
        {"Relics:","Lith S7 Relic (Radiant)","RewardSet423"},
        {"Relics:","Lith T1 Relic (Intact)","RewardSet424"},
        {"Relics:","Lith T1 Relic (Exceptional)","RewardSet425"},
        {"Relics:","Lith T1 Relic (Flawless)","RewardSet426"},
        {"Relics:","Lith T1 Relic (Radiant)","RewardSet427"},
        {"Relics:","Lith V1 Relic (Intact)","RewardSet428"},
        {"Relics:","Lith V1 Relic (Exceptional)","RewardSet429"},
        {"Relics:","Lith V1 Relic (Flawless)","RewardSet430"},
        {"Relics:","Lith V1 Relic (Radiant)","RewardSet431"},
        {"Relics:","Lith V2 Relic (Intact)","RewardSet432"},
        {"Relics:","Lith V2 Relic (Exceptional)","RewardSet433"},
        {"Relics:","Lith V2 Relic (Flawless)","RewardSet434"},
        {"Relics:","Lith V2 Relic (Radiant)","RewardSet435"},
        {"Relics:","Lith V3 Relic (Intact)","RewardSet436"},
        {"Relics:","Lith V3 Relic (Exceptional)","RewardSet437"},
        {"Relics:","Lith V3 Relic (Flawless)","RewardSet438"},
        {"Relics:","Lith V3 Relic (Radiant)","RewardSet439"},
        {"Relics:","Lith V4 Relic (Intact)","RewardSet440"},
        {"Relics:","Lith V4 Relic (Exceptional)","RewardSet441"},
        {"Relics:","Lith V4 Relic (Flawless)","RewardSet442"},
        {"Relics:","Lith V4 Relic (Radiant)","RewardSet443"},
        {"Relics:","Lith Z1 Relic (Intact)","RewardSet444"},
        {"Relics:","Lith Z1 Relic (Exceptional)","RewardSet445"},
        {"Relics:","Lith Z1 Relic (Flawless)","RewardSet446"},
        {"Relics:","Lith Z1 Relic (Radiant)","RewardSet447"},
        {"Relics:","Meso B1 Relic (Intact)","RewardSet448"},
        {"Relics:","Meso B1 Relic (Exceptional)","RewardSet449"},
        {"Relics:","Meso B1 Relic (Flawless)","RewardSet450"},
        {"Relics:","Meso B1 Relic (Radiant)","RewardSet451"},
        {"Relics:","Meso C1 Relic (Intact)","RewardSet452"},
        {"Relics:","Meso C1 Relic (Exceptional)","RewardSet453"},
        {"Relics:","Meso C1 Relic (Flawless)","RewardSet454"},
        {"Relics:","Meso C1 Relic (Radiant)","RewardSet455"},
        {"Relics:","Meso C2 Relic (Intact)","RewardSet456"},
        {"Relics:","Meso C2 Relic (Exceptional)","RewardSet457"},
        {"Relics:","Meso C2 Relic (Flawless)","RewardSet458"},
        {"Relics:","Meso C2 Relic (Radiant)","RewardSet459"},
        {"Relics:","Meso C3 Relic (Intact)","RewardSet460"},
        {"Relics:","Meso C3 Relic (Exceptional)","RewardSet461"},
        {"Relics:","Meso C3 Relic (Flawless)","RewardSet462"},
        {"Relics:","Meso C3 Relic (Radiant)","RewardSet463"},
        {"Relics:","Meso D1 Relic (Intact)","RewardSet464"},
        {"Relics:","Meso D1 Relic (Exceptional)","RewardSet465"},
        {"Relics:","Meso D1 Relic (Flawless)","RewardSet466"},
        {"Relics:","Meso D1 Relic (Radiant)","RewardSet467"},
        {"Relics:","Meso E1 Relic (Intact)","RewardSet468"},
        {"Relics:","Meso E1 Relic (Exceptional)","RewardSet469"},
        {"Relics:","Meso E1 Relic (Flawless)","RewardSet470"},
        {"Relics:","Meso E1 Relic (Radiant)","RewardSet471"},
        {"Relics:","Meso F1 Relic (Intact)","RewardSet472"},
        {"Relics:","Meso F1 Relic (Exceptional)","RewardSet473"},
        {"Relics:","Meso F1 Relic (Flawless)","RewardSet474"},
        {"Relics:","Meso F1 Relic (Radiant)","RewardSet475"},
        {"Relics:","Meso F2 Relic (Intact)","RewardSet476"},
        {"Relics:","Meso F2 Relic (Exceptional)","RewardSet477"},
        {"Relics:","Meso F2 Relic (Flawless)","RewardSet478"},
        {"Relics:","Meso F2 Relic (Radiant)","RewardSet479"},
        {"Relics:","Meso F3 Relic (Intact)","RewardSet480"},
        {"Relics:","Meso F3 Relic (Exceptional)","RewardSet481"},
        {"Relics:","Meso F3 Relic (Flawless)","RewardSet482"},
        {"Relics:","Meso F3 Relic (Radiant)","RewardSet483"},
        {"Relics:","Meso G1 Relic (Intact)","RewardSet484"},
        {"Relics:","Meso G1 Relic (Exceptional)","RewardSet485"},
        {"Relics:","Meso G1 Relic (Flawless)","RewardSet486"},
        {"Relics:","Meso G1 Relic (Radiant)","RewardSet487"},
        {"Relics:","Meso H1 Relic (Intact)","RewardSet488"},
        {"Relics:","Meso H1 Relic (Exceptional)","RewardSet489"},
        {"Relics:","Meso H1 Relic (Flawless)","RewardSet490"},
        {"Relics:","Meso H1 Relic (Radiant)","RewardSet491"},
        {"Relics:","Meso K1 Relic (Intact)","RewardSet492"},
        {"Relics:","Meso K1 Relic (Exceptional)","RewardSet493"},
        {"Relics:","Meso K1 Relic (Flawless)","RewardSet494"},
        {"Relics:","Meso K1 Relic (Radiant)","RewardSet495"},
        {"Relics:","Meso M1 Relic (Intact)","RewardSet496"},
        {"Relics:","Meso M1 Relic (Exceptional)","RewardSet497"},
        {"Relics:","Meso M1 Relic (Flawless)","RewardSet498"},
        {"Relics:","Meso M1 Relic (Radiant)","RewardSet499"},
        {"Relics:","Meso N1 Relic (Intact)","RewardSet500"},
        {"Relics:","Meso N1 Relic (Exceptional)","RewardSet501"},
        {"Relics:","Meso N1 Relic (Flawless)","RewardSet502"},
        {"Relics:","Meso N1 Relic (Radiant)","RewardSet503"},
        {"Relics:","Meso N2 Relic (Intact)","RewardSet504"},
        {"Relics:","Meso N2 Relic (Exceptional)","RewardSet505"},
        {"Relics:","Meso N2 Relic (Flawless)","RewardSet506"},
        {"Relics:","Meso N2 Relic (Radiant)","RewardSet507"},
        {"Relics:","Meso N3 Relic (Intact)","RewardSet508"},
        {"Relics:","Meso N3 Relic (Exceptional)","RewardSet509"},
        {"Relics:","Meso N3 Relic (Flawless)","RewardSet510"},
        {"Relics:","Meso N3 Relic (Radiant)","RewardSet511"},
        {"Relics:","Meso N4 Relic (Intact)","RewardSet512"},
        {"Relics:","Meso N4 Relic (Exceptional)","RewardSet513"},
        {"Relics:","Meso N4 Relic (Flawless)","RewardSet514"},
        {"Relics:","Meso N4 Relic (Radiant)","RewardSet515"},
        {"Relics:","Meso N5 Relic (Intact)","RewardSet516"},
        {"Relics:","Meso N5 Relic (Exceptional)","RewardSet517"},
        {"Relics:","Meso N5 Relic (Flawless)","RewardSet518"},
        {"Relics:","Meso N5 Relic (Radiant)","RewardSet519"},
        {"Relics:","Meso O1 Relic (Intact)","RewardSet520"},
        {"Relics:","Meso O1 Relic (Exceptional)","RewardSet521"},
        {"Relics:","Meso O1 Relic (Flawless)","RewardSet522"},
        {"Relics:","Meso O1 Relic (Radiant)","RewardSet523"},
        {"Relics:","Meso O2 Relic (Intact)","RewardSet524"},
        {"Relics:","Meso O2 Relic (Exceptional)","RewardSet525"},
        {"Relics:","Meso O2 Relic (Flawless)","RewardSet526"},
        {"Relics:","Meso O2 Relic (Radiant)","RewardSet527"},
        {"Relics:","Meso S1 Relic (Intact)","RewardSet528"},
        {"Relics:","Meso S1 Relic (Exceptional)","RewardSet529"},
        {"Relics:","Meso S1 Relic (Flawless)","RewardSet530"},
        {"Relics:","Meso S1 Relic (Radiant)","RewardSet531"},
        {"Relics:","Meso S2 Relic (Intact)","RewardSet532"},
        {"Relics:","Meso S2 Relic (Exceptional)","RewardSet533"},
        {"Relics:","Meso S2 Relic (Flawless)","RewardSet534"},
        {"Relics:","Meso S2 Relic (Radiant)","RewardSet535"},
        {"Relics:","Meso S3 Relic (Intact)","RewardSet536"},
        {"Relics:","Meso S3 Relic (Exceptional)","RewardSet537"},
        {"Relics:","Meso S3 Relic (Flawless)","RewardSet538"},
        {"Relics:","Meso S3 Relic (Radiant)","RewardSet539"},
        {"Relics:","Meso S4 Relic (Intact)","RewardSet540"},
        {"Relics:","Meso S4 Relic (Exceptional)","RewardSet541"},
        {"Relics:","Meso S4 Relic (Flawless)","RewardSet542"},
        {"Relics:","Meso S4 Relic (Radiant)","RewardSet543"},
        {"Relics:","Meso S5 Relic (Intact)","RewardSet544"},
        {"Relics:","Meso S5 Relic (Exceptional)","RewardSet545"},
        {"Relics:","Meso S5 Relic (Flawless)","RewardSet546"},
        {"Relics:","Meso S5 Relic (Radiant)","RewardSet547"},
        {"Relics:","Meso S6 Relic (Intact)","RewardSet548"},
        {"Relics:","Meso S6 Relic (Exceptional)","RewardSet549"},
        {"Relics:","Meso S6 Relic (Flawless)","RewardSet550"},
        {"Relics:","Meso S6 Relic (Radiant)","RewardSet551"},
        {"Relics:","Meso T1 Relic (Intact)","RewardSet552"},
        {"Relics:","Meso T1 Relic (Exceptional)","RewardSet553"},
        {"Relics:","Meso T1 Relic (Flawless)","RewardSet554"},
        {"Relics:","Meso T1 Relic (Radiant)","RewardSet555"},
        {"Relics:","Meso T2 Relic (Intact)","RewardSet556"},
        {"Relics:","Meso T2 Relic (Exceptional)","RewardSet557"},
        {"Relics:","Meso T2 Relic (Flawless)","RewardSet558"},
        {"Relics:","Meso T2 Relic (Radiant)","RewardSet559"},
        {"Relics:","Meso V1 Relic (Intact)","RewardSet560"},
        {"Relics:","Meso V1 Relic (Exceptional)","RewardSet561"},
        {"Relics:","Meso V1 Relic (Flawless)","RewardSet562"},
        {"Relics:","Meso V1 Relic (Radiant)","RewardSet563"},
        {"Relics:","Meso V2 Relic (Intact)","RewardSet564"},
        {"Relics:","Meso V2 Relic (Exceptional)","RewardSet565"},
        {"Relics:","Meso V2 Relic (Flawless)","RewardSet566"},
        {"Relics:","Meso V2 Relic (Radiant)","RewardSet567"},
        {"Relics:","Meso V3 Relic (Intact)","RewardSet568"},
        {"Relics:","Meso V3 Relic (Exceptional)","RewardSet569"},
        {"Relics:","Meso V3 Relic (Flawless)","RewardSet570"},
        {"Relics:","Meso V3 Relic (Radiant)","RewardSet571"},
        {"Relics:","Meso V4 Relic (Intact)","RewardSet572"},
        {"Relics:","Meso V4 Relic (Exceptional)","RewardSet573"},
        {"Relics:","Meso V4 Relic (Flawless)","RewardSet574"},
        {"Relics:","Meso V4 Relic (Radiant)","RewardSet575"},
        {"Relics:","Meso V5 Relic (Intact)","RewardSet576"},
        {"Relics:","Meso V5 Relic (Exceptional)","RewardSet577"},
        {"Relics:","Meso V5 Relic (Flawless)","RewardSet578"},
        {"Relics:","Meso V5 Relic (Radiant)","RewardSet579"},
        {"Relics:","Neo A1 Relic (Intact)","RewardSet580"},
        {"Relics:","Neo A1 Relic (Exceptional)","RewardSet581"},
        {"Relics:","Neo A1 Relic (Flawless)","RewardSet582"},
        {"Relics:","Neo A1 Relic (Radiant)","RewardSet583"},
        {"Relics:","Neo B1 Relic (Intact)","RewardSet584"},
        {"Relics:","Neo B1 Relic (Exceptional)","RewardSet585"},
        {"Relics:","Neo B1 Relic (Flawless)","RewardSet586"},
        {"Relics:","Neo B1 Relic (Radiant)","RewardSet587"},
        {"Relics:","Neo B2 Relic (Intact)","RewardSet588"},
        {"Relics:","Neo B2 Relic (Exceptional)","RewardSet589"},
        {"Relics:","Neo B2 Relic (Flawless)","RewardSet590"},
        {"Relics:","Neo B2 Relic (Radiant)","RewardSet591"},
        {"Relics:","Neo B3 Relic (Intact)","RewardSet592"},
        {"Relics:","Neo B3 Relic (Exceptional)","RewardSet593"},
        {"Relics:","Neo B3 Relic (Flawless)","RewardSet594"},
        {"Relics:","Neo B3 Relic (Radiant)","RewardSet595"},
        {"Relics:","Neo B4 Relic (Intact)","RewardSet596"},
        {"Relics:","Neo B4 Relic (Exceptional)","RewardSet597"},
        {"Relics:","Neo B4 Relic (Flawless)","RewardSet598"},
        {"Relics:","Neo B4 Relic (Radiant)","RewardSet599"},
        {"Relics:","Neo D1 Relic (Intact)","RewardSet600"},
        {"Relics:","Neo D1 Relic (Exceptional)","RewardSet601"},
        {"Relics:","Neo D1 Relic (Flawless)","RewardSet602"},
        {"Relics:","Neo D1 Relic (Radiant)","RewardSet603"},
        {"Relics:","Neo E1 Relic (Intact)","RewardSet604"},
        {"Relics:","Neo E1 Relic (Exceptional)","RewardSet605"},
        {"Relics:","Neo E1 Relic (Flawless)","RewardSet606"},
        {"Relics:","Neo E1 Relic (Radiant)","RewardSet607"},
        {"Relics:","Neo F1 Relic (Intact)","RewardSet608"},
        {"Relics:","Neo F1 Relic (Exceptional)","RewardSet609"},
        {"Relics:","Neo F1 Relic (Flawless)","RewardSet610"},
        {"Relics:","Neo F1 Relic (Radiant)","RewardSet611"},
        {"Relics:","Neo H1 Relic (Intact)","RewardSet612"},
        {"Relics:","Neo H1 Relic (Exceptional)","RewardSet613"},
        {"Relics:","Neo H1 Relic (Flawless)","RewardSet614"},
        {"Relics:","Neo H1 Relic (Radiant)","RewardSet615"},
        {"Relics:","Neo K1 Relic (Intact)","RewardSet616"},
        {"Relics:","Neo K1 Relic (Exceptional)","RewardSet617"},
        {"Relics:","Neo K1 Relic (Flawless)","RewardSet618"},
        {"Relics:","Neo K1 Relic (Radiant)","RewardSet619"},
        {"Relics:","Neo M1 Relic (Intact)","RewardSet620"},
        {"Relics:","Neo M1 Relic (Exceptional)","RewardSet621"},
        {"Relics:","Neo M1 Relic (Flawless)","RewardSet622"},
        {"Relics:","Neo M1 Relic (Radiant)","RewardSet623"},
        {"Relics:","Neo N1 Relic (Intact)","RewardSet624"},
        {"Relics:","Neo N1 Relic (Exceptional)","RewardSet625"},
        {"Relics:","Neo N1 Relic (Flawless)","RewardSet626"},
        {"Relics:","Neo N1 Relic (Radiant)","RewardSet627"},
        {"Relics:","Neo N2 Relic (Intact)","RewardSet628"},
        {"Relics:","Neo N2 Relic (Exceptional)","RewardSet629"},
        {"Relics:","Neo N2 Relic (Flawless)","RewardSet630"},
        {"Relics:","Neo N2 Relic (Radiant)","RewardSet631"},
        {"Relics:","Neo N3 Relic (Intact)","RewardSet632"},
        {"Relics:","Neo N3 Relic (Exceptional)","RewardSet633"},
        {"Relics:","Neo N3 Relic (Flawless)","RewardSet634"},
        {"Relics:","Neo N3 Relic (Radiant)","RewardSet635"},
        {"Relics:","Neo N4 Relic (Intact)","RewardSet636"},
        {"Relics:","Neo N4 Relic (Exceptional)","RewardSet637"},
        {"Relics:","Neo N4 Relic (Flawless)","RewardSet638"},
        {"Relics:","Neo N4 Relic (Radiant)","RewardSet639"},
        {"Relics:","Neo N5 Relic (Intact)","RewardSet640"},
        {"Relics:","Neo N5 Relic (Exceptional)","RewardSet641"},
        {"Relics:","Neo N5 Relic (Flawless)","RewardSet642"},
        {"Relics:","Neo N5 Relic (Radiant)","RewardSet643"},
        {"Relics:","Neo N6 Relic (Intact)","RewardSet644"},
        {"Relics:","Neo N6 Relic (Exceptional)","RewardSet645"},
        {"Relics:","Neo N6 Relic (Flawless)","RewardSet646"},
        {"Relics:","Neo N6 Relic (Radiant)","RewardSet647"},
        {"Relics:","Neo N7 Relic (Intact)","RewardSet648"},
        {"Relics:","Neo N7 Relic (Exceptional)","RewardSet649"},
        {"Relics:","Neo N7 Relic (Flawless)","RewardSet650"},
        {"Relics:","Neo N7 Relic (Radiant)","RewardSet651"},
        {"Relics:","Neo O1 Relic (Intact)","RewardSet652"},
        {"Relics:","Neo O1 Relic (Exceptional)","RewardSet653"},
        {"Relics:","Neo O1 Relic (Flawless)","RewardSet654"},
        {"Relics:","Neo O1 Relic (Radiant)","RewardSet655"},
        {"Relics:","Neo S1 Relic (Intact)","RewardSet656"},
        {"Relics:","Neo S1 Relic (Exceptional)","RewardSet657"},
        {"Relics:","Neo S1 Relic (Flawless)","RewardSet658"},
        {"Relics:","Neo S1 Relic (Radiant)","RewardSet659"},
        {"Relics:","Neo S2 Relic (Intact)","RewardSet660"},
        {"Relics:","Neo S2 Relic (Exceptional)","RewardSet661"},
        {"Relics:","Neo S2 Relic (Flawless)","RewardSet662"},
        {"Relics:","Neo S2 Relic (Radiant)","RewardSet663"},
        {"Relics:","Neo S3 Relic (Intact)","RewardSet664"},
        {"Relics:","Neo S3 Relic (Exceptional)","RewardSet665"},
        {"Relics:","Neo S3 Relic (Flawless)","RewardSet666"},
        {"Relics:","Neo S3 Relic (Radiant)","RewardSet667"},
        {"Relics:","Neo S5 Relic (Intact)","RewardSet668"},
        {"Relics:","Neo S5 Relic (Exceptional)","RewardSet669"},
        {"Relics:","Neo S5 Relic (Flawless)","RewardSet670"},
        {"Relics:","Neo S5 Relic (Radiant)","RewardSet671"},
        {"Relics:","Neo S6 Relic (Intact)","RewardSet672"},
        {"Relics:","Neo S6 Relic (Exceptional)","RewardSet673"},
        {"Relics:","Neo S6 Relic (Flawless)","RewardSet674"},
        {"Relics:","Neo S6 Relic (Radiant)","RewardSet675"},
        {"Relics:","Neo S7 Relic (Intact)","RewardSet676"},
        {"Relics:","Neo S7 Relic (Exceptional)","RewardSet677"},
        {"Relics:","Neo S7 Relic (Flawless)","RewardSet678"},
        {"Relics:","Neo S7 Relic (Radiant)","RewardSet679"},
        {"Relics:","Neo S8 Relic (Intact)","RewardSet680"},
        {"Relics:","Neo S8 Relic (Exceptional)","RewardSet681"},
        {"Relics:","Neo S8 Relic (Flawless)","RewardSet682"},
        {"Relics:","Neo S8 Relic (Radiant)","RewardSet683"},
        {"Relics:","Neo T1 Relic (Intact)","RewardSet684"},
        {"Relics:","Neo T1 Relic (Exceptional)","RewardSet685"},
        {"Relics:","Neo T1 Relic (Flawless)","RewardSet686"},
        {"Relics:","Neo T1 Relic (Radiant)","RewardSet687"},
        {"Relics:","Neo V1 Relic (Intact)","RewardSet688"},
        {"Relics:","Neo V1 Relic (Exceptional)","RewardSet689"},
        {"Relics:","Neo V1 Relic (Flawless)","RewardSet690"},
        {"Relics:","Neo V1 Relic (Radiant)","RewardSet691"},
        {"Relics:","Neo V2 Relic (Intact)","RewardSet692"},
        {"Relics:","Neo V2 Relic (Exceptional)","RewardSet693"},
        {"Relics:","Neo V2 Relic (Flawless)","RewardSet694"},
        {"Relics:","Neo V2 Relic (Radiant)","RewardSet695"},
        {"Relics:","Neo V3 Relic (Intact)","RewardSet696"},
        {"Relics:","Neo V3 Relic (Exceptional)","RewardSet697"},
        {"Relics:","Neo V3 Relic (Flawless)","RewardSet698"},
        {"Relics:","Neo V3 Relic (Radiant)","RewardSet699"},
        {"Relics:","Neo V4 Relic (Intact)","RewardSet700"},
        {"Relics:","Neo V4 Relic (Exceptional)","RewardSet701"},
        {"Relics:","Neo V4 Relic (Flawless)","RewardSet702"},
        {"Relics:","Neo V4 Relic (Radiant)","RewardSet703"},
        {"Relics:","Neo V5 Relic (Intact)","RewardSet704"},
        {"Relics:","Neo V5 Relic (Exceptional)","RewardSet705"},
        {"Relics:","Neo V5 Relic (Flawless)","RewardSet706"},
        {"Relics:","Neo V5 Relic (Radiant)","RewardSet707"},
        {"Relics:","Neo V6 Relic (Intact)","RewardSet708"},
        {"Relics:","Neo V6 Relic (Exceptional)","RewardSet709"},
        {"Relics:","Neo V6 Relic (Flawless)","RewardSet710"},
        {"Relics:","Neo V6 Relic (Radiant)","RewardSet711"},
        {"Relics:","Neo Z1 Relic (Intact)","RewardSet712"},
        {"Relics:","Neo Z1 Relic (Exceptional)","RewardSet713"},
        {"Relics:","Neo Z1 Relic (Flawless)","RewardSet714"},
        {"Relics:","Neo Z1 Relic (Radiant)","RewardSet715"},
        {"Keys:","Recover The Orokin Archive","RewardSet716"},
        {"Keys:","Help Clem Retrieve The Relic","RewardSet717"},
        {"Keys:","Mutalist Alad V Assassinate","RewardSet718"},
        {"Keys:","Acquire The Incubator Segment","RewardSet719"},
        {"Keys:","Orokin Derelict Defense","RewardSet172"},
        {"Keys:","Orokin Derelict Assassinate","RewardSet721"},
        {"Keys:","Orokin Derelict Survival","RewardSet174"},
        {"Keys:","Jordas Golem Assassinate","RewardSet723"},
        {"Keys:","Vay Hek Frequency Triangulator","RewardSet028"},
        {"Dynamic Location Rewards:","Fomorian Sabotage","RewardSet725"},
        {"Dynamic Location Rewards:","Phorid Assassination","RewardSet726"},
        {"Dynamic Location Rewards:","Void Onslaught (Easy)","RewardSet727"},
        {"Dynamic Location Rewards:","Void Onslaught (Hard)","RewardSet728"},
        {"Dynamic Location Rewards:","Nightmare Mode Rewards","RewardSet729"},
        {"Dynamic Location Rewards:","Razorback","RewardSet730"},
        {"Dynamic Location Rewards:","Derelict Vault","RewardSet731"},
        {"Dynamic Location Rewards:","Plains of Eidolon Incursions","RewardSet732"},
        {"Sorties:","Sortie","RewardSet733"},
        {"Mod Drops by Mod:","Napalm","RewardSet734"},
        {"Mod Drops by Mod:","Infested Mesa","RewardSet735"},
        {"Mod Drops by Mod:","Chroma","RewardSet735"},
        {"Mod Drops by Mod:","Tusk Napalm","RewardSet734"},
        {"Mod Drops by Mod:","Kuva Napalm","RewardSet734"},
        {"Mod Drops by Mod:","Tenno Specter","RewardSet735"},
        {"Mod Drops by Mod:","Attack Drone","RewardSet740"},
        {"Mod Drops by Mod:","Regulator","RewardSet741"},
        {"Mod Drops by Mod:","Vem Tabook","RewardSet742"},
        {"Mod Drops by Mod:","Leekter","RewardSet743"},
        {"Mod Drops by Mod:","Shik Tal","RewardSet744"},
        {"Mod Drops by Mod:","Sensor Regulator","RewardSet741"},
        {"Mod Drops by Mod:","Remech Osprey","RewardSet741"},
        {"Mod Drops by Mod:","Frontier Regulator","RewardSet741"},
        {"Mod Drops by Mod:","Oxium Osprey","RewardSet748"},
        {"Mod Drops by Mod:","Nemes","RewardSet748"},
        {"Mod Drops by Mod:","Carabus","RewardSet748"},
        {"Mod Drops by Mod:","Rathuum Broadcaster","RewardSet741"},
        {"Mod Drops by Mod:","Kuva Lancer","RewardSet752"},
        {"Mod Drops by Mod:","Lancer","RewardSet752"},
        {"Mod Drops by Mod:","Drekar Lancer","RewardSet754"},
        {"Mod Drops by Mod:","Drekar Elite Lancer","RewardSet754"},
        {"Mod Drops by Mod:","Drekar Scorpion","RewardSet752"},
        {"Mod Drops by Mod:","Captain Vor","RewardSet757"},
        {"Mod Drops by Mod:","Alad V","RewardSet757"},
        {"Mod Drops by Mod:","Mutalist Alad V","RewardSet757"},
        {"Mod Drops by Mod:","Frontier Lancer","RewardSet752"},
        {"Mod Drops by Mod:","Frontier Hellion","RewardSet752"},
        {"Mod Drops by Mod:","Tusk Hellion","RewardSet752"},
        {"Mod Drops by Mod:","Frontier Heavy Gunner","RewardSet752"},
        {"Mod Drops by Mod:","Kuva Hellion","RewardSet752"},
        {"Mod Drops by Mod:","Tyl Regor","RewardSet765"},
        {"Mod Drops by Mod:","Arid Lancer","RewardSet752"},
        {"Mod Drops by Mod:","Nightwatch Reaver","RewardSet752"},
        {"Mod Drops by Mod:","Tusk Lancer","RewardSet752"},
        {"Mod Drops by Mod:","Tusk Reaver","RewardSet769"},
        {"Mod Drops by Mod:","Hellion","RewardSet752"},
        {"Mod Drops by Mod:","Arid Hellion","RewardSet752"},
        {"Mod Drops by Mod:","Heavy Gunner","RewardSet772"},
        {"Mod Drops by Mod:","Frontier Trooper","RewardSet773"},
        {"Mod Drops by Mod:","Frontier Eviscerator","RewardSet773"},
        {"Mod Drops by Mod:","Drekar Trooper","RewardSet775"},
        {"Mod Drops by Mod:","Drekar Heavy Gunner","RewardSet776"},
        {"Mod Drops by Mod:","Trooper","RewardSet773"},
        {"Mod Drops by Mod:","Drekar Eviscerator","RewardSet778"},
        {"Mod Drops by Mod:","Detron Crewman","RewardSet779"},
        {"Mod Drops by Mod:","Kuva Trooper","RewardSet773"},
        {"Mod Drops by Mod:","Kuva Eviscerator","RewardSet773"},
        {"Mod Drops by Mod:","Eviscerator","RewardSet773"},
        {"Mod Drops by Mod:","Commander","RewardSet783"},
        {"Mod Drops by Mod:","General Sargas Ruk","RewardSet784"},
        {"Mod Drops by Mod:","Arid Trooper","RewardSet773"},
        {"Mod Drops by Mod:","Tusk Trooper","RewardSet773"},
        {"Mod Drops by Mod:","Tusk Eviscerator","RewardSet773"},
        {"Mod Drops by Mod:","Arid Eviscerator","RewardSet773"},
        {"Mod Drops by Mod:","Eidolon Vomvalyst","RewardSet789"},
        {"Mod Drops by Mod:","Crewman","RewardSet790"},
        {"Mod Drops by Mod:","Elite Crewman","RewardSet791"},
        {"Mod Drops by Mod:","Corpus Power Carrier","RewardSet790"},
        {"Mod Drops by Mod:","Nightwatch Lancer","RewardSet790"},
        {"Mod Drops by Mod:","Grineer Power Carrier","RewardSet790"},
        {"Mod Drops by Mod:","Mutalist Osprey Carrier","RewardSet790"},
        {"Mod Drops by Mod:","Hellion Power Carrier","RewardSet790"},
        {"Mod Drops by Mod:","Charger","RewardSet797"},
        {"Mod Drops by Mod:","Juggernaut","RewardSet798"},
        {"Mod Drops by Mod:","Juggernaut Behemoth","RewardSet798"},
        {"Mod Drops by Mod:","Carrion Charger","RewardSet797"},
        {"Mod Drops by Mod:","Jack O'Naut","RewardSet798"},
        {"Mod Drops by Mod:","Orokin Spectator","RewardSet802"},
        {"Mod Drops by Mod:","Nox","RewardSet803"},
        {"Mod Drops by Mod:","Orokin Drone","RewardSet802"},
        {"Mod Drops by Mod:","Corrupted Crewman","RewardSet805"},
        {"Mod Drops by Mod:","Drahk Master","RewardSet806"},
        {"Mod Drops by Mod:","Infested Corpus","RewardSet807"},
        {"Mod Drops by Mod:","Ancient Infested","RewardSet807"},
        {"Mod Drops by Mod:","Infested Grineer","RewardSet807"},
        {"Mod Drops by Mod:","Drekar Butcher","RewardSet810"},
        {"Mod Drops by Mod:","Grineer Manic","RewardSet811"},
        {"Mod Drops by Mod:","Butcher","RewardSet806"},
        {"Mod Drops by Mod:","Ambulas","RewardSet813"},
        {"Mod Drops by Mod:","Toxic Crawler","RewardSet814"},
        {"Mod Drops by Mod:","Lobber Crawler","RewardSet814"},
        {"Mod Drops by Mod:","Mutalist Osprey","RewardSet816"},
        {"Mod Drops by Mod:","Ghoul Rictus","RewardSet817"},
        {"Mod Drops by Mod:","Ghoul Devourer","RewardSet818"},
        {"Mod Drops by Mod:","Bailiff Defector","RewardSet819"},
        {"Mod Drops by Mod:","Guardsman","RewardSet820"},
        {"Mod Drops by Mod:","Mine Osprey","RewardSet816"},
        {"Mod Drops by Mod:","Kuva Butcher","RewardSet806"},
        {"Mod Drops by Mod:","Kuva Drahk Master","RewardSet806"},
        {"Mod Drops by Mod:","Bailiff","RewardSet824"},
        {"Mod Drops by Mod:","J3 Jordas Golem","RewardSet825"},
        {"Mod Drops by Mod:","Jordas Golem","RewardSet825"},
        {"Mod Drops by Mod:","Hyekka Master","RewardSet827"},
        {"Mod Drops by Mod:","Drekar Manic","RewardSet828"},
        {"Mod Drops by Mod:","Sikula","RewardSet816"},
        {"Mod Drops by Mod:","Tusk Butcher","RewardSet806"},
        {"Mod Drops by Mod:","Venin Mutalist","RewardSet816"},
        {"Mod Drops by Mod:","Kuva Hyekka Master","RewardSet827"},
        {"Mod Drops by Mod:","Frontier Bailiff","RewardSet806"},
        {"Mod Drops by Mod:","Sapping Osprey","RewardSet834"},
        {"Mod Drops by Mod:","Leech Osprey","RewardSet834"},
        {"Mod Drops by Mod:","Ancient Disruptor","RewardSet836"},
        {"Mod Drops by Mod:","Shield Lancer","RewardSet837"},
        {"Mod Drops by Mod:","Tar Mutalist Moa","RewardSet836"},
        {"Mod Drops by Mod:","Kuva Shield Lancer","RewardSet837"},
        {"Mod Drops by Mod:","Brood Mother","RewardSet840"},
        {"Mod Drops by Mod:","Tusk Shield Lancer","RewardSet837"},
        {"Mod Drops by Mod:","Elite Frontier Lancer","RewardSet842"},
        {"Mod Drops by Mod:","Dargyn Pilot","RewardSet842"},
        {"Mod Drops by Mod:","Elite Lancer","RewardSet844"},
        {"Mod Drops by Mod:","Scavenger Drone","RewardSet845"},
        {"Mod Drops by Mod:","Draga","RewardSet842"},
        {"Mod Drops by Mod:","Shock Draga","RewardSet842"},
        {"Mod Drops by Mod:","Darek Draga","RewardSet842"},
        {"Mod Drops by Mod:","Tusk Elite Lancer","RewardSet842"},
        {"Mod Drops by Mod:","Elite Arid Lancer","RewardSet842"},
        {"Mod Drops by Mod:","Kuva Elite Lancer","RewardSet842"},
        {"Mod Drops by Mod:","Crawler","RewardSet852"},
        {"Mod Drops by Mod:","Nauseous Crawler","RewardSet853"},
        {"Mod Drops by Mod:","Void Shade","RewardSet853"},
        {"Mod Drops by Mod:","Nauseous Void Shade","RewardSet853"},
        {"Mod Drops by Mod:","Volatile Runner","RewardSet856"},
        {"Mod Drops by Mod:","Orphid Husks","RewardSet856"},
        {"Mod Drops by Mod:","Shield Osprey","RewardSet858"},
        {"Mod Drops by Mod:","Jackal","RewardSet859"},
        {"Mod Drops by Mod:","Eidolon Hydrolyst","RewardSet860"},
        {"Mod Drops by Mod:","Moa","RewardSet861"},
        {"Mod Drops by Mod:","Isolator Bursa","RewardSet862"},
        {"Mod Drops by Mod:","Drover Bursa","RewardSet863"},
        {"Mod Drops by Mod:","Denial Bursa","RewardSet864"},
        {"Mod Drops by Mod:","Ratel","RewardSet861"},
        {"Mod Drops by Mod:","Corpus Tech","RewardSet866"},
        {"Mod Drops by Mod:","Corpus Warden","RewardSet866"},
        {"Mod Drops by Mod:","Frontier Butcher","RewardSet868"},
        {"Mod Drops by Mod:","The Sergeant","RewardSet869"},
        {"Mod Drops by Mod:","Raptor","RewardSet870"},
        {"Mod Drops by Mod:","Raptor Mt","RewardSet871"},
        {"Mod Drops by Mod:","Raptor Rv","RewardSet871"},
        {"Mod Drops by Mod:","Raptor Ns","RewardSet871"},
        {"Mod Drops by Mod:","Arid Butcher","RewardSet868"},
        {"Mod Drops by Mod:","Hyena Pack","RewardSet875"},
        {"Mod Drops by Mod:","Hyena Th","RewardSet875"},
        {"Mod Drops by Mod:","Hyena Pb","RewardSet875"},
        {"Mod Drops by Mod:","Hyena Ln2","RewardSet875"},
        {"Mod Drops by Mod:","Hyena Ng","RewardSet875"},
        {"Mod Drops by Mod:","Lt Lech Kril","RewardSet880"},
        {"Mod Drops by Mod:","Vay Hek Terra Frame","RewardSet881"},
        {"Mod Drops by Mod:","Councilor Vay Hek","RewardSet882"},
        {"Mod Drops by Mod:","Shockwave Moa","RewardSet883"},
        {"Mod Drops by Mod:","Phorid","RewardSet880"},
        {"Mod Drops by Mod:","Artificer","RewardSet881"},
        {"Mod Drops by Mod:","Stalker","RewardSet886"},
        {"Mod Drops by Mod:","Shadow Stalker","RewardSet887"},
        {"Mod Drops by Mod:","Hunhow","RewardSet886"},
        {"Mod Drops by Mod:","Frontier Seeker","RewardSet889"},
        {"Mod Drops by Mod:","Drekar Seeker","RewardSet890"},
        {"Mod Drops by Mod:","Seeker","RewardSet889"},
        {"Mod Drops by Mod:","Kuva Seeker","RewardSet889"},
        {"Mod Drops by Mod:","Arid Seeker","RewardSet889"},
        {"Mod Drops by Mod:","Tusk Seeker","RewardSet889"},
        {"Mod Drops by Mod:","Kubrow","RewardSet895"},
        {"Mod Drops by Mod:","Drahk","RewardSet895"},
        {"Mod Drops by Mod:","Kuva Drahk","RewardSet895"},
        {"Mod Drops by Mod:","Roller","RewardSet898"},
        {"Mod Drops by Mod:","Latcher","RewardSet898"},
        {"Mod Drops by Mod:","Bombard","RewardSet900"},
        {"Mod Drops by Mod:","Roller Sentry","RewardSet898"},
        {"Mod Drops by Mod:","Kuva Heavy Gunner","RewardSet902"},
        {"Mod Drops by Mod:","Kuva Bombard","RewardSet900"},
        {"Mod Drops by Mod:","Tusk Heavy Gunner","RewardSet902"},
        {"Mod Drops by Mod:","Tusk Roller","RewardSet898"},
        {"Mod Drops by Mod:","Tusk Bombard","RewardSet900"},
        {"Mod Drops by Mod:","Tusk Mortar Bombard","RewardSet900"},
        {"Mod Drops by Mod:","Drekar Manic Bombard","RewardSet908"},
        {"Mod Drops by Mod:","Manic Bombard","RewardSet908"},
        {"Mod Drops by Mod:","Kuva Roller","RewardSet898"},
        {"Mod Drops by Mod:","Drekar Ballista","RewardSet911"},
        {"Mod Drops by Mod:","Tusk Ballista","RewardSet912"},
        {"Mod Drops by Mod:","Ballista","RewardSet912"},
        {"Mod Drops by Mod:","Drekar Hellion","RewardSet914"},
        {"Mod Drops by Mod:","Kuva Ballista","RewardSet912"},
        {"Mod Drops by Mod:","Toxic Ancient","RewardSet916"},
        {"Mod Drops by Mod:","Boiler","RewardSet916"},
        {"Mod Drops by Mod:","Arcane Boiler","RewardSet916"},
        {"Mod Drops by Mod:","Sprag","RewardSet919"},
        {"Mod Drops by Mod:","Ven'Kra Tel","RewardSet919"},
        {"Mod Drops by Mod:","Lynx","RewardSet921"},
        {"Mod Drops by Mod:","Flameblade","RewardSet922"},
        {"Mod Drops by Mod:","Railgun Moa","RewardSet923"},
        {"Mod Drops by Mod:","Tusk Flameblade","RewardSet922"},
        {"Mod Drops by Mod:","Tusk Predator","RewardSet922"},
        {"Mod Drops by Mod:","Kuva Flameblade","RewardSet922"},
        {"Mod Drops by Mod:","Grineer Warden","RewardSet927"},
        {"Mod Drops by Mod:","Arid Heavy Gunner","RewardSet927"},
        {"Mod Drops by Mod:","Corrupted Warden","RewardSet927"},
        {"Mod Drops by Mod:","Prod Crewman","RewardSet930"},
        {"Mod Drops by Mod:","Fusion Moa","RewardSet931"},
        {"Mod Drops by Mod:","Powerfist","RewardSet932"},
        {"Mod Drops by Mod:","Kuva Powerclaw","RewardSet932"},
        {"Mod Drops by Mod:","Electric Crawler","RewardSet934"},
        {"Mod Drops by Mod:","Ghoul Expired","RewardSet935"},
        {"Mod Drops by Mod:","Scorpion","RewardSet936"},
        {"Mod Drops by Mod:","Kuva Scorpion","RewardSet936"},
        {"Mod Drops by Mod:","Nullifier Crewman","RewardSet938"},
        {"Mod Drops by Mod:","Sniper Crewman","RewardSet938"},
        {"Mod Drops by Mod:","Anti Moa","RewardSet940"},
        {"Mod Drops by Mod:","Swarm Mutalist Moa","RewardSet941"},
        {"Mod Drops by Mod:","Ancient Healer","RewardSet941"},
        {"Mod Drops by Mod:","Scorch","RewardSet943"},
        {"Mod Drops by Mod:","Ghoul Auger","RewardSet944"},
        {"Mod Drops by Mod:","Kuva Scorch","RewardSet943"},
        {"Mod Drops by Mod:","Leaper","RewardSet946"},
        {"Mod Drops by Mod:","Knave Specter","RewardSet947"},
        {"Mod Drops by Mod:","Corrupted Moa","RewardSet948"},
        {"Mod Drops by Mod:","Corrupted Lancer","RewardSet949"},
        {"Mod Drops by Mod:","Corrupted Butcher","RewardSet950"},
        {"Mod Drops by Mod:","Lephantis","RewardSet951"},
        {"Mod Drops by Mod:","Corrupted Ancient","RewardSet952"},
        {"Mod Drops by Mod:","Corrupted Heavy Gunner","RewardSet953"},
        {"Mod Drops by Mod:","Corrupted Bombard","RewardSet953"},
        {"Mod Drops by Mod:","Corrupted Nullifier","RewardSet953"},
        {"Mod Drops by Mod:","Eidolon Teralyst","RewardSet956"},
        {"Mod Drops by Mod:","Eidolon Gantulyst","RewardSet957"},
        {"Mod Drops by Mod:","Kuva Jester","RewardSet958"},
        {"Mod Drops by Mod:","Kuva Guardian","RewardSet959"},
        {"Mod Drops by Mod:","Shield Dargyn","RewardSet960"},
        {"Mod Drops by Mod:","Cannon Battery","RewardSet961"},
        {"Mod Drops by Mod:","Turret","RewardSet962"},
        {"Mod Drops by Mod:","Corvette","RewardSet963"},
        {"Mod Drops by Mod:","Carrier","RewardSet964"},
        {"Mod Drops by Mod:","Gox","RewardSet963"},
        {"Mod Drops by Mod:","Tusk Command Dargyn","RewardSet966"},
        {"Mod Drops by Mod:","Tusk Shield Dargyn","RewardSet967"},
        {"Mod Drops by Mod:","Tusk Dargyn","RewardSet967"},
        {"Mod Drops by Mod:","Kuva Dargyn","RewardSet966"},
        {"Mod Drops by Mod:","Hellion Dargyn","RewardSet966"},
        {"Mod Drops by Mod:","Ogma","RewardSet971"},
        {"Mod Drops by Mod:","Ogma Elite","RewardSet971"},
        {"Mod Drops by Mod:","Locust Drone","RewardSet973"},
        {"Mod Drops by Mod:","Lancer Dreg","RewardSet974"},
        {"Mod Drops by Mod:","Temporal Dreg","RewardSet975"},
        {"Mod Drops by Mod:","Zeplen","RewardSet976"},
        {"Mod Drops by Mod:","Orphid Specter","RewardSet977"},
        {"Mod Drops by Mod:","Plains Commander","RewardSet978"},
        {"Mod Drops by Mod:","Nul Comba","RewardSet979"},
        {"Mod Drops by Mod:","Fog Scrambus","RewardSet979"},
        {"Mod Drops by Mod:","Sap Scrambus","RewardSet979"},
        {"Mod Drops by Mod:","Nul Scrambus","RewardSet979"},
        {"Mod Drops by Mod:","Slo Scrambus","RewardSet979"},
        {"Mod Drops by Mod:","Datalyst","RewardSet979"},
        {"Mod Drops by Mod:","Fog Comba","RewardSet979"},
        {"Mod Drops by Mod:","Slo Comba","RewardSet979"},
        {"Mod Drops by Mod:","Sap Comba","RewardSet979"},
        {"Mod Drops by Mod:","Malice","RewardSet988"},
        {"Mod Drops by Mod:","Misery","RewardSet989"},
        {"Mod Drops by Mod:","Recon Commander","RewardSet990"},
        {"Mod Drops by Mod:","Aerial Commander","RewardSet991"},
        {"Mod Drops by Mod:","Ghoul Auger Alpha","RewardSet992"},
        {"Mod Drops by Mod:","Hemocyte","RewardSet993"},
        {"Mod Drops by Mod:","Ghoul Rictus Alpha","RewardSet994"},
        {"Mod Drops by Mod:","Corrupted Vor","RewardSet995"},
        {"Mod Drops by Mod:","Battalyst","RewardSet996"},
        {"Mod Drops by Mod:","Decaying Battalyst","RewardSet996"},
        {"Mod Drops by Mod:","Conculyst","RewardSet998"},
        {"Mod Drops by Mod:","Decaying Conculyst","RewardSet998"},
        {"Mod Drops by Mod:","Shield-Hellion Dargyn","RewardSet1000"},
        {"Mod Drops by Mod:","Courier","RewardSet1001"},
        {"Mod Drops by Mod:","Dargyn","RewardSet1002"},
        {"Mod Drops by Mod:","Kela De Thaym","RewardSet1003"},
        {"Mod Drops by Mod:","Feyarch Specter","RewardSet1004"},
        {"Mod Drops by Mod:","Hyekka","RewardSet1005"},
        {"Mod Drops by Mod:","Kavat","RewardSet1006"},
        {"Mod Drops by Mod:","Dreg","RewardSet1007"},
        {"Mod Drops by Mod:","Mutalist Toxic Carrier","RewardSet1007"},
        {"Mod Drops by Mod:","Attack Mutalist","RewardSet1007"},
        {"Mod Drops by Mod:","Mutalist Lightning Carrier","RewardSet1007"},
        {"Mod Drops by Mod:","Ranger","RewardSet1011"},
        {"Mod Drops by Mod:","Frigate","RewardSet1011"},
        {"Mod Drops by Mod:","Penta Ranger","RewardSet1011"},
        {"Mod Drops by Mod:","Quanta Ranger","RewardSet1011"},
        {"Mod Drops by Mod:","Torment","RewardSet1015"},
        {"Mod Drops by Mod:","Angst","RewardSet1016"},
        {"Mod Drops by Mod:","Mania","RewardSet1017"},
        {"Mod Drops by Mod:","Violence","RewardSet1018"},
        {"Mod Drops by Mod:","Eidolon Gantulyst (Special)","RewardSet1019"},
        {"Mod Drops by Mod:","Eidolon Hydrolyst (Special)","RewardSet1020"},
        {"Mod Drops by Mod:","Ved Xol","RewardSet1021"},
        {"Mod Drops by Mod:","Nako Xol","RewardSet1021"},
        {"Mod Drops by Mod:","Pelna Cade","RewardSet1023"},
        {"Mod Drops by Mod:","Jad Teran","RewardSet1021"},
        {"Mod Drops by Mod:","Azoth","RewardSet1021"},
        {"Mod Drops by Mod:","Raptor Rx","RewardSet1021"},
        {"Mod Drops by Mod:","Auditor","RewardSet1021"},
        {"Mod Drops by Mod:","Jen Dro","RewardSet1021"},
        {"Mod Drops by Mod:","M-W.A.M.","RewardSet1021"},
        {"Mod Drops by Mod:","Derim Zahn","RewardSet1021"},
        {"Mod Drops by Mod:","Tia Mayn","RewardSet1021"},
        {"Mod Drops by Mod:","Armis Ulta","RewardSet1021"},
        {"Mod Drops by Mod:","Dru Pesfor","RewardSet1021"},
        {"Mod Drops by Mod:","Rana Del","RewardSet1021"},
        {"Mod Drops by Mod:","002-Er","RewardSet1021"},
        {"Mod Drops by Mod:","Executioner Dhurnam","RewardSet1036"},
        {"Mod Drops by Mod:","Eidolon Teralyst (Special)","RewardSet1037"},
        {"Mod Drops by Enemy:","Attack Drone","RewardSet740"},
        {"Mod Drops by Enemy:","Orokin Spectator","RewardSet802"},
        {"Mod Drops by Enemy:","Kuva Lancer","RewardSet752"},
        {"Mod Drops by Enemy:","Ancient Disruptor","RewardSet836"},
        {"Mod Drops by Enemy:","Lancer","RewardSet752"},
        {"Mod Drops by Enemy:","Shield Osprey","RewardSet858"},
        {"Mod Drops by Enemy:","Drahk Master","RewardSet806"},
        {"Mod Drops by Enemy:","Drekar Lancer","RewardSet754"},
        {"Mod Drops by Enemy:","Drekar Elite Lancer","RewardSet754"},
        {"Mod Drops by Enemy:","Drekar Scorpion","RewardSet752"},
        {"Mod Drops by Enemy:","Regulator","RewardSet741"},
        {"Mod Drops by Enemy:","Captain Vor","RewardSet757"},
        {"Mod Drops by Enemy:","Lt Lech Kril","RewardSet880"},
        {"Mod Drops by Enemy:","Kubrow","RewardSet895"},
        {"Mod Drops by Enemy:","Roller","RewardSet898"},
        {"Mod Drops by Enemy:","Latcher","RewardSet898"},
        {"Mod Drops by Enemy:","Corrupted Lancer","RewardSet949"},
        {"Mod Drops by Enemy:","Corrupted Crewman","RewardSet805"},
        {"Mod Drops by Enemy:","Corrupted Butcher","RewardSet950"},
        {"Mod Drops by Enemy:","Corrupted Moa","RewardSet948"},
        {"Mod Drops by Enemy:","Corrupted Ancient","RewardSet952"},
        {"Mod Drops by Enemy:","Corrupted Heavy Gunner","RewardSet953"},
        {"Mod Drops by Enemy:","Corrupted Bombard","RewardSet953"},
        {"Mod Drops by Enemy:","Corrupted Nullifier","RewardSet953"},
        {"Mod Drops by Enemy:","Charger","RewardSet797"},
        {"Mod Drops by Enemy:","Crawler","RewardSet852"},
        {"Mod Drops by Enemy:","Leaper","RewardSet946"},
        {"Mod Drops by Enemy:","Volatile Runner","RewardSet856"},
        {"Mod Drops by Enemy:","Lephantis","RewardSet951"},
        {"Mod Drops by Enemy:","Infested Corpus","RewardSet807"},
        {"Mod Drops by Enemy:","Ancient Infested","RewardSet807"},
        {"Mod Drops by Enemy:","Infested Grineer","RewardSet807"},
        {"Mod Drops by Enemy:","Alad V","RewardSet757"},
        {"Mod Drops by Enemy:","Vem Tabook","RewardSet742"},
        {"Mod Drops by Enemy:","Leekter","RewardSet743"},
        {"Mod Drops by Enemy:","Shik Tal","RewardSet744"},
        {"Mod Drops by Enemy:","Mutalist Alad V","RewardSet757"},
        {"Mod Drops by Enemy:","Stalker","RewardSet886"},
        {"Mod Drops by Enemy:","Vay Hek Terra Frame","RewardSet881"},
        {"Mod Drops by Enemy:","Frontier Butcher","RewardSet868"},
        {"Mod Drops by Enemy:","Elite Frontier Lancer","RewardSet842"},
        {"Mod Drops by Enemy:","Frontier Lancer","RewardSet752"},
        {"Mod Drops by Enemy:","Frontier Hellion","RewardSet752"},
        {"Mod Drops by Enemy:","Frontier Trooper","RewardSet773"},
        {"Mod Drops by Enemy:","Frontier Seeker","RewardSet889"},
        {"Mod Drops by Enemy:","Frontier Eviscerator","RewardSet773"},
        {"Mod Drops by Enemy:","Scorch","RewardSet943"},
        {"Mod Drops by Enemy:","Councilor Vay Hek","RewardSet882"},
        {"Mod Drops by Enemy:","Drekar Butcher","RewardSet810"},
        {"Mod Drops by Enemy:","Drekar Trooper","RewardSet775"},
        {"Mod Drops by Enemy:","Drekar Heavy Gunner","RewardSet776"},
        {"Mod Drops by Enemy:","Shield Lancer","RewardSet837"},
        {"Mod Drops by Enemy:","Bombard","RewardSet900"},
        {"Mod Drops by Enemy:","Drekar Seeker","RewardSet890"},
        {"Mod Drops by Enemy:","Drekar Ballista","RewardSet911"},
        {"Mod Drops by Enemy:","Grineer Manic","RewardSet811"},
        {"Mod Drops by Enemy:","Butcher","RewardSet806"},
        {"Mod Drops by Enemy:","Sensor Regulator","RewardSet741"},
        {"Mod Drops by Enemy:","Moa","RewardSet861"},
        {"Mod Drops by Enemy:","Remech Osprey","RewardSet741"},
        {"Mod Drops by Enemy:","Ambulas","RewardSet813"},
        {"Mod Drops by Enemy:","Shield Dargyn","RewardSet960"},
        {"Mod Drops by Enemy:","Dargyn Pilot","RewardSet842"},
        {"Mod Drops by Enemy:","Eidolon Vomvalyst","RewardSet789"},
        {"Mod Drops by Enemy:","Plains Commander","RewardSet978"},
        {"Mod Drops by Enemy:","Nul Comba","RewardSet979"},
        {"Mod Drops by Enemy:","Malice","RewardSet988"},
        {"Mod Drops by Enemy:","Recon Commander","RewardSet990"},
        {"Mod Drops by Enemy:","Aerial Commander","RewardSet991"},
        {"Mod Drops by Enemy:","Tusk Command Dargyn","RewardSet966"},
        {"Mod Drops by Enemy:","Nox","RewardSet803"},
        {"Mod Drops by Enemy:","Ghoul Auger Alpha","RewardSet992"},
        {"Mod Drops by Enemy:","Tar Mutalist Moa","RewardSet836"},
        {"Mod Drops by Enemy:","Swarm Mutalist Moa","RewardSet941"},
        {"Mod Drops by Enemy:","Toxic Crawler","RewardSet814"},
        {"Mod Drops by Enemy:","Nauseous Crawler","RewardSet853"},
        {"Mod Drops by Enemy:","Lobber Crawler","RewardSet814"},
        {"Mod Drops by Enemy:","Electric Crawler","RewardSet934"},
        {"Mod Drops by Enemy:","Mutalist Osprey","RewardSet816"},
        {"Mod Drops by Enemy:","Drahk","RewardSet895"},
        {"Mod Drops by Enemy:","Ghoul Rictus Alpha","RewardSet994"},
        {"Mod Drops by Enemy:","Ghoul Expired","RewardSet935"},
        {"Mod Drops by Enemy:","Ghoul Rictus","RewardSet817"},
        {"Mod Drops by Enemy:","Ghoul Auger","RewardSet944"},
        {"Mod Drops by Enemy:","Ghoul Devourer","RewardSet818"},
        {"Mod Drops by Enemy:","Tusk Hellion","RewardSet752"},
        {"Mod Drops by Enemy:","Tusk Ballista","RewardSet912"},
        {"Mod Drops by Enemy:","Tusk Shield Dargyn","RewardSet967"},
        {"Mod Drops by Enemy:","Tusk Dargyn","RewardSet967"},
        {"Mod Drops by Enemy:","Executioner Harkonar","RewardSet1038"},
        {"Mod Drops by Enemy:","Roller Sentry","RewardSet898"},
        {"Mod Drops by Enemy:","Jackal","RewardSet859"},
        {"Mod Drops by Enemy:","Fog Scrambus","RewardSet979"},
        {"Mod Drops by Enemy:","Sap Scrambus","RewardSet979"},
        {"Mod Drops by Enemy:","Nul Scrambus","RewardSet979"},
        {"Mod Drops by Enemy:","Slo Scrambus","RewardSet979"},
        {"Mod Drops by Enemy:","Bailiff Defector","RewardSet819"},
        {"Mod Drops by Enemy:","Frontier Regulator","RewardSet741"},
        {"Mod Drops by Enemy:","Frontier Heavy Gunner","RewardSet752"},
        {"Mod Drops by Enemy:","Ballista","RewardSet912"},
        {"Mod Drops by Enemy:","Scorpion","RewardSet936"},
        {"Mod Drops by Enemy:","Elite Lancer","RewardSet844"},
        {"Mod Drops by Enemy:","Trooper","RewardSet773"},
        {"Mod Drops by Enemy:","Powerfist","RewardSet932"},
        {"Mod Drops by Enemy:","Napalm","RewardSet734"},
        {"Mod Drops by Enemy:","Flameblade","RewardSet922"},
        {"Mod Drops by Enemy:","Seeker","RewardSet889"},
        {"Mod Drops by Enemy:","Heavy Gunner","RewardSet772"},
        {"Mod Drops by Enemy:","Guardsman","RewardSet820"},
        {"Mod Drops by Enemy:","Corrupted Vor","RewardSet995"},
        {"Mod Drops by Enemy:","Drekar Hellion","RewardSet914"},
        {"Mod Drops by Enemy:","Drekar Eviscerator","RewardSet778"},
        {"Mod Drops by Enemy:","Crewman","RewardSet790"},
        {"Mod Drops by Enemy:","Elite Crewman","RewardSet791"},
        {"Mod Drops by Enemy:","Shockwave Moa","RewardSet883"},
        {"Mod Drops by Enemy:","Prod Crewman","RewardSet930"},
        {"Mod Drops by Enemy:","Fusion Moa","RewardSet931"},
        {"Mod Drops by Enemy:","Corpus Tech","RewardSet866"},
        {"Mod Drops by Enemy:","Oxium Osprey","RewardSet748"},
        {"Mod Drops by Enemy:","Sapping Osprey","RewardSet834"},
        {"Mod Drops by Enemy:","Isolator Bursa","RewardSet862"},
        {"Mod Drops by Enemy:","Drover Bursa","RewardSet863"},
        {"Mod Drops by Enemy:","Denial Bursa","RewardSet864"},
        {"Mod Drops by Enemy:","Corpus Power Carrier","RewardSet790"},
        {"Mod Drops by Enemy:","Nullifier Crewman","RewardSet938"},
        {"Mod Drops by Enemy:","Detron Crewman","RewardSet779"},
        {"Mod Drops by Enemy:","Sniper Crewman","RewardSet938"},
        {"Mod Drops by Enemy:","Scavenger Drone","RewardSet845"},
        {"Mod Drops by Enemy:","Battalyst","RewardSet996"},
        {"Mod Drops by Enemy:","Conculyst","RewardSet998"},
        {"Mod Drops by Enemy:","Shadow Stalker","RewardSet887"},
        {"Mod Drops by Enemy:","Decaying Battalyst","RewardSet996"},
        {"Mod Drops by Enemy:","Decaying Conculyst","RewardSet998"},
        {"Mod Drops by Enemy:","Hunhow","RewardSet886"},
        {"Mod Drops by Enemy:","Kuva Dargyn","RewardSet966"},
        {"Mod Drops by Enemy:","Shield-Hellion Dargyn","RewardSet1000"},
        {"Mod Drops by Enemy:","Hellion Dargyn","RewardSet966"},
        {"Mod Drops by Enemy:","Orokin Drone","RewardSet802"},
        {"Mod Drops by Enemy:","Ratel","RewardSet861"},
        {"Mod Drops by Enemy:","Mine Osprey","RewardSet816"},
        {"Mod Drops by Enemy:","Kuva Butcher","RewardSet806"},
        {"Mod Drops by Enemy:","Kuva Shield Lancer","RewardSet837"},
        {"Mod Drops by Enemy:","Kuva Hellion","RewardSet752"},
        {"Mod Drops by Enemy:","Kuva Heavy Gunner","RewardSet902"},
        {"Mod Drops by Enemy:","Kuva Scorpion","RewardSet936"},
        {"Mod Drops by Enemy:","Kuva Trooper","RewardSet773"},
        {"Mod Drops by Enemy:","Kuva Bombard","RewardSet900"},
        {"Mod Drops by Enemy:","Kuva Seeker","RewardSet889"},
        {"Mod Drops by Enemy:","Kuva Ballista","RewardSet912"},
        {"Mod Drops by Enemy:","Kuva Eviscerator","RewardSet773"},
        {"Mod Drops by Enemy:","Eviscerator","RewardSet773"},
        {"Mod Drops by Enemy:","Kuva Powerclaw","RewardSet932"},
        {"Mod Drops by Enemy:","Kuva Drahk Master","RewardSet806"},
        {"Mod Drops by Enemy:","Kuva Drahk","RewardSet895"},
        {"Mod Drops by Enemy:","Kuva Scorch","RewardSet943"},
        {"Mod Drops by Enemy:","Bailiff","RewardSet824"},
        {"Mod Drops by Enemy:","Hyena Pack","RewardSet875"},
        {"Mod Drops by Enemy:","Phorid","RewardSet880"},
        {"Mod Drops by Enemy:","J3 Jordas Golem","RewardSet825"},
        {"Mod Drops by Enemy:","The Sergeant","RewardSet869"},
        {"Mod Drops by Enemy:","Commander","RewardSet783"},
        {"Mod Drops by Enemy:","Kela De Thaym","RewardSet1003"},
        {"Mod Drops by Enemy:","Tyl Regor","RewardSet765"},
        {"Mod Drops by Enemy:","Toxic Ancient","RewardSet916"},
        {"Mod Drops by Enemy:","Ancient Healer","RewardSet941"},
        {"Mod Drops by Enemy:","Juggernaut","RewardSet798"},
        {"Mod Drops by Enemy:","Jordas Golem","RewardSet825"},
        {"Mod Drops by Enemy:","Raptor","RewardSet870"},
        {"Mod Drops by Enemy:","General Sargas Ruk","RewardSet784"},
        {"Mod Drops by Enemy:","Boiler","RewardSet916"},
        {"Mod Drops by Enemy:","Brood Mother","RewardSet840"},
        {"Mod Drops by Enemy:","Hyekka Master","RewardSet827"},
        {"Mod Drops by Enemy:","Hyekka","RewardSet1005"},
        {"Mod Drops by Enemy:","Dreg","RewardSet1007"},
        {"Mod Drops by Enemy:","Locust Drone","RewardSet973"},
        {"Mod Drops by Enemy:","Lancer Dreg","RewardSet974"},
        {"Mod Drops by Enemy:","Railgun Moa","RewardSet923"},
        {"Mod Drops by Enemy:","Anti Moa","RewardSet940"},
        {"Mod Drops by Enemy:","Infested Mesa","RewardSet735"},
        {"Mod Drops by Enemy:","Knave Specter","RewardSet947"},
        {"Mod Drops by Enemy:","Feyarch Specter","RewardSet1004"},
        {"Mod Drops by Enemy:","Orphid Specter","RewardSet977"},
        {"Mod Drops by Enemy:","Orphid Husks","RewardSet856"},
        {"Mod Drops by Enemy:","Kuva Jester","RewardSet958"},
        {"Mod Drops by Enemy:","Arid Seeker","RewardSet889"},
        {"Mod Drops by Enemy:","Drekar Manic","RewardSet828"},
        {"Mod Drops by Enemy:","Arid Lancer","RewardSet752"},
        {"Mod Drops by Enemy:","Arid Trooper","RewardSet773"},
        {"Mod Drops by Enemy:","Cannon Battery","RewardSet961"},
        {"Mod Drops by Enemy:","Datalyst","RewardSet979"},
        {"Mod Drops by Enemy:","Nemes","RewardSet748"},
        {"Mod Drops by Enemy:","Artificer","RewardSet881"},
        {"Mod Drops by Enemy:","Carabus","RewardSet748"},
        {"Mod Drops by Enemy:","Chroma","RewardSet735"},
        {"Mod Drops by Enemy:","Kuva Guardian","RewardSet959"},
        {"Mod Drops by Enemy:","Void Shade","RewardSet853"},
        {"Mod Drops by Enemy:","Nauseous Void Shade","RewardSet853"},
        {"Mod Drops by Enemy:","Misery","RewardSet989"},
        {"Mod Drops by Enemy:","Torment","RewardSet1015"},
        {"Mod Drops by Enemy:","Violence","RewardSet1018"},
        {"Mod Drops by Enemy:","Mania","RewardSet1017"},
        {"Mod Drops by Enemy:","Angst","RewardSet1016"},
        {"Mod Drops by Enemy:","Juggernaut Behemoth","RewardSet798"},
        {"Mod Drops by Enemy:","Hemocyte","RewardSet993"},
        {"Mod Drops by Enemy:","Hyena Th","RewardSet875"},
        {"Mod Drops by Enemy:","Hyena Pb","RewardSet875"},
        {"Mod Drops by Enemy:","Hyena Ln2","RewardSet875"},
        {"Mod Drops by Enemy:","Hyena Ng","RewardSet875"},
        {"Mod Drops by Enemy:","Arcane Boiler","RewardSet916"},
        {"Mod Drops by Enemy:","Corpus Warden","RewardSet866"},
        {"Mod Drops by Enemy:","Sprag","RewardSet919"},
        {"Mod Drops by Enemy:","Ven'Kra Tel","RewardSet919"},
        {"Mod Drops by Enemy:","Draga","RewardSet842"},
        {"Mod Drops by Enemy:","Shock Draga","RewardSet842"},
        {"Mod Drops by Enemy:","Darek Draga","RewardSet842"},
        {"Mod Drops by Enemy:","Sikula","RewardSet816"},
        {"Mod Drops by Enemy:","Raptor Mt","RewardSet871"},
        {"Mod Drops by Enemy:","Raptor Rv","RewardSet871"},
        {"Mod Drops by Enemy:","Raptor Ns","RewardSet871"},
        {"Mod Drops by Enemy:","Tusk Shield Lancer","RewardSet837"},
        {"Mod Drops by Enemy:","Nightwatch Reaver","RewardSet752"},
        {"Mod Drops by Enemy:","Nightwatch Lancer","RewardSet790"},
        {"Mod Drops by Enemy:","Tusk Elite Lancer","RewardSet842"},
        {"Mod Drops by Enemy:","Tusk Heavy Gunner","RewardSet902"},
        {"Mod Drops by Enemy:","Tusk Lancer","RewardSet752"},
        {"Mod Drops by Enemy:","Tusk Trooper","RewardSet773"},
        {"Mod Drops by Enemy:","Eidolon Gantulyst","RewardSet957"},
        {"Mod Drops by Enemy:","Eidolon Hydrolyst","RewardSet860"},
        {"Mod Drops by Enemy:","Tusk Butcher","RewardSet806"},
        {"Mod Drops by Enemy:","Tusk Roller","RewardSet898"},
        {"Mod Drops by Enemy:","Tusk Bombard","RewardSet900"},
        {"Mod Drops by Enemy:","Tusk Flameblade","RewardSet922"},
        {"Mod Drops by Enemy:","Tusk Mortar Bombard","RewardSet900"},
        {"Mod Drops by Enemy:","Tusk Reaver","RewardSet769"},
        {"Mod Drops by Enemy:","Tusk Predator","RewardSet922"},
        {"Mod Drops by Enemy:","Tusk Seeker","RewardSet889"},
        {"Mod Drops by Enemy:","Tusk Eviscerator","RewardSet773"},
        {"Mod Drops by Enemy:","Tusk Napalm","RewardSet734"},
        {"Mod Drops by Enemy:","Leech Osprey","RewardSet834"},
        {"Mod Drops by Enemy:","Lynx","RewardSet921"},
        {"Mod Drops by Enemy:","Grineer Power Carrier","RewardSet790"},
        {"Mod Drops by Enemy:","Mutalist Osprey Carrier","RewardSet790"},
        {"Mod Drops by Enemy:","Hellion","RewardSet752"},
        {"Mod Drops by Enemy:","Grineer Warden","RewardSet927"},
        {"Mod Drops by Enemy:","Elite Arid Lancer","RewardSet842"},
        {"Mod Drops by Enemy:","Arid Butcher","RewardSet868"},
        {"Mod Drops by Enemy:","Arid Heavy Gunner","RewardSet927"},
        {"Mod Drops by Enemy:","Arid Eviscerator","RewardSet773"},
        {"Mod Drops by Enemy:","Arid Hellion","RewardSet752"},
        {"Mod Drops by Enemy:","Mutalist Toxic Carrier","RewardSet1007"},
        {"Mod Drops by Enemy:","Attack Mutalist","RewardSet1007"},
        {"Mod Drops by Enemy:","Mutalist Lightning Carrier","RewardSet1007"},
        {"Mod Drops by Enemy:","Ved Xol","RewardSet1021"},
        {"Mod Drops by Enemy:","Nako Xol","RewardSet1021"},
        {"Mod Drops by Enemy:","Pelna Cade","RewardSet1023"},
        {"Mod Drops by Enemy:","None","RewardSet1039"},
        {"Mod Drops by Enemy:","Jad Teran","RewardSet1021"},
        {"Mod Drops by Enemy:","Azoth","RewardSet1021"},
        {"Mod Drops by Enemy:","Raptor Rx","RewardSet1021"},
        {"Mod Drops by Enemy:","Auditor","RewardSet1021"},
        {"Mod Drops by Enemy:","Jen Dro","RewardSet1021"},
        {"Mod Drops by Enemy:","M-W.A.M.","RewardSet1021"},
        {"Mod Drops by Enemy:","Derim Zahn","RewardSet1021"},
        {"Mod Drops by Enemy:","Tia Mayn","RewardSet1021"},
        {"Mod Drops by Enemy:","Armis Ulta","RewardSet1021"},
        {"Mod Drops by Enemy:","Dru Pesfor","RewardSet1021"},
        {"Mod Drops by Enemy:","Rana Del","RewardSet1021"},
        {"Mod Drops by Enemy:","002-Er","RewardSet1021"},
        {"Mod Drops by Enemy:","Kavat","RewardSet1006"},
        {"Mod Drops by Enemy:","Drekar Manic Bombard","RewardSet908"},
        {"Mod Drops by Enemy:","Ranger","RewardSet1011"},
        {"Mod Drops by Enemy:","Rathuum Broadcaster","RewardSet741"},
        {"Mod Drops by Enemy:","Executioner Garesh","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Nok","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Gorth","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Reth","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Dok Thul","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Zura","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Vay Molta","RewardSet1038"},
        {"Mod Drops by Enemy:","Executioner Dhurnam","RewardSet1036"},
        {"Mod Drops by Enemy:","Fog Comba","RewardSet979"},
        {"Mod Drops by Enemy:","Slo Comba","RewardSet979"},
        {"Mod Drops by Enemy:","Sap Comba","RewardSet979"},
        {"Mod Drops by Enemy:","Kuva Napalm","RewardSet734"},
        {"Mod Drops by Enemy:","Kuva Flameblade","RewardSet922"},
        {"Mod Drops by Enemy:","Venin Mutalist","RewardSet816"},
        {"Mod Drops by Enemy:","Carrion Charger","RewardSet797"},
        {"Mod Drops by Enemy:","Corvette","RewardSet963"},
        {"Mod Drops by Enemy:","Frigate","RewardSet1011"},
        {"Mod Drops by Enemy:","Carrier","RewardSet964"},
        {"Mod Drops by Enemy:","Penta Ranger","RewardSet1011"},
        {"Mod Drops by Enemy:","Quanta Ranger","RewardSet1011"},
        {"Mod Drops by Enemy:","Gox","RewardSet963"},
        {"Mod Drops by Enemy:","Jack O'Naut","RewardSet798"},
        {"Mod Drops by Enemy:","Temporal Dreg","RewardSet975"},
        {"Mod Drops by Enemy:","Turret","RewardSet962"},
        {"Mod Drops by Enemy:","Courier","RewardSet1001"},
        {"Mod Drops by Enemy:","Hellion Power Carrier","RewardSet790"},
        {"Mod Drops by Enemy:","Manic Bombard","RewardSet908"},
        {"Mod Drops by Enemy:","Corrupted Warden","RewardSet927"},
        {"Mod Drops by Enemy:","Dargyn","RewardSet1002"},
        {"Mod Drops by Enemy:","Kuva Hyekka Master","RewardSet827"},
        {"Mod Drops by Enemy:","Kuva Roller","RewardSet898"},
        {"Mod Drops by Enemy:","Ogma","RewardSet971"},
        {"Mod Drops by Enemy:","Frontier Bailiff","RewardSet806"},
        {"Mod Drops by Enemy:","Kuva Elite Lancer","RewardSet842"},
        {"Mod Drops by Enemy:","Zeplen","RewardSet976"},
        {"Mod Drops by Enemy:","Eidolon Teralyst","RewardSet956"},
        {"Mod Drops by Enemy:","Tenno Specter","RewardSet735"},
        {"Mod Drops by Enemy:","Ogma Elite","RewardSet971"},
        {"Mod Drops by Enemy:","Eidolon Teralyst (Special)","RewardSet1037"},
        {"Mod Drops by Enemy:","Eidolon Gantulyst (Special)","RewardSet1019"},
        {"Mod Drops by Enemy:","Eidolon Hydrolyst (Special)","RewardSet1020"},
        {"Blueprint/Part Drops by Item:","Hyekka Master","RewardSet827"},
        {"Blueprint/Part Drops by Item:","Kuva Hyekka Master","RewardSet827"},
        {"Blueprint/Part Drops by Item:","Juggernaut","RewardSet798"},
        {"Blueprint/Part Drops by Item:","Juggernaut Behemoth","RewardSet798"},
        {"Blueprint/Part Drops by Item:","Jack O'Naut","RewardSet798"},
        {"Blueprint/Part Drops by Item:","Zanuka Hunter","RewardSet1047"},
        {"Blueprint/Part Drops by Item:","Stalker","RewardSet886"},
        {"Blueprint/Part Drops by Item:","Shadow Stalker","RewardSet887"},
        {"Blueprint/Part Drops by Item:","Hunhow","RewardSet886"},
        {"Blueprint/Part Drops by Item:","Vem Tabook","RewardSet742"},
        {"Blueprint/Part Drops by Item:","Grineer Manic","RewardSet811"},
        {"Blueprint/Part Drops by Item:","Fissure Corrupted Enemy","RewardSet1048"},
        {"Blueprint/Part Drops by Item:","Heavy Gunner","RewardSet772"},
        {"Blueprint/Part Drops by Item:","Grineer Warden","RewardSet927"},
        {"Blueprint/Part Drops by Item:","Arid Heavy Gunner","RewardSet927"},
        {"Blueprint/Part Drops by Item:","Corrupted Warden","RewardSet927"},
        {"Blueprint/Part Drops by Item:","Drekar Trooper","RewardSet775"},
        {"Blueprint/Part Drops by Item:","Kela De Thaym","RewardSet1003"},
        {"Blueprint/Part Drops by Item:","Ghoul Auger Alpha","RewardSet992"},
        {"Blueprint/Part Drops by Item:","Ghoul Rictus Alpha","RewardSet994"},
        {"Blueprint/Part Drops by Item:","Conculyst","RewardSet998"},
        {"Blueprint/Part Drops by Item:","Decaying Conculyst","RewardSet998"},
        {"Blueprint/Part Drops by Enemy:","Zanuka Hunter","RewardSet1047"},
        {"Blueprint/Part Drops by Enemy:","Vem Tabook","RewardSet742"},
        {"Blueprint/Part Drops by Enemy:","Stalker","RewardSet886"},
        {"Blueprint/Part Drops by Enemy:","Drekar Trooper","RewardSet775"},
        {"Blueprint/Part Drops by Enemy:","Grineer Manic","RewardSet811"},
        {"Blueprint/Part Drops by Enemy:","Ghoul Auger Alpha","RewardSet992"},
        {"Blueprint/Part Drops by Enemy:","Ghoul Rictus Alpha","RewardSet994"},
        {"Blueprint/Part Drops by Enemy:","Heavy Gunner","RewardSet772"},
        {"Blueprint/Part Drops by Enemy:","Conculyst","RewardSet998"},
        {"Blueprint/Part Drops by Enemy:","Shadow Stalker","RewardSet887"},
        {"Blueprint/Part Drops by Enemy:","Decaying Conculyst","RewardSet998"},
        {"Blueprint/Part Drops by Enemy:","Hunhow","RewardSet886"},
        {"Blueprint/Part Drops by Enemy:","Kela De Thaym","RewardSet1003"},
        {"Blueprint/Part Drops by Enemy:","Juggernaut","RewardSet798"},
        {"Blueprint/Part Drops by Enemy:","Hyekka Master","RewardSet827"},
        {"Blueprint/Part Drops by Enemy:","Juggernaut Behemoth","RewardSet798"},
        {"Blueprint/Part Drops by Enemy:","Grineer Warden","RewardSet927"},
        {"Blueprint/Part Drops by Enemy:","Arid Heavy Gunner","RewardSet927"},
        {"Blueprint/Part Drops by Enemy:","Jack O'Naut","RewardSet798"},
        {"Blueprint/Part Drops by Enemy:","Corrupted Warden","RewardSet927"},
        {"Blueprint/Part Drops by Enemy:","Kuva Hyekka Master","RewardSet827"},
        {"Blueprint/Part Drops by Enemy:","Fissure Corrupted Enemy","RewardSet1048"},
        {"Miscellanous Enemy Drops:","Captain Vor","RewardSet757"},
        {"Miscellanous Enemy Drops:","Lt Lech Kril","RewardSet880"},
        {"Miscellanous Enemy Drops:","Kubrow","RewardSet895"},
        {"Miscellanous Enemy Drops:","Lephantis","RewardSet951"},
        {"Miscellanous Enemy Drops:","Alad V","RewardSet757"},
        {"Miscellanous Enemy Drops:","Zanuka Hunter","RewardSet1047"},
        {"Miscellanous Enemy Drops:","Vem Tabook","RewardSet742"},
        {"Miscellanous Enemy Drops:","Leekter","RewardSet743"},
        {"Miscellanous Enemy Drops:","Shik Tal","RewardSet744"},
        {"Miscellanous Enemy Drops:","Mutalist Alad V","RewardSet757"},
        {"Miscellanous Enemy Drops:","Stalker","RewardSet886"},
        {"Miscellanous Enemy Drops:","Vay Hek Terra Frame","RewardSet881"},
        {"Miscellanous Enemy Drops:","Councilor Vay Hek","RewardSet882"},
        {"Miscellanous Enemy Drops:","Ambulas","RewardSet813"},
        {"Miscellanous Enemy Drops:","Turret","RewardSet962"},
        {"Miscellanous Enemy Drops:","Tusk Bolkor","RewardSet1049"},
        {"Miscellanous Enemy Drops:","Eidolon Vomvalyst","RewardSet789"},
        {"Miscellanous Enemy Drops:","Drahk","RewardSet895"},
        {"Miscellanous Enemy Drops:","Akkalak Turret","RewardSet1050"},
        {"Miscellanous Enemy Drops:","Mordda Turret","RewardSet1050"},
        {"Miscellanous Enemy Drops:","Vruush Turret","RewardSet1050"},
        {"Miscellanous Enemy Drops:","Jackal","RewardSet859"},
        {"Miscellanous Enemy Drops:","Corrupted Vor","RewardSet995"},
        {"Miscellanous Enemy Drops:","Oxium Osprey","RewardSet748"},
        {"Miscellanous Enemy Drops:","Battalyst","RewardSet996"},
        {"Miscellanous Enemy Drops:","Conculyst","RewardSet998"},
        {"Miscellanous Enemy Drops:","Shadow Stalker","RewardSet887"},
        {"Miscellanous Enemy Drops:","Decaying Battalyst","RewardSet996"},
        {"Miscellanous Enemy Drops:","Decaying Conculyst","RewardSet998"},
        {"Miscellanous Enemy Drops:","Hunhow","RewardSet886"},
        {"Miscellanous Enemy Drops:","Kuva Drahk","RewardSet895"},
        {"Miscellanous Enemy Drops:","Hyena Pack","RewardSet875"},
        {"Miscellanous Enemy Drops:","Phorid","RewardSet880"},
        {"Miscellanous Enemy Drops:","J3 Jordas Golem","RewardSet825"},
        {"Miscellanous Enemy Drops:","The Sergeant","RewardSet869"},
        {"Miscellanous Enemy Drops:","Commander","RewardSet783"},
        {"Miscellanous Enemy Drops:","Kela De Thaym","RewardSet1003"},
        {"Miscellanous Enemy Drops:","Tyl Regor","RewardSet765"},
        {"Miscellanous Enemy Drops:","Juggernaut","RewardSet798"},
        {"Miscellanous Enemy Drops:","Jordas Golem","RewardSet825"},
        {"Miscellanous Enemy Drops:","Raptor","RewardSet870"},
        {"Miscellanous Enemy Drops:","General Sargas Ruk","RewardSet784"},
        {"Miscellanous Enemy Drops:","Hyekka","RewardSet1005"},
        {"Miscellanous Enemy Drops:","Kuva Jester","RewardSet958"},
        {"Miscellanous Enemy Drops:","Kuaka","RewardSet1053"},
        {"Miscellanous Enemy Drops:","Nemes","RewardSet748"},
        {"Miscellanous Enemy Drops:","Artificer","RewardSet881"},
        {"Miscellanous Enemy Drops:","Carabus","RewardSet748"},
        {"Miscellanous Enemy Drops:","Kuva Guardian","RewardSet959"},
        {"Miscellanous Enemy Drops:","Juggernaut Behemoth","RewardSet798"},
        {"Miscellanous Enemy Drops:","Hyena Th","RewardSet875"},
        {"Miscellanous Enemy Drops:","Hyena Pb","RewardSet875"},
        {"Miscellanous Enemy Drops:","Hyena Ln2","RewardSet875"},
        {"Miscellanous Enemy Drops:","Hyena Ng","RewardSet875"},
        {"Miscellanous Enemy Drops:","Raptor Mt","RewardSet871"},
        {"Miscellanous Enemy Drops:","Raptor Rv","RewardSet871"},
        {"Miscellanous Enemy Drops:","Raptor Ns","RewardSet871"},
        {"Miscellanous Enemy Drops:","Ashen Kuaka","RewardSet1053"},
        {"Miscellanous Enemy Drops:","Kavat","RewardSet1006"},
        {"Miscellanous Enemy Drops:","Jack O'Naut","RewardSet798"}
    },
    ["rewardSets"]={
        ["RewardSet001"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet002"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet003"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet004"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet005"]={
            ["A"]={
                {"1000 Credits Cache",0.25},
                {"1500 Credits Cache",0.25},
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.0101},
                {"240X Polymer Bundle",0.1265},
                {"250 Endo",0.2211},
                {"400 Endo",0.0101},
                {"45 Endo",0.1265},
                {"75 Endo",0.1265},
                {"750X Alloy Plate",0.1265},
                {"750X Circuits",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"160 Endo",0.055},
                {"2X Gallium",0.055},
                {"2X Morphics",0.055},
                {"2X Neurodes",0.055},
                {"80 Endo",0.151},
                {"Argon Crystal",0.0067},
                {"Gallium",0.151},
                {"Morphics",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.0067},
                {"Tellurium",0.0067},
                {"Xiphos Fuselage Blueprint",0.005}
            }
        },
        ["RewardSet006"]={
            ["A"]={
                {"Seer Barrel",0.3872},
                {"Seer Blueprint",0.3872},
                {"Seer Receiver",0.2256}
            }
        },
        ["RewardSet007"]={
            ["A"]={
                {"Lith B2 Relic",0.0833},
                {"Lith C2 Relic",0.0833},
                {"Lith H2 Relic",0.0833},
                {"Lith N3 Relic",0.0833},
                {"Lith S7 Relic",0.0833},
                {"Lith T1 Relic",0.0833},
                {"Lith V3 Relic",0.0833},
                {"Lith Z1 Relic",0.0833},
                {"Magazine Warp",0.0833},
                {"Synthula",0.0833},
                {"Trick Mag",0.0833},
                {"Vitality",0.0833}
            },
            ["B"]={
                {"Deep Freeze",0.0667},
                {"Fast Deflection",0.0667},
                {"Hornet Strike",0.0667},
                {"Meso G1 Relic",0.0667},
                {"Meso N5 Relic",0.0667},
                {"Meso O2 Relic",0.0667},
                {"Meso T1 Relic",0.0667},
                {"Meso T2 Relic",0.0667},
                {"No Return",0.0667},
                {"North Wind",0.0667},
                {"Reflex Coil",0.0667},
                {"Rush",0.0667},
                {"Serration",0.0667},
                {"Speed Trigger",0.0667},
                {"Target Cracker",0.0667}
            },
            ["C"]={
                {"Meso G1 Relic",0.1948},
                {"Meso N5 Relic",0.1948},
                {"Meso O2 Relic",0.1948},
                {"Meso T1 Relic",0.1948},
                {"Meso T2 Relic",0.1948},
                {"Natural Talent",0.0258}
            }
        },
        ["RewardSet008"]={
            ["A"]={
                {"1500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Parry",0.1429},
                {"Reflection",0.1429},
                {"Reflex Guard",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Lith B2 Relic",0.125},
                {"Lith C2 Relic",0.125},
                {"Lith H2 Relic",0.125},
                {"Lith N3 Relic",0.125},
                {"Lith S7 Relic",0.125},
                {"Lith T1 Relic",0.125},
                {"Lith V3 Relic",0.125},
                {"Lith Z1 Relic",0.125}
            },
            ["C"]={
                {"2000 Credits Cache",0.0909},
                {"3000 Credits Cache",0.0909},
                {"Heavy Impact",0.0909},
                {"Hornet Strike",0.0909},
                {"Ivara Systems Blueprint",0.0909},
                {"Metal Auger",0.0909},
                {"Parry",0.0909},
                {"Reflection",0.0909},
                {"Serration",0.0909},
                {"Vicious Frost",0.0909},
                {"Volcanic Edge",0.0909}
            }
        },
        ["RewardSet009"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet010"]={
            ["A"]={
                {"1000 Credits Cache",0.25},
                {"1500 Credits Cache",0.25},
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.0101},
                {"240X Polymer Bundle",0.1265},
                {"250 Endo",0.2211},
                {"400 Endo",0.0101},
                {"45 Endo",0.1265},
                {"75 Endo",0.1265},
                {"750X Alloy Plate",0.1265},
                {"750X Circuits",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"160 Endo",0.055},
                {"2X Gallium",0.055},
                {"2X Morphics",0.055},
                {"2X Neurodes",0.055},
                {"80 Endo",0.151},
                {"Argon Crystal",0.0067},
                {"Gallium",0.151},
                {"Morphics",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.0067},
                {"Tellurium",0.0067},
                {"Xiphos Fuselage Blueprint",0.005}
            }
        },
        ["RewardSet011"]={
            ["A"]={
                {"Lith B2 Relic",0.0833},
                {"Lith C2 Relic",0.0833},
                {"Lith H2 Relic",0.0833},
                {"Lith N3 Relic",0.0833},
                {"Lith S7 Relic",0.0833},
                {"Lith T1 Relic",0.0833},
                {"Lith V3 Relic",0.0833},
                {"Lith Z1 Relic",0.0833},
                {"Magazine Warp",0.0833},
                {"Synthula",0.0833},
                {"Trick Mag",0.0833},
                {"Vitality",0.0833}
            },
            ["B"]={
                {"Deep Freeze",0.0667},
                {"Fast Deflection",0.0667},
                {"Hornet Strike",0.0667},
                {"Meso G1 Relic",0.0667},
                {"Meso N5 Relic",0.0667},
                {"Meso O2 Relic",0.0667},
                {"Meso T1 Relic",0.0667},
                {"Meso T2 Relic",0.0667},
                {"No Return",0.0667},
                {"North Wind",0.0667},
                {"Reflex Coil",0.0667},
                {"Rush",0.0667},
                {"Serration",0.0667},
                {"Speed Trigger",0.0667},
                {"Target Cracker",0.0667}
            },
            ["C"]={
                {"Meso G1 Relic",0.1948},
                {"Meso N5 Relic",0.1948},
                {"Meso O2 Relic",0.1948},
                {"Meso T1 Relic",0.1948},
                {"Meso T2 Relic",0.1948},
                {"Natural Talent",0.0258}
            }
        },
        ["RewardSet012"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet013"]={
            ["A"]={
                {"Rhino Chassis Blueprint",0.3872},
                {"Rhino Neuroptics Blueprint",0.3872},
                {"Rhino Systems Blueprint",0.2256}
            }
        },
        ["RewardSet014"]={
            ["A"]={
                {"1500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Parry",0.1429},
                {"Reflection",0.1429},
                {"Reflex Guard",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Lith B2 Relic",0.125},
                {"Lith C2 Relic",0.125},
                {"Lith H2 Relic",0.125},
                {"Lith N3 Relic",0.125},
                {"Lith S7 Relic",0.125},
                {"Lith T1 Relic",0.125},
                {"Lith V3 Relic",0.125},
                {"Lith Z1 Relic",0.125}
            },
            ["C"]={
                {"2000 Credits Cache",0.0909},
                {"3000 Credits Cache",0.0909},
                {"Heavy Impact",0.0909},
                {"Hornet Strike",0.0909},
                {"Ivara Systems Blueprint",0.0909},
                {"Metal Auger",0.0909},
                {"Parry",0.0909},
                {"Reflection",0.0909},
                {"Serration",0.0909},
                {"Vicious Frost",0.0909},
                {"Volcanic Edge",0.0909}
            }
        },
        ["RewardSet015"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Quickening",0.1128},
                {"True Punishment",0.1128}
            }
        },
        ["RewardSet016"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet017"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet018"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet019"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet020"]={
            ["A"]={
                {"Automatic Trigger",0.3872},
                {"Extend",0.3872},
                {"Morphic Transformer",0.0564},
                {"Phaedra Receiver",0.0564},
                {"Shell Rush",0.0564},
                {"Shell Rush",0.0564}
            }
        },
        ["RewardSet021"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet022"]={
            ["A"]={
                {"1500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Parry",0.1429},
                {"Reflection",0.1429},
                {"Reflex Guard",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Lith B2 Relic",0.125},
                {"Lith C2 Relic",0.125},
                {"Lith H2 Relic",0.125},
                {"Lith N3 Relic",0.125},
                {"Lith S7 Relic",0.125},
                {"Lith T1 Relic",0.125},
                {"Lith V3 Relic",0.125},
                {"Lith Z1 Relic",0.125}
            },
            ["C"]={
                {"2000 Credits Cache",0.0909},
                {"3000 Credits Cache",0.0909},
                {"Heavy Impact",0.0909},
                {"Hornet Strike",0.0909},
                {"Ivara Systems Blueprint",0.0909},
                {"Metal Auger",0.0909},
                {"Parry",0.0909},
                {"Reflection",0.0909},
                {"Serration",0.0909},
                {"Vicious Frost",0.0909},
                {"Volcanic Edge",0.0909}
            }
        },
        ["RewardSet023"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet024"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet025"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet026"]={
            ["A"]={
                {"Lith B2 Relic",0.0833},
                {"Lith C2 Relic",0.0833},
                {"Lith H2 Relic",0.0833},
                {"Lith N3 Relic",0.0833},
                {"Lith S7 Relic",0.0833},
                {"Lith T1 Relic",0.0833},
                {"Lith V3 Relic",0.0833},
                {"Lith Z1 Relic",0.0833},
                {"Magazine Warp",0.0833},
                {"Synthula",0.0833},
                {"Trick Mag",0.0833},
                {"Vitality",0.0833}
            },
            ["B"]={
                {"Deep Freeze",0.0667},
                {"Fast Deflection",0.0667},
                {"Hornet Strike",0.0667},
                {"Meso G1 Relic",0.0667},
                {"Meso N5 Relic",0.0667},
                {"Meso O2 Relic",0.0667},
                {"Meso T1 Relic",0.0667},
                {"Meso T2 Relic",0.0667},
                {"No Return",0.0667},
                {"North Wind",0.0667},
                {"Reflex Coil",0.0667},
                {"Rush",0.0667},
                {"Serration",0.0667},
                {"Speed Trigger",0.0667},
                {"Target Cracker",0.0667}
            },
            ["C"]={
                {"Meso G1 Relic",0.1948},
                {"Meso N5 Relic",0.1948},
                {"Meso O2 Relic",0.1948},
                {"Meso T1 Relic",0.1948},
                {"Meso T2 Relic",0.1948},
                {"Natural Talent",0.0258}
            }
        },
        ["RewardSet027"]={
            ["A"]={
                {"1000 Credits Cache",0.25},
                {"1500 Credits Cache",0.25},
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25}
            },
            ["B"]={
                {"150X Rubedo",0.1218},
                {"2500 Credits Cache",0.1218},
                {"3000 Credits Cache",0.1218},
                {"300X Ferrite",0.1218},
                {"45 Endo",0.1218},
                {"75 Endo",0.1218},
                {"Detonite Ampule",0.1218},
                {"Kubrow Egg",0.0258},
                {"Neurodes",0.1218}
            },
            ["C"]={
                {"100 Endo",0.151},
                {"80 Endo",0.151},
                {"Bite",0.0367},
                {"Forma Blueprint",0.02},
                {"Forma",0.005},
                {"Hastened Deflection",0.0367},
                {"Health Restore (Large)",0.151},
                {"Health Restore (Large)",0.151},
                {"Link Armor",0.0367},
                {"Link Health",0.0367},
                {"Link Shields",0.0367},
                {"Maul",0.0367},
                {"Neurodes",0.151}
            }
        },
        ["RewardSet028"]={
            ["A"]={
                {"Hydroid Chassis Blueprint",0.3872},
                {"Hydroid Neuroptics Blueprint",0.3872},
                {"Hydroid Systems Blueprint",0.2256}
            }
        },
        ["RewardSet029"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet030"]={
            ["A"]={
                {"Astral Slash",0.0376},
                {"Comet Blast",0.0376},
                {"Meteor Crash",0.0376},
                {"Nebula Bore",0.0376},
                {"Polar Magazine",0.3872},
                {"Quasar Drill",0.0376},
                {"Superior Defenses",0.3872},
                {"Zodiac Shred",0.0376}
            }
        },
        ["RewardSet031"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet032"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet033"]={
            ["A"]={
                {"Lith B2 Relic",0.0833},
                {"Lith C2 Relic",0.0833},
                {"Lith H2 Relic",0.0833},
                {"Lith N3 Relic",0.0833},
                {"Lith S7 Relic",0.0833},
                {"Lith T1 Relic",0.0833},
                {"Lith V3 Relic",0.0833},
                {"Lith Z1 Relic",0.0833},
                {"Magazine Warp",0.0833},
                {"Synthula",0.0833},
                {"Trick Mag",0.0833},
                {"Vitality",0.0833}
            },
            ["B"]={
                {"Deep Freeze",0.0667},
                {"Fast Deflection",0.0667},
                {"Hornet Strike",0.0667},
                {"Meso G1 Relic",0.0667},
                {"Meso N5 Relic",0.0667},
                {"Meso O2 Relic",0.0667},
                {"Meso T1 Relic",0.0667},
                {"Meso T2 Relic",0.0667},
                {"No Return",0.0667},
                {"North Wind",0.0667},
                {"Reflex Coil",0.0667},
                {"Rush",0.0667},
                {"Serration",0.0667},
                {"Speed Trigger",0.0667},
                {"Target Cracker",0.0667}
            },
            ["C"]={
                {"Meso G1 Relic",0.1948},
                {"Meso N5 Relic",0.1948},
                {"Meso O2 Relic",0.1948},
                {"Meso T1 Relic",0.1948},
                {"Meso T2 Relic",0.1948},
                {"Natural Talent",0.0258}
            }
        },
        ["RewardSet034"]={
            ["A"]={
                {"1500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Parry",0.1429},
                {"Reflection",0.1429},
                {"Reflex Guard",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Lith B2 Relic",0.125},
                {"Lith C2 Relic",0.125},
                {"Lith H2 Relic",0.125},
                {"Lith N3 Relic",0.125},
                {"Lith S7 Relic",0.125},
                {"Lith T1 Relic",0.125},
                {"Lith V3 Relic",0.125},
                {"Lith Z1 Relic",0.125}
            },
            ["C"]={
                {"2000 Credits Cache",0.0909},
                {"3000 Credits Cache",0.0909},
                {"Heavy Impact",0.0909},
                {"Hornet Strike",0.0909},
                {"Ivara Systems Blueprint",0.0909},
                {"Metal Auger",0.0909},
                {"Parry",0.0909},
                {"Reflection",0.0909},
                {"Serration",0.0909},
                {"Vicious Frost",0.0909},
                {"Volcanic Edge",0.0909}
            }
        },
        ["RewardSet035"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet036"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet037"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet038"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet039"]={
            ["A"]={
                {"Excalibur Chassis Blueprint",0.3872},
                {"Excalibur Neuroptics Blueprint",0.3872},
                {"Excalibur Systems Blueprint",0.2256}
            }
        },
        ["RewardSet040"]={
            ["A"]={
                {"1000 Credits Cache",0.25},
                {"1500 Credits Cache",0.25},
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.0101},
                {"240X Polymer Bundle",0.1265},
                {"250 Endo",0.2211},
                {"400 Endo",0.0101},
                {"45 Endo",0.1265},
                {"75 Endo",0.1265},
                {"750X Alloy Plate",0.1265},
                {"750X Circuits",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"160 Endo",0.055},
                {"2X Gallium",0.055},
                {"2X Morphics",0.055},
                {"2X Neurodes",0.055},
                {"80 Endo",0.151},
                {"Argon Crystal",0.0067},
                {"Gallium",0.151},
                {"Morphics",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.0067},
                {"Tellurium",0.0067},
                {"Xiphos Fuselage Blueprint",0.005}
            }
        },
        ["RewardSet041"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Enduring Strike",0.1128},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Quickening",0.1128}
            }
        },
        ["RewardSet042"]={
            ["A"]={
                {"Automatic Trigger",0.3872},
                {"Extend",0.3872},
                {"Morphic Transformer",0.0564},
                {"Phaedra Receiver",0.0564},
                {"Shell Rush",0.0564},
                {"Shell Rush",0.0564}
            }
        },
        ["RewardSet043"]={
            ["A"]={
                {"2500 Credits Cache",0.3333},
                {"3000 Credits Cache",0.3333},
                {"4000 Credits Cache",0.3333}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"250 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"300X Polymer Bundle",0.1265},
                {"350X Rubedo",0.1265},
                {"400 Endo",0.0101},
                {"640 Endo",0.0101},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"240 Endo",0.044},
                {"2X Gallium",0.044},
                {"2X Neurodes",0.044},
                {"2X Orokin Cell",0.044},
                {"80 Endo",0.151},
                {"Argon Crystal",0.01},
                {"Gallium",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.01},
                {"Orokin Cell",0.151},
                {"Tellurium",0.044},
                {"Xiphos Engines Blueprint",0.005}
            }
        },
        ["RewardSet044"]={
            ["A"]={
                {"15 Endo",0.0909},
                {"Ammo Drum",0.0909},
                {"Blunderbuss",0.0909},
                {"Fast Hands",0.0909},
                {"Magazine Warp",0.0909},
                {"Piercing Hit",0.0909},
                {"Pistol Gambit",0.0909},
                {"Point Strike",0.0909},
                {"Pressure Point",0.0909},
                {"Trick Mag",0.0909},
                {"Vitality",0.0909}
            },
            ["B"]={
                {"50 Endo",0.0556},
                {"Cryo Rounds",0.0556},
                {"Deep Freeze",0.0556},
                {"Fast Deflection",0.0556},
                {"Fury",0.0556},
                {"Hell's Chamber",0.0556},
                {"Hornet Strike",0.0556},
                {"No Return",0.0556},
                {"North Wind",0.0556},
                {"Point Blank",0.0556},
                {"Reflex Coil",0.0556},
                {"Rush",0.0556},
                {"Serration",0.0556},
                {"Shocking Touch",0.0556},
                {"Speed Trigger",0.0556},
                {"Stormbringer",0.0556},
                {"Streamline",0.0556},
                {"Target Cracker",0.0556}
            },
            ["C"]={
                {"80 Endo",0.1291},
                {"Ivara Chassis Blueprint",0.0564},
                {"Meso G1 Relic",0.1291},
                {"Meso N5 Relic",0.1291},
                {"Meso O2 Relic",0.1291},
                {"Meso T1 Relic",0.1291},
                {"Meso T2 Relic",0.1291},
                {"Metal Auger",0.0564},
                {"Rime Rounds",0.0564},
                {"Scattering Inferno",0.0564}
            }
        },
        ["RewardSet045"]={
            ["A"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["B"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["C"]={
                {"Force Specter Blueprint",1.0}
            }
        },
        ["RewardSet046"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"Meso G1 Relic",0.1667},
                {"Meso N5 Relic",0.1667},
                {"Meso O2 Relic",0.1667},
                {"Meso T1 Relic",0.1667},
                {"Meso T2 Relic",0.1667}
            },
            ["B"]={
                {"50 Endo",0.0667},
                {"Cryo Rounds",0.0667},
                {"Deep Freeze",0.0667},
                {"Fury",0.0667},
                {"Hell's Chamber",0.0667},
                {"Neo B2 Relic",0.0667},
                {"Neo B4 Relic",0.0667},
                {"Neo K1 Relic",0.0667},
                {"Neo M1 Relic",0.0667},
                {"Neo S7 Relic",0.0667},
                {"Neo Z1 Relic",0.0667},
                {"North Wind",0.0667},
                {"Point Blank",0.0667},
                {"Reflex Coil",0.0667},
                {"Stormbringer",0.0667}
            },
            ["C"]={
                {"80 Endo",0.0451},
                {"Metal Auger",0.0451},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Ravage",0.0451},
                {"Stretch",0.0451},
                {"Vital Sense",0.0451}
            }
        },
        ["RewardSet047"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Corpus",0.0376},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet048"]={
            ["A"]={
                {"15 Endo",0.1111},
                {"Magazine Warp",0.1111},
                {"Meso G1 Relic",0.1111},
                {"Meso N5 Relic",0.1111},
                {"Meso O2 Relic",0.1111},
                {"Meso T1 Relic",0.1111},
                {"Meso T2 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"No Return",0.0714},
                {"North Wind",0.0714},
                {"Reflex Coil",0.0714},
                {"Serration",0.0714},
                {"Target Cracker",0.0714}
            },
            ["C"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            }
        },
        ["RewardSet049"]={
            ["A"]={
                {"Valkyr Chassis Blueprint",0.3872},
                {"Valkyr Neuroptics Blueprint",0.3872},
                {"Valkyr Systems Blueprint",0.2256}
            }
        },
        ["RewardSet050"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet051"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet052"]={
            ["A"]={
                {"Astral Slash",0.0376},
                {"Comet Blast",0.0376},
                {"Galvanized Blade",0.2581},
                {"Glacial Edge",0.2581},
                {"Meteor Crash",0.0376},
                {"Nebula Bore",0.0376},
                {"Quasar Drill",0.0376},
                {"Tempered Blade",0.2581},
                {"Zodiac Shred",0.0376}
            }
        },
        ["RewardSet053"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Enduring Strike",0.1128},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Quickening",0.1128}
            }
        },
        ["RewardSet054"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"Meso G1 Relic",0.1667},
                {"Meso N5 Relic",0.1667},
                {"Meso O2 Relic",0.1667},
                {"Meso T1 Relic",0.1667},
                {"Meso T2 Relic",0.1667}
            },
            ["B"]={
                {"50 Endo",0.0667},
                {"Cryo Rounds",0.0667},
                {"Deep Freeze",0.0667},
                {"Fury",0.0667},
                {"Hell's Chamber",0.0667},
                {"Neo B2 Relic",0.0667},
                {"Neo B4 Relic",0.0667},
                {"Neo K1 Relic",0.0667},
                {"Neo M1 Relic",0.0667},
                {"Neo S7 Relic",0.0667},
                {"Neo Z1 Relic",0.0667},
                {"North Wind",0.0667},
                {"Point Blank",0.0667},
                {"Reflex Coil",0.0667},
                {"Stormbringer",0.0667}
            },
            ["C"]={
                {"80 Endo",0.0451},
                {"Metal Auger",0.0451},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Ravage",0.0451},
                {"Stretch",0.0451},
                {"Vital Sense",0.0451}
            }
        },
        ["RewardSet055"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Corpus",0.0376},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet056"]={
            ["A"]={
                {"15 Endo",0.0909},
                {"Ammo Drum",0.0909},
                {"Blunderbuss",0.0909},
                {"Fast Hands",0.0909},
                {"Magazine Warp",0.0909},
                {"Piercing Hit",0.0909},
                {"Pistol Gambit",0.0909},
                {"Point Strike",0.0909},
                {"Pressure Point",0.0909},
                {"Trick Mag",0.0909},
                {"Vitality",0.0909}
            },
            ["B"]={
                {"50 Endo",0.0556},
                {"Cryo Rounds",0.0556},
                {"Deep Freeze",0.0556},
                {"Fast Deflection",0.0556},
                {"Fury",0.0556},
                {"Hell's Chamber",0.0556},
                {"Hornet Strike",0.0556},
                {"No Return",0.0556},
                {"North Wind",0.0556},
                {"Point Blank",0.0556},
                {"Reflex Coil",0.0556},
                {"Rush",0.0556},
                {"Serration",0.0556},
                {"Shocking Touch",0.0556},
                {"Speed Trigger",0.0556},
                {"Stormbringer",0.0556},
                {"Streamline",0.0556},
                {"Target Cracker",0.0556}
            },
            ["C"]={
                {"80 Endo",0.1291},
                {"Ivara Chassis Blueprint",0.0564},
                {"Meso G1 Relic",0.1291},
                {"Meso N5 Relic",0.1291},
                {"Meso O2 Relic",0.1291},
                {"Meso T1 Relic",0.1291},
                {"Meso T2 Relic",0.1291},
                {"Metal Auger",0.0564},
                {"Rime Rounds",0.0564},
                {"Scattering Inferno",0.0564}
            }
        },
        ["RewardSet057"]={
            ["A"]={
                {"Ember Chassis Blueprint",0.3872},
                {"Ember Neuroptics Blueprint",0.3872},
                {"Ember Systems Blueprint",0.2256}
            }
        },
        ["RewardSet058"]={
            ["A"]={
                {"15 Endo",0.1111},
                {"Magazine Warp",0.1111},
                {"Meso G1 Relic",0.1111},
                {"Meso N5 Relic",0.1111},
                {"Meso O2 Relic",0.1111},
                {"Meso T1 Relic",0.1111},
                {"Meso T2 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"No Return",0.0714},
                {"North Wind",0.0714},
                {"Reflex Coil",0.0714},
                {"Serration",0.0714},
                {"Target Cracker",0.0714}
            },
            ["C"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            }
        },
        ["RewardSet059"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet060"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet061"]={
            ["A"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["B"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["C"]={
                {"Force Specter Blueprint",1.0}
            }
        },
        ["RewardSet062"]={
            ["A"]={
                {"2500 Credits Cache",0.3333},
                {"3000 Credits Cache",0.3333},
                {"4000 Credits Cache",0.3333}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"250 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"300X Polymer Bundle",0.1265},
                {"350X Rubedo",0.1265},
                {"400 Endo",0.0101},
                {"640 Endo",0.0101},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"240 Endo",0.044},
                {"2X Gallium",0.044},
                {"2X Neurodes",0.044},
                {"2X Orokin Cell",0.044},
                {"80 Endo",0.151},
                {"Argon Crystal",0.01},
                {"Gallium",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.01},
                {"Orokin Cell",0.151},
                {"Tellurium",0.044},
                {"Xiphos Engines Blueprint",0.005}
            }
        },
        ["RewardSet063"]={
            ["A"]={
                {"150 Endo",0.0542},
                {"150 Endo",0.0542},
                {"400 Endo",0.0542},
                {"50 Endo",0.0316},
                {"80 Endo",0.0201},
                {"Blazing Steel",0.0316},
                {"Cutting Edge",0.0316},
                {"Efficient Transferral",0.0316},
                {"Extend",0.0316},
                {"Furor",0.0542},
                {"Galvanized Blade",0.0542},
                {"Glacial Edge",0.0542},
                {"Meso G1 Relic",0.0542},
                {"Meso N5 Relic",0.0542},
                {"Meso O2 Relic",0.0542},
                {"Meso T1 Relic",0.0542},
                {"Meso T2 Relic",0.0542},
                {"Poisonous Sting",0.0542},
                {"Sudden Impact",0.0542},
                {"Superior Defenses",0.0316},
                {"System Reroute",0.0316},
                {"Tempered Blade",0.0542}
            }
        },
        ["RewardSet064"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet065"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet066"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet067"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet068"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet069"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet070"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet071"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet072"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Enduring Strike",0.1128},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Quickening",0.1128}
            }
        },
        ["RewardSet073"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Bane Of Corrupted",0.0564},
                {"Cleanse Corrupted",0.0564},
                {"Expel Corrupted",0.0564},
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Smite Corrupted",0.0564}
            },
            ["C"]={
                {"Enduring Strike",0.1128},
                {"Harrow Systems Blueprint",0.1128},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291}
            }
        },
        ["RewardSet074"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet075"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet076"]={
            ["A"]={
                {"10X Alloy Plate",0.0316},
                {"10X Charc Electroplax",0.0316},
                {"10X Circuits",0.0316},
                {"10X Condroc Wing",0.0316},
                {"10X Coprite Alloy",0.0316},
                {"10X Coprite Alloy",0.0316},
                {"10X Cryotic",0.0316},
                {"10X Esher Devar",0.0316},
                {"10X Fish Scales",0.0316},
                {"10X Goopolla Spleen",0.0316},
                {"10X Grokdrul",0.0316},
                {"10X Iradite",0.0316},
                {"10X Khut-Khut Venom Sac",0.0316},
                {"10X Kuaka Spinal Claw",0.0316},
                {"10X Maprico",0.0316},
                {"10X Mawfish Bones",0.0316},
                {"10X Nistlepod",0.0316},
                {"10X Plastids",0.0316},
                {"10X Pyrotic Alloy",0.0316},
                {"10X Pyrotic Alloy",0.0316},
                {"10X Rubedo",0.0316},
                {"10X Salvage",0.0316},
                {"10X Tear Azurite",0.0316},
                {"10X Yogwun Stomach",0.0316},
                {"3X Auroxium Alloy",0.0067},
                {"3X Cetus Wisp",0.0067},
                {"6X Fersteel Alloy",0.0553},
                {"6X Marquise Veridos",0.0553},
                {"6X Mortus Horn",0.0553},
                {"6X Tralok Eyes",0.0553},
                {"Breath Of The Eidolon",0.0067}
            },
            ["B"]={
                {"10X Alloy Plate",0.0316},
                {"10X Charc Electroplax",0.0316},
                {"10X Circuits",0.0316},
                {"10X Condroc Wing",0.0316},
                {"10X Coprite Alloy",0.0316},
                {"10X Coprite Alloy",0.0316},
                {"10X Cryotic",0.0316},
                {"10X Esher Devar",0.0316},
                {"10X Fish Scales",0.0316},
                {"10X Goopolla Spleen",0.0316},
                {"10X Grokdrul",0.0316},
                {"10X Iradite",0.0316},
                {"10X Khut-Khut Venom Sac",0.0316},
                {"10X Kuaka Spinal Claw",0.0316},
                {"10X Maprico",0.0316},
                {"10X Mawfish Bones",0.0316},
                {"10X Nistlepod",0.0316},
                {"10X Plastids",0.0316},
                {"10X Pyrotic Alloy",0.0316},
                {"10X Pyrotic Alloy",0.0316},
                {"10X Rubedo",0.0316},
                {"10X Salvage",0.0316},
                {"10X Tear Azurite",0.0316},
                {"10X Yogwun Stomach",0.0316},
                {"3X Auroxium Alloy",0.0067},
                {"3X Breath Of The Eidolon",0.0067},
                {"3X Cetus Wisp",0.0067},
                {"6X Fersteel Alloy",0.0553},
                {"6X Marquise Veridos",0.0553},
                {"6X Mortus Horn",0.0553},
                {"6X Tralok Eyes",0.0553}
            },
            ["C"]={
                {"Balla Blueprint",0.0357},
                {"Cyath Blueprint",0.0357},
                {"Dehtat Blueprint",0.0357},
                {"Ekwana Ii Jai Blueprint",0.0357},
                {"Ekwana Ii Ruhang Blueprint",0.0357},
                {"Ekwana Jai Blueprint",0.0357},
                {"Ekwana Jai Ii Blueprint",0.0357},
                {"Ekwana Ruhang Blueprint",0.0357},
                {"Ekwana Ruhang Ii Blueprint",0.0357},
                {"Jai Blueprint",0.0357},
                {"Jai Ii Blueprint",0.0357},
                {"Jayap Blueprint",0.0357},
                {"Kronsh Blueprint",0.0357},
                {"Kroostra Blueprint",0.0357},
                {"Kwath Blueprint",0.0357},
                {"Laka Blueprint",0.0357},
                {"Mewan Blueprint",0.0357},
                {"Ooltha Blueprint",0.0357},
                {"Peye Blueprint",0.0357},
                {"Ruhang Blueprint",0.0357},
                {"Ruhang Ii Blueprint",0.0357},
                {"Seekalla Blueprint",0.0357},
                {"Vargeet Ii Jai Blueprint",0.0357},
                {"Vargeet Ii Ruhang Blueprint",0.0357},
                {"Vargeet Jai Blueprint",0.0357},
                {"Vargeet Jai Ii Blueprint",0.0357},
                {"Vargeet Ruhang Blueprint",0.0357},
                {"Vargeet Ruhang Ii Blueprint",0.0357}
            }
        },
        ["RewardSet077"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet078"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet079"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet080"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet081"]={
            ["A"]={
                {"Equinox Day Aspect Blueprint",0.1128},
                {"Equinox Day Chassis Blueprint",0.1291},
                {"Equinox Day Neuroptics Blueprint",0.1291},
                {"Equinox Day Systems Blueprint",0.1291},
                {"Equinox Night Aspect Blueprint",0.1128},
                {"Equinox Night Chassis Blueprint",0.1291},
                {"Equinox Night Neuroptics Blueprint",0.1291},
                {"Equinox Night Systems Blueprint",0.1291}
            }
        },
        ["RewardSet082"]={
            ["A"]={
                {"15 Endo",0.1111},
                {"Magazine Warp",0.1111},
                {"Meso G1 Relic",0.1111},
                {"Meso N5 Relic",0.1111},
                {"Meso O2 Relic",0.1111},
                {"Meso T1 Relic",0.1111},
                {"Meso T2 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"No Return",0.0714},
                {"North Wind",0.0714},
                {"Reflex Coil",0.0714},
                {"Serration",0.0714},
                {"Target Cracker",0.0714}
            },
            ["C"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            }
        },
        ["RewardSet083"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet084"]={
            ["A"]={
                {"150 Endo",0.2},
                {"2500 Credits Cache",0.2},
                {"3000 Credits Cache",0.2},
                {"300X Polymer Bundle",0.2},
                {"45 Endo",0.2}
            },
            ["B"]={
                {"150 Endo",0.1549},
                {"300X Plastids",0.1549},
                {"4000 Credits Cache",0.1549},
                {"5000 Credits Cache",0.1549},
                {"80 Endo",0.1549},
                {"Battering Maneuver",0.0451},
                {"Mobilize",0.0451},
                {"Patagium",0.0451},
                {"Piercing Step",0.0451},
                {"Rending Turn",0.0451}
            },
            ["C"]={
                {"240 Endo",0.1549},
                {"250X Oxium",0.1549},
                {"2X Gallium",0.1549},
                {"3X Gallium",0.1549},
                {"400 Endo",0.0451},
                {"Firewalker",0.0451},
                {"Ice Spring",0.0451},
                {"Lightning Dash",0.0451},
                {"Tellurium",0.1549},
                {"Toxic Flight",0.0451}
            }
        },
        ["RewardSet085"]={
            ["A"]={
                {"2000 Credits Cache",0.1429},
                {"2500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Power Throw",0.1429},
                {"Stabilizer",0.1429},
                {"Steady Hands",0.1429}
            },
            ["B"]={
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Neo B2 Relic",0.0376},
                {"Neo B4 Relic",0.0376},
                {"Neo K1 Relic",0.0376},
                {"Neo M1 Relic",0.0376},
                {"Neo S7 Relic",0.0376},
                {"Neo Z1 Relic",0.0376}
            },
            ["C"]={
                {"4000 Credits Cache",0.0645},
                {"5000 Credits Cache",0.0645},
                {"Arrow Mutation",0.0645},
                {"Covert Lethality",0.0645},
                {"Frigid Blast",0.0645},
                {"Frostbite",0.0752},
                {"Hell's Chamber",0.0645},
                {"Ivara Blueprint",0.0752},
                {"Ivara Neuroptics Blueprint",0.0752},
                {"Power Throw",0.0645},
                {"Scorch",0.0645},
                {"Shotgun Ammo Mutation",0.0645},
                {"Sniper Ammo Mutation",0.0645},
                {"Stretch",0.0645},
                {"Thermite Rounds",0.0645}
            }
        },
        ["RewardSet086"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet087"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet088"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet089"]={
            ["A"]={
                {"150 Endo",0.3872},
                {"250 Endo",0.3872},
                {"Automatic Trigger",0.0251},
                {"Combustion Rounds",0.0251},
                {"Dual Rounds",0.0251},
                {"Hollowed Bullets",0.0251},
                {"Magazine Extension",0.0251},
                {"Modified Munitions",0.0251},
                {"Parallax Scope",0.0251},
                {"Rubedo-Lined Barrel",0.0251},
                {"Venomous Clip",0.0251}
            },
            ["B"]={
                {"250 Endo",0.1},
                {"50 Endo",0.1},
                {"Argon Plating",0.1},
                {"Bleeding Edge",0.1},
                {"Electrified Barrel",0.1},
                {"Energy Inversion",0.1},
                {"Furor",0.1},
                {"Glacial Edge",0.1},
                {"Superior Defenses",0.1},
                {"Superior Defenses",0.1}
            },
            ["C"]={
                {"250 Endo",0.086},
                {"400 Endo",0.2256},
                {"Axi A3 Relic",0.086},
                {"Axi E2 Relic",0.086},
                {"Axi H3 Relic",0.086},
                {"Axi K2 Relic",0.086},
                {"Axi N5 Relic",0.086},
                {"Axi O2 Relic",0.086},
                {"Axi V6 Relic",0.086},
                {"Axi V7 Relic",0.086}
            }
        },
        ["RewardSet090"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Enduring Strike",0.1128},
                {"Life Strike",0.1128}
            }
        },
        ["RewardSet091"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet092"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet093"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet094"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet095"]={
            ["A"]={
                {"Astral Slash",0.0376},
                {"Comet Blast",0.0376},
                {"Meteor Crash",0.0376},
                {"Nebula Bore",0.0376},
                {"Polar Magazine",0.3872},
                {"Quasar Drill",0.0376},
                {"Superior Defenses",0.3872},
                {"Zodiac Shred",0.0376}
            }
        },
        ["RewardSet096"]={
            ["A"]={
                {"Loki Chassis Blueprint",0.3872},
                {"Loki Neuroptics Blueprint",0.3872},
                {"Loki Systems Blueprint",0.2256}
            }
        },
        ["RewardSet097"]={
            ["A"]={
                {"2000 Credits Cache",0.1429},
                {"2500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Power Throw",0.1429},
                {"Stabilizer",0.1429},
                {"Steady Hands",0.1429}
            },
            ["B"]={
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Neo B2 Relic",0.0376},
                {"Neo B4 Relic",0.0376},
                {"Neo K1 Relic",0.0376},
                {"Neo M1 Relic",0.0376},
                {"Neo S7 Relic",0.0376},
                {"Neo Z1 Relic",0.0376}
            },
            ["C"]={
                {"4000 Credits Cache",0.0645},
                {"5000 Credits Cache",0.0645},
                {"Arrow Mutation",0.0645},
                {"Covert Lethality",0.0645},
                {"Frigid Blast",0.0645},
                {"Frostbite",0.0752},
                {"Hell's Chamber",0.0645},
                {"Ivara Blueprint",0.0752},
                {"Ivara Neuroptics Blueprint",0.0752},
                {"Power Throw",0.0645},
                {"Scorch",0.0645},
                {"Shotgun Ammo Mutation",0.0645},
                {"Sniper Ammo Mutation",0.0645},
                {"Stretch",0.0645},
                {"Thermite Rounds",0.0645}
            }
        },
        ["RewardSet098"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"240 Endo",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25}
            },
            ["B"]={
                {"Bane Of Corrupted",0.0564},
                {"Cleanse Corrupted",0.0564},
                {"Expel Corrupted",0.0564},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Smite Corrupted",0.0564}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Harrow Systems Blueprint",0.1128},
                {"Life Strike",0.1128}
            }
        },
        ["RewardSet099"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Enduring Strike",0.1128},
                {"Life Strike",0.1128}
            }
        },
        ["RewardSet100"]={
            ["A"]={
                {"400 Endo",0.0833},
                {"Adrenaline Boost",0.0248},
                {"Ambush Optics",0.0248},
                {"Blind Shot",0.0248},
                {"Brain Storm",0.0248},
                {"Deft Tempo",0.0248},
                {"Directed Convergence",0.0248},
                {"Double Tap",0.0248},
                {"Draining Gloom",0.0248},
                {"Emergent Aftermath",0.0248},
                {"Feathered Arrows",0.0248},
                {"Final Act",0.0248},
                {"Final Tap",0.0248},
                {"Focused Acceleration",0.0248},
                {"Gorgon Frenzy",0.0248},
                {"Grinloked",0.0248},
                {"Hastened Steps",0.0248},
                {"Heavy Warhead",0.0248},
                {"Heightened Reflexes",0.0248},
                {"Hydraulic Barrel",0.0248},
                {"Hydraulic Chamber",0.0248},
                {"Hydraulic Gauge",0.0248},
                {"Kill Switch",0.0248},
                {"Lucky Shot",0.0248},
                {"Measured Burst",0.0248},
                {"Mortal Conduct",0.0248},
                {"Plan B",0.0248},
                {"Precision Munition",0.0248},
                {"Secondary Wind",0.0248},
                {"Shrapnel Rounds",0.0248},
                {"Skull Shots",0.0248},
                {"Soaring Strike",0.0248},
                {"Static Alacrity",0.0248},
                {"Sudden Justice",0.0248},
                {"Tactical Retreat",0.0248},
                {"Thundermiter",0.0248},
                {"Triple Tap",0.0248},
                {"Vital Systems Bypass",0.0248}
            },
            ["B"]={
                {"100X Circuits",0.0737},
                {"100X Rubedo",0.0737},
                {"120X Plastids",0.0737},
                {"400X Alloy Plate",0.1265},
                {"400X Ferrite",0.1265},
                {"500X Nano Spores",0.1265},
                {"500X Polymer Bundle",0.1265},
                {"600X Cryotic",0.1265},
                {"600X Salvage",0.1265},
                {"Argon Crystal",0.0025},
                {"Control Module",0.0025},
                {"Forma Blueprint",0.0025},
                {"Gallium",0.0025},
                {"Morphics",0.0025},
                {"Neural Sensors",0.0025},
                {"Neurodes",0.0025},
                {"Orokin Cell",0.0025}
            }
        },
        ["RewardSet101"]={
            ["A"]={
                {"Return: 105,000",1.0}
            },
            ["B"]={
                {"Return: 175,000",1.0}
            },
            ["C"]={
                {"Return: 250,000",1.0}
            }
        },
        ["RewardSet102"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet103"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet104"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet105"]={
            ["A"]={
                {"Trinity Chassis Blueprint",0.3872},
                {"Trinity Neuroptics Blueprint",0.3872},
                {"Trinity Systems Blueprint",0.2256}
            }
        },
        ["RewardSet106"]={
            ["A"]={
                {"2X 5000 Credits Cache",0.2256},
                {"4000 Credits Cache",0.3872},
                {"5000 Credits Cache",0.3872}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"400 Endo",0.1106},
                {"400X Circuits",0.1265},
                {"400X Rubedo",0.1265},
                {"640 Endo",0.0201},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.1258},
                {"240 Endo",0.1258},
                {"2X Gallium",0.0367},
                {"2X Neurodes",0.0367},
                {"2X Orokin Cell",0.0367},
                {"400 Endo",0.0367},
                {"80 Endo",0.1258},
                {"Argon Crystal",0.0367},
                {"Gallium",0.1258},
                {"Neurodes",0.1258},
                {"Nitain Extract",0.02},
                {"Orokin Cell",0.1258},
                {"Tellurium",0.0367},
                {"Xiphos Avionics Blueprint",0.005}
            }
        },
        ["RewardSet107"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            },
            ["C"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            }
        },
        ["RewardSet108"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet109"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet110"]={
            ["A"]={
                {"2000 Credits Cache",0.1429},
                {"2500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Power Throw",0.1429},
                {"Stabilizer",0.1429},
                {"Steady Hands",0.1429}
            },
            ["B"]={
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Neo B2 Relic",0.0376},
                {"Neo B4 Relic",0.0376},
                {"Neo K1 Relic",0.0376},
                {"Neo M1 Relic",0.0376},
                {"Neo S7 Relic",0.0376},
                {"Neo Z1 Relic",0.0376}
            },
            ["C"]={
                {"4000 Credits Cache",0.0645},
                {"5000 Credits Cache",0.0645},
                {"Arrow Mutation",0.0645},
                {"Covert Lethality",0.0645},
                {"Frigid Blast",0.0645},
                {"Frostbite",0.0752},
                {"Hell's Chamber",0.0645},
                {"Ivara Blueprint",0.0752},
                {"Ivara Neuroptics Blueprint",0.0752},
                {"Power Throw",0.0645},
                {"Scorch",0.0645},
                {"Shotgun Ammo Mutation",0.0645},
                {"Sniper Ammo Mutation",0.0645},
                {"Stretch",0.0645},
                {"Thermite Rounds",0.0645}
            }
        },
        ["RewardSet111"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet112"]={
            ["A"]={
                {"2500 Credits Cache",0.3333},
                {"3000 Credits Cache",0.3333},
                {"4000 Credits Cache",0.3333}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"250 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"300X Polymer Bundle",0.1265},
                {"350X Rubedo",0.1265},
                {"400 Endo",0.0101},
                {"640 Endo",0.0101},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.151},
                {"240 Endo",0.044},
                {"2X Gallium",0.044},
                {"2X Neurodes",0.044},
                {"2X Orokin Cell",0.044},
                {"80 Endo",0.151},
                {"Argon Crystal",0.01},
                {"Gallium",0.151},
                {"Neurodes",0.151},
                {"Nitain Extract",0.01},
                {"Orokin Cell",0.151},
                {"Tellurium",0.044},
                {"Xiphos Engines Blueprint",0.005}
            }
        },
        ["RewardSet113"]={
            ["A"]={
                {"15 Endo",0.0909},
                {"Ammo Drum",0.0909},
                {"Blunderbuss",0.0909},
                {"Fast Hands",0.0909},
                {"Magazine Warp",0.0909},
                {"Piercing Hit",0.0909},
                {"Pistol Gambit",0.0909},
                {"Point Strike",0.0909},
                {"Pressure Point",0.0909},
                {"Trick Mag",0.0909},
                {"Vitality",0.0909}
            },
            ["B"]={
                {"50 Endo",0.0556},
                {"Cryo Rounds",0.0556},
                {"Deep Freeze",0.0556},
                {"Fast Deflection",0.0556},
                {"Fury",0.0556},
                {"Hell's Chamber",0.0556},
                {"Hornet Strike",0.0556},
                {"No Return",0.0556},
                {"North Wind",0.0556},
                {"Point Blank",0.0556},
                {"Reflex Coil",0.0556},
                {"Rush",0.0556},
                {"Serration",0.0556},
                {"Shocking Touch",0.0556},
                {"Speed Trigger",0.0556},
                {"Stormbringer",0.0556},
                {"Streamline",0.0556},
                {"Target Cracker",0.0556}
            },
            ["C"]={
                {"80 Endo",0.1291},
                {"Ivara Chassis Blueprint",0.0564},
                {"Meso G1 Relic",0.1291},
                {"Meso N5 Relic",0.1291},
                {"Meso O2 Relic",0.1291},
                {"Meso T1 Relic",0.1291},
                {"Meso T2 Relic",0.1291},
                {"Metal Auger",0.0564},
                {"Rime Rounds",0.0564},
                {"Scattering Inferno",0.0564}
            }
        },
        ["RewardSet114"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet115"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet116"]={
            ["A"]={
                {"Miter Barrel",0.1667},
                {"Miter Blade",0.1667},
                {"Miter Blueprint",0.1667},
                {"Miter Chassis",0.1667},
                {"Miter Handle",0.1667},
                {"Twin Gremlins Blueprint",0.1667}
            }
        },
        ["RewardSet117"]={
            ["A"]={
                {"Frost Chassis Blueprint",0.3872},
                {"Frost Neuroptics Blueprint",0.3872},
                {"Frost Systems Blueprint",0.2256}
            }
        },
        ["RewardSet118"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet119"]={
            ["A"]={
                {"Lith B2 Relic",0.0833},
                {"Lith C2 Relic",0.0833},
                {"Lith H2 Relic",0.0833},
                {"Lith N3 Relic",0.0833},
                {"Lith S7 Relic",0.0833},
                {"Lith T1 Relic",0.0833},
                {"Lith V3 Relic",0.0833},
                {"Lith Z1 Relic",0.0833},
                {"Magazine Warp",0.0833},
                {"Synthula",0.0833},
                {"Trick Mag",0.0833},
                {"Vitality",0.0833}
            },
            ["B"]={
                {"Deep Freeze",0.0667},
                {"Fast Deflection",0.0667},
                {"Hornet Strike",0.0667},
                {"Meso G1 Relic",0.0667},
                {"Meso N5 Relic",0.0667},
                {"Meso O2 Relic",0.0667},
                {"Meso T1 Relic",0.0667},
                {"Meso T2 Relic",0.0667},
                {"No Return",0.0667},
                {"North Wind",0.0667},
                {"Reflex Coil",0.0667},
                {"Rush",0.0667},
                {"Serration",0.0667},
                {"Speed Trigger",0.0667},
                {"Target Cracker",0.0667}
            },
            ["C"]={
                {"Meso G1 Relic",0.1948},
                {"Meso N5 Relic",0.1948},
                {"Meso O2 Relic",0.1948},
                {"Meso T1 Relic",0.1948},
                {"Meso T2 Relic",0.1948},
                {"Natural Talent",0.0258}
            }
        },
        ["RewardSet120"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Corpus",0.0376},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet121"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Quickening",0.1128},
                {"True Punishment",0.1128}
            }
        },
        ["RewardSet122"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet123"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet124"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet125"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet126"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.1429},
                {"Metal Auger",0.1429},
                {"Nidus Chassis Blueprint",0.1429},
                {"Nidus Neuroptics Blueprint",0.1429},
                {"Nidus Systems Blueprint",0.1429},
                {"Stretch",0.1429},
                {"Vital Sense",0.1429}
            }
        },
        ["RewardSet127"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet128"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet129"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            },
            ["C"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            }
        },
        ["RewardSet130"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            },
            ["C"]={
                {"Axi A3 Relic",0.1111},
                {"Axi E2 Relic",0.1111},
                {"Axi H3 Relic",0.1111},
                {"Axi K2 Relic",0.1111},
                {"Axi N5 Relic",0.1111},
                {"Axi O2 Relic",0.1111},
                {"Axi V6 Relic",0.1111},
                {"Axi V7 Relic",0.1111},
                {"Life Strike",0.1111}
            }
        },
        ["RewardSet131"]={
            ["A"]={
                {"1000X Nano Spores",0.1667},
                {"150 Endo",0.1667},
                {"2500 Credits Cache",0.1667},
                {"3000 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"Thief's Wit",0.1667}
            },
            ["B"]={
                {"350X Plastids",0.1549},
                {"3X Mutagen Sample",0.1549},
                {"4000 Credits Cache",0.1549},
                {"5000 Credits Cache",0.1549},
                {"80 Endo",0.1549},
                {"Contagious Spread",0.0564},
                {"Fever Strike",0.0564},
                {"Infected Clip",0.0564},
                {"Pathogen Rounds",0.0564}
            },
            ["C"]={
                {"240 Endo",0.1549},
                {"2X Neurodes",0.1549},
                {"400 Endo",0.0451},
                {"80 Endo",0.1549},
                {"Enemy Sense",0.1549},
                {"Firestorm",0.0451},
                {"High Voltage",0.0451},
                {"Mutalist Alad V Nav Coordinate",0.0451},
                {"Neurodes",0.1549},
                {"Shell Shock",0.0451}
            }
        },
        ["RewardSet132"]={
            ["A"]={
                {"2000 Credits Cache",0.1429},
                {"2500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Power Throw",0.1429},
                {"Stabilizer",0.1429},
                {"Steady Hands",0.1429}
            },
            ["B"]={
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Neo B2 Relic",0.0376},
                {"Neo B4 Relic",0.0376},
                {"Neo K1 Relic",0.0376},
                {"Neo M1 Relic",0.0376},
                {"Neo S7 Relic",0.0376},
                {"Neo Z1 Relic",0.0376}
            },
            ["C"]={
                {"4000 Credits Cache",0.0645},
                {"5000 Credits Cache",0.0645},
                {"Arrow Mutation",0.0645},
                {"Covert Lethality",0.0645},
                {"Frigid Blast",0.0645},
                {"Frostbite",0.0752},
                {"Hell's Chamber",0.0645},
                {"Ivara Blueprint",0.0752},
                {"Ivara Neuroptics Blueprint",0.0752},
                {"Power Throw",0.0645},
                {"Scorch",0.0645},
                {"Shotgun Ammo Mutation",0.0645},
                {"Sniper Ammo Mutation",0.0645},
                {"Stretch",0.0645},
                {"Thermite Rounds",0.0645}
            }
        },
        ["RewardSet133"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet134"]={
            ["A"]={
                {"240 Endo",0.22},
                {"5000 Credits Cache",0.755},
                {"Astral Twilight",0.005},
                {"Blind Justice",0.005},
                {"Crimson Dervish",0.005},
                {"Forma Blueprint",0.005},
                {"Tempo Royale",0.0025},
                {"Vengeful Revenant",0.0025}
            }
        },
        ["RewardSet135"]={
            ["A"]={
                {"250 Endo",0.2211},
                {"4000 Credits Cache",0.7588},
                {"Crushing Ruin",0.0034},
                {"Decisive Judgement",0.0034},
                {"Final Harbinger",0.0034},
                {"Forma Blueprint",0.0034},
                {"Stalking Fan",0.0034},
                {"Vermillion Storm",0.0034}
            }
        },
        ["RewardSet136"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            },
            ["C"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            }
        },
        ["RewardSet137"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet138"]={
            ["A"]={
                {"2X 5000 Credits Cache",0.2256},
                {"4000 Credits Cache",0.3872},
                {"5000 Credits Cache",0.3872}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"400 Endo",0.1106},
                {"400X Circuits",0.1265},
                {"400X Rubedo",0.1265},
                {"640 Endo",0.0201},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.1258},
                {"240 Endo",0.1258},
                {"2X Gallium",0.0367},
                {"2X Neurodes",0.0367},
                {"2X Orokin Cell",0.0367},
                {"400 Endo",0.0367},
                {"80 Endo",0.1258},
                {"Argon Crystal",0.0367},
                {"Gallium",0.1258},
                {"Neurodes",0.1258},
                {"Nitain Extract",0.02},
                {"Orokin Cell",0.1258},
                {"Tellurium",0.0367},
                {"Xiphos Avionics Blueprint",0.005}
            }
        },
        ["RewardSet139"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet140"]={
            ["A"]={
                {"240 Endo",0.22},
                {"5000 Credits Cache",0.755},
                {"Astral Twilight",0.005},
                {"Blind Justice",0.005},
                {"Crimson Dervish",0.005},
                {"Forma Blueprint",0.005},
                {"Tempo Royale",0.0025},
                {"Vengeful Revenant",0.0025}
            }
        },
        ["RewardSet141"]={
            ["A"]={
                {"Saryn Chassis Blueprint",0.3872},
                {"Saryn Neuroptics Blueprint",0.3872},
                {"Saryn Systems Blueprint",0.2256}
            }
        },
        ["RewardSet142"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet143"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Enduring Strike",0.1128},
                {"Life Strike",0.1128}
            }
        },
        ["RewardSet144"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet145"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet146"]={
            ["A"]={
                {"Nova Chassis Blueprint",0.3872},
                {"Nova Neuroptics Blueprint",0.3872},
                {"Nova Systems Blueprint",0.2256}
            }
        },
        ["RewardSet147"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Corpus",0.0376},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet148"]={
            ["A"]={
                {"15 Endo",0.1111},
                {"Magazine Warp",0.1111},
                {"Meso G1 Relic",0.1111},
                {"Meso N5 Relic",0.1111},
                {"Meso O2 Relic",0.1111},
                {"Meso T1 Relic",0.1111},
                {"Meso T2 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"No Return",0.0714},
                {"North Wind",0.0714},
                {"Reflex Coil",0.0714},
                {"Serration",0.0714},
                {"Target Cracker",0.0714}
            },
            ["C"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            }
        },
        ["RewardSet149"]={
            ["A"]={
                {"15 Endo",0.0909},
                {"Ammo Drum",0.0909},
                {"Blunderbuss",0.0909},
                {"Fast Hands",0.0909},
                {"Magazine Warp",0.0909},
                {"Piercing Hit",0.0909},
                {"Pistol Gambit",0.0909},
                {"Point Strike",0.0909},
                {"Pressure Point",0.0909},
                {"Trick Mag",0.0909},
                {"Vitality",0.0909}
            },
            ["B"]={
                {"50 Endo",0.0556},
                {"Cryo Rounds",0.0556},
                {"Deep Freeze",0.0556},
                {"Fast Deflection",0.0556},
                {"Fury",0.0556},
                {"Hell's Chamber",0.0556},
                {"Hornet Strike",0.0556},
                {"No Return",0.0556},
                {"North Wind",0.0556},
                {"Point Blank",0.0556},
                {"Reflex Coil",0.0556},
                {"Rush",0.0556},
                {"Serration",0.0556},
                {"Shocking Touch",0.0556},
                {"Speed Trigger",0.0556},
                {"Stormbringer",0.0556},
                {"Streamline",0.0556},
                {"Target Cracker",0.0556}
            },
            ["C"]={
                {"80 Endo",0.1291},
                {"Ivara Chassis Blueprint",0.0564},
                {"Meso G1 Relic",0.1291},
                {"Meso N5 Relic",0.1291},
                {"Meso O2 Relic",0.1291},
                {"Meso T1 Relic",0.1291},
                {"Meso T2 Relic",0.1291},
                {"Metal Auger",0.0564},
                {"Rime Rounds",0.0564},
                {"Scattering Inferno",0.0564}
            }
        },
        ["RewardSet150"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"Meso G1 Relic",0.1667},
                {"Meso N5 Relic",0.1667},
                {"Meso O2 Relic",0.1667},
                {"Meso T1 Relic",0.1667},
                {"Meso T2 Relic",0.1667}
            },
            ["B"]={
                {"50 Endo",0.0667},
                {"Cryo Rounds",0.0667},
                {"Deep Freeze",0.0667},
                {"Fury",0.0667},
                {"Hell's Chamber",0.0667},
                {"Neo B2 Relic",0.0667},
                {"Neo B4 Relic",0.0667},
                {"Neo K1 Relic",0.0667},
                {"Neo M1 Relic",0.0667},
                {"Neo S7 Relic",0.0667},
                {"Neo Z1 Relic",0.0667},
                {"North Wind",0.0667},
                {"Point Blank",0.0667},
                {"Reflex Coil",0.0667},
                {"Stormbringer",0.0667}
            },
            ["C"]={
                {"80 Endo",0.0451},
                {"Metal Auger",0.0451},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Ravage",0.0451},
                {"Stretch",0.0451},
                {"Vital Sense",0.0451}
            }
        },
        ["RewardSet151"]={
            ["A"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["B"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["C"]={
                {"Force Specter Blueprint",1.0}
            }
        },
        ["RewardSet152"]={
            ["A"]={
                {"Ammo Drum",0.0316},
                {"Fast Deflection",0.0948},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0316},
                {"Lith B2 Relic",0.0316},
                {"Lith C2 Relic",0.0948},
                {"Lith H2 Relic",0.0948},
                {"Lith N3 Relic",0.0316},
                {"Lith S7 Relic",0.0948},
                {"Lith T1 Relic",0.0316},
                {"Lith Z1 Relic",0.0316},
                {"Magazine Warp",0.0948},
                {"Pressure Point",0.0101},
                {"Rush",0.0316},
                {"Trick Mag",0.0948},
                {"True Punishment",0.0101},
                {"Vitality",0.0948}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0067},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Quickening",0.0067},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"True Punishment",0.0067},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.0948},
                {"80 Endo",0.0201},
                {"Barrel Diffusion",0.0201},
                {"Enduring Strike",0.004},
                {"Heated Charge",0.0948},
                {"Hellfire",0.0948},
                {"Intensify",0.0201},
                {"Life Strike",0.004},
                {"Meso G1 Relic",0.0948},
                {"Meso N5 Relic",0.0948},
                {"Meso O2 Relic",0.0948},
                {"Meso T1 Relic",0.0948},
                {"Meso T2 Relic",0.0948},
                {"Molten Impact",0.0201},
                {"Neo B2 Relic",0.0201},
                {"Neo B4 Relic",0.0201},
                {"Neo K1 Relic",0.0201},
                {"Neo M1 Relic",0.0201},
                {"Neo S7 Relic",0.0201},
                {"Neo Z1 Relic",0.0201},
                {"Quickening",0.004},
                {"Streamline",0.0201},
                {"Thunderbolt",0.004},
                {"True Punishment",0.004}
            }
        },
        ["RewardSet153"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet154"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet155"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet156"]={
            ["A"]={
                {"3000 Credits Cache",0.3333},
                {"4000 Credits Cache",0.3333},
                {"5000 Credits Cache",0.3333}
            },
            ["B"]={
                {"15 Endo",0.1265},
                {"240 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"400 Endo",0.1106},
                {"400X Circuits",0.1265},
                {"400X Rubedo",0.1265},
                {"50 Endo",0.1265},
                {"640 Endo",0.0201},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.1888},
                {"240 Endo",0.1888},
                {"2X Gallium",0.0367},
                {"2X Neurodes",0.0367},
                {"2X Orokin Cell",0.0367},
                {"400 Endo",0.0367},
                {"80 Endo",0.1888},
                {"Argon Crystal",0.0367},
                {"Bullet Dance",0.0367},
                {"Neurodes",0.1888},
                {"Nitain Extract",0.02},
                {"Xiphos Avionics Blueprint",0.005}
            }
        },
        ["RewardSet157"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Corpus",0.0376},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet158"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet159"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet160"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Neo B2 Relic",0.1667},
                {"Neo B4 Relic",0.1667},
                {"Neo K1 Relic",0.1667},
                {"Neo M1 Relic",0.1667},
                {"Neo S7 Relic",0.1667},
                {"Neo Z1 Relic",0.1667}
            },
            ["C"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            }
        },
        ["RewardSet161"]={
            ["A"]={
                {"10000 Credits Cache",0.2256},
                {"5000 Credits Cache",0.3872},
                {"7500 Credits Cache",0.3872}
            },
            ["B"]={
                {"150 Endo",0.1518},
                {"240 Endo",0.1518},
                {"300X Plastids",0.1518},
                {"320 Endo",0.1106},
                {"400 Endo",0.1106},
                {"400X Circuits",0.1518},
                {"400X Rubedo",0.1518},
                {"640 Endo",0.0201}
            },
            ["C"]={
                {"150 Endo",0.2529},
                {"240 Endo",0.2529},
                {"2X Gallium",0.0442},
                {"2X Orokin Cell",0.0442},
                {"400 Endo",0.0442},
                {"Argon Crystal",0.0442},
                {"Bullet Dance",0.0442},
                {"Neurodes",0.2529},
                {"Nitain Extract",0.0101},
                {"Xiphos Avionics Blueprint",0.0101}
            }
        },
        ["RewardSet162"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            },
            ["C"]={
                {"Axi A3 Relic",0.125},
                {"Axi E2 Relic",0.125},
                {"Axi H3 Relic",0.125},
                {"Axi K2 Relic",0.125},
                {"Axi N5 Relic",0.125},
                {"Axi O2 Relic",0.125},
                {"Axi V6 Relic",0.125},
                {"Axi V7 Relic",0.125}
            }
        },
        ["RewardSet163"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Hornet Strike",0.0714},
                {"Incendiary Coat",0.0714},
                {"Intensify",0.0714},
                {"Lith B2 Relic",0.0714},
                {"Lith C2 Relic",0.0714},
                {"Lith H2 Relic",0.0714},
                {"Lith N3 Relic",0.0714},
                {"Lith S7 Relic",0.0714},
                {"Lith T1 Relic",0.0714},
                {"Lith V3 Relic",0.0714},
                {"Lith Z1 Relic",0.0714},
                {"Parry",0.0714},
                {"Serration",0.0714},
                {"Steel Fiber",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Cleanse Grineer",0.0376},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet164"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet165"]={
            ["B"]={
                {"Vapor Specter Blueprint",1.0}
            },
            ["C"]={
                {"Phase Specter Blueprint",1.0}
            }
        },
        ["RewardSet166"]={
            ["A"]={
                {"150 Endo",0.1429},
                {"Furor",0.1429},
                {"Galvanized Blade",0.1429},
                {"Glacial Edge",0.1429},
                {"Poisonous Sting",0.1429},
                {"Sudden Impact",0.1429},
                {"Tempered Blade",0.1429}
            },
            ["B"]={
                {"150 Endo",0.7744},
                {"Blazing Steel",0.0376},
                {"Cutting Edge",0.0376},
                {"Efficient Transferral",0.0376},
                {"Extend",0.0376},
                {"Superior Defenses",0.0376},
                {"System Reroute",0.0376}
            },
            ["C"]={
                {"400 Endo",0.086},
                {"Astral Slash",0.0752},
                {"Lith B2 Relic",0.086},
                {"Lith C2 Relic",0.086},
                {"Lith H2 Relic",0.086},
                {"Lith N3 Relic",0.086},
                {"Lith S7 Relic",0.086},
                {"Lith T1 Relic",0.086},
                {"Lith V3 Relic",0.086},
                {"Lith Z1 Relic",0.086},
                {"Meteor Crash",0.0752},
                {"Nebula Bore",0.0752}
            }
        },
        ["RewardSet167"]={
            ["A"]={
                {"Ammo Drum",0.0769},
                {"Lith B2 Relic",0.0769},
                {"Lith C2 Relic",0.0769},
                {"Lith H2 Relic",0.0769},
                {"Lith N3 Relic",0.0769},
                {"Lith S7 Relic",0.0769},
                {"Lith T1 Relic",0.0769},
                {"Lith V3 Relic",0.0769},
                {"Lith Z1 Relic",0.0769},
                {"Magazine Warp",0.0769},
                {"Pressure Point",0.0769},
                {"Synthula",0.0769},
                {"Trick Mag",0.0769}
            },
            ["B"]={
                {"50 Endo",0.1},
                {"Cryo Rounds",0.1},
                {"Hell's Chamber",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Reflex Coil",0.1},
                {"Shocking Touch",0.1}
            },
            ["C"]={
                {"80 Endo",0.1},
                {"Continuity",0.1},
                {"Master Thief",0.1},
                {"Meso G1 Relic",0.1},
                {"Meso N5 Relic",0.1},
                {"Meso O2 Relic",0.1},
                {"Meso T1 Relic",0.1},
                {"Meso T2 Relic",0.1},
                {"Metal Auger",0.1},
                {"Ravage",0.1}
            }
        },
        ["RewardSet168"]={
            ["A"]={
                {"1500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Parry",0.1429},
                {"Reflection",0.1429},
                {"Reflex Guard",0.1429},
                {"Synthula",0.1429}
            },
            ["B"]={
                {"Lith B2 Relic",0.125},
                {"Lith C2 Relic",0.125},
                {"Lith H2 Relic",0.125},
                {"Lith N3 Relic",0.125},
                {"Lith S7 Relic",0.125},
                {"Lith T1 Relic",0.125},
                {"Lith V3 Relic",0.125},
                {"Lith Z1 Relic",0.125}
            },
            ["C"]={
                {"2000 Credits Cache",0.0909},
                {"3000 Credits Cache",0.0909},
                {"Heavy Impact",0.0909},
                {"Hornet Strike",0.0909},
                {"Ivara Systems Blueprint",0.0909},
                {"Metal Auger",0.0909},
                {"Parry",0.0909},
                {"Reflection",0.0909},
                {"Serration",0.0909},
                {"Vicious Frost",0.0909},
                {"Volcanic Edge",0.0909}
            }
        },
        ["RewardSet169"]={
            ["A"]={
                {"1000 Credits Cache",0.1429},
                {"15 Endo",0.1429},
                {"1500 Credits Cache",0.1429},
                {"2000 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"500 Credits Cache",0.1429},
                {"80 Endo",0.1429}
            },
            ["B"]={
                {"Bane Of Corrupted",0.0451},
                {"Cleanse Corrupted",0.0451},
                {"Expel Corrupted",0.0451},
                {"Intensify",0.0451},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Smite Corrupted",0.0451}
            },
            ["C"]={
                {"Enduring Strike",0.0752},
                {"Harrow Systems Blueprint",0.0752},
                {"Lith B2 Relic",0.0968},
                {"Lith C2 Relic",0.0968},
                {"Lith H2 Relic",0.0968},
                {"Lith N3 Relic",0.0968},
                {"Lith S7 Relic",0.0968},
                {"Lith T1 Relic",0.0968},
                {"Lith V3 Relic",0.0968},
                {"Lith Z1 Relic",0.0968},
                {"Quickening",0.0752}
            }
        },
        ["RewardSet170"]={
            ["A"]={
                {"Mag Chassis Blueprint",0.3872},
                {"Mag Neuroptics Blueprint",0.3872},
                {"Mag Systems Blueprint",0.2256}
            }
        },
        ["RewardSet171"]={
            ["A"]={
                {"15 Endo",0.1667},
                {"1500 Credits Cache",0.1667},
                {"2000 Credits Cache",0.1667},
                {"2500 Credits Cache",0.1667},
                {"50 Endo",0.1667},
                {"80 Endo",0.1667}
            },
            ["B"]={
                {"Charged Shell",0.0833},
                {"Fast Deflection",0.0833},
                {"Hornet Strike",0.0833},
                {"Meso G1 Relic",0.0833},
                {"Meso N5 Relic",0.0833},
                {"Meso O2 Relic",0.0833},
                {"Meso T1 Relic",0.0833},
                {"Meso T2 Relic",0.0833},
                {"Provoked",0.0833},
                {"Serration",0.0833},
                {"Steel Fiber",0.0833},
                {"Vital Sense",0.0833}
            },
            ["C"]={
                {"Enduring Strike",0.1128},
                {"Neo B2 Relic",0.1291},
                {"Neo B4 Relic",0.1291},
                {"Neo K1 Relic",0.1291},
                {"Neo M1 Relic",0.1291},
                {"Neo S7 Relic",0.1291},
                {"Neo Z1 Relic",0.1291},
                {"Quickening",0.1128}
            }
        },
        ["RewardSet172"]={
            ["A"]={
                {"150 Endo",0.1},
                {"240 Endo",0.1},
                {"Lith B2 Relic",0.1},
                {"Lith C2 Relic",0.1},
                {"Lith H2 Relic",0.1},
                {"Lith N3 Relic",0.1},
                {"Lith S7 Relic",0.1},
                {"Lith T1 Relic",0.1},
                {"Lith V3 Relic",0.1},
                {"Lith Z1 Relic",0.1}
            },
            ["B"]={
                {"150 Endo",0.3872},
                {"240 Endo",0.3872},
                {"Mutalist Alad V Nav Coordinate",0.2256}
            },
            ["C"]={
                {"Forma Blueprint",0.2256},
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549}
            }
        },
        ["RewardSet173"]={
            ["A"]={
                {"1000X Nano Spores",0.1429},
                {"150 Endo",0.1429},
                {"2500 Credits Cache",0.1429},
                {"3000 Credits Cache",0.1429},
                {"3X Mutagen Sample",0.1429},
                {"80 Endo",0.1429},
                {"Thief's Wit",0.1429}
            },
            ["B"]={
                {"150 Endo",0.1518},
                {"2X Neurodes",0.0442},
                {"4000 Credits Cache",0.1518},
                {"5000 Credits Cache",0.1518},
                {"80 Endo",0.1518},
                {"Bane Of Infested",0.0442},
                {"Cleanse Infested",0.0442},
                {"Expel Infested",0.0442},
                {"Mutalist Alad V Nav Coordinate",0.0201},
                {"Neurodes",0.1518},
                {"Smite Infested",0.0442}
            },
            ["C"]={
                {"240 Endo",0.1936},
                {"2X Argon Crystal",0.0376},
                {"2X Neural Sensors",0.0376},
                {"2X Orokin Cell",0.0376},
                {"400 Endo",0.0376},
                {"Argon Crystal",0.1936},
                {"Enemy Sense",0.0376},
                {"Master Thief",0.0376},
                {"Neural Sensors",0.1936},
                {"Orokin Cell",0.1936}
            }
        },
        ["RewardSet174"]={
            ["A"]={
                {"320 Endo",0.1},
                {"400 Endo",0.1},
                {"Lith B2 Relic",0.1},
                {"Lith C2 Relic",0.1},
                {"Lith H2 Relic",0.1},
                {"Lith N3 Relic",0.1},
                {"Lith S7 Relic",0.1},
                {"Lith T1 Relic",0.1},
                {"Lith V3 Relic",0.1},
                {"Lith Z1 Relic",0.1}
            },
            ["B"]={
                {"Mutalist Alad V Nav Coordinate",0.1429},
                {"Neo B2 Relic",0.1429},
                {"Neo B4 Relic",0.1429},
                {"Neo K1 Relic",0.1429},
                {"Neo M1 Relic",0.1429},
                {"Neo S7 Relic",0.1429},
                {"Neo Z1 Relic",0.1429}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Octavia Neuroptics Blueprint",0.2256}
            }
        },
        ["RewardSet175"]={
            ["A"]={
                {"Nekros Chassis Blueprint",0.3333},
                {"Nekros Neuroptics Blueprint",0.3333},
                {"Nekros Systems Blueprint",0.3333}
            }
        },
        ["RewardSet176"]={
            ["A"]={
                {"150 Endo",0.1291},
                {"240 Endo",0.1291},
                {"300X Plastids",0.1291},
                {"300X Polymer Bundle",0.1291},
                {"350X Rubedo",0.1291},
                {"80 Endo",0.1291},
                {"Octavia Systems Blueprint",0.2256}
            },
            ["B"]={
                {"240 Endo",0.2211},
                {"2500 Credits Cache",0.2529},
                {"3000 Credits Cache",0.2529},
                {"400 Endo",0.0101},
                {"4000 Credits Cache",0.2529},
                {"640 Endo",0.0101}
            },
            ["C"]={
                {"240 Endo",0.1082},
                {"2X Gallium",0.1082},
                {"2X Neurodes",0.1082},
                {"2X Orokin Cell",0.1082},
                {"Argon Crystal",0.1082},
                {"Gallium",0.1082},
                {"Neurodes",0.1082},
                {"Nitain Extract",0.0129},
                {"Orokin Cell",0.1082},
                {"Tellurium",0.1082},
                {"Xiphos Engines Blueprint",0.0129}
            }
        },
        ["RewardSet177"]={
            ["A"]={
                {"100 Endo",0.1218},
                {"Astral Twilight",0.0129},
                {"Blood Rush",0.1218},
                {"Fast Hands",0.1218},
                {"Gnashing Payara",0.0129},
                {"Hydraulic Crosshairs",0.1218},
                {"Piercing Hit",0.1218},
                {"Pistol Gambit",0.1218},
                {"Point Strike",0.1218},
                {"Shrapnel Shot",0.1218}
            },
            ["B"]={
                {"150 Endo",0.0649},
                {"Catalyzer Link",0.0649},
                {"Crushing Ruin",0.0129},
                {"Cryo Rounds",0.0649},
                {"Deep Freeze",0.0649},
                {"Focused Defense",0.0649},
                {"Hell's Chamber",0.0649},
                {"High Noon",0.0129},
                {"Hornet Strike",0.0649},
                {"No Return",0.0649},
                {"North Wind",0.0649},
                {"Reflex Coil",0.0649},
                {"Serration",0.0649},
                {"Shocking Touch",0.0649},
                {"Stormbringer",0.0649},
                {"Streamline",0.0649},
                {"Target Cracker",0.0649}
            },
            ["C"]={
                {"400 Endo",0.3794},
                {"Cleaving Whirlwind",0.0201},
                {"Coiling Viper",0.3794},
                {"Ivara Chassis Blueprint",0.0737},
                {"Rime Rounds",0.0737},
                {"Scattering Inferno",0.0737}
            }
        },
        ["RewardSet178"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet179"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet180"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet181"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet182"]={
            ["A"]={
                {"Ammo Drum",0.1106},
                {"Fast Deflection",0.0948},
                {"Fast Hands",0.0948},
                {"Health Restore (Large)",0.0948},
                {"Lith N3 Relic",0.0029},
                {"Magazine Warp",0.0948},
                {"Molten Impact",0.0029},
                {"Neo B2 Relic",0.0948},
                {"North Wind",0.0029},
                {"Omni Ammo Box",0.0029},
                {"Pressure Point",0.0029},
                {"Quickdraw",0.0948},
                {"Rush",0.1106},
                {"Shocking Touch",0.0029},
                {"Stretch",0.0029},
                {"Trick Mag",0.0948},
                {"Vitality",0.0948}
            }
        },
        ["RewardSet183"]={
            ["A"]={
                {"2000 Credits Cache",0.25},
                {"2500 Credits Cache",0.25},
                {"3000 Credits Cache",0.25},
                {"400 Endo",0.25}
            },
            ["B"]={
                {"Flow",0.0714},
                {"Hell's Chamber",0.0714},
                {"Hornet Strike",0.0714},
                {"Neo B2 Relic",0.0714},
                {"Neo B4 Relic",0.0714},
                {"Neo K1 Relic",0.0714},
                {"Neo M1 Relic",0.0714},
                {"Neo S7 Relic",0.0714},
                {"Neo Z1 Relic",0.0714},
                {"Serration",0.0714},
                {"Split Chamber",0.0714},
                {"Stabilizer",0.0714},
                {"Steel Fiber",0.0714},
                {"Stretch",0.0714}
            },
            ["C"]={
                {"Arrow Mutation",0.0376},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Cleanse Infested",0.0376},
                {"Pistol Ammo Mutation",0.0376},
                {"Rifle Ammo Mutation",0.0376},
                {"Shotgun Ammo Mutation",0.0376},
                {"Sniper Ammo Mutation",0.0376}
            }
        },
        ["RewardSet184"]={
            ["A"]={
                {"Magazine Warp",0.1111},
                {"Neo B2 Relic",0.1111},
                {"Neo B4 Relic",0.1111},
                {"Neo K1 Relic",0.1111},
                {"Neo M1 Relic",0.1111},
                {"Neo S7 Relic",0.1111},
                {"Neo Z1 Relic",0.1111},
                {"Trick Mag",0.1111},
                {"Vitality",0.1111}
            },
            ["B"]={
                {"50 Endo",0.0625},
                {"Axi A3 Relic",0.0625},
                {"Axi E2 Relic",0.0625},
                {"Axi H3 Relic",0.0625},
                {"Axi K2 Relic",0.0625},
                {"Axi N5 Relic",0.0625},
                {"Axi O2 Relic",0.0625},
                {"Axi V6 Relic",0.0625},
                {"Axi V7 Relic",0.0625},
                {"Deep Freeze",0.0625},
                {"Hell's Chamber",0.0625},
                {"Hornet Strike",0.0625},
                {"North Wind",0.0625},
                {"Reflex Coil",0.0625},
                {"Shocking Touch",0.0625},
                {"Streamline",0.0625}
            },
            ["C"]={
                {"80 Endo",0.0226},
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Continuity",0.0226},
                {"Convulsion",0.0226},
                {"Handspring",0.0226},
                {"Master Thief",0.0226},
                {"Metal Auger",0.0226},
                {"Ravage",0.0226},
                {"Split Chamber",0.0226},
                {"Stretch",0.0226},
                {"Vital Sense",0.0226}
            }
        },
        ["RewardSet185"]={
            ["A"]={
                {"2X 5000 Credits Cache",0.2256},
                {"4000 Credits Cache",0.3872},
                {"5000 Credits Cache",0.3872}
            },
            ["B"]={
                {"150 Endo",0.1265},
                {"240 Endo",0.1106},
                {"300X Plastids",0.1265},
                {"400 Endo",0.1106},
                {"400X Circuits",0.1265},
                {"400X Rubedo",0.1265},
                {"640 Endo",0.0201},
                {"75 Endo",0.1265},
                {"80 Endo",0.1265}
            },
            ["C"]={
                {"150 Endo",0.1079},
                {"240 Endo",0.1079},
                {"2X Gallium",0.0367},
                {"2X Neural Sensors",0.0367},
                {"2X Orokin Cell",0.0367},
                {"400 Endo",0.0367},
                {"80 Endo",0.1079},
                {"Argon Crystal",0.0367},
                {"Cyclone Kraken",0.1079},
                {"Gallium",0.1079},
                {"Neurodes",0.1079},
                {"Nitain Extract",0.02},
                {"Orokin Cell",0.1079},
                {"Tellurium",0.0367},
                {"Xiphos Avionics Blueprint",0.005}
            }
        },
        ["RewardSet186"]={
            ["A"]={
                {"2000 Credits Cache",0.1429},
                {"2500 Credits Cache",0.1429},
                {"50 Endo",0.1429},
                {"80 Endo",0.1429},
                {"Power Throw",0.1429},
                {"Stabilizer",0.1429},
                {"Steady Hands",0.1429}
            },
            ["B"]={
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549},
                {"Neo B2 Relic",0.0376},
                {"Neo B4 Relic",0.0376},
                {"Neo K1 Relic",0.0376},
                {"Neo M1 Relic",0.0376},
                {"Neo S7 Relic",0.0376},
                {"Neo Z1 Relic",0.0376}
            },
            ["C"]={
                {"4000 Credits Cache",0.0645},
                {"5000 Credits Cache",0.0645},
                {"Arrow Mutation",0.0645},
                {"Covert Lethality",0.0645},
                {"Frigid Blast",0.0645},
                {"Frostbite",0.1128},
                {"Harrow Neuroptics Blueprint",0.1128},
                {"Hell's Chamber",0.0645},
                {"Power Throw",0.0645},
                {"Scorch",0.0645},
                {"Shotgun Ammo Mutation",0.0645},
                {"Sniper Ammo Mutation",0.0645},
                {"Stretch",0.0645},
                {"Thermite Rounds",0.0645}
            }
        },
        ["RewardSet187"]={
            ["A"]={
                {"Phase Specter Blueprint",1.0}
            },
            ["B"]={
                {"Force Specter Blueprint",1.0}
            },
            ["C"]={
                {"Cosmic Specter Blueprint",1.0}
            }
        },
        ["RewardSet188"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.11},
                {"Braton Prime Stock",0.2533},
                {"Dual Kamas Prime Handle",0.11},
                {"Fragor Prime Head",0.2533},
                {"Nikana Prime Blueprint",0.02},
                {"Trinity Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet189"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.13},
                {"Braton Prime Stock",0.2333},
                {"Dual Kamas Prime Handle",0.13},
                {"Fragor Prime Head",0.2333},
                {"Nikana Prime Blueprint",0.04},
                {"Trinity Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet190"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.17},
                {"Braton Prime Stock",0.2},
                {"Dual Kamas Prime Handle",0.17},
                {"Fragor Prime Head",0.2},
                {"Nikana Prime Blueprint",0.06},
                {"Trinity Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet191"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.2},
                {"Braton Prime Stock",0.1667},
                {"Dual Kamas Prime Handle",0.2},
                {"Fragor Prime Head",0.1667},
                {"Nikana Prime Blueprint",0.1},
                {"Trinity Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet192"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.11},
                {"Aklex Prime Link",0.02},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Barrel",0.2533},
                {"Lex Prime Blueprint",0.11},
                {"Lex Prime Receiver",0.2533}
            }
        },
        ["RewardSet193"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.13},
                {"Aklex Prime Link",0.04},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Barrel",0.2333},
                {"Lex Prime Blueprint",0.13},
                {"Lex Prime Receiver",0.2333}
            }
        },
        ["RewardSet194"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.17},
                {"Aklex Prime Link",0.06},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.2},
                {"Lex Prime Blueprint",0.17},
                {"Lex Prime Receiver",0.2}
            }
        },
        ["RewardSet195"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.2},
                {"Aklex Prime Link",0.1},
                {"Forma Blueprint",0.1667},
                {"Lex Prime Barrel",0.1667},
                {"Lex Prime Blueprint",0.2},
                {"Lex Prime Receiver",0.1667}
            }
        },
        ["RewardSet196"]={
            ["A"]={
                {"Akbolto Prime Receiver",0.02},
                {"Braton Prime Barrel",0.2533},
                {"Cernos Prime String",0.11},
                {"Helios Prime Carapace",0.2533},
                {"Hydroid Prime Neuroptics Blueprint",0.11},
                {"Kogake Prime Boot",0.2533}
            }
        },
        ["RewardSet197"]={
            ["A"]={
                {"Akbolto Prime Receiver",0.04},
                {"Braton Prime Barrel",0.2333},
                {"Cernos Prime String",0.13},
                {"Helios Prime Carapace",0.2333},
                {"Hydroid Prime Neuroptics Blueprint",0.13},
                {"Kogake Prime Boot",0.2333}
            }
        },
        ["RewardSet198"]={
            ["A"]={
                {"Akbolto Prime Receiver",0.06},
                {"Braton Prime Barrel",0.2},
                {"Cernos Prime String",0.17},
                {"Helios Prime Carapace",0.2},
                {"Hydroid Prime Neuroptics Blueprint",0.17},
                {"Kogake Prime Boot",0.2}
            }
        },
        ["RewardSet199"]={
            ["A"]={
                {"Akbolto Prime Receiver",0.1},
                {"Braton Prime Barrel",0.1667},
                {"Cernos Prime String",0.2},
                {"Helios Prime Carapace",0.1667},
                {"Hydroid Prime Neuroptics Blueprint",0.2},
                {"Kogake Prime Boot",0.1667}
            }
        },
        ["RewardSet200"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2533},
                {"Banshee Prime Systems Blueprint",0.02},
                {"Cernos Prime Blueprint",0.11},
                {"Euphona Prime Blueprint",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Kavasa Prime Buckle",0.11}
            }
        },
        ["RewardSet201"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2333},
                {"Banshee Prime Systems Blueprint",0.04},
                {"Cernos Prime Blueprint",0.13},
                {"Euphona Prime Blueprint",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Kavasa Prime Buckle",0.13}
            }
        },
        ["RewardSet202"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2},
                {"Banshee Prime Systems Blueprint",0.06},
                {"Cernos Prime Blueprint",0.17},
                {"Euphona Prime Blueprint",0.2},
                {"Fang Prime Blade",0.2},
                {"Kavasa Prime Buckle",0.17}
            }
        },
        ["RewardSet203"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.1667},
                {"Banshee Prime Systems Blueprint",0.1},
                {"Cernos Prime Blueprint",0.2},
                {"Euphona Prime Blueprint",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Kavasa Prime Buckle",0.2}
            }
        },
        ["RewardSet204"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.02},
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.11},
                {"Fragor Prime Head",0.2533},
                {"Orthos Prime Blueprint",0.11},
                {"Sybaris Prime Blueprint",0.2533}
            }
        },
        ["RewardSet205"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.04},
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.13},
                {"Fragor Prime Head",0.2333},
                {"Orthos Prime Blueprint",0.13},
                {"Sybaris Prime Blueprint",0.2333}
            }
        },
        ["RewardSet206"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.06},
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.17},
                {"Fragor Prime Head",0.2},
                {"Orthos Prime Blueprint",0.17},
                {"Sybaris Prime Blueprint",0.2}
            }
        },
        ["RewardSet207"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.1},
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Head",0.1667},
                {"Orthos Prime Blueprint",0.2},
                {"Sybaris Prime Blueprint",0.1667}
            }
        },
        ["RewardSet208"]={
            ["A"]={
                {"Cernos Prime Lower Limb",0.02},
                {"Forma Blueprint",0.11},
                {"Lex Prime Receiver",0.2533},
                {"Orthos Prime Blueprint",0.11},
                {"Trinity Prime Neuroptics Blueprint",0.2533},
                {"Vectis Prime Barrel",0.2533}
            }
        },
        ["RewardSet209"]={
            ["A"]={
                {"Cernos Prime Lower Limb",0.04},
                {"Forma Blueprint",0.13},
                {"Lex Prime Receiver",0.2333},
                {"Orthos Prime Blueprint",0.13},
                {"Trinity Prime Neuroptics Blueprint",0.2333},
                {"Vectis Prime Barrel",0.2333}
            }
        },
        ["RewardSet210"]={
            ["A"]={
                {"Cernos Prime Lower Limb",0.06},
                {"Forma Blueprint",0.17},
                {"Lex Prime Receiver",0.2},
                {"Orthos Prime Blueprint",0.17},
                {"Trinity Prime Neuroptics Blueprint",0.2},
                {"Vectis Prime Barrel",0.2}
            }
        },
        ["RewardSet211"]={
            ["A"]={
                {"Cernos Prime Lower Limb",0.1},
                {"Forma Blueprint",0.2},
                {"Lex Prime Receiver",0.1667},
                {"Orthos Prime Blueprint",0.2},
                {"Trinity Prime Neuroptics Blueprint",0.1667},
                {"Vectis Prime Barrel",0.1667}
            }
        },
        ["RewardSet212"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2533},
                {"Cernos Prime Lower Limb",0.02},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Handle",0.11},
                {"None",0.11},
                {"Trinity Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet213"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2333},
                {"Cernos Prime Lower Limb",0.04},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Handle",0.13},
                {"None",0.13},
                {"Trinity Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet214"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2},
                {"Cernos Prime Lower Limb",0.06},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Handle",0.17},
                {"None",0.17},
                {"Trinity Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet215"]={
            ["A"]={
                {"Braton Prime Blueprint",0.1667},
                {"Cernos Prime Lower Limb",0.1},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Handle",0.2},
                {"None",0.2},
                {"Trinity Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet216"]={
            ["A"]={
                {"Ember Prime Blueprint",0.02},
                {"Forma Blueprint",0.11},
                {"Frost Prime Neuroptics Blueprint",0.2533},
                {"Glaive Prime Blade",0.11},
                {"Latron Prime Barrel",0.2533},
                {"Sicarus Prime Blueprint",0.2533}
            }
        },
        ["RewardSet217"]={
            ["A"]={
                {"Ember Prime Blueprint",0.04},
                {"Forma Blueprint",0.13},
                {"Frost Prime Neuroptics Blueprint",0.2333},
                {"Glaive Prime Blade",0.13},
                {"Latron Prime Barrel",0.2333},
                {"Sicarus Prime Blueprint",0.2333}
            }
        },
        ["RewardSet218"]={
            ["A"]={
                {"Ember Prime Blueprint",0.06},
                {"Forma Blueprint",0.17},
                {"Frost Prime Neuroptics Blueprint",0.2},
                {"Glaive Prime Blade",0.17},
                {"Latron Prime Barrel",0.2},
                {"Sicarus Prime Blueprint",0.2}
            }
        },
        ["RewardSet219"]={
            ["A"]={
                {"Ember Prime Blueprint",0.1},
                {"Forma Blueprint",0.2},
                {"Frost Prime Neuroptics Blueprint",0.1667},
                {"Glaive Prime Blade",0.2},
                {"Latron Prime Barrel",0.1667},
                {"Sicarus Prime Blueprint",0.1667}
            }
        },
        ["RewardSet220"]={
            ["A"]={
                {"Braton Prime Stock",0.2533},
                {"Bronco Prime Barrel",0.11},
                {"Euphona Prime Receiver",0.02},
                {"Forma Blueprint",0.11},
                {"Lex Prime Receiver",0.2533},
                {"Paris Prime Blueprint",0.2533}
            }
        },
        ["RewardSet221"]={
            ["A"]={
                {"Braton Prime Stock",0.2333},
                {"Bronco Prime Barrel",0.13},
                {"Euphona Prime Receiver",0.04},
                {"Forma Blueprint",0.13},
                {"Lex Prime Receiver",0.2333},
                {"Paris Prime Blueprint",0.2333}
            }
        },
        ["RewardSet222"]={
            ["A"]={
                {"Braton Prime Stock",0.2},
                {"Bronco Prime Barrel",0.17},
                {"Euphona Prime Receiver",0.06},
                {"Forma Blueprint",0.17},
                {"Lex Prime Receiver",0.2},
                {"Paris Prime Blueprint",0.2}
            }
        },
        ["RewardSet223"]={
            ["A"]={
                {"Braton Prime Stock",0.1667},
                {"Bronco Prime Barrel",0.2},
                {"Euphona Prime Receiver",0.1},
                {"Forma Blueprint",0.2},
                {"Lex Prime Receiver",0.1667},
                {"Paris Prime Blueprint",0.1667}
            }
        },
        ["RewardSet224"]={
            ["A"]={
                {"Forma Blueprint",0.11},
                {"Galatine Prime Blueprint",0.02},
                {"Kavasa Prime Kubrow Collar Blueprint",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Paris Prime Blueprint",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet225"]={
            ["A"]={
                {"Forma Blueprint",0.13},
                {"Galatine Prime Blueprint",0.04},
                {"Kavasa Prime Kubrow Collar Blueprint",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Paris Prime Blueprint",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet226"]={
            ["A"]={
                {"Forma Blueprint",0.17},
                {"Galatine Prime Blueprint",0.06},
                {"Kavasa Prime Kubrow Collar Blueprint",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Paris Prime Blueprint",0.2},
                {"Saryn Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet227"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Galatine Prime Blueprint",0.1},
                {"Kavasa Prime Kubrow Collar Blueprint",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Paris Prime Blueprint",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet228"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.11},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Head",0.2533},
                {"Helios Prime Cerebrum",0.02},
                {"Trinity Prime Chassis Blueprint",0.11},
                {"Vectis Prime Barrel",0.2533}
            }
        },
        ["RewardSet229"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.13},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Head",0.2333},
                {"Helios Prime Cerebrum",0.04},
                {"Trinity Prime Chassis Blueprint",0.13},
                {"Vectis Prime Barrel",0.2333}
            }
        },
        ["RewardSet230"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.17},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Head",0.2},
                {"Helios Prime Cerebrum",0.06},
                {"Trinity Prime Chassis Blueprint",0.17},
                {"Vectis Prime Barrel",0.2}
            }
        },
        ["RewardSet231"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.2},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Head",0.1667},
                {"Helios Prime Cerebrum",0.1},
                {"Trinity Prime Chassis Blueprint",0.2},
                {"Vectis Prime Barrel",0.1667}
            }
        },
        ["RewardSet232"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.11},
                {"Fang Prime Handle",0.2533},
                {"Helios Prime Cerebrum",0.02},
                {"Lex Prime Receiver",0.2533},
                {"Oberon Prime Chassis Blueprint",0.2533},
                {"Trinity Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet233"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.13},
                {"Fang Prime Handle",0.2333},
                {"Helios Prime Cerebrum",0.04},
                {"Lex Prime Receiver",0.2333},
                {"Oberon Prime Chassis Blueprint",0.2333},
                {"Trinity Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet234"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.17},
                {"Fang Prime Handle",0.2},
                {"Helios Prime Cerebrum",0.06},
                {"Lex Prime Receiver",0.2},
                {"Oberon Prime Chassis Blueprint",0.2},
                {"Trinity Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet235"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.2},
                {"Fang Prime Handle",0.1667},
                {"Helios Prime Cerebrum",0.1},
                {"Lex Prime Receiver",0.1667},
                {"Oberon Prime Chassis Blueprint",0.1667},
                {"Trinity Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet236"]={
            ["A"]={
                {"Burston Prime Barrel",0.11},
                {"Cernos Prime Grip",0.2533},
                {"Forma Blueprint",0.11},
                {"Helios Prime Carapace",0.2533},
                {"Hydroid Prime Systems Blueprint",0.02},
                {"Kronen Prime Blueprint",0.2533}
            }
        },
        ["RewardSet237"]={
            ["A"]={
                {"Burston Prime Barrel",0.13},
                {"Cernos Prime Grip",0.2333},
                {"Forma Blueprint",0.13},
                {"Helios Prime Carapace",0.2333},
                {"Hydroid Prime Systems Blueprint",0.04},
                {"Kronen Prime Blueprint",0.2333}
            }
        },
        ["RewardSet238"]={
            ["A"]={
                {"Burston Prime Barrel",0.17},
                {"Cernos Prime Grip",0.2},
                {"Forma Blueprint",0.17},
                {"Helios Prime Carapace",0.2},
                {"Hydroid Prime Systems Blueprint",0.06},
                {"Kronen Prime Blueprint",0.2}
            }
        },
        ["RewardSet239"]={
            ["A"]={
                {"Burston Prime Barrel",0.2},
                {"Cernos Prime Grip",0.1667},
                {"Forma Blueprint",0.2},
                {"Helios Prime Carapace",0.1667},
                {"Hydroid Prime Systems Blueprint",0.1},
                {"Kronen Prime Blueprint",0.1667}
            }
        },
        ["RewardSet240"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.11},
                {"Forma Blueprint",0.11},
                {"Hikou Prime Pouch",0.2533},
                {"Kavasa Prime Buckle",0.02},
                {"Lex Prime Barrel",0.2533},
                {"Odonata Prime Harness Blueprint",0.2533}
            }
        },
        ["RewardSet241"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.13},
                {"Forma Blueprint",0.13},
                {"Hikou Prime Pouch",0.2333},
                {"Kavasa Prime Buckle",0.04},
                {"Lex Prime Barrel",0.2333},
                {"Odonata Prime Harness Blueprint",0.2333}
            }
        },
        ["RewardSet242"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.17},
                {"Forma Blueprint",0.17},
                {"Hikou Prime Pouch",0.2},
                {"Kavasa Prime Buckle",0.06},
                {"Lex Prime Barrel",0.2},
                {"Odonata Prime Harness Blueprint",0.2}
            }
        },
        ["RewardSet243"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.2},
                {"Forma Blueprint",0.2},
                {"Hikou Prime Pouch",0.1667},
                {"Kavasa Prime Buckle",0.1},
                {"Lex Prime Barrel",0.1667},
                {"Odonata Prime Harness Blueprint",0.1667}
            }
        },
        ["RewardSet244"]={
            ["A"]={
                {"Cernos Prime String",0.11},
                {"Forma Blueprint",0.2533},
                {"Galatine Prime Handle",0.11},
                {"Kronen Prime Blade",0.02},
                {"Orthos Prime Handle",0.2533},
                {"Sybaris Prime Blueprint",0.2533}
            }
        },
        ["RewardSet245"]={
            ["A"]={
                {"Cernos Prime String",0.13},
                {"Forma Blueprint",0.2333},
                {"Galatine Prime Handle",0.13},
                {"Kronen Prime Blade",0.04},
                {"Orthos Prime Handle",0.2333},
                {"Sybaris Prime Blueprint",0.2333}
            }
        },
        ["RewardSet246"]={
            ["A"]={
                {"Cernos Prime String",0.17},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Handle",0.17},
                {"Kronen Prime Blade",0.06},
                {"Orthos Prime Handle",0.2},
                {"Sybaris Prime Blueprint",0.2}
            }
        },
        ["RewardSet247"]={
            ["A"]={
                {"Cernos Prime String",0.2},
                {"Forma Blueprint",0.1667},
                {"Galatine Prime Handle",0.2},
                {"Kronen Prime Blade",0.1},
                {"Orthos Prime Handle",0.1667},
                {"Sybaris Prime Blueprint",0.1667}
            }
        },
        ["RewardSet248"]={
            ["A"]={
                {"Forma Blueprint",0.11},
                {"Glaive Prime Blade",0.11},
                {"Latron Prime Blueprint",0.2533},
                {"Loki Prime Systems Blueprint",0.02},
                {"Reaper Prime Blueprint",0.2533},
                {"Wyrm Prime Carapace",0.2533}
            }
        },
        ["RewardSet249"]={
            ["A"]={
                {"Forma Blueprint",0.13},
                {"Glaive Prime Blade",0.13},
                {"Latron Prime Blueprint",0.2333},
                {"Loki Prime Systems Blueprint",0.04},
                {"Reaper Prime Blueprint",0.2333},
                {"Wyrm Prime Carapace",0.2333}
            }
        },
        ["RewardSet250"]={
            ["A"]={
                {"Forma Blueprint",0.17},
                {"Glaive Prime Blade",0.17},
                {"Latron Prime Blueprint",0.2},
                {"Loki Prime Systems Blueprint",0.06},
                {"Reaper Prime Blueprint",0.2},
                {"Wyrm Prime Carapace",0.2}
            }
        },
        ["RewardSet251"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Glaive Prime Blade",0.2},
                {"Latron Prime Blueprint",0.1667},
                {"Loki Prime Systems Blueprint",0.1},
                {"Reaper Prime Blueprint",0.1667},
                {"Wyrm Prime Carapace",0.1667}
            }
        },
        ["RewardSet252"]={
            ["A"]={
                {"Akstiletto Prime Link",0.11},
                {"Ash Prime Systems Blueprint",0.02},
                {"Braton Prime Blueprint",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.2533},
                {"Odonata Prime Wings Blueprint",0.11}
            }
        },
        ["RewardSet253"]={
            ["A"]={
                {"Akstiletto Prime Link",0.13},
                {"Ash Prime Systems Blueprint",0.04},
                {"Braton Prime Blueprint",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.2333},
                {"Odonata Prime Wings Blueprint",0.13}
            }
        },
        ["RewardSet254"]={
            ["A"]={
                {"Akstiletto Prime Link",0.17},
                {"Ash Prime Systems Blueprint",0.06},
                {"Braton Prime Blueprint",0.2},
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.2},
                {"Odonata Prime Wings Blueprint",0.17}
            }
        },
        ["RewardSet255"]={
            ["A"]={
                {"Akstiletto Prime Link",0.2},
                {"Ash Prime Systems Blueprint",0.1},
                {"Braton Prime Blueprint",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.1667},
                {"Odonata Prime Wings Blueprint",0.2}
            }
        },
        ["RewardSet256"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.11},
                {"Bronco Prime Blueprint",0.2533},
                {"Carrier Prime Carapace",0.2533},
                {"Forma Blueprint",0.11},
                {"Lex Prime Receiver",0.2533},
                {"Nikana Prime Hilt",0.02}
            }
        },
        ["RewardSet257"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.13},
                {"Bronco Prime Blueprint",0.2333},
                {"Carrier Prime Carapace",0.2333},
                {"Forma Blueprint",0.13},
                {"Lex Prime Receiver",0.2333},
                {"Nikana Prime Hilt",0.04}
            }
        },
        ["RewardSet258"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.17},
                {"Bronco Prime Blueprint",0.2},
                {"Carrier Prime Carapace",0.2},
                {"Forma Blueprint",0.17},
                {"Lex Prime Receiver",0.2},
                {"Nikana Prime Hilt",0.06}
            }
        },
        ["RewardSet259"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.2},
                {"Bronco Prime Blueprint",0.1667},
                {"Carrier Prime Carapace",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Receiver",0.1667},
                {"Nikana Prime Hilt",0.1}
            }
        },
        ["RewardSet260"]={
            ["A"]={
                {"Bronco Prime Barrel",0.11},
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Nekros Prime Blueprint",0.02},
                {"Paris Prime Upper Limb",0.2533},
                {"Volt Prime Blueprint",0.11}
            }
        },
        ["RewardSet261"]={
            ["A"]={
                {"Bronco Prime Barrel",0.13},
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Nekros Prime Blueprint",0.04},
                {"Paris Prime Upper Limb",0.2333},
                {"Volt Prime Blueprint",0.13}
            }
        },
        ["RewardSet262"]={
            ["A"]={
                {"Bronco Prime Barrel",0.17},
                {"Dual Kamas Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Nekros Prime Blueprint",0.06},
                {"Paris Prime Upper Limb",0.2},
                {"Volt Prime Blueprint",0.17}
            }
        },
        ["RewardSet263"]={
            ["A"]={
                {"Bronco Prime Barrel",0.2},
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Nekros Prime Blueprint",0.1},
                {"Paris Prime Upper Limb",0.1667},
                {"Volt Prime Blueprint",0.2}
            }
        },
        ["RewardSet264"]={
            ["A"]={
                {"Cernos Prime Upper Limb",0.2533},
                {"Fragor Prime Handle",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Hydroid Prime Neuroptics Blueprint",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Nikana Prime Hilt",0.02}
            }
        },
        ["RewardSet265"]={
            ["A"]={
                {"Cernos Prime Upper Limb",0.2333},
                {"Fragor Prime Handle",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Hydroid Prime Neuroptics Blueprint",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Nikana Prime Hilt",0.04}
            }
        },
        ["RewardSet266"]={
            ["A"]={
                {"Cernos Prime Upper Limb",0.2},
                {"Fragor Prime Handle",0.17},
                {"Galatine Prime Blade",0.2},
                {"Hydroid Prime Neuroptics Blueprint",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Nikana Prime Hilt",0.06}
            }
        },
        ["RewardSet267"]={
            ["A"]={
                {"Cernos Prime Upper Limb",0.1667},
                {"Fragor Prime Handle",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Hydroid Prime Neuroptics Blueprint",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Nikana Prime Hilt",0.1}
            }
        },
        ["RewardSet268"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2533},
                {"Helios Prime Systems",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Nami Skyla Prime Blade",0.02},
                {"Nekros Prime Neuroptics Blueprint",0.11},
                {"Oberon Prime Chassis Blueprint",0.2533}
            }
        },
        ["RewardSet269"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2333},
                {"Helios Prime Systems",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Nami Skyla Prime Blade",0.04},
                {"Nekros Prime Neuroptics Blueprint",0.13},
                {"Oberon Prime Chassis Blueprint",0.2333}
            }
        },
        ["RewardSet270"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2},
                {"Helios Prime Systems",0.17},
                {"Lex Prime Barrel",0.2},
                {"Nami Skyla Prime Blade",0.06},
                {"Nekros Prime Neuroptics Blueprint",0.17},
                {"Oberon Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet271"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.1667},
                {"Helios Prime Systems",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Nami Skyla Prime Blade",0.1},
                {"Nekros Prime Neuroptics Blueprint",0.2},
                {"Oberon Prime Chassis Blueprint",0.1667}
            }
        },
        ["RewardSet272"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.11},
                {"Euphona Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Galatine Prime Handle",0.11},
                {"Oberon Prime Systems Blueprint",0.02},
                {"Paris Prime Blueprint",0.2533}
            }
        },
        ["RewardSet273"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.13},
                {"Euphona Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Galatine Prime Handle",0.13},
                {"Oberon Prime Systems Blueprint",0.04},
                {"Paris Prime Blueprint",0.2333}
            }
        },
        ["RewardSet274"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.17},
                {"Euphona Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Handle",0.17},
                {"Oberon Prime Systems Blueprint",0.06},
                {"Paris Prime Blueprint",0.2}
            }
        },
        ["RewardSet275"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.2},
                {"Euphona Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Galatine Prime Handle",0.2},
                {"Oberon Prime Systems Blueprint",0.1},
                {"Paris Prime Blueprint",0.1667}
            }
        },
        ["RewardSet276"]={
            ["A"]={
                {"Fang Prime Blade",0.2533},
                {"Galatine Prime Blade",0.2533},
                {"Helios Prime Systems",0.11},
                {"Oberon Prime Systems Blueprint",0.02},
                {"Paris Prime String",0.2533},
                {"Tiberon Prime Blueprint",0.11}
            }
        },
        ["RewardSet277"]={
            ["A"]={
                {"Fang Prime Blade",0.2333},
                {"Galatine Prime Blade",0.2333},
                {"Helios Prime Systems",0.13},
                {"Oberon Prime Systems Blueprint",0.04},
                {"Paris Prime String",0.2333},
                {"Tiberon Prime Blueprint",0.13}
            }
        },
        ["RewardSet278"]={
            ["A"]={
                {"Fang Prime Blade",0.2},
                {"Galatine Prime Blade",0.2},
                {"Helios Prime Systems",0.17},
                {"Oberon Prime Systems Blueprint",0.06},
                {"Paris Prime String",0.2},
                {"Tiberon Prime Blueprint",0.17}
            }
        },
        ["RewardSet279"]={
            ["A"]={
                {"Fang Prime Blade",0.1667},
                {"Galatine Prime Blade",0.1667},
                {"Helios Prime Systems",0.2},
                {"Oberon Prime Systems Blueprint",0.1},
                {"Paris Prime String",0.1667},
                {"Tiberon Prime Blueprint",0.2}
            }
        },
        ["RewardSet280"]={
            ["A"]={
                {"Ankyros Prime Blade",0.11},
                {"Boar Prime Receiver",0.2533},
                {"Boltor Prime Stock",0.2533},
                {"Dakra Prime Blueprint",0.11},
                {"Mag Prime Systems Blueprint",0.2533},
                {"Rhino Prime Blueprint",0.02}
            }
        },
        ["RewardSet281"]={
            ["A"]={
                {"Ankyros Prime Blade",0.13},
                {"Boar Prime Receiver",0.2333},
                {"Boltor Prime Stock",0.2333},
                {"Dakra Prime Blueprint",0.13},
                {"Mag Prime Systems Blueprint",0.2333},
                {"Rhino Prime Blueprint",0.04}
            }
        },
        ["RewardSet282"]={
            ["A"]={
                {"Ankyros Prime Blade",0.17},
                {"Boar Prime Receiver",0.2},
                {"Boltor Prime Stock",0.2},
                {"Dakra Prime Blueprint",0.17},
                {"Mag Prime Systems Blueprint",0.2},
                {"Rhino Prime Blueprint",0.06}
            }
        },
        ["RewardSet283"]={
            ["A"]={
                {"Ankyros Prime Blade",0.2},
                {"Boar Prime Receiver",0.1667},
                {"Boltor Prime Stock",0.1667},
                {"Dakra Prime Blueprint",0.2},
                {"Mag Prime Systems Blueprint",0.1667},
                {"Rhino Prime Blueprint",0.1}
            }
        },
        ["RewardSet284"]={
            ["A"]={
                {"Akbronco Prime Link",0.11},
                {"Bronco Prime Blueprint",0.2533},
                {"Bronco Prime Receiver",0.2533},
                {"Forma Blueprint",0.2533},
                {"Scindo Prime Blade",0.02},
                {"Trinity Prime Blueprint",0.11}
            }
        },
        ["RewardSet285"]={
            ["A"]={
                {"Akbronco Prime Link",0.13},
                {"Bronco Prime Blueprint",0.2333},
                {"Bronco Prime Receiver",0.2333},
                {"Forma Blueprint",0.2333},
                {"Scindo Prime Blade",0.04},
                {"Trinity Prime Blueprint",0.13}
            }
        },
        ["RewardSet286"]={
            ["A"]={
                {"Akbronco Prime Link",0.17},
                {"Bronco Prime Blueprint",0.2},
                {"Bronco Prime Receiver",0.2},
                {"Forma Blueprint",0.2},
                {"Scindo Prime Blade",0.06},
                {"Trinity Prime Blueprint",0.17}
            }
        },
        ["RewardSet287"]={
            ["A"]={
                {"Akbronco Prime Link",0.2},
                {"Bronco Prime Blueprint",0.1667},
                {"Bronco Prime Receiver",0.1667},
                {"Forma Blueprint",0.1667},
                {"Scindo Prime Blade",0.1},
                {"Trinity Prime Blueprint",0.2}
            }
        },
        ["RewardSet288"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.11},
                {"Forma Blueprint",0.11},
                {"Latron Prime Receiver",0.2533},
                {"Loki Prime Blueprint",0.2533},
                {"Sicarus Prime Receiver",0.02},
                {"Wyrm Prime Blueprint",0.2533}
            }
        },
        ["RewardSet289"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.13},
                {"Forma Blueprint",0.13},
                {"Latron Prime Receiver",0.2333},
                {"Loki Prime Blueprint",0.2333},
                {"Sicarus Prime Receiver",0.04},
                {"Wyrm Prime Blueprint",0.2333}
            }
        },
        ["RewardSet290"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.17},
                {"Forma Blueprint",0.17},
                {"Latron Prime Receiver",0.2},
                {"Loki Prime Blueprint",0.2},
                {"Sicarus Prime Receiver",0.06},
                {"Wyrm Prime Blueprint",0.2}
            }
        },
        ["RewardSet291"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Latron Prime Receiver",0.1667},
                {"Loki Prime Blueprint",0.1667},
                {"Sicarus Prime Receiver",0.1},
                {"Wyrm Prime Blueprint",0.1667}
            }
        },
        ["RewardSet292"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.11},
                {"Burston Prime Barrel",0.11},
                {"Odonata Prime Harness Blueprint",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533},
                {"Tigris Prime Blueprint",0.02},
                {"Vectis Prime Barrel",0.2533}
            }
        },
        ["RewardSet293"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.13},
                {"Burston Prime Barrel",0.13},
                {"Odonata Prime Harness Blueprint",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333},
                {"Tigris Prime Blueprint",0.04},
                {"Vectis Prime Barrel",0.2333}
            }
        },
        ["RewardSet294"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.17},
                {"Burston Prime Barrel",0.17},
                {"Odonata Prime Harness Blueprint",0.2},
                {"Saryn Prime Systems Blueprint",0.2},
                {"Tigris Prime Blueprint",0.06},
                {"Vectis Prime Barrel",0.2}
            }
        },
        ["RewardSet295"]={
            ["A"]={
                {"Akstiletto Prime Receiver",0.2},
                {"Burston Prime Barrel",0.2},
                {"Odonata Prime Harness Blueprint",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667},
                {"Tigris Prime Blueprint",0.1},
                {"Vectis Prime Barrel",0.1667}
            }
        },
        ["RewardSet296"]={
            ["A"]={
                {"Carrier Prime Systems",0.2533},
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Odonata Prime Systems Blueprint",0.2533},
                {"Vauban Prime Chassis Blueprint",0.02},
                {"Volt Prime Neuroptics Blueprint",0.11}
            }
        },
        ["RewardSet297"]={
            ["A"]={
                {"Carrier Prime Systems",0.2333},
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Odonata Prime Systems Blueprint",0.2333},
                {"Vauban Prime Chassis Blueprint",0.04},
                {"Volt Prime Neuroptics Blueprint",0.13}
            }
        },
        ["RewardSet298"]={
            ["A"]={
                {"Carrier Prime Systems",0.2},
                {"Dual Kamas Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Odonata Prime Systems Blueprint",0.2},
                {"Vauban Prime Chassis Blueprint",0.06},
                {"Volt Prime Neuroptics Blueprint",0.17}
            }
        },
        ["RewardSet299"]={
            ["A"]={
                {"Carrier Prime Systems",0.1667},
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Odonata Prime Systems Blueprint",0.1667},
                {"Vauban Prime Chassis Blueprint",0.1},
                {"Volt Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet300"]={
            ["A"]={
                {"Boar Prime Barrel",0.11},
                {"Braton Prime Receiver",0.11},
                {"Hikou Prime Pouch",0.2533},
                {"Mag Prime Neuroptics Blueprint",0.2533},
                {"Trinity Prime Systems Blueprint",0.2533},
                {"Vectis Prime Stock",0.02}
            }
        },
        ["RewardSet301"]={
            ["A"]={
                {"Boar Prime Barrel",0.13},
                {"Braton Prime Receiver",0.13},
                {"Hikou Prime Pouch",0.2333},
                {"Mag Prime Neuroptics Blueprint",0.2333},
                {"Trinity Prime Systems Blueprint",0.2333},
                {"Vectis Prime Stock",0.04}
            }
        },
        ["RewardSet302"]={
            ["A"]={
                {"Boar Prime Barrel",0.17},
                {"Braton Prime Receiver",0.17},
                {"Hikou Prime Pouch",0.2},
                {"Mag Prime Neuroptics Blueprint",0.2},
                {"Trinity Prime Systems Blueprint",0.2},
                {"Vectis Prime Stock",0.06}
            }
        },
        ["RewardSet303"]={
            ["A"]={
                {"Boar Prime Barrel",0.2},
                {"Braton Prime Receiver",0.2},
                {"Hikou Prime Pouch",0.1667},
                {"Mag Prime Neuroptics Blueprint",0.1667},
                {"Trinity Prime Systems Blueprint",0.1667},
                {"Vectis Prime Stock",0.1}
            }
        },
        ["RewardSet304"]={
            ["A"]={
                {"Braton Prime Receiver",0.11},
                {"Orthos Prime Blueprint",0.11},
                {"Trinity Prime Neuroptics Blueprint",0.2533},
                {"Trinity Prime Systems Blueprint",0.2533},
                {"Vasto Prime Barrel",0.2533},
                {"Vectis Prime Stock",0.02}
            }
        },
        ["RewardSet305"]={
            ["A"]={
                {"Braton Prime Receiver",0.13},
                {"Orthos Prime Blueprint",0.13},
                {"Trinity Prime Neuroptics Blueprint",0.2333},
                {"Trinity Prime Systems Blueprint",0.2333},
                {"Vasto Prime Barrel",0.2333},
                {"Vectis Prime Stock",0.04}
            }
        },
        ["RewardSet306"]={
            ["A"]={
                {"Braton Prime Receiver",0.17},
                {"Orthos Prime Blueprint",0.17},
                {"Trinity Prime Neuroptics Blueprint",0.2},
                {"Trinity Prime Systems Blueprint",0.2},
                {"Vasto Prime Barrel",0.2},
                {"Vectis Prime Stock",0.06}
            }
        },
        ["RewardSet307"]={
            ["A"]={
                {"Braton Prime Receiver",0.2},
                {"Orthos Prime Blueprint",0.2},
                {"Trinity Prime Neuroptics Blueprint",0.1667},
                {"Trinity Prime Systems Blueprint",0.1667},
                {"Vasto Prime Barrel",0.1667},
                {"Vectis Prime Stock",0.1}
            }
        },
        ["RewardSet308"]={
            ["A"]={
                {"Cernos Prime Blueprint",0.11},
                {"Forma Blueprint",0.11},
                {"Odonata Prime Harness Blueprint",0.2533},
                {"Paris Prime Blueprint",0.2533},
                {"Trinity Prime Systems Blueprint",0.2533},
                {"Vectis Prime Stock",0.02}
            }
        },
        ["RewardSet309"]={
            ["A"]={
                {"Cernos Prime Blueprint",0.13},
                {"Forma Blueprint",0.13},
                {"Odonata Prime Harness Blueprint",0.2333},
                {"Paris Prime Blueprint",0.2333},
                {"Trinity Prime Systems Blueprint",0.2333},
                {"Vectis Prime Stock",0.04}
            }
        },
        ["RewardSet310"]={
            ["A"]={
                {"Cernos Prime Blueprint",0.17},
                {"Forma Blueprint",0.17},
                {"Odonata Prime Harness Blueprint",0.2},
                {"Paris Prime Blueprint",0.2},
                {"Trinity Prime Systems Blueprint",0.2},
                {"Vectis Prime Stock",0.06}
            }
        },
        ["RewardSet311"]={
            ["A"]={
                {"Cernos Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Odonata Prime Harness Blueprint",0.1667},
                {"Paris Prime Blueprint",0.1667},
                {"Trinity Prime Systems Blueprint",0.1667},
                {"Vectis Prime Stock",0.1}
            }
        },
        ["RewardSet312"]={
            ["A"]={
                {"Braton Prime Receiver",0.11},
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Tigris Prime Receiver",0.11},
                {"Valkyr Prime Chassis Blueprint",0.02},
                {"Venka Prime Blades",0.2533}
            }
        },
        ["RewardSet313"]={
            ["A"]={
                {"Braton Prime Receiver",0.13},
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Tigris Prime Receiver",0.13},
                {"Valkyr Prime Chassis Blueprint",0.04},
                {"Venka Prime Blades",0.2333}
            }
        },
        ["RewardSet314"]={
            ["A"]={
                {"Braton Prime Receiver",0.17},
                {"Dual Kamas Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Tigris Prime Receiver",0.17},
                {"Valkyr Prime Chassis Blueprint",0.06},
                {"Venka Prime Blades",0.2}
            }
        },
        ["RewardSet315"]={
            ["A"]={
                {"Braton Prime Receiver",0.2},
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Tigris Prime Receiver",0.2},
                {"Valkyr Prime Chassis Blueprint",0.1},
                {"Venka Prime Blades",0.1667}
            }
        },
        ["RewardSet316"]={
            ["A"]={
                {"Ballistica Prime Lower Limb",0.2533},
                {"Braton Prime Blueprint",0.2533},
                {"Fang Prime Handle",0.11},
                {"Forma Blueprint",0.2533},
                {"Galatine Prime Handle",0.11},
                {"Valkyr Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet317"]={
            ["A"]={
                {"Ballistica Prime Lower Limb",0.2333},
                {"Braton Prime Blueprint",0.2333},
                {"Fang Prime Handle",0.13},
                {"Forma Blueprint",0.2333},
                {"Galatine Prime Handle",0.13},
                {"Valkyr Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet318"]={
            ["A"]={
                {"Ballistica Prime Lower Limb",0.2},
                {"Braton Prime Blueprint",0.2},
                {"Fang Prime Handle",0.17},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Handle",0.17},
                {"Valkyr Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet319"]={
            ["A"]={
                {"Ballistica Prime Lower Limb",0.1667},
                {"Braton Prime Blueprint",0.1667},
                {"Fang Prime Handle",0.2},
                {"Forma Blueprint",0.1667},
                {"Galatine Prime Handle",0.2},
                {"Valkyr Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet320"]={
            ["A"]={
                {"Kogake Prime Blueprint",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Nami Skyla Prime Blueprint",0.2533},
                {"None",0.11},
                {"Valkyr Prime Blueprint",0.2533},
                {"Venka Prime Gauntlet",0.02}
            }
        },
        ["RewardSet321"]={
            ["A"]={
                {"Kogake Prime Blueprint",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Nami Skyla Prime Blueprint",0.2333},
                {"None",0.13},
                {"Valkyr Prime Blueprint",0.2333},
                {"Venka Prime Gauntlet",0.04}
            }
        },
        ["RewardSet322"]={
            ["A"]={
                {"Kogake Prime Blueprint",0.17},
                {"Lex Prime Barrel",0.2},
                {"Nami Skyla Prime Blueprint",0.2},
                {"None",0.17},
                {"Valkyr Prime Blueprint",0.2},
                {"Venka Prime Gauntlet",0.06}
            }
        },
        ["RewardSet323"]={
            ["A"]={
                {"Kogake Prime Blueprint",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Nami Skyla Prime Blueprint",0.1667},
                {"None",0.2},
                {"Valkyr Prime Blueprint",0.1667},
                {"Venka Prime Gauntlet",0.1}
            }
        },
        ["RewardSet324"]={
            ["A"]={
                {"Forma Blueprint",0.2533},
                {"Lex Prime Receiver",0.2533},
                {"Odonata Prime Blueprint",0.11},
                {"Odonata Prime Systems Blueprint",0.2533},
                {"Volt Prime Chassis Blueprint",0.11},
                {"Volt Prime Neuroptics Blueprint",0.02}
            }
        },
        ["RewardSet325"]={
            ["A"]={
                {"Forma Blueprint",0.2333},
                {"Lex Prime Receiver",0.2333},
                {"Odonata Prime Blueprint",0.13},
                {"Odonata Prime Systems Blueprint",0.2333},
                {"Volt Prime Chassis Blueprint",0.13},
                {"Volt Prime Neuroptics Blueprint",0.04}
            }
        },
        ["RewardSet326"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Lex Prime Receiver",0.2},
                {"Odonata Prime Blueprint",0.17},
                {"Odonata Prime Systems Blueprint",0.2},
                {"Volt Prime Chassis Blueprint",0.17},
                {"Volt Prime Neuroptics Blueprint",0.06}
            }
        },
        ["RewardSet327"]={
            ["A"]={
                {"Forma Blueprint",0.1667},
                {"Lex Prime Receiver",0.1667},
                {"Odonata Prime Blueprint",0.2},
                {"Odonata Prime Systems Blueprint",0.1667},
                {"Volt Prime Chassis Blueprint",0.2},
                {"Volt Prime Neuroptics Blueprint",0.1}
            }
        },
        ["RewardSet328"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.02},
                {"Braton Prime Barrel",0.2533},
                {"Forma Blueprint",0.2533},
                {"Saryn Prime Neuroptics Blueprint",0.11},
                {"Vasto Prime Receiver",0.2533},
                {"Vectis Prime Blueprint",0.11}
            }
        },
        ["RewardSet329"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.04},
                {"Braton Prime Barrel",0.2333},
                {"Forma Blueprint",0.2333},
                {"Saryn Prime Neuroptics Blueprint",0.13},
                {"Vasto Prime Receiver",0.2333},
                {"Vectis Prime Blueprint",0.13}
            }
        },
        ["RewardSet330"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.06},
                {"Braton Prime Barrel",0.2},
                {"Forma Blueprint",0.2},
                {"Saryn Prime Neuroptics Blueprint",0.17},
                {"Vasto Prime Receiver",0.2},
                {"Vectis Prime Blueprint",0.17}
            }
        },
        ["RewardSet331"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.1},
                {"Braton Prime Barrel",0.1667},
                {"Forma Blueprint",0.1667},
                {"Saryn Prime Neuroptics Blueprint",0.2},
                {"Vasto Prime Receiver",0.1667},
                {"Vectis Prime Blueprint",0.2}
            }
        },
        ["RewardSet332"]={
            ["A"]={
                {"Akbronco Prime Link",0.11},
                {"Akstiletto Prime Blueprint",0.02},
                {"Cernos Prime Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Barrel",0.2533},
                {"Valkyr Prime Blueprint",0.2533}
            }
        },
        ["RewardSet333"]={
            ["A"]={
                {"Akbronco Prime Link",0.13},
                {"Akstiletto Prime Blueprint",0.04},
                {"Cernos Prime Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Barrel",0.2333},
                {"Valkyr Prime Blueprint",0.2333}
            }
        },
        ["RewardSet334"]={
            ["A"]={
                {"Akbronco Prime Link",0.17},
                {"Akstiletto Prime Blueprint",0.06},
                {"Cernos Prime Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.2},
                {"Valkyr Prime Blueprint",0.2}
            }
        },
        ["RewardSet335"]={
            ["A"]={
                {"Akbronco Prime Link",0.2},
                {"Akstiletto Prime Blueprint",0.1},
                {"Cernos Prime Blueprint",0.2},
                {"Forma Blueprint",0.1667},
                {"Lex Prime Barrel",0.1667},
                {"Valkyr Prime Blueprint",0.1667}
            }
        },
        ["RewardSet336"]={
            ["A"]={
                {"Ankyros Prime Blueprint",0.2533},
                {"Boar Prime Stock",0.02},
                {"Boltor Prime Receiver",0.11},
                {"Forma Blueprint",0.2533},
                {"Mag Prime Neuroptics Blueprint",0.2533},
                {"Rhino Prime Neuroptics Blueprint",0.11}
            }
        },
        ["RewardSet337"]={
            ["A"]={
                {"Ankyros Prime Blueprint",0.2333},
                {"Boar Prime Stock",0.04},
                {"Boltor Prime Receiver",0.13},
                {"Forma Blueprint",0.2333},
                {"Mag Prime Neuroptics Blueprint",0.2333},
                {"Rhino Prime Neuroptics Blueprint",0.13}
            }
        },
        ["RewardSet338"]={
            ["A"]={
                {"Ankyros Prime Blueprint",0.2},
                {"Boar Prime Stock",0.06},
                {"Boltor Prime Receiver",0.17},
                {"Forma Blueprint",0.2},
                {"Mag Prime Neuroptics Blueprint",0.2},
                {"Rhino Prime Neuroptics Blueprint",0.17}
            }
        },
        ["RewardSet339"]={
            ["A"]={
                {"Ankyros Prime Blueprint",0.1667},
                {"Boar Prime Stock",0.1},
                {"Boltor Prime Receiver",0.2},
                {"Forma Blueprint",0.1667},
                {"Mag Prime Neuroptics Blueprint",0.1667},
                {"Rhino Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet340"]={
            ["A"]={
                {"Ballistica Prime Blueprint",0.02},
                {"Braton Prime Receiver",0.11},
                {"Forma Blueprint",0.2533},
                {"Orthos Prime Blade",0.11},
                {"Paris Prime Lower Limb",0.2533},
                {"Tigris Prime Stock",0.2533}
            }
        },
        ["RewardSet341"]={
            ["A"]={
                {"Ballistica Prime Blueprint",0.04},
                {"Braton Prime Receiver",0.13},
                {"Forma Blueprint",0.2333},
                {"Orthos Prime Blade",0.13},
                {"Paris Prime Lower Limb",0.2333},
                {"Tigris Prime Stock",0.2333}
            }
        },
        ["RewardSet342"]={
            ["A"]={
                {"Ballistica Prime Blueprint",0.06},
                {"Braton Prime Receiver",0.17},
                {"Forma Blueprint",0.2},
                {"Orthos Prime Blade",0.17},
                {"Paris Prime Lower Limb",0.2},
                {"Tigris Prime Stock",0.2}
            }
        },
        ["RewardSet343"]={
            ["A"]={
                {"Ballistica Prime Blueprint",0.1},
                {"Braton Prime Receiver",0.2},
                {"Forma Blueprint",0.1667},
                {"Orthos Prime Blade",0.2},
                {"Paris Prime Lower Limb",0.1667},
                {"Tigris Prime Stock",0.1667}
            }
        },
        ["RewardSet344"]={
            ["A"]={
                {"Carrier Prime Cerebrum",0.02},
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.11},
                {"Kavasa Prime Band",0.11},
                {"Nova Prime Neuroptics Blueprint",0.2533},
                {"Nova Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet345"]={
            ["A"]={
                {"Carrier Prime Cerebrum",0.04},
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.13},
                {"Kavasa Prime Band",0.13},
                {"Nova Prime Neuroptics Blueprint",0.2333},
                {"Nova Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet346"]={
            ["A"]={
                {"Carrier Prime Cerebrum",0.06},
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.17},
                {"Kavasa Prime Band",0.17},
                {"Nova Prime Neuroptics Blueprint",0.2},
                {"Nova Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet347"]={
            ["A"]={
                {"Carrier Prime Cerebrum",0.1},
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Band",0.2},
                {"Nova Prime Neuroptics Blueprint",0.1667},
                {"Nova Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet348"]={
            ["A"]={
                {"Akbolto Prime Barrel",0.11},
                {"Bronco Prime Receiver",0.2533},
                {"Cernos Prime Lower Limb",0.02},
                {"Nami Skyla Prime Handle",0.11},
                {"Paris Prime Upper Limb",0.2533},
                {"Venka Prime Blades",0.2533}
            }
        },
        ["RewardSet349"]={
            ["A"]={
                {"Akbolto Prime Barrel",0.13},
                {"Bronco Prime Receiver",0.2333},
                {"Cernos Prime Lower Limb",0.04},
                {"Nami Skyla Prime Handle",0.13},
                {"Paris Prime Upper Limb",0.2333},
                {"Venka Prime Blades",0.2333}
            }
        },
        ["RewardSet350"]={
            ["A"]={
                {"Akbolto Prime Barrel",0.17},
                {"Bronco Prime Receiver",0.2},
                {"Cernos Prime Lower Limb",0.06},
                {"Nami Skyla Prime Handle",0.17},
                {"Paris Prime Upper Limb",0.2},
                {"Venka Prime Blades",0.2}
            }
        },
        ["RewardSet351"]={
            ["A"]={
                {"Akbolto Prime Barrel",0.2},
                {"Bronco Prime Receiver",0.1667},
                {"Cernos Prime Lower Limb",0.1},
                {"Nami Skyla Prime Handle",0.2},
                {"Paris Prime Upper Limb",0.1667},
                {"Venka Prime Blades",0.1667}
            }
        },
        ["RewardSet352"]={
            ["A"]={
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Blueprint",0.02},
                {"Odonata Prime Blueprint",0.11},
                {"Paris Prime Blueprint",0.2533},
                {"Scindo Prime Blueprint",0.11}
            }
        },
        ["RewardSet353"]={
            ["A"]={
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Blueprint",0.04},
                {"Odonata Prime Blueprint",0.13},
                {"Paris Prime Blueprint",0.2333},
                {"Scindo Prime Blueprint",0.13}
            }
        },
        ["RewardSet354"]={
            ["A"]={
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Blueprint",0.06},
                {"Odonata Prime Blueprint",0.17},
                {"Paris Prime Blueprint",0.2},
                {"Scindo Prime Blueprint",0.17}
            }
        },
        ["RewardSet355"]={
            ["A"]={
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Blueprint",0.1},
                {"Odonata Prime Blueprint",0.2},
                {"Paris Prime Blueprint",0.1667},
                {"Scindo Prime Blueprint",0.2}
            }
        },
        ["RewardSet356"]={
            ["A"]={
                {"Burston Prime Barrel",0.11},
                {"Fang Prime Handle",0.11},
                {"Hikou Prime Stars",0.2533},
                {"Odonata Prime Systems Blueprint",0.2533},
                {"Paris Prime Upper Limb",0.2533},
                {"Vauban Prime Blueprint",0.02}
            }
        },
        ["RewardSet357"]={
            ["A"]={
                {"Burston Prime Barrel",0.13},
                {"Fang Prime Handle",0.13},
                {"Hikou Prime Stars",0.2333},
                {"Odonata Prime Systems Blueprint",0.2333},
                {"Paris Prime Upper Limb",0.2333},
                {"Vauban Prime Blueprint",0.04}
            }
        },
        ["RewardSet358"]={
            ["A"]={
                {"Burston Prime Barrel",0.17},
                {"Fang Prime Handle",0.17},
                {"Hikou Prime Stars",0.2},
                {"Odonata Prime Systems Blueprint",0.2},
                {"Paris Prime Upper Limb",0.2},
                {"Vauban Prime Blueprint",0.06}
            }
        },
        ["RewardSet359"]={
            ["A"]={
                {"Burston Prime Barrel",0.2},
                {"Fang Prime Handle",0.2},
                {"Hikou Prime Stars",0.1667},
                {"Odonata Prime Systems Blueprint",0.1667},
                {"Paris Prime Upper Limb",0.1667},
                {"Vauban Prime Blueprint",0.1}
            }
        },
        ["RewardSet360"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.11},
                {"Forma Blueprint",0.11},
                {"Frost Prime Chassis Blueprint",0.2533},
                {"Glaive Prime Blueprint",0.02},
                {"Latron Prime Blueprint",0.2533},
                {"Reaper Prime Handle",0.2533}
            }
        },
        ["RewardSet361"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.13},
                {"Forma Blueprint",0.13},
                {"Frost Prime Chassis Blueprint",0.2333},
                {"Glaive Prime Blueprint",0.04},
                {"Latron Prime Blueprint",0.2333},
                {"Reaper Prime Handle",0.2333}
            }
        },
        ["RewardSet362"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.17},
                {"Forma Blueprint",0.17},
                {"Frost Prime Chassis Blueprint",0.2},
                {"Glaive Prime Blueprint",0.06},
                {"Latron Prime Blueprint",0.2},
                {"Reaper Prime Handle",0.2}
            }
        },
        ["RewardSet363"]={
            ["A"]={
                {"Ember Prime Systems Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Frost Prime Chassis Blueprint",0.1667},
                {"Glaive Prime Blueprint",0.1},
                {"Latron Prime Blueprint",0.1667},
                {"Reaper Prime Handle",0.1667}
            }
        },
        ["RewardSet364"]={
            ["A"]={
                {"Bo Prime Blueprint",0.2533},
                {"Frost Prime Systems Blueprint",0.11},
                {"Glaive Prime Blueprint",0.02},
                {"Latron Prime Stock",0.2533},
                {"Loki Prime Chassis Blueprint",0.11},
                {"Wyrm Prime Cerebrum",0.2533}
            }
        },
        ["RewardSet365"]={
            ["A"]={
                {"Bo Prime Blueprint",0.2333},
                {"Frost Prime Systems Blueprint",0.13},
                {"Glaive Prime Blueprint",0.04},
                {"Latron Prime Stock",0.2333},
                {"Loki Prime Chassis Blueprint",0.13},
                {"Wyrm Prime Cerebrum",0.2333}
            }
        },
        ["RewardSet366"]={
            ["A"]={
                {"Bo Prime Blueprint",0.2},
                {"Frost Prime Systems Blueprint",0.17},
                {"Glaive Prime Blueprint",0.06},
                {"Latron Prime Stock",0.2},
                {"Loki Prime Chassis Blueprint",0.17},
                {"Wyrm Prime Cerebrum",0.2}
            }
        },
        ["RewardSet367"]={
            ["A"]={
                {"Bo Prime Blueprint",0.1667},
                {"Frost Prime Systems Blueprint",0.2},
                {"Glaive Prime Blueprint",0.1},
                {"Latron Prime Stock",0.1667},
                {"Loki Prime Chassis Blueprint",0.2},
                {"Wyrm Prime Cerebrum",0.1667}
            }
        },
        ["RewardSet368"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.11},
                {"Bronco Prime Blueprint",0.2533},
                {"Helios Prime Cerebrum",0.02},
                {"Nami Skyla Prime Handle",0.11},
                {"Paris Prime Blueprint",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet369"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.13},
                {"Bronco Prime Blueprint",0.2333},
                {"Helios Prime Cerebrum",0.04},
                {"Nami Skyla Prime Handle",0.13},
                {"Paris Prime Blueprint",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet370"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.17},
                {"Bronco Prime Blueprint",0.2},
                {"Helios Prime Cerebrum",0.06},
                {"Nami Skyla Prime Handle",0.17},
                {"Paris Prime Blueprint",0.2},
                {"Saryn Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet371"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.2},
                {"Bronco Prime Blueprint",0.1667},
                {"Helios Prime Cerebrum",0.1},
                {"Nami Skyla Prime Handle",0.2},
                {"Paris Prime Blueprint",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet372"]={
            ["A"]={
                {"Forma Blueprint",0.2533},
                {"Helios Prime Cerebrum",0.02},
                {"Lex Prime Barrel",0.2533},
                {"Oberon Prime Blueprint",0.11},
                {"Orthos Prime Blueprint",0.11},
                {"Zephyr Prime Neuroptics Blueprint",0.2533}
            }
        },
        ["RewardSet373"]={
            ["A"]={
                {"Forma Blueprint",0.2333},
                {"Helios Prime Cerebrum",0.04},
                {"Lex Prime Barrel",0.2333},
                {"Oberon Prime Blueprint",0.13},
                {"Orthos Prime Blueprint",0.13},
                {"Zephyr Prime Neuroptics Blueprint",0.2333}
            }
        },
        ["RewardSet374"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Helios Prime Cerebrum",0.06},
                {"Lex Prime Barrel",0.2},
                {"Oberon Prime Blueprint",0.17},
                {"Orthos Prime Blueprint",0.17},
                {"Zephyr Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet375"]={
            ["A"]={
                {"Forma Blueprint",0.1667},
                {"Helios Prime Cerebrum",0.1},
                {"Lex Prime Barrel",0.1667},
                {"Oberon Prime Blueprint",0.2},
                {"Orthos Prime Blueprint",0.2},
                {"Zephyr Prime Neuroptics Blueprint",0.1667}
            }
        },
        ["RewardSet376"]={
            ["A"]={
                {"Burston Prime Stock",0.2533},
                {"Fang Prime Blueprint",0.2533},
                {"Kavasa Prime Buckle",0.02},
                {"Odonata Prime Harness Blueprint",0.2533},
                {"Tigris Prime Barrel",0.11},
                {"Trinity Prime Blueprint",0.11}
            }
        },
        ["RewardSet377"]={
            ["A"]={
                {"Burston Prime Stock",0.2333},
                {"Fang Prime Blueprint",0.2333},
                {"Kavasa Prime Buckle",0.04},
                {"Odonata Prime Harness Blueprint",0.2333},
                {"Tigris Prime Barrel",0.13},
                {"Trinity Prime Blueprint",0.13}
            }
        },
        ["RewardSet378"]={
            ["A"]={
                {"Burston Prime Stock",0.2},
                {"Fang Prime Blueprint",0.2},
                {"Kavasa Prime Buckle",0.06},
                {"Odonata Prime Harness Blueprint",0.2},
                {"Tigris Prime Barrel",0.17},
                {"Trinity Prime Blueprint",0.17}
            }
        },
        ["RewardSet379"]={
            ["A"]={
                {"Burston Prime Stock",0.1667},
                {"Fang Prime Blueprint",0.1667},
                {"Kavasa Prime Buckle",0.1},
                {"Odonata Prime Harness Blueprint",0.1667},
                {"Tigris Prime Barrel",0.2},
                {"Trinity Prime Blueprint",0.2}
            }
        },
        ["RewardSet380"]={
            ["A"]={
                {"Boar Prime Receiver",0.2533},
                {"Dakra Prime Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Receiver",0.2533},
                {"Mag Prime Blueprint",0.02},
                {"Soma Prime Blueprint",0.11}
            }
        },
        ["RewardSet381"]={
            ["A"]={
                {"Boar Prime Receiver",0.2333},
                {"Dakra Prime Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Receiver",0.2333},
                {"Mag Prime Blueprint",0.04},
                {"Soma Prime Blueprint",0.13}
            }
        },
        ["RewardSet382"]={
            ["A"]={
                {"Boar Prime Receiver",0.2},
                {"Dakra Prime Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Lex Prime Receiver",0.2},
                {"Mag Prime Blueprint",0.06},
                {"Soma Prime Blueprint",0.17}
            }
        },
        ["RewardSet383"]={
            ["A"]={
                {"Boar Prime Receiver",0.1667},
                {"Dakra Prime Blueprint",0.2},
                {"Forma Blueprint",0.1667},
                {"Lex Prime Receiver",0.1667},
                {"Mag Prime Blueprint",0.1},
                {"Soma Prime Blueprint",0.2}
            }
        },
        ["RewardSet384"]={
            ["A"]={
                {"Akbronco Prime Link",0.11},
                {"Bronco Prime Blueprint",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Nova Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet385"]={
            ["A"]={
                {"Akbronco Prime Link",0.13},
                {"Bronco Prime Blueprint",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Nova Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet386"]={
            ["A"]={
                {"Akbronco Prime Link",0.17},
                {"Bronco Prime Blueprint",0.2},
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Nova Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet387"]={
            ["A"]={
                {"Akbronco Prime Link",0.2},
                {"Bronco Prime Blueprint",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Nova Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet388"]={
            ["A"]={
                {"Carrier Prime Systems",0.2533},
                {"Helios Prime Blueprint",0.11},
                {"Kavasa Prime Band",0.11},
                {"Nekros Prime Systems Blueprint",0.02},
                {"Paris Prime Upper Limb",0.2533},
                {"Spira Prime Blueprint",0.2533}
            }
        },
        ["RewardSet389"]={
            ["A"]={
                {"Carrier Prime Systems",0.2333},
                {"Helios Prime Blueprint",0.13},
                {"Kavasa Prime Band",0.13},
                {"Nekros Prime Systems Blueprint",0.04},
                {"Paris Prime Upper Limb",0.2333},
                {"Spira Prime Blueprint",0.2333}
            }
        },
        ["RewardSet390"]={
            ["A"]={
                {"Carrier Prime Systems",0.2},
                {"Helios Prime Blueprint",0.17},
                {"Kavasa Prime Band",0.17},
                {"Nekros Prime Systems Blueprint",0.06},
                {"Paris Prime Upper Limb",0.2},
                {"Spira Prime Blueprint",0.2}
            }
        },
        ["RewardSet391"]={
            ["A"]={
                {"Carrier Prime Systems",0.1667},
                {"Helios Prime Blueprint",0.2},
                {"Kavasa Prime Band",0.2},
                {"Nekros Prime Systems Blueprint",0.1},
                {"Paris Prime Upper Limb",0.1667},
                {"Spira Prime Blueprint",0.1667}
            }
        },
        ["RewardSet392"]={
            ["A"]={
                {"Braton Prime Blueprint",0.11},
                {"Burston Prime Receiver",0.2533},
                {"Forma Blueprint",0.11},
                {"Nekros Prime Blueprint",0.02},
                {"Sybaris Prime Stock",0.2533},
                {"Valkyr Prime Blueprint",0.2533}
            }
        },
        ["RewardSet393"]={
            ["A"]={
                {"Braton Prime Blueprint",0.13},
                {"Burston Prime Receiver",0.2333},
                {"Forma Blueprint",0.13},
                {"Nekros Prime Blueprint",0.04},
                {"Sybaris Prime Stock",0.2333},
                {"Valkyr Prime Blueprint",0.2333}
            }
        },
        ["RewardSet394"]={
            ["A"]={
                {"Braton Prime Blueprint",0.17},
                {"Burston Prime Receiver",0.2},
                {"Forma Blueprint",0.17},
                {"Nekros Prime Blueprint",0.06},
                {"Sybaris Prime Stock",0.2},
                {"Valkyr Prime Blueprint",0.2}
            }
        },
        ["RewardSet395"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2},
                {"Burston Prime Receiver",0.1667},
                {"Forma Blueprint",0.2},
                {"Nekros Prime Blueprint",0.1},
                {"Sybaris Prime Stock",0.1667},
                {"Valkyr Prime Blueprint",0.1667}
            }
        },
        ["RewardSet396"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Hikou Prime Blueprint",0.2533},
                {"Paris Prime Grip",0.11},
                {"Paris Prime String",0.2533},
                {"Spira Prime Pouch",0.02}
            }
        },
        ["RewardSet397"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Hikou Prime Blueprint",0.2333},
                {"Paris Prime Grip",0.13},
                {"Paris Prime String",0.2333},
                {"Spira Prime Pouch",0.04}
            }
        },
        ["RewardSet398"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Hikou Prime Blueprint",0.2},
                {"Paris Prime Grip",0.17},
                {"Paris Prime String",0.2},
                {"Spira Prime Pouch",0.06}
            }
        },
        ["RewardSet399"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Hikou Prime Blueprint",0.1667},
                {"Paris Prime Grip",0.2},
                {"Paris Prime String",0.1667},
                {"Spira Prime Pouch",0.1}
            }
        },
        ["RewardSet400"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Carrier Prime Systems",0.2533},
                {"Forma Blueprint",0.11},
                {"Kavasa Prime Band",0.11},
                {"Nyx Prime Blueprint",0.2533},
                {"Soma Prime Stock",0.02}
            }
        },
        ["RewardSet401"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Carrier Prime Systems",0.2333},
                {"Forma Blueprint",0.13},
                {"Kavasa Prime Band",0.13},
                {"Nyx Prime Blueprint",0.2333},
                {"Soma Prime Stock",0.04}
            }
        },
        ["RewardSet402"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Carrier Prime Systems",0.2},
                {"Forma Blueprint",0.17},
                {"Kavasa Prime Band",0.17},
                {"Nyx Prime Blueprint",0.2},
                {"Soma Prime Stock",0.06}
            }
        },
        ["RewardSet403"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Carrier Prime Systems",0.1667},
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Band",0.2},
                {"Nyx Prime Blueprint",0.1667},
                {"Soma Prime Stock",0.1}
            }
        },
        ["RewardSet404"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Ash Prime Blueprint",0.11},
                {"Carrier Prime Systems",0.2533},
                {"Paris Prime String",0.2533},
                {"Soma Prime Receiver",0.11},
                {"Spira Prime Pouch",0.02}
            }
        },
        ["RewardSet405"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Ash Prime Blueprint",0.13},
                {"Carrier Prime Systems",0.2333},
                {"Paris Prime String",0.2333},
                {"Soma Prime Receiver",0.13},
                {"Spira Prime Pouch",0.04}
            }
        },
        ["RewardSet406"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Ash Prime Blueprint",0.17},
                {"Carrier Prime Systems",0.2},
                {"Paris Prime String",0.2},
                {"Soma Prime Receiver",0.17},
                {"Spira Prime Pouch",0.06}
            }
        },
        ["RewardSet407"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Ash Prime Blueprint",0.2},
                {"Carrier Prime Systems",0.1667},
                {"Paris Prime String",0.1667},
                {"Soma Prime Receiver",0.2},
                {"Spira Prime Pouch",0.1}
            }
        },
        ["RewardSet408"]={
            ["A"]={
                {"Forma Blueprint",0.2533},
                {"Kavasa Prime Kubrow Collar Blueprint",0.11},
                {"Lex Prime Blueprint",0.2533},
                {"Paris Prime Blueprint",0.2533},
                {"Saryn Prime Blueprint",0.02},
                {"Trinity Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet409"]={
            ["A"]={
                {"Forma Blueprint",0.2333},
                {"Kavasa Prime Kubrow Collar Blueprint",0.13},
                {"Lex Prime Blueprint",0.2333},
                {"Paris Prime Blueprint",0.2333},
                {"Saryn Prime Blueprint",0.04},
                {"Trinity Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet410"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Kubrow Collar Blueprint",0.17},
                {"Lex Prime Blueprint",0.2},
                {"Paris Prime Blueprint",0.2},
                {"Saryn Prime Blueprint",0.06},
                {"Trinity Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet411"]={
            ["A"]={
                {"Forma Blueprint",0.1667},
                {"Kavasa Prime Kubrow Collar Blueprint",0.2},
                {"Lex Prime Blueprint",0.1667},
                {"Paris Prime Blueprint",0.1667},
                {"Saryn Prime Blueprint",0.1},
                {"Trinity Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet412"]={
            ["A"]={
                {"Akbronco Prime Link",0.11},
                {"Burston Prime Receiver",0.2533},
                {"Carrier Prime Carapace",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Galatine Prime Handle",0.11},
                {"Spira Prime Blade",0.02}
            }
        },
        ["RewardSet413"]={
            ["A"]={
                {"Akbronco Prime Link",0.13},
                {"Burston Prime Receiver",0.2333},
                {"Carrier Prime Carapace",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Galatine Prime Handle",0.13},
                {"Spira Prime Blade",0.04}
            }
        },
        ["RewardSet414"]={
            ["A"]={
                {"Akbronco Prime Link",0.17},
                {"Burston Prime Receiver",0.2},
                {"Carrier Prime Carapace",0.2},
                {"Fang Prime Blade",0.2},
                {"Galatine Prime Handle",0.17},
                {"Spira Prime Blade",0.06}
            }
        },
        ["RewardSet415"]={
            ["A"]={
                {"Akbronco Prime Link",0.2},
                {"Burston Prime Receiver",0.1667},
                {"Carrier Prime Carapace",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Galatine Prime Handle",0.2},
                {"Spira Prime Blade",0.1}
            }
        },
        ["RewardSet416"]={
            ["A"]={
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Forma Blueprint",0.2533},
                {"Kavasa Prime Band",0.11},
                {"Spira Prime Pouch",0.02},
                {"Valkyr Prime Neuroptics Blueprint",0.11}
            }
        },
        ["RewardSet417"]={
            ["A"]={
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Forma Blueprint",0.2333},
                {"Kavasa Prime Band",0.13},
                {"Spira Prime Pouch",0.04},
                {"Valkyr Prime Neuroptics Blueprint",0.13}
            }
        },
        ["RewardSet418"]={
            ["A"]={
                {"Dual Kamas Prime Blueprint",0.2},
                {"Fang Prime Blade",0.2},
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Band",0.17},
                {"Spira Prime Pouch",0.06},
                {"Valkyr Prime Neuroptics Blueprint",0.17}
            }
        },
        ["RewardSet419"]={
            ["A"]={
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Forma Blueprint",0.1667},
                {"Kavasa Prime Band",0.2},
                {"Spira Prime Pouch",0.1},
                {"Valkyr Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet420"]={
            ["A"]={
                {"Akbolto Prime Link",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Lex Prime Blueprint",0.2533},
                {"Mirage Prime Chassis Blueprint",0.2533},
                {"Paris Prime Grip",0.11},
                {"Sybaris Prime Barrel",0.02}
            }
        },
        ["RewardSet421"]={
            ["A"]={
                {"Akbolto Prime Link",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Lex Prime Blueprint",0.2333},
                {"Mirage Prime Chassis Blueprint",0.2333},
                {"Paris Prime Grip",0.13},
                {"Sybaris Prime Barrel",0.04}
            }
        },
        ["RewardSet422"]={
            ["A"]={
                {"Akbolto Prime Link",0.17},
                {"Galatine Prime Blade",0.2},
                {"Lex Prime Blueprint",0.2},
                {"Mirage Prime Chassis Blueprint",0.2},
                {"Paris Prime Grip",0.17},
                {"Sybaris Prime Barrel",0.06}
            }
        },
        ["RewardSet423"]={
            ["A"]={
                {"Akbolto Prime Link",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Lex Prime Blueprint",0.1667},
                {"Mirage Prime Chassis Blueprint",0.1667},
                {"Paris Prime Grip",0.2},
                {"Sybaris Prime Barrel",0.1}
            }
        },
        ["RewardSet424"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Ballistica Prime Upper Limb",0.11},
                {"Burston Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Tigris Prime Blueprint",0.02},
                {"Valkyr Prime Neuroptics Blueprint",0.11}
            }
        },
        ["RewardSet425"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Ballistica Prime Upper Limb",0.13},
                {"Burston Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Tigris Prime Blueprint",0.04},
                {"Valkyr Prime Neuroptics Blueprint",0.13}
            }
        },
        ["RewardSet426"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Ballistica Prime Upper Limb",0.17},
                {"Burston Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Tigris Prime Blueprint",0.06},
                {"Valkyr Prime Neuroptics Blueprint",0.17}
            }
        },
        ["RewardSet427"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Ballistica Prime Upper Limb",0.2},
                {"Burston Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Tigris Prime Blueprint",0.1},
                {"Valkyr Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet428"]={
            ["A"]={
                {"Burston Prime Stock",0.2533},
                {"Forma Blueprint",0.11},
                {"Fragor Prime Handle",0.02},
                {"Paris Prime Lower Limb",0.2533},
                {"Paris Prime Upper Limb",0.2533},
                {"Volt Prime Systems Blueprint",0.11}
            }
        },
        ["RewardSet429"]={
            ["A"]={
                {"Burston Prime Stock",0.2333},
                {"Forma Blueprint",0.13},
                {"Fragor Prime Handle",0.04},
                {"Paris Prime Lower Limb",0.2333},
                {"Paris Prime Upper Limb",0.2333},
                {"Volt Prime Systems Blueprint",0.13}
            }
        },
        ["RewardSet430"]={
            ["A"]={
                {"Burston Prime Stock",0.2},
                {"Forma Blueprint",0.17},
                {"Fragor Prime Handle",0.06},
                {"Paris Prime Lower Limb",0.2},
                {"Paris Prime Upper Limb",0.2},
                {"Volt Prime Systems Blueprint",0.17}
            }
        },
        ["RewardSet431"]={
            ["A"]={
                {"Burston Prime Stock",0.1667},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Handle",0.1},
                {"Paris Prime Lower Limb",0.1667},
                {"Paris Prime Upper Limb",0.1667},
                {"Volt Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet432"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Paris Prime Lower Limb",0.2533},
                {"Paris Prime Upper Limb",0.11},
                {"Vauban Prime Systems Blueprint",0.02}
            }
        },
        ["RewardSet433"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Paris Prime Lower Limb",0.2333},
                {"Paris Prime Upper Limb",0.13},
                {"Vauban Prime Systems Blueprint",0.04}
            }
        },
        ["RewardSet434"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Lex Prime Barrel",0.2},
                {"Paris Prime Lower Limb",0.2},
                {"Paris Prime Upper Limb",0.17},
                {"Vauban Prime Systems Blueprint",0.06}
            }
        },
        ["RewardSet435"]={
            ["A"]={
                {"Fang Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Paris Prime Lower Limb",0.1667},
                {"Paris Prime Upper Limb",0.2},
                {"Vauban Prime Systems Blueprint",0.1}
            }
        },
        ["RewardSet436"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2533},
                {"Cernos Prime Upper Limb",0.2533},
                {"Helios Prime Systems",0.11},
                {"Paris Prime Lower Limb",0.2533},
                {"Tigris Prime Barrel",0.11},
                {"Valkyr Prime Systems Blueprint",0.02}
            }
        },
        ["RewardSet437"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2333},
                {"Cernos Prime Upper Limb",0.2333},
                {"Helios Prime Systems",0.13},
                {"Paris Prime Lower Limb",0.2333},
                {"Tigris Prime Barrel",0.13},
                {"Valkyr Prime Systems Blueprint",0.04}
            }
        },
        ["RewardSet438"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2},
                {"Cernos Prime Upper Limb",0.2},
                {"Helios Prime Systems",0.17},
                {"Paris Prime Lower Limb",0.2},
                {"Tigris Prime Barrel",0.17},
                {"Valkyr Prime Systems Blueprint",0.06}
            }
        },
        ["RewardSet439"]={
            ["A"]={
                {"Braton Prime Blueprint",0.1667},
                {"Cernos Prime Upper Limb",0.1667},
                {"Helios Prime Systems",0.2},
                {"Paris Prime Lower Limb",0.1667},
                {"Tigris Prime Barrel",0.2},
                {"Valkyr Prime Systems Blueprint",0.1}
            }
        },
        ["RewardSet440"]={
            ["A"]={
                {"Helios Prime Blueprint",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Spira Prime Blueprint",0.2533},
                {"Tigris Prime Barrel",0.11},
                {"Vauban Prime Chassis Blueprint",0.02},
                {"Venka Prime Blades",0.2533}
            }
        },
        ["RewardSet441"]={
            ["A"]={
                {"Helios Prime Blueprint",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Spira Prime Blueprint",0.2333},
                {"Tigris Prime Barrel",0.13},
                {"Vauban Prime Chassis Blueprint",0.04},
                {"Venka Prime Blades",0.2333}
            }
        },
        ["RewardSet442"]={
            ["A"]={
                {"Helios Prime Blueprint",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Spira Prime Blueprint",0.2},
                {"Tigris Prime Barrel",0.17},
                {"Vauban Prime Chassis Blueprint",0.06},
                {"Venka Prime Blades",0.2}
            }
        },
        ["RewardSet443"]={
            ["A"]={
                {"Helios Prime Blueprint",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Spira Prime Blueprint",0.1667},
                {"Tigris Prime Barrel",0.2},
                {"Vauban Prime Chassis Blueprint",0.1},
                {"Venka Prime Blades",0.1667}
            }
        },
        ["RewardSet444"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Cernos Prime Blueprint",0.11},
                {"Fang Prime Handle",0.2533},
                {"Forma Blueprint",0.11},
                {"Mirage Prime Neuroptics Blueprint",0.2533},
                {"Zephyr Prime Systems Blueprint",0.02}
            }
        },
        ["RewardSet445"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Cernos Prime Blueprint",0.13},
                {"Fang Prime Handle",0.2333},
                {"Forma Blueprint",0.13},
                {"Mirage Prime Neuroptics Blueprint",0.2333},
                {"Zephyr Prime Systems Blueprint",0.04}
            }
        },
        ["RewardSet446"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Cernos Prime Blueprint",0.17},
                {"Fang Prime Handle",0.2},
                {"Forma Blueprint",0.17},
                {"Mirage Prime Neuroptics Blueprint",0.2},
                {"Zephyr Prime Systems Blueprint",0.06}
            }
        },
        ["RewardSet447"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Cernos Prime Blueprint",0.2},
                {"Fang Prime Handle",0.1667},
                {"Forma Blueprint",0.2},
                {"Mirage Prime Neuroptics Blueprint",0.1667},
                {"Zephyr Prime Systems Blueprint",0.1}
            }
        },
        ["RewardSet448"]={
            ["A"]={
                {"Boar Prime Stock",0.02},
                {"Dakra Prime Handle",0.2533},
                {"Forma Blueprint",0.2533},
                {"Mag Prime Chassis Blueprint",0.11},
                {"Orthos Prime Blueprint",0.11},
                {"Orthos Prime Handle",0.2533}
            }
        },
        ["RewardSet449"]={
            ["A"]={
                {"Boar Prime Stock",0.04},
                {"Dakra Prime Handle",0.2333},
                {"Forma Blueprint",0.2333},
                {"Mag Prime Chassis Blueprint",0.13},
                {"Orthos Prime Blueprint",0.13},
                {"Orthos Prime Handle",0.2333}
            }
        },
        ["RewardSet450"]={
            ["A"]={
                {"Boar Prime Stock",0.06},
                {"Dakra Prime Handle",0.2},
                {"Forma Blueprint",0.2},
                {"Mag Prime Chassis Blueprint",0.17},
                {"Orthos Prime Blueprint",0.17},
                {"Orthos Prime Handle",0.2}
            }
        },
        ["RewardSet451"]={
            ["A"]={
                {"Boar Prime Stock",0.1},
                {"Dakra Prime Handle",0.1667},
                {"Forma Blueprint",0.1667},
                {"Mag Prime Chassis Blueprint",0.2},
                {"Orthos Prime Blueprint",0.2},
                {"Orthos Prime Handle",0.1667}
            }
        },
        ["RewardSet452"]={
            ["A"]={
                {"Ash Prime Blueprint",0.11},
                {"Carrier Prime Cerebrum",0.02},
                {"Forma Blueprint",0.2533},
                {"Nova Prime Neuroptics Blueprint",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533},
                {"Scindo Prime Handle",0.11}
            }
        },
        ["RewardSet453"]={
            ["A"]={
                {"Ash Prime Blueprint",0.13},
                {"Carrier Prime Cerebrum",0.04},
                {"Forma Blueprint",0.2333},
                {"Nova Prime Neuroptics Blueprint",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333},
                {"Scindo Prime Handle",0.13}
            }
        },
        ["RewardSet454"]={
            ["A"]={
                {"Ash Prime Blueprint",0.17},
                {"Carrier Prime Cerebrum",0.06},
                {"Forma Blueprint",0.2},
                {"Nova Prime Neuroptics Blueprint",0.2},
                {"Saryn Prime Systems Blueprint",0.2},
                {"Scindo Prime Handle",0.17}
            }
        },
        ["RewardSet455"]={
            ["A"]={
                {"Ash Prime Blueprint",0.2},
                {"Carrier Prime Cerebrum",0.1},
                {"Forma Blueprint",0.1667},
                {"Nova Prime Neuroptics Blueprint",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667},
                {"Scindo Prime Handle",0.2}
            }
        },
        ["RewardSet456"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2533},
                {"Carrier Prime Cerebrum",0.02},
                {"Cernos Prime Upper Limb",0.2533},
                {"Galatine Prime Blade",0.2533},
                {"Odonata Prime Blueprint",0.11},
                {"Valkyr Prime Neuroptics Blueprint",0.11}
            }
        },
        ["RewardSet457"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2333},
                {"Carrier Prime Cerebrum",0.04},
                {"Cernos Prime Upper Limb",0.2333},
                {"Galatine Prime Blade",0.2333},
                {"Odonata Prime Blueprint",0.13},
                {"Valkyr Prime Neuroptics Blueprint",0.13}
            }
        },
        ["RewardSet458"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2},
                {"Carrier Prime Cerebrum",0.06},
                {"Cernos Prime Upper Limb",0.2},
                {"Galatine Prime Blade",0.2},
                {"Odonata Prime Blueprint",0.17},
                {"Valkyr Prime Neuroptics Blueprint",0.17}
            }
        },
        ["RewardSet459"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.1667},
                {"Carrier Prime Cerebrum",0.1},
                {"Cernos Prime Upper Limb",0.1667},
                {"Galatine Prime Blade",0.1667},
                {"Odonata Prime Blueprint",0.2},
                {"Valkyr Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet460"]={
            ["A"]={
                {"Burston Prime Stock",0.2533},
                {"Cernos Prime Lower Limb",0.02},
                {"Helios Prime Blueprint",0.11},
                {"Lex Prime Blueprint",0.2533},
                {"Nami Skyla Prime Blueprint",0.2533},
                {"Saryn Prime Blueprint",0.11}
            }
        },
        ["RewardSet461"]={
            ["A"]={
                {"Burston Prime Stock",0.2333},
                {"Cernos Prime Lower Limb",0.04},
                {"Helios Prime Blueprint",0.13},
                {"Lex Prime Blueprint",0.2333},
                {"Nami Skyla Prime Blueprint",0.2333},
                {"Saryn Prime Blueprint",0.13}
            }
        },
        ["RewardSet462"]={
            ["A"]={
                {"Burston Prime Stock",0.2},
                {"Cernos Prime Lower Limb",0.06},
                {"Helios Prime Blueprint",0.17},
                {"Lex Prime Blueprint",0.2},
                {"Nami Skyla Prime Blueprint",0.2},
                {"Saryn Prime Blueprint",0.17}
            }
        },
        ["RewardSet463"]={
            ["A"]={
                {"Burston Prime Stock",0.1667},
                {"Cernos Prime Lower Limb",0.1},
                {"Helios Prime Blueprint",0.2},
                {"Lex Prime Blueprint",0.1667},
                {"Nami Skyla Prime Blueprint",0.1667},
                {"Saryn Prime Blueprint",0.2}
            }
        },
        ["RewardSet464"]={
            ["A"]={
                {"Dual Kamas Prime Blade",0.02},
                {"Forma Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Blueprint",0.2533},
                {"Orthos Prime Blade",0.11},
                {"Orthos Prime Handle",0.2533}
            }
        },
        ["RewardSet465"]={
            ["A"]={
                {"Dual Kamas Prime Blade",0.04},
                {"Forma Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Blueprint",0.2333},
                {"Orthos Prime Blade",0.13},
                {"Orthos Prime Handle",0.2333}
            }
        },
        ["RewardSet466"]={
            ["A"]={
                {"Dual Kamas Prime Blade",0.06},
                {"Forma Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Lex Prime Blueprint",0.2},
                {"Orthos Prime Blade",0.17},
                {"Orthos Prime Handle",0.2}
            }
        },
        ["RewardSet467"]={
            ["A"]={
                {"Dual Kamas Prime Blade",0.1},
                {"Forma Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Blueprint",0.1667},
                {"Orthos Prime Blade",0.2},
                {"Orthos Prime Handle",0.1667}
            }
        },
        ["RewardSet468"]={
            ["A"]={
                {"Bo Prime Ornament",0.2533},
                {"Ember Prime Blueprint",0.02},
                {"Forma Blueprint",0.11},
                {"Frost Prime Chassis Blueprint",0.2533},
                {"Latron Prime Barrel",0.2533},
                {"Wyrm Prime Systems",0.11}
            }
        },
        ["RewardSet469"]={
            ["A"]={
                {"Bo Prime Ornament",0.2333},
                {"Ember Prime Blueprint",0.04},
                {"Forma Blueprint",0.13},
                {"Frost Prime Chassis Blueprint",0.2333},
                {"Latron Prime Barrel",0.2333},
                {"Wyrm Prime Systems",0.13}
            }
        },
        ["RewardSet470"]={
            ["A"]={
                {"Bo Prime Ornament",0.2},
                {"Ember Prime Blueprint",0.06},
                {"Forma Blueprint",0.17},
                {"Frost Prime Chassis Blueprint",0.2},
                {"Latron Prime Barrel",0.2},
                {"Wyrm Prime Systems",0.17}
            }
        },
        ["RewardSet471"]={
            ["A"]={
                {"Bo Prime Ornament",0.1667},
                {"Ember Prime Blueprint",0.1},
                {"Forma Blueprint",0.2},
                {"Frost Prime Chassis Blueprint",0.1667},
                {"Latron Prime Barrel",0.1667},
                {"Wyrm Prime Systems",0.2}
            }
        },
        ["RewardSet472"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2533},
                {"Dual Kamas Prime Handle",0.11},
                {"Fragor Prime Blueprint",0.02},
                {"Nekros Prime Neuroptics Blueprint",0.11},
                {"Paris Prime Lower Limb",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet473"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2333},
                {"Dual Kamas Prime Handle",0.13},
                {"Fragor Prime Blueprint",0.04},
                {"Nekros Prime Neuroptics Blueprint",0.13},
                {"Paris Prime Lower Limb",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet474"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2},
                {"Dual Kamas Prime Handle",0.17},
                {"Fragor Prime Blueprint",0.06},
                {"Nekros Prime Neuroptics Blueprint",0.17},
                {"Paris Prime Lower Limb",0.2},
                {"Saryn Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet475"]={
            ["A"]={
                {"Bronco Prime Receiver",0.1667},
                {"Dual Kamas Prime Handle",0.2},
                {"Fragor Prime Blueprint",0.1},
                {"Nekros Prime Neuroptics Blueprint",0.2},
                {"Paris Prime Lower Limb",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet476"]={
            ["A"]={
                {"Ember Prime Chassis Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Frost Prime Blueprint",0.02},
                {"Latron Prime Stock",0.2533},
                {"Reaper Prime Blade",0.11},
                {"Sicarus Prime Barrel",0.2533}
            }
        },
        ["RewardSet477"]={
            ["A"]={
                {"Ember Prime Chassis Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Frost Prime Blueprint",0.04},
                {"Latron Prime Stock",0.2333},
                {"Reaper Prime Blade",0.13},
                {"Sicarus Prime Barrel",0.2333}
            }
        },
        ["RewardSet478"]={
            ["A"]={
                {"Ember Prime Chassis Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Frost Prime Blueprint",0.06},
                {"Latron Prime Stock",0.2},
                {"Reaper Prime Blade",0.17},
                {"Sicarus Prime Barrel",0.2}
            }
        },
        ["RewardSet479"]={
            ["A"]={
                {"Ember Prime Chassis Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Frost Prime Blueprint",0.1},
                {"Latron Prime Stock",0.1667},
                {"Reaper Prime Blade",0.2},
                {"Sicarus Prime Barrel",0.1667}
            }
        },
        ["RewardSet480"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Frost Prime Blueprint",0.02},
                {"Glaive Prime Disc",0.11},
                {"Loki Prime Blueprint",0.2533},
                {"Reaper Prime Handle",0.2533}
            }
        },
        ["RewardSet481"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Frost Prime Blueprint",0.04},
                {"Glaive Prime Disc",0.13},
                {"Loki Prime Blueprint",0.2333},
                {"Reaper Prime Handle",0.2333}
            }
        },
        ["RewardSet482"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Frost Prime Blueprint",0.06},
                {"Glaive Prime Disc",0.17},
                {"Loki Prime Blueprint",0.2},
                {"Reaper Prime Handle",0.2}
            }
        },
        ["RewardSet483"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Frost Prime Blueprint",0.1},
                {"Glaive Prime Disc",0.2},
                {"Loki Prime Blueprint",0.1667},
                {"Reaper Prime Handle",0.1667}
            }
        },
        ["RewardSet484"]={
            ["A"]={
                {"Ballistica Prime String",0.11},
                {"Braton Prime Barrel",0.2533},
                {"Forma Blueprint",0.2533},
                {"Galatine Prime Blueprint",0.02},
                {"None",0.11},
                {"Venka Prime Blades",0.2533}
            }
        },
        ["RewardSet485"]={
            ["A"]={
                {"Ballistica Prime String",0.13},
                {"Braton Prime Barrel",0.2333},
                {"Forma Blueprint",0.2333},
                {"Galatine Prime Blueprint",0.04},
                {"None",0.13},
                {"Venka Prime Blades",0.2333}
            }
        },
        ["RewardSet486"]={
            ["A"]={
                {"Ballistica Prime String",0.17},
                {"Braton Prime Barrel",0.2},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Blueprint",0.06},
                {"None",0.17},
                {"Venka Prime Blades",0.2}
            }
        },
        ["RewardSet487"]={
            ["A"]={
                {"Ballistica Prime String",0.2},
                {"Braton Prime Barrel",0.1667},
                {"Forma Blueprint",0.1667},
                {"Galatine Prime Blueprint",0.1},
                {"None",0.2},
                {"Venka Prime Blades",0.1667}
            }
        },
        ["RewardSet488"]={
            ["A"]={
                {"Fragor Prime Blueprint",0.11},
                {"Helios Prime Cerebrum",0.02},
                {"Hydroid Prime Chassis Blueprint",0.2533},
                {"Mirage Prime Neuroptics Blueprint",0.2533},
                {"Oberon Prime Blueprint",0.11},
                {"Paris Prime Blueprint",0.2533}
            }
        },
        ["RewardSet489"]={
            ["A"]={
                {"Fragor Prime Blueprint",0.13},
                {"Helios Prime Cerebrum",0.04},
                {"Hydroid Prime Chassis Blueprint",0.2333},
                {"Mirage Prime Neuroptics Blueprint",0.2333},
                {"Oberon Prime Blueprint",0.13},
                {"Paris Prime Blueprint",0.2333}
            }
        },
        ["RewardSet490"]={
            ["A"]={
                {"Fragor Prime Blueprint",0.17},
                {"Helios Prime Cerebrum",0.06},
                {"Hydroid Prime Chassis Blueprint",0.2},
                {"Mirage Prime Neuroptics Blueprint",0.2},
                {"Oberon Prime Blueprint",0.17},
                {"Paris Prime Blueprint",0.2}
            }
        },
        ["RewardSet491"]={
            ["A"]={
                {"Fragor Prime Blueprint",0.2},
                {"Helios Prime Cerebrum",0.1},
                {"Hydroid Prime Chassis Blueprint",0.1667},
                {"Mirage Prime Neuroptics Blueprint",0.1667},
                {"Oberon Prime Blueprint",0.2},
                {"Paris Prime Blueprint",0.1667}
            }
        },
        ["RewardSet492"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.11},
                {"Cernos Prime Upper Limb",0.2533},
                {"Kogake Prime Gauntlet",0.02},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Orthos Prime Handle",0.2533},
                {"Tigris Prime Receiver",0.11}
            }
        },
        ["RewardSet493"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.13},
                {"Cernos Prime Upper Limb",0.2333},
                {"Kogake Prime Gauntlet",0.04},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Orthos Prime Handle",0.2333},
                {"Tigris Prime Receiver",0.13}
            }
        },
        ["RewardSet494"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.17},
                {"Cernos Prime Upper Limb",0.2},
                {"Kogake Prime Gauntlet",0.06},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Orthos Prime Handle",0.2},
                {"Tigris Prime Receiver",0.17}
            }
        },
        ["RewardSet495"]={
            ["A"]={
                {"Akstiletto Prime Barrel",0.2},
                {"Cernos Prime Upper Limb",0.1667},
                {"Kogake Prime Gauntlet",0.1},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Orthos Prime Handle",0.1667},
                {"Tigris Prime Receiver",0.2}
            }
        },
        ["RewardSet496"]={
            ["A"]={
                {"Ankyros Prime Gauntlet",0.2533},
                {"Boar Prime Barrel",0.11},
                {"Boltor Prime Barrel",0.2533},
                {"Dakra Prime Handle",0.2533},
                {"Mag Prime Blueprint",0.02},
                {"Rhino Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet497"]={
            ["A"]={
                {"Ankyros Prime Gauntlet",0.2333},
                {"Boar Prime Barrel",0.13},
                {"Boltor Prime Barrel",0.2333},
                {"Dakra Prime Handle",0.2333},
                {"Mag Prime Blueprint",0.04},
                {"Rhino Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet498"]={
            ["A"]={
                {"Ankyros Prime Gauntlet",0.2},
                {"Boar Prime Barrel",0.17},
                {"Boltor Prime Barrel",0.2},
                {"Dakra Prime Handle",0.2},
                {"Mag Prime Blueprint",0.06},
                {"Rhino Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet499"]={
            ["A"]={
                {"Ankyros Prime Gauntlet",0.1667},
                {"Boar Prime Barrel",0.2},
                {"Boltor Prime Barrel",0.1667},
                {"Dakra Prime Handle",0.1667},
                {"Mag Prime Blueprint",0.1},
                {"Rhino Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet500"]={
            ["A"]={
                {"Braton Prime Stock",0.2533},
                {"Dual Kamas Prime Handle",0.11},
                {"Fang Prime Blueprint",0.2533},
                {"Fang Prime Handle",0.2533},
                {"Forma Blueprint",0.11},
                {"Nyx Prime Neuroptics Blueprint",0.02}
            }
        },
        ["RewardSet501"]={
            ["A"]={
                {"Braton Prime Stock",0.2333},
                {"Dual Kamas Prime Handle",0.13},
                {"Fang Prime Blueprint",0.2333},
                {"Fang Prime Handle",0.2333},
                {"Forma Blueprint",0.13},
                {"Nyx Prime Neuroptics Blueprint",0.04}
            }
        },
        ["RewardSet502"]={
            ["A"]={
                {"Braton Prime Stock",0.2},
                {"Dual Kamas Prime Handle",0.17},
                {"Fang Prime Blueprint",0.2},
                {"Fang Prime Handle",0.2},
                {"Forma Blueprint",0.17},
                {"Nyx Prime Neuroptics Blueprint",0.06}
            }
        },
        ["RewardSet503"]={
            ["A"]={
                {"Braton Prime Stock",0.1667},
                {"Dual Kamas Prime Handle",0.2},
                {"Fang Prime Blueprint",0.1667},
                {"Fang Prime Handle",0.1667},
                {"Forma Blueprint",0.2},
                {"Nyx Prime Neuroptics Blueprint",0.1}
            }
        },
        ["RewardSet504"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.11},
                {"Bronco Prime Blueprint",0.2533},
                {"Fang Prime Handle",0.2533},
                {"Forma Blueprint",0.11},
                {"Hikou Prime Blueprint",0.2533},
                {"Vauban Prime Neuroptics Blueprint",0.02}
            }
        },
        ["RewardSet505"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.13},
                {"Bronco Prime Blueprint",0.2333},
                {"Fang Prime Handle",0.2333},
                {"Forma Blueprint",0.13},
                {"Hikou Prime Blueprint",0.2333},
                {"Vauban Prime Neuroptics Blueprint",0.04}
            }
        },
        ["RewardSet506"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.17},
                {"Bronco Prime Blueprint",0.2},
                {"Fang Prime Handle",0.2},
                {"Forma Blueprint",0.17},
                {"Hikou Prime Blueprint",0.2},
                {"Vauban Prime Neuroptics Blueprint",0.06}
            }
        },
        ["RewardSet507"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.2},
                {"Bronco Prime Blueprint",0.1667},
                {"Fang Prime Handle",0.1667},
                {"Forma Blueprint",0.2},
                {"Hikou Prime Blueprint",0.1667},
                {"Vauban Prime Neuroptics Blueprint",0.1}
            }
        },
        ["RewardSet508"]={
            ["A"]={
                {"Braton Prime Barrel",0.2533},
                {"Bronco Prime Blueprint",0.2533},
                {"Burston Prime Stock",0.2533},
                {"Carrier Prime Cerebrum",0.11},
                {"Euphona Prime Barrel",0.11},
                {"Nekros Prime Blueprint",0.02}
            }
        },
        ["RewardSet509"]={
            ["A"]={
                {"Braton Prime Barrel",0.2333},
                {"Bronco Prime Blueprint",0.2333},
                {"Burston Prime Stock",0.2333},
                {"Carrier Prime Cerebrum",0.13},
                {"Euphona Prime Barrel",0.13},
                {"Nekros Prime Blueprint",0.04}
            }
        },
        ["RewardSet510"]={
            ["A"]={
                {"Braton Prime Barrel",0.2},
                {"Bronco Prime Blueprint",0.2},
                {"Burston Prime Stock",0.2},
                {"Carrier Prime Cerebrum",0.17},
                {"Euphona Prime Barrel",0.17},
                {"Nekros Prime Blueprint",0.06}
            }
        },
        ["RewardSet511"]={
            ["A"]={
                {"Braton Prime Barrel",0.1667},
                {"Bronco Prime Blueprint",0.1667},
                {"Burston Prime Stock",0.1667},
                {"Carrier Prime Cerebrum",0.2},
                {"Euphona Prime Barrel",0.2},
                {"Nekros Prime Blueprint",0.1}
            }
        },
        ["RewardSet512"]={
            ["A"]={
                {"Forma Blueprint",0.11},
                {"Nikana Prime Blade",0.02},
                {"Oberon Prime Blueprint",0.11},
                {"Orthos Prime Handle",0.2533},
                {"Paris Prime Upper Limb",0.2533},
                {"Saryn Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet513"]={
            ["A"]={
                {"Forma Blueprint",0.13},
                {"Nikana Prime Blade",0.04},
                {"Oberon Prime Blueprint",0.13},
                {"Orthos Prime Handle",0.2333},
                {"Paris Prime Upper Limb",0.2333},
                {"Saryn Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet514"]={
            ["A"]={
                {"Forma Blueprint",0.17},
                {"Nikana Prime Blade",0.06},
                {"Oberon Prime Blueprint",0.17},
                {"Orthos Prime Handle",0.2},
                {"Paris Prime Upper Limb",0.2},
                {"Saryn Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet515"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Nikana Prime Blade",0.1},
                {"Oberon Prime Blueprint",0.2},
                {"Orthos Prime Handle",0.1667},
                {"Paris Prime Upper Limb",0.1667},
                {"Saryn Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet516"]={
            ["A"]={
                {"Braton Prime Stock",0.2533},
                {"Forma Blueprint",0.2533},
                {"Hydroid Prime Blueprint",0.11},
                {"Lex Prime Receiver",0.2533},
                {"Nekros Prime Systems Blueprint",0.02},
                {"Tigris Prime Receiver",0.11}
            }
        },
        ["RewardSet517"]={
            ["A"]={
                {"Braton Prime Stock",0.2333},
                {"Forma Blueprint",0.2333},
                {"Hydroid Prime Blueprint",0.13},
                {"Lex Prime Receiver",0.2333},
                {"Nekros Prime Systems Blueprint",0.04},
                {"Tigris Prime Receiver",0.13}
            }
        },
        ["RewardSet518"]={
            ["A"]={
                {"Braton Prime Stock",0.2},
                {"Forma Blueprint",0.2},
                {"Hydroid Prime Blueprint",0.17},
                {"Lex Prime Receiver",0.2},
                {"Nekros Prime Systems Blueprint",0.06},
                {"Tigris Prime Receiver",0.17}
            }
        },
        ["RewardSet519"]={
            ["A"]={
                {"Braton Prime Stock",0.1667},
                {"Forma Blueprint",0.1667},
                {"Hydroid Prime Blueprint",0.2},
                {"Lex Prime Receiver",0.1667},
                {"Nekros Prime Systems Blueprint",0.1},
                {"Tigris Prime Receiver",0.2}
            }
        },
        ["RewardSet520"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Akstiletto Prime Link",0.11},
                {"Cernos Prime String",0.11},
                {"Forma Blueprint",0.2533},
                {"Oberon Prime Neuroptics Blueprint",0.02},
                {"Paris Prime Lower Limb",0.2533}
            }
        },
        ["RewardSet521"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Akstiletto Prime Link",0.13},
                {"Cernos Prime String",0.13},
                {"Forma Blueprint",0.2333},
                {"Oberon Prime Neuroptics Blueprint",0.04},
                {"Paris Prime Lower Limb",0.2333}
            }
        },
        ["RewardSet522"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Akstiletto Prime Link",0.17},
                {"Cernos Prime String",0.17},
                {"Forma Blueprint",0.2},
                {"Oberon Prime Neuroptics Blueprint",0.06},
                {"Paris Prime Lower Limb",0.2}
            }
        },
        ["RewardSet523"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Akstiletto Prime Link",0.2},
                {"Cernos Prime String",0.2},
                {"Forma Blueprint",0.1667},
                {"Oberon Prime Neuroptics Blueprint",0.1},
                {"Paris Prime Lower Limb",0.1667}
            }
        },
        ["RewardSet524"]={
            ["A"]={
                {"Akbronco Prime Link",0.11},
                {"Cernos Prime Upper Limb",0.2533},
                {"Mirage Prime Systems Blueprint",0.11},
                {"Oberon Prime Neuroptics Blueprint",0.02},
                {"Paris Prime Lower Limb",0.2533},
                {"Tiberon Prime Receiver",0.2533}
            }
        },
        ["RewardSet525"]={
            ["A"]={
                {"Akbronco Prime Link",0.13},
                {"Cernos Prime Upper Limb",0.2333},
                {"Mirage Prime Systems Blueprint",0.13},
                {"Oberon Prime Neuroptics Blueprint",0.04},
                {"Paris Prime Lower Limb",0.2333},
                {"Tiberon Prime Receiver",0.2333}
            }
        },
        ["RewardSet526"]={
            ["A"]={
                {"Akbronco Prime Link",0.17},
                {"Cernos Prime Upper Limb",0.2},
                {"Mirage Prime Systems Blueprint",0.17},
                {"Oberon Prime Neuroptics Blueprint",0.06},
                {"Paris Prime Lower Limb",0.2},
                {"Tiberon Prime Receiver",0.2}
            }
        },
        ["RewardSet527"]={
            ["A"]={
                {"Akbronco Prime Link",0.2},
                {"Cernos Prime Upper Limb",0.1667},
                {"Mirage Prime Systems Blueprint",0.2},
                {"Oberon Prime Neuroptics Blueprint",0.1},
                {"Paris Prime Lower Limb",0.1667},
                {"Tiberon Prime Receiver",0.1667}
            }
        },
        ["RewardSet528"]={
            ["A"]={
                {"Nova Prime Systems Blueprint",0.2533},
                {"Odonata Prime Blueprint",0.11},
                {"Paris Prime Blueprint",0.2533},
                {"Paris Prime Upper Limb",0.11},
                {"Soma Prime Stock",0.02},
                {"Tigris Prime Stock",0.2533}
            }
        },
        ["RewardSet529"]={
            ["A"]={
                {"Nova Prime Systems Blueprint",0.2333},
                {"Odonata Prime Blueprint",0.13},
                {"Paris Prime Blueprint",0.2333},
                {"Paris Prime Upper Limb",0.13},
                {"Soma Prime Stock",0.04},
                {"Tigris Prime Stock",0.2333}
            }
        },
        ["RewardSet530"]={
            ["A"]={
                {"Nova Prime Systems Blueprint",0.2},
                {"Odonata Prime Blueprint",0.17},
                {"Paris Prime Blueprint",0.2},
                {"Paris Prime Upper Limb",0.17},
                {"Soma Prime Stock",0.06},
                {"Tigris Prime Stock",0.2}
            }
        },
        ["RewardSet531"]={
            ["A"]={
                {"Nova Prime Systems Blueprint",0.1667},
                {"Odonata Prime Blueprint",0.2},
                {"Paris Prime Blueprint",0.1667},
                {"Paris Prime Upper Limb",0.2},
                {"Soma Prime Stock",0.1},
                {"Tigris Prime Stock",0.1667}
            }
        },
        ["RewardSet532"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Paris Prime Grip",0.11},
                {"Paris Prime String",0.2533},
                {"Saryn Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet533"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Paris Prime Grip",0.13},
                {"Paris Prime String",0.2333},
                {"Saryn Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet534"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Galatine Prime Blade",0.2},
                {"Paris Prime Grip",0.17},
                {"Paris Prime String",0.2},
                {"Saryn Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet535"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Paris Prime Grip",0.2},
                {"Paris Prime String",0.1667},
                {"Saryn Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet536"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2533},
                {"Ash Prime Blueprint",0.11},
                {"Forma Blueprint",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Spira Prime Pouch",0.02},
                {"Valkyr Prime Blueprint",0.2533}
            }
        },
        ["RewardSet537"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2333},
                {"Ash Prime Blueprint",0.13},
                {"Forma Blueprint",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Spira Prime Pouch",0.04},
                {"Valkyr Prime Blueprint",0.2333}
            }
        },
        ["RewardSet538"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.2},
                {"Ash Prime Blueprint",0.17},
                {"Forma Blueprint",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Spira Prime Pouch",0.06},
                {"Valkyr Prime Blueprint",0.2}
            }
        },
        ["RewardSet539"]={
            ["A"]={
                {"Akbronco Prime Blueprint",0.1667},
                {"Ash Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Spira Prime Pouch",0.1},
                {"Valkyr Prime Blueprint",0.1667}
            }
        },
        ["RewardSet540"]={
            ["A"]={
                {"Banshee Prime Neuroptics Blueprint",0.2533},
                {"Fang Prime Blueprint",0.2533},
                {"Fang Prime Handle",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Saryn Prime Blueprint",0.02},
                {"Trinity Prime Blueprint",0.11}
            }
        },
        ["RewardSet541"]={
            ["A"]={
                {"Banshee Prime Neuroptics Blueprint",0.2333},
                {"Fang Prime Blueprint",0.2333},
                {"Fang Prime Handle",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Saryn Prime Blueprint",0.04},
                {"Trinity Prime Blueprint",0.13}
            }
        },
        ["RewardSet542"]={
            ["A"]={
                {"Banshee Prime Neuroptics Blueprint",0.2},
                {"Fang Prime Blueprint",0.2},
                {"Fang Prime Handle",0.17},
                {"Galatine Prime Blade",0.2},
                {"Saryn Prime Blueprint",0.06},
                {"Trinity Prime Blueprint",0.17}
            }
        },
        ["RewardSet543"]={
            ["A"]={
                {"Banshee Prime Neuroptics Blueprint",0.1667},
                {"Fang Prime Blueprint",0.1667},
                {"Fang Prime Handle",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Saryn Prime Blueprint",0.1},
                {"Trinity Prime Blueprint",0.2}
            }
        },
        ["RewardSet544"]={
            ["A"]={
                {"Braton Prime Barrel",0.2533},
                {"Burston Prime Stock",0.2533},
                {"Forma Blueprint",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Saryn Prime Neuroptics Blueprint",0.11},
                {"Sybaris Prime Barrel",0.02}
            }
        },
        ["RewardSet545"]={
            ["A"]={
                {"Braton Prime Barrel",0.2333},
                {"Burston Prime Stock",0.2333},
                {"Forma Blueprint",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Saryn Prime Neuroptics Blueprint",0.13},
                {"Sybaris Prime Barrel",0.04}
            }
        },
        ["RewardSet546"]={
            ["A"]={
                {"Braton Prime Barrel",0.2},
                {"Burston Prime Stock",0.2},
                {"Forma Blueprint",0.17},
                {"Lex Prime Barrel",0.2},
                {"Saryn Prime Neuroptics Blueprint",0.17},
                {"Sybaris Prime Barrel",0.06}
            }
        },
        ["RewardSet547"]={
            ["A"]={
                {"Braton Prime Barrel",0.1667},
                {"Burston Prime Stock",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Saryn Prime Neuroptics Blueprint",0.2},
                {"Sybaris Prime Barrel",0.1}
            }
        },
        ["RewardSet548"]={
            ["A"]={
                {"Cernos Prime String",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Helios Prime Carapace",0.2533},
                {"Spira Prime Blade",0.02},
                {"Tigris Prime Receiver",0.11},
                {"Valkyr Prime Blueprint",0.2533}
            }
        },
        ["RewardSet549"]={
            ["A"]={
                {"Cernos Prime String",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Helios Prime Carapace",0.2333},
                {"Spira Prime Blade",0.04},
                {"Tigris Prime Receiver",0.13},
                {"Valkyr Prime Blueprint",0.2333}
            }
        },
        ["RewardSet550"]={
            ["A"]={
                {"Cernos Prime String",0.17},
                {"Galatine Prime Blade",0.2},
                {"Helios Prime Carapace",0.2},
                {"Spira Prime Blade",0.06},
                {"Tigris Prime Receiver",0.17},
                {"Valkyr Prime Blueprint",0.2}
            }
        },
        ["RewardSet551"]={
            ["A"]={
                {"Cernos Prime String",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Helios Prime Carapace",0.1667},
                {"Spira Prime Blade",0.1},
                {"Tigris Prime Receiver",0.2},
                {"Valkyr Prime Blueprint",0.1667}
            }
        },
        ["RewardSet552"]={
            ["A"]={
                {"Braton Prime Stock",0.2533},
                {"Burston Prime Receiver",0.2533},
                {"Fang Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Paris Prime Upper Limb",0.11},
                {"Tiberon Prime Barrel",0.02}
            }
        },
        ["RewardSet553"]={
            ["A"]={
                {"Braton Prime Stock",0.2333},
                {"Burston Prime Receiver",0.2333},
                {"Fang Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Paris Prime Upper Limb",0.13},
                {"Tiberon Prime Barrel",0.04}
            }
        },
        ["RewardSet554"]={
            ["A"]={
                {"Braton Prime Stock",0.2},
                {"Burston Prime Receiver",0.2},
                {"Fang Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Paris Prime Upper Limb",0.17},
                {"Tiberon Prime Barrel",0.06}
            }
        },
        ["RewardSet555"]={
            ["A"]={
                {"Braton Prime Stock",0.1667},
                {"Burston Prime Receiver",0.1667},
                {"Fang Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Paris Prime Upper Limb",0.2},
                {"Tiberon Prime Barrel",0.1}
            }
        },
        ["RewardSet556"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Barrel",0.2533},
                {"Paris Prime Lower Limb",0.2533},
                {"Tiberon Prime Stock",0.02},
                {"Tigris Prime Receiver",0.11}
            }
        },
        ["RewardSet557"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Barrel",0.2333},
                {"Paris Prime Lower Limb",0.2333},
                {"Tiberon Prime Stock",0.04},
                {"Tigris Prime Receiver",0.13}
            }
        },
        ["RewardSet558"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.2},
                {"Paris Prime Lower Limb",0.2},
                {"Tiberon Prime Stock",0.06},
                {"Tigris Prime Receiver",0.17}
            }
        },
        ["RewardSet559"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.2},
                {"Forma Blueprint",0.1667},
                {"Lex Prime Barrel",0.1667},
                {"Paris Prime Lower Limb",0.1667},
                {"Tiberon Prime Stock",0.1},
                {"Tigris Prime Receiver",0.2}
            }
        },
        ["RewardSet560"]={
            ["A"]={
                {"Braton Prime Blueprint",0.11},
                {"Burston Prime Blueprint",0.2533},
                {"Carrier Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Spira Prime Blueprint",0.2533},
                {"Vectis Prime Receiver",0.02}
            }
        },
        ["RewardSet561"]={
            ["A"]={
                {"Braton Prime Blueprint",0.13},
                {"Burston Prime Blueprint",0.2333},
                {"Carrier Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Spira Prime Blueprint",0.2333},
                {"Vectis Prime Receiver",0.04}
            }
        },
        ["RewardSet562"]={
            ["A"]={
                {"Braton Prime Blueprint",0.17},
                {"Burston Prime Blueprint",0.2},
                {"Carrier Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Spira Prime Blueprint",0.2},
                {"Vectis Prime Receiver",0.06}
            }
        },
        ["RewardSet563"]={
            ["A"]={
                {"Braton Prime Blueprint",0.2},
                {"Burston Prime Blueprint",0.1667},
                {"Carrier Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Spira Prime Blueprint",0.1667},
                {"Vectis Prime Receiver",0.1}
            }
        },
        ["RewardSet564"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Nikana Prime Blade",0.02},
                {"Paris Prime Blueprint",0.2533},
                {"Vasto Prime Receiver",0.2533},
                {"Volt Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet565"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Nikana Prime Blade",0.04},
                {"Paris Prime Blueprint",0.2333},
                {"Vasto Prime Receiver",0.2333},
                {"Volt Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet566"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Nikana Prime Blade",0.06},
                {"Paris Prime Blueprint",0.2},
                {"Vasto Prime Receiver",0.2},
                {"Volt Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet567"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Nikana Prime Blade",0.1},
                {"Paris Prime Blueprint",0.1667},
                {"Vasto Prime Receiver",0.1667},
                {"Volt Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet568"]={
            ["A"]={
                {"Carrier Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Kavasa Prime Band",0.11},
                {"Spira Prime Blueprint",0.2533},
                {"Valkyr Prime Systems Blueprint",0.02},
                {"Volt Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet569"]={
            ["A"]={
                {"Carrier Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Kavasa Prime Band",0.13},
                {"Spira Prime Blueprint",0.2333},
                {"Valkyr Prime Systems Blueprint",0.04},
                {"Volt Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet570"]={
            ["A"]={
                {"Carrier Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Band",0.17},
                {"Spira Prime Blueprint",0.2},
                {"Valkyr Prime Systems Blueprint",0.06},
                {"Volt Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet571"]={
            ["A"]={
                {"Carrier Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Kavasa Prime Band",0.2},
                {"Spira Prime Blueprint",0.1667},
                {"Valkyr Prime Systems Blueprint",0.1},
                {"Volt Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet572"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.11},
                {"Carrier Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Lex Prime Barrel",0.2533},
                {"Valkyr Prime Neuroptics Blueprint",0.11},
                {"Vauban Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet573"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.13},
                {"Carrier Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Lex Prime Barrel",0.2333},
                {"Valkyr Prime Neuroptics Blueprint",0.13},
                {"Vauban Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet574"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.17},
                {"Carrier Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.2},
                {"Valkyr Prime Neuroptics Blueprint",0.17},
                {"Vauban Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet575"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.2},
                {"Carrier Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Lex Prime Barrel",0.1667},
                {"Valkyr Prime Neuroptics Blueprint",0.2},
                {"Vauban Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet576"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2533},
                {"Cernos Prime Grip",0.2533},
                {"Euphona Prime Barrel",0.11},
                {"None",0.11},
                {"Spira Prime Blueprint",0.2533},
                {"Venka Prime Gauntlet",0.02}
            }
        },
        ["RewardSet577"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2333},
                {"Cernos Prime Grip",0.2333},
                {"Euphona Prime Barrel",0.13},
                {"None",0.13},
                {"Spira Prime Blueprint",0.2333},
                {"Venka Prime Gauntlet",0.04}
            }
        },
        ["RewardSet578"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.2},
                {"Cernos Prime Grip",0.2},
                {"Euphona Prime Barrel",0.17},
                {"None",0.17},
                {"Spira Prime Blueprint",0.2},
                {"Venka Prime Gauntlet",0.06}
            }
        },
        ["RewardSet579"]={
            ["A"]={
                {"Bronco Prime Blueprint",0.1667},
                {"Cernos Prime Grip",0.1667},
                {"Euphona Prime Barrel",0.2},
                {"None",0.2},
                {"Spira Prime Blueprint",0.1667},
                {"Venka Prime Gauntlet",0.1}
            }
        },
        ["RewardSet580"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.02},
                {"Braton Prime Barrel",0.2533},
                {"Carrier Prime Systems",0.2533},
                {"Cernos Prime String",0.11},
                {"Forma Blueprint",0.2533},
                {"Vectis Prime Blueprint",0.11}
            }
        },
        ["RewardSet581"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.04},
                {"Braton Prime Barrel",0.2333},
                {"Carrier Prime Systems",0.2333},
                {"Cernos Prime String",0.13},
                {"Forma Blueprint",0.2333},
                {"Vectis Prime Blueprint",0.13}
            }
        },
        ["RewardSet582"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.06},
                {"Braton Prime Barrel",0.2},
                {"Carrier Prime Systems",0.2},
                {"Cernos Prime String",0.17},
                {"Forma Blueprint",0.2},
                {"Vectis Prime Blueprint",0.17}
            }
        },
        ["RewardSet583"]={
            ["A"]={
                {"Akstiletto Prime Blueprint",0.1},
                {"Braton Prime Barrel",0.1667},
                {"Carrier Prime Systems",0.1667},
                {"Cernos Prime String",0.2},
                {"Forma Blueprint",0.1667},
                {"Vectis Prime Blueprint",0.2}
            }
        },
        ["RewardSet584"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.02},
                {"Bronco Prime Receiver",0.2533},
                {"Burston Prime Barrel",0.11},
                {"Paris Prime String",0.2533},
                {"Trinity Prime Systems Blueprint",0.2533},
                {"Vectis Prime Stock",0.11}
            }
        },
        ["RewardSet585"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.04},
                {"Bronco Prime Receiver",0.2333},
                {"Burston Prime Barrel",0.13},
                {"Paris Prime String",0.2333},
                {"Trinity Prime Systems Blueprint",0.2333},
                {"Vectis Prime Stock",0.13}
            }
        },
        ["RewardSet586"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.06},
                {"Bronco Prime Receiver",0.2},
                {"Burston Prime Barrel",0.17},
                {"Paris Prime String",0.2},
                {"Trinity Prime Systems Blueprint",0.2},
                {"Vectis Prime Stock",0.17}
            }
        },
        ["RewardSet587"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.1},
                {"Bronco Prime Receiver",0.1667},
                {"Burston Prime Barrel",0.2},
                {"Paris Prime String",0.1667},
                {"Trinity Prime Systems Blueprint",0.1667},
                {"Vectis Prime Stock",0.2}
            }
        },
        ["RewardSet588"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.02},
                {"Braton Prime Stock",0.2533},
                {"Fang Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Tigris Prime Stock",0.2533},
                {"Venka Prime Blueprint",0.11}
            }
        },
        ["RewardSet589"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.04},
                {"Braton Prime Stock",0.2333},
                {"Fang Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Tigris Prime Stock",0.2333},
                {"Venka Prime Blueprint",0.13}
            }
        },
        ["RewardSet590"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.06},
                {"Braton Prime Stock",0.2},
                {"Fang Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Tigris Prime Stock",0.2},
                {"Venka Prime Blueprint",0.17}
            }
        },
        ["RewardSet591"]={
            ["A"]={
                {"Banshee Prime Chassis Blueprint",0.1},
                {"Braton Prime Stock",0.1667},
                {"Fang Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Tigris Prime Stock",0.1667},
                {"Venka Prime Blueprint",0.2}
            }
        },
        ["RewardSet592"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2533},
                {"Boltor Prime Blueprint",0.02},
                {"Dakra Prime Blade",0.11},
                {"Forma Blueprint",0.2533},
                {"Mag Prime Chassis Blueprint",0.11},
                {"Rhino Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet593"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2333},
                {"Boltor Prime Blueprint",0.04},
                {"Dakra Prime Blade",0.13},
                {"Forma Blueprint",0.2333},
                {"Mag Prime Chassis Blueprint",0.13},
                {"Rhino Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet594"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2},
                {"Boltor Prime Blueprint",0.06},
                {"Dakra Prime Blade",0.17},
                {"Forma Blueprint",0.2},
                {"Mag Prime Chassis Blueprint",0.17},
                {"Rhino Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet595"]={
            ["A"]={
                {"Boar Prime Blueprint",0.1667},
                {"Boltor Prime Blueprint",0.1},
                {"Dakra Prime Blade",0.2},
                {"Forma Blueprint",0.1667},
                {"Mag Prime Chassis Blueprint",0.2},
                {"Rhino Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet596"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.02},
                {"Burston Prime Stock",0.2533},
                {"Forma Blueprint",0.2533},
                {"Hydroid Prime Chassis Blueprint",0.2533},
                {"Kronen Prime Handle",0.11},
                {"Tigris Prime Barrel",0.11}
            }
        },
        ["RewardSet597"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.04},
                {"Burston Prime Stock",0.2333},
                {"Forma Blueprint",0.2333},
                {"Hydroid Prime Chassis Blueprint",0.2333},
                {"Kronen Prime Handle",0.13},
                {"Tigris Prime Barrel",0.13}
            }
        },
        ["RewardSet598"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.06},
                {"Burston Prime Stock",0.2},
                {"Forma Blueprint",0.2},
                {"Hydroid Prime Chassis Blueprint",0.2},
                {"Kronen Prime Handle",0.17},
                {"Tigris Prime Barrel",0.17}
            }
        },
        ["RewardSet599"]={
            ["A"]={
                {"Banshee Prime Systems Blueprint",0.1},
                {"Burston Prime Stock",0.1667},
                {"Forma Blueprint",0.1667},
                {"Hydroid Prime Chassis Blueprint",0.1667},
                {"Kronen Prime Handle",0.2},
                {"Tigris Prime Barrel",0.2}
            }
        },
        ["RewardSet600"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2533},
                {"Dakra Prime Blade",0.02},
                {"Forma Blueprint",0.11},
                {"Mag Prime Systems Blueprint",0.2533},
                {"Trinity Prime Neuroptics Blueprint",0.11},
                {"Vasto Prime Barrel",0.2533}
            }
        },
        ["RewardSet601"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2333},
                {"Dakra Prime Blade",0.04},
                {"Forma Blueprint",0.13},
                {"Mag Prime Systems Blueprint",0.2333},
                {"Trinity Prime Neuroptics Blueprint",0.13},
                {"Vasto Prime Barrel",0.2333}
            }
        },
        ["RewardSet602"]={
            ["A"]={
                {"Boar Prime Blueprint",0.2},
                {"Dakra Prime Blade",0.06},
                {"Forma Blueprint",0.17},
                {"Mag Prime Systems Blueprint",0.2},
                {"Trinity Prime Neuroptics Blueprint",0.17},
                {"Vasto Prime Barrel",0.2}
            }
        },
        ["RewardSet603"]={
            ["A"]={
                {"Boar Prime Blueprint",0.1667},
                {"Dakra Prime Blade",0.1},
                {"Forma Blueprint",0.2},
                {"Mag Prime Systems Blueprint",0.1667},
                {"Trinity Prime Neuroptics Blueprint",0.2},
                {"Vasto Prime Barrel",0.1667}
            }
        },
        ["RewardSet604"]={
            ["A"]={
                {"Ember Prime Blueprint",0.02},
                {"Forma Blueprint",0.11},
                {"Frost Prime Neuroptics Blueprint",0.2533},
                {"Loki Prime Neuroptics Blueprint",0.2533},
                {"Reaper Prime Blade",0.11},
                {"Wyrm Prime Blueprint",0.2533}
            }
        },
        ["RewardSet605"]={
            ["A"]={
                {"Ember Prime Blueprint",0.04},
                {"Forma Blueprint",0.13},
                {"Frost Prime Neuroptics Blueprint",0.2333},
                {"Loki Prime Neuroptics Blueprint",0.2333},
                {"Reaper Prime Blade",0.13},
                {"Wyrm Prime Blueprint",0.2333}
            }
        },
        ["RewardSet606"]={
            ["A"]={
                {"Ember Prime Blueprint",0.06},
                {"Forma Blueprint",0.17},
                {"Frost Prime Neuroptics Blueprint",0.2},
                {"Loki Prime Neuroptics Blueprint",0.2},
                {"Reaper Prime Blade",0.17},
                {"Wyrm Prime Blueprint",0.2}
            }
        },
        ["RewardSet607"]={
            ["A"]={
                {"Ember Prime Blueprint",0.1},
                {"Forma Blueprint",0.2},
                {"Frost Prime Neuroptics Blueprint",0.1667},
                {"Loki Prime Neuroptics Blueprint",0.1667},
                {"Reaper Prime Blade",0.2},
                {"Wyrm Prime Blueprint",0.1667}
            }
        },
        ["RewardSet608"]={
            ["A"]={
                {"Bo Prime Handle",0.11},
                {"Ember Prime Chassis Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Frost Prime Blueprint",0.02},
                {"Sicarus Prime Barrel",0.2533},
                {"Sicarus Prime Blueprint",0.2533}
            }
        },
        ["RewardSet609"]={
            ["A"]={
                {"Bo Prime Handle",0.13},
                {"Ember Prime Chassis Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Frost Prime Blueprint",0.04},
                {"Sicarus Prime Barrel",0.2333},
                {"Sicarus Prime Blueprint",0.2333}
            }
        },
        ["RewardSet610"]={
            ["A"]={
                {"Bo Prime Handle",0.17},
                {"Ember Prime Chassis Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Frost Prime Blueprint",0.06},
                {"Sicarus Prime Barrel",0.2},
                {"Sicarus Prime Blueprint",0.2}
            }
        },
        ["RewardSet611"]={
            ["A"]={
                {"Bo Prime Handle",0.2},
                {"Ember Prime Chassis Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Frost Prime Blueprint",0.1},
                {"Sicarus Prime Barrel",0.1667},
                {"Sicarus Prime Blueprint",0.1667}
            }
        },
        ["RewardSet612"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.11},
                {"Burston Prime Receiver",0.2533},
                {"Fragor Prime Head",0.2533},
                {"Hydroid Prime Systems Blueprint",0.02},
                {"Orthos Prime Handle",0.2533},
                {"Tigris Prime Barrel",0.11}
            }
        },
        ["RewardSet613"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.13},
                {"Burston Prime Receiver",0.2333},
                {"Fragor Prime Head",0.2333},
                {"Hydroid Prime Systems Blueprint",0.04},
                {"Orthos Prime Handle",0.2333},
                {"Tigris Prime Barrel",0.13}
            }
        },
        ["RewardSet614"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.17},
                {"Burston Prime Receiver",0.2},
                {"Fragor Prime Head",0.2},
                {"Hydroid Prime Systems Blueprint",0.06},
                {"Orthos Prime Handle",0.2},
                {"Tigris Prime Barrel",0.17}
            }
        },
        ["RewardSet615"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.2},
                {"Burston Prime Receiver",0.1667},
                {"Fragor Prime Head",0.1667},
                {"Hydroid Prime Systems Blueprint",0.1},
                {"Orthos Prime Handle",0.1667},
                {"Tigris Prime Barrel",0.2}
            }
        },
        ["RewardSet616"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2533},
                {"Helios Prime Blueprint",0.11},
                {"Kogake Prime Gauntlet",0.02},
                {"None",0.2533},
                {"Valkyr Prime Blueprint",0.2533},
                {"Zephyr Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet617"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2333},
                {"Helios Prime Blueprint",0.13},
                {"Kogake Prime Gauntlet",0.04},
                {"None",0.2333},
                {"Valkyr Prime Blueprint",0.2333},
                {"Zephyr Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet618"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.2},
                {"Helios Prime Blueprint",0.17},
                {"Kogake Prime Gauntlet",0.06},
                {"None",0.2},
                {"Valkyr Prime Blueprint",0.2},
                {"Zephyr Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet619"]={
            ["A"]={
                {"Euphona Prime Blueprint",0.1667},
                {"Helios Prime Blueprint",0.2},
                {"Kogake Prime Gauntlet",0.1},
                {"None",0.1667},
                {"Valkyr Prime Blueprint",0.1667},
                {"Zephyr Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet620"]={
            ["A"]={
                {"Akbolto Prime Blueprint",0.2533},
                {"Bronco Prime Blueprint",0.2533},
                {"Euphona Prime Barrel",0.11},
                {"Helios Prime Blueprint",0.11},
                {"Mirage Prime Blueprint",0.02},
                {"Paris Prime String",0.2533}
            }
        },
        ["RewardSet621"]={
            ["A"]={
                {"Akbolto Prime Blueprint",0.2333},
                {"Bronco Prime Blueprint",0.2333},
                {"Euphona Prime Barrel",0.13},
                {"Helios Prime Blueprint",0.13},
                {"Mirage Prime Blueprint",0.04},
                {"Paris Prime String",0.2333}
            }
        },
        ["RewardSet622"]={
            ["A"]={
                {"Akbolto Prime Blueprint",0.2},
                {"Bronco Prime Blueprint",0.2},
                {"Euphona Prime Barrel",0.17},
                {"Helios Prime Blueprint",0.17},
                {"Mirage Prime Blueprint",0.06},
                {"Paris Prime String",0.2}
            }
        },
        ["RewardSet623"]={
            ["A"]={
                {"Akbolto Prime Blueprint",0.1667},
                {"Bronco Prime Blueprint",0.1667},
                {"Euphona Prime Barrel",0.2},
                {"Helios Prime Blueprint",0.2},
                {"Mirage Prime Blueprint",0.1},
                {"Paris Prime String",0.1667}
            }
        },
        ["RewardSet624"]={
            ["A"]={
                {"Forma Blueprint",0.2533},
                {"Hikou Prime Stars",0.2533},
                {"Kavasa Prime Kubrow Collar Blueprint",0.11},
                {"Nyx Prime Chassis Blueprint",0.02},
                {"Soma Prime Receiver",0.11},
                {"Vectis Prime Barrel",0.2533}
            }
        },
        ["RewardSet625"]={
            ["A"]={
                {"Forma Blueprint",0.2333},
                {"Hikou Prime Stars",0.2333},
                {"Kavasa Prime Kubrow Collar Blueprint",0.13},
                {"Nyx Prime Chassis Blueprint",0.04},
                {"Soma Prime Receiver",0.13},
                {"Vectis Prime Barrel",0.2333}
            }
        },
        ["RewardSet626"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Hikou Prime Stars",0.2},
                {"Kavasa Prime Kubrow Collar Blueprint",0.17},
                {"Nyx Prime Chassis Blueprint",0.06},
                {"Soma Prime Receiver",0.17},
                {"Vectis Prime Barrel",0.2}
            }
        },
        ["RewardSet627"]={
            ["A"]={
                {"Forma Blueprint",0.1667},
                {"Hikou Prime Stars",0.1667},
                {"Kavasa Prime Kubrow Collar Blueprint",0.2},
                {"Nyx Prime Chassis Blueprint",0.1},
                {"Soma Prime Receiver",0.2},
                {"Vectis Prime Barrel",0.1667}
            }
        },
        ["RewardSet628"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Lex Prime Blueprint",0.2533},
                {"Nova Prime Blueprint",0.11},
                {"Vasto Prime Barrel",0.2533},
                {"Vauban Prime Systems Blueprint",0.02}
            }
        },
        ["RewardSet629"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Lex Prime Blueprint",0.2333},
                {"Nova Prime Blueprint",0.13},
                {"Vasto Prime Barrel",0.2333},
                {"Vauban Prime Systems Blueprint",0.04}
            }
        },
        ["RewardSet630"]={
            ["A"]={
                {"Fang Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Lex Prime Blueprint",0.2},
                {"Nova Prime Blueprint",0.17},
                {"Vasto Prime Barrel",0.2},
                {"Vauban Prime Systems Blueprint",0.06}
            }
        },
        ["RewardSet631"]={
            ["A"]={
                {"Fang Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Blueprint",0.1667},
                {"Nova Prime Blueprint",0.2},
                {"Vasto Prime Barrel",0.1667},
                {"Vauban Prime Systems Blueprint",0.1}
            }
        },
        ["RewardSet632"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.11},
                {"Fang Prime Handle",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Nekros Prime Systems Blueprint",0.02},
                {"Odonata Prime Systems Blueprint",0.2533},
                {"Paris Prime String",0.2533}
            }
        },
        ["RewardSet633"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.13},
                {"Fang Prime Handle",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Nekros Prime Systems Blueprint",0.04},
                {"Odonata Prime Systems Blueprint",0.2333},
                {"Paris Prime String",0.2333}
            }
        },
        ["RewardSet634"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.17},
                {"Fang Prime Handle",0.17},
                {"Lex Prime Barrel",0.2},
                {"Nekros Prime Systems Blueprint",0.06},
                {"Odonata Prime Systems Blueprint",0.2},
                {"Paris Prime String",0.2}
            }
        },
        ["RewardSet635"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.2},
                {"Fang Prime Handle",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Nekros Prime Systems Blueprint",0.1},
                {"Odonata Prime Systems Blueprint",0.1667},
                {"Paris Prime String",0.1667}
            }
        },
        ["RewardSet636"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2533},
                {"Braton Prime Stock",0.2533},
                {"Forma Blueprint",0.11},
                {"Nikana Prime Blade",0.02},
                {"Paris Prime String",0.2533},
                {"Venka Prime Blueprint",0.11}
            }
        },
        ["RewardSet637"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2333},
                {"Braton Prime Stock",0.2333},
                {"Forma Blueprint",0.13},
                {"Nikana Prime Blade",0.04},
                {"Paris Prime String",0.2333},
                {"Venka Prime Blueprint",0.13}
            }
        },
        ["RewardSet638"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.2},
                {"Braton Prime Stock",0.2},
                {"Forma Blueprint",0.17},
                {"Nikana Prime Blade",0.06},
                {"Paris Prime String",0.2},
                {"Venka Prime Blueprint",0.17}
            }
        },
        ["RewardSet639"]={
            ["A"]={
                {"Ash Prime Chassis Blueprint",0.1667},
                {"Braton Prime Stock",0.1667},
                {"Forma Blueprint",0.2},
                {"Nikana Prime Blade",0.1},
                {"Paris Prime String",0.1667},
                {"Venka Prime Blueprint",0.2}
            }
        },
        ["RewardSet640"]={
            ["A"]={
                {"Akstiletto Prime Link",0.11},
                {"Ash Prime Systems Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Helios Prime Carapace",0.2533},
                {"Nikana Prime Blueprint",0.02},
                {"Saryn Prime Systems Blueprint",0.2533}
            }
        },
        ["RewardSet641"]={
            ["A"]={
                {"Akstiletto Prime Link",0.13},
                {"Ash Prime Systems Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Helios Prime Carapace",0.2333},
                {"Nikana Prime Blueprint",0.04},
                {"Saryn Prime Systems Blueprint",0.2333}
            }
        },
        ["RewardSet642"]={
            ["A"]={
                {"Akstiletto Prime Link",0.17},
                {"Ash Prime Systems Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Helios Prime Carapace",0.2},
                {"Nikana Prime Blueprint",0.06},
                {"Saryn Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet643"]={
            ["A"]={
                {"Akstiletto Prime Link",0.2},
                {"Ash Prime Systems Blueprint",0.2},
                {"Forma Blueprint",0.1667},
                {"Helios Prime Carapace",0.1667},
                {"Nikana Prime Blueprint",0.1},
                {"Saryn Prime Systems Blueprint",0.1667}
            }
        },
        ["RewardSet644"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2533},
                {"Cernos Prime Upper Limb",0.2533},
                {"Galatine Prime Blade",0.2533},
                {"Nikana Prime Hilt",0.02},
                {"Sybaris Prime Receiver",0.11},
                {"Trinity Prime Blueprint",0.11}
            }
        },
        ["RewardSet645"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2333},
                {"Cernos Prime Upper Limb",0.2333},
                {"Galatine Prime Blade",0.2333},
                {"Nikana Prime Hilt",0.04},
                {"Sybaris Prime Receiver",0.13},
                {"Trinity Prime Blueprint",0.13}
            }
        },
        ["RewardSet646"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2},
                {"Cernos Prime Upper Limb",0.2},
                {"Galatine Prime Blade",0.2},
                {"Nikana Prime Hilt",0.06},
                {"Sybaris Prime Receiver",0.17},
                {"Trinity Prime Blueprint",0.17}
            }
        },
        ["RewardSet647"]={
            ["A"]={
                {"Bronco Prime Receiver",0.1667},
                {"Cernos Prime Upper Limb",0.1667},
                {"Galatine Prime Blade",0.1667},
                {"Nikana Prime Hilt",0.1},
                {"Sybaris Prime Receiver",0.2},
                {"Trinity Prime Blueprint",0.2}
            }
        },
        ["RewardSet648"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.11},
                {"Euphona Prime Blueprint",0.2533},
                {"Nekros Prime Systems Blueprint",0.02},
                {"Trinity Prime Neuroptics Blueprint",0.2533},
                {"Valkyr Prime Neuroptics Blueprint",0.11},
                {"Venka Prime Blades",0.2533}
            }
        },
        ["RewardSet649"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.13},
                {"Euphona Prime Blueprint",0.2333},
                {"Nekros Prime Systems Blueprint",0.04},
                {"Trinity Prime Neuroptics Blueprint",0.2333},
                {"Valkyr Prime Neuroptics Blueprint",0.13},
                {"Venka Prime Blades",0.2333}
            }
        },
        ["RewardSet650"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.17},
                {"Euphona Prime Blueprint",0.2},
                {"Nekros Prime Systems Blueprint",0.06},
                {"Trinity Prime Neuroptics Blueprint",0.2},
                {"Valkyr Prime Neuroptics Blueprint",0.17},
                {"Venka Prime Blades",0.2}
            }
        },
        ["RewardSet651"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.2},
                {"Euphona Prime Blueprint",0.1667},
                {"Nekros Prime Systems Blueprint",0.1},
                {"Trinity Prime Neuroptics Blueprint",0.1667},
                {"Valkyr Prime Neuroptics Blueprint",0.2},
                {"Venka Prime Blades",0.1667}
            }
        },
        ["RewardSet652"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.11},
                {"Forma Blueprint",0.2533},
                {"Odonata Prime Harness Blueprint",0.2533},
                {"Odonata Prime Wings Blueprint",0.02},
                {"Volt Prime Blueprint",0.2533},
                {"Volt Prime Systems Blueprint",0.11}
            }
        },
        ["RewardSet653"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.13},
                {"Forma Blueprint",0.2333},
                {"Odonata Prime Harness Blueprint",0.2333},
                {"Odonata Prime Wings Blueprint",0.04},
                {"Volt Prime Blueprint",0.2333},
                {"Volt Prime Systems Blueprint",0.13}
            }
        },
        ["RewardSet654"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.17},
                {"Forma Blueprint",0.2},
                {"Odonata Prime Harness Blueprint",0.2},
                {"Odonata Prime Wings Blueprint",0.06},
                {"Volt Prime Blueprint",0.2},
                {"Volt Prime Systems Blueprint",0.17}
            }
        },
        ["RewardSet655"]={
            ["A"]={
                {"Aklex Prime Blueprint",0.2},
                {"Forma Blueprint",0.1667},
                {"Odonata Prime Harness Blueprint",0.1667},
                {"Odonata Prime Wings Blueprint",0.1},
                {"Volt Prime Blueprint",0.1667},
                {"Volt Prime Systems Blueprint",0.2}
            }
        },
        ["RewardSet656"]={
            ["A"]={
                {"Carrier Prime Carapace",0.2533},
                {"Forma Blueprint",0.11},
                {"Lex Prime Barrel",0.2533},
                {"Saryn Prime Blueprint",0.02},
                {"Soma Prime Blueprint",0.2533},
                {"Trinity Prime Chassis Blueprint",0.11}
            }
        },
        ["RewardSet657"]={
            ["A"]={
                {"Carrier Prime Carapace",0.2333},
                {"Forma Blueprint",0.13},
                {"Lex Prime Barrel",0.2333},
                {"Saryn Prime Blueprint",0.04},
                {"Soma Prime Blueprint",0.2333},
                {"Trinity Prime Chassis Blueprint",0.13}
            }
        },
        ["RewardSet658"]={
            ["A"]={
                {"Carrier Prime Carapace",0.2},
                {"Forma Blueprint",0.17},
                {"Lex Prime Barrel",0.2},
                {"Saryn Prime Blueprint",0.06},
                {"Soma Prime Blueprint",0.2},
                {"Trinity Prime Chassis Blueprint",0.17}
            }
        },
        ["RewardSet659"]={
            ["A"]={
                {"Carrier Prime Carapace",0.1667},
                {"Forma Blueprint",0.2},
                {"Lex Prime Barrel",0.1667},
                {"Saryn Prime Blueprint",0.1},
                {"Soma Prime Blueprint",0.1667},
                {"Trinity Prime Chassis Blueprint",0.2}
            }
        },
        ["RewardSet660"]={
            ["A"]={
                {"Burston Prime Stock",0.2533},
                {"Nova Prime Systems Blueprint",0.2533},
                {"Nyx Prime Systems Blueprint",0.11},
                {"Paris Prime Lower Limb",0.2533},
                {"Paris Prime Upper Limb",0.11},
                {"Saryn Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet661"]={
            ["A"]={
                {"Burston Prime Stock",0.2333},
                {"Nova Prime Systems Blueprint",0.2333},
                {"Nyx Prime Systems Blueprint",0.13},
                {"Paris Prime Lower Limb",0.2333},
                {"Paris Prime Upper Limb",0.13},
                {"Saryn Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet662"]={
            ["A"]={
                {"Burston Prime Stock",0.2},
                {"Nova Prime Systems Blueprint",0.2},
                {"Nyx Prime Systems Blueprint",0.17},
                {"Paris Prime Lower Limb",0.2},
                {"Paris Prime Upper Limb",0.17},
                {"Saryn Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet663"]={
            ["A"]={
                {"Burston Prime Stock",0.1667},
                {"Nova Prime Systems Blueprint",0.1667},
                {"Nyx Prime Systems Blueprint",0.2},
                {"Paris Prime Lower Limb",0.1667},
                {"Paris Prime Upper Limb",0.2},
                {"Saryn Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet664"]={
            ["A"]={
                {"Burston Prime Receiver",0.2533},
                {"Carrier Prime Blueprint",0.2533},
                {"Forma Blueprint",0.11},
                {"Soma Prime Barrel",0.2533},
                {"Spira Prime Blade",0.02},
                {"Vasto Prime Blueprint",0.11}
            }
        },
        ["RewardSet665"]={
            ["A"]={
                {"Burston Prime Receiver",0.2333},
                {"Carrier Prime Blueprint",0.2333},
                {"Forma Blueprint",0.13},
                {"Soma Prime Barrel",0.2333},
                {"Spira Prime Blade",0.04},
                {"Vasto Prime Blueprint",0.13}
            }
        },
        ["RewardSet666"]={
            ["A"]={
                {"Burston Prime Receiver",0.2},
                {"Carrier Prime Blueprint",0.2},
                {"Forma Blueprint",0.17},
                {"Soma Prime Barrel",0.2},
                {"Spira Prime Blade",0.06},
                {"Vasto Prime Blueprint",0.17}
            }
        },
        ["RewardSet667"]={
            ["A"]={
                {"Burston Prime Receiver",0.1667},
                {"Carrier Prime Blueprint",0.1667},
                {"Forma Blueprint",0.2},
                {"Soma Prime Barrel",0.1667},
                {"Spira Prime Blade",0.1},
                {"Vasto Prime Blueprint",0.2}
            }
        },
        ["RewardSet668"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2533},
                {"Frost Prime Systems Blueprint",0.11},
                {"Glaive Prime Disc",0.11},
                {"Latron Prime Receiver",0.2533},
                {"Reaper Prime Blueprint",0.2533},
                {"Sicarus Prime Receiver",0.02}
            }
        },
        ["RewardSet669"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2333},
                {"Frost Prime Systems Blueprint",0.13},
                {"Glaive Prime Disc",0.13},
                {"Latron Prime Receiver",0.2333},
                {"Reaper Prime Blueprint",0.2333},
                {"Sicarus Prime Receiver",0.04}
            }
        },
        ["RewardSet670"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.2},
                {"Frost Prime Systems Blueprint",0.17},
                {"Glaive Prime Disc",0.17},
                {"Latron Prime Receiver",0.2},
                {"Reaper Prime Blueprint",0.2},
                {"Sicarus Prime Receiver",0.06}
            }
        },
        ["RewardSet671"]={
            ["A"]={
                {"Ember Prime Neuroptics Blueprint",0.1667},
                {"Frost Prime Systems Blueprint",0.2},
                {"Glaive Prime Disc",0.2},
                {"Latron Prime Receiver",0.1667},
                {"Reaper Prime Blueprint",0.1667},
                {"Sicarus Prime Receiver",0.1}
            }
        },
        ["RewardSet672"]={
            ["A"]={
                {"Burston Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Kavasa Prime Buckle",0.11},
                {"None",0.02},
                {"Tigris Prime Receiver",0.11},
                {"Trinity Prime Neuroptics Blueprint",0.2533}
            }
        },
        ["RewardSet673"]={
            ["A"]={
                {"Burston Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Kavasa Prime Buckle",0.13},
                {"None",0.04},
                {"Tigris Prime Receiver",0.13},
                {"Trinity Prime Neuroptics Blueprint",0.2333}
            }
        },
        ["RewardSet674"]={
            ["A"]={
                {"Burston Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Kavasa Prime Buckle",0.17},
                {"None",0.06},
                {"Tigris Prime Receiver",0.17},
                {"Trinity Prime Neuroptics Blueprint",0.2}
            }
        },
        ["RewardSet675"]={
            ["A"]={
                {"Burston Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Kavasa Prime Buckle",0.2},
                {"None",0.1},
                {"Tigris Prime Receiver",0.2},
                {"Trinity Prime Neuroptics Blueprint",0.1667}
            }
        },
        ["RewardSet676"]={
            ["A"]={
                {"Ballistica Prime Receiver",0.11},
                {"Banshee Prime Neuroptics Blueprint",0.2533},
                {"Fang Prime Blade",0.2533},
                {"Helios Prime Carapace",0.2533},
                {"None",0.02},
                {"Sybaris Prime Receiver",0.11}
            }
        },
        ["RewardSet677"]={
            ["A"]={
                {"Ballistica Prime Receiver",0.13},
                {"Banshee Prime Neuroptics Blueprint",0.2333},
                {"Fang Prime Blade",0.2333},
                {"Helios Prime Carapace",0.2333},
                {"None",0.04},
                {"Sybaris Prime Receiver",0.13}
            }
        },
        ["RewardSet678"]={
            ["A"]={
                {"Ballistica Prime Receiver",0.17},
                {"Banshee Prime Neuroptics Blueprint",0.2},
                {"Fang Prime Blade",0.2},
                {"Helios Prime Carapace",0.2},
                {"None",0.06},
                {"Sybaris Prime Receiver",0.17}
            }
        },
        ["RewardSet679"]={
            ["A"]={
                {"Ballistica Prime Receiver",0.2},
                {"Banshee Prime Neuroptics Blueprint",0.1667},
                {"Fang Prime Blade",0.1667},
                {"Helios Prime Carapace",0.1667},
                {"None",0.1},
                {"Sybaris Prime Receiver",0.2}
            }
        },
        ["RewardSet680"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2533},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Blueprint",0.11},
                {"Hydroid Prime Chassis Blueprint",0.2533},
                {"Nikana Prime Blueprint",0.11},
                {"Spira Prime Pouch",0.02}
            }
        },
        ["RewardSet681"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2333},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Blueprint",0.13},
                {"Hydroid Prime Chassis Blueprint",0.2333},
                {"Nikana Prime Blueprint",0.13},
                {"Spira Prime Pouch",0.04}
            }
        },
        ["RewardSet682"]={
            ["A"]={
                {"Bronco Prime Receiver",0.2},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Blueprint",0.17},
                {"Hydroid Prime Chassis Blueprint",0.2},
                {"Nikana Prime Blueprint",0.17},
                {"Spira Prime Pouch",0.06}
            }
        },
        ["RewardSet683"]={
            ["A"]={
                {"Bronco Prime Receiver",0.1667},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Blueprint",0.2},
                {"Hydroid Prime Chassis Blueprint",0.1667},
                {"Nikana Prime Blueprint",0.2},
                {"Spira Prime Pouch",0.1}
            }
        },
        ["RewardSet684"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.11},
                {"Burston Prime Blueprint",0.2533},
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Handle",0.11},
                {"Tigris Prime Blueprint",0.02}
            }
        },
        ["RewardSet685"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.13},
                {"Burston Prime Blueprint",0.2333},
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Handle",0.13},
                {"Tigris Prime Blueprint",0.04}
            }
        },
        ["RewardSet686"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.17},
                {"Burston Prime Blueprint",0.2},
                {"Dual Kamas Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Handle",0.17},
                {"Tigris Prime Blueprint",0.06}
            }
        },
        ["RewardSet687"]={
            ["A"]={
                {"Banshee Prime Blueprint",0.2},
                {"Burston Prime Blueprint",0.1667},
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Handle",0.2},
                {"Tigris Prime Blueprint",0.1}
            }
        },
        ["RewardSet688"]={
            ["A"]={
                {"Bronco Prime Barrel",0.11},
                {"Dual Kamas Prime Blueprint",0.2533},
                {"Forma Blueprint",0.2533},
                {"Nova Prime Chassis Blueprint",0.02},
                {"Nyx Prime Blueprint",0.2533},
                {"Volt Prime Blueprint",0.11}
            }
        },
        ["RewardSet689"]={
            ["A"]={
                {"Bronco Prime Barrel",0.13},
                {"Dual Kamas Prime Blueprint",0.2333},
                {"Forma Blueprint",0.2333},
                {"Nova Prime Chassis Blueprint",0.04},
                {"Nyx Prime Blueprint",0.2333},
                {"Volt Prime Blueprint",0.13}
            }
        },
        ["RewardSet690"]={
            ["A"]={
                {"Bronco Prime Barrel",0.17},
                {"Dual Kamas Prime Blueprint",0.2},
                {"Forma Blueprint",0.2},
                {"Nova Prime Chassis Blueprint",0.06},
                {"Nyx Prime Blueprint",0.2},
                {"Volt Prime Blueprint",0.17}
            }
        },
        ["RewardSet691"]={
            ["A"]={
                {"Bronco Prime Barrel",0.2},
                {"Dual Kamas Prime Blueprint",0.1667},
                {"Forma Blueprint",0.1667},
                {"Nova Prime Chassis Blueprint",0.1},
                {"Nyx Prime Blueprint",0.1667},
                {"Volt Prime Blueprint",0.2}
            }
        },
        ["RewardSet692"]={
            ["A"]={
                {"Braton Prime Stock",0.2533},
                {"Fang Prime Handle",0.2533},
                {"Forma Blueprint",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Galatine Prime Handle",0.11},
                {"Vauban Prime Blueprint",0.02}
            }
        },
        ["RewardSet693"]={
            ["A"]={
                {"Braton Prime Stock",0.2333},
                {"Fang Prime Handle",0.2333},
                {"Forma Blueprint",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Galatine Prime Handle",0.13},
                {"Vauban Prime Blueprint",0.04}
            }
        },
        ["RewardSet694"]={
            ["A"]={
                {"Braton Prime Stock",0.2},
                {"Fang Prime Handle",0.2},
                {"Forma Blueprint",0.17},
                {"Galatine Prime Blade",0.2},
                {"Galatine Prime Handle",0.17},
                {"Vauban Prime Blueprint",0.06}
            }
        },
        ["RewardSet695"]={
            ["A"]={
                {"Braton Prime Stock",0.1667},
                {"Fang Prime Handle",0.1667},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Galatine Prime Handle",0.2},
                {"Vauban Prime Blueprint",0.1}
            }
        },
        ["RewardSet696"]={
            ["A"]={
                {"Carrier Prime Systems",0.2533},
                {"Forma Blueprint",0.11},
                {"Galatine Prime Blade",0.2533},
                {"Paris Prime String",0.2533},
                {"Tigris Prime Receiver",0.11},
                {"Vauban Prime Neuroptics Blueprint",0.02}
            }
        },
        ["RewardSet697"]={
            ["A"]={
                {"Carrier Prime Systems",0.2333},
                {"Forma Blueprint",0.13},
                {"Galatine Prime Blade",0.2333},
                {"Paris Prime String",0.2333},
                {"Tigris Prime Receiver",0.13},
                {"Vauban Prime Neuroptics Blueprint",0.04}
            }
        },
        ["RewardSet698"]={
            ["A"]={
                {"Carrier Prime Systems",0.2},
                {"Forma Blueprint",0.17},
                {"Galatine Prime Blade",0.2},
                {"Paris Prime String",0.2},
                {"Tigris Prime Receiver",0.17},
                {"Vauban Prime Neuroptics Blueprint",0.06}
            }
        },
        ["RewardSet699"]={
            ["A"]={
                {"Carrier Prime Systems",0.1667},
                {"Forma Blueprint",0.2},
                {"Galatine Prime Blade",0.1667},
                {"Paris Prime String",0.1667},
                {"Tigris Prime Receiver",0.2},
                {"Vauban Prime Neuroptics Blueprint",0.1}
            }
        },
        ["RewardSet700"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.11},
                {"Bronco Prime Receiver",0.2533},
                {"Cernos Prime Grip",0.2533},
                {"Saryn Prime Neuroptics Blueprint",0.11},
                {"Tigris Prime Stock",0.2533},
                {"Venka Prime Gauntlet",0.02}
            }
        },
        ["RewardSet701"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.13},
                {"Bronco Prime Receiver",0.2333},
                {"Cernos Prime Grip",0.2333},
                {"Saryn Prime Neuroptics Blueprint",0.13},
                {"Tigris Prime Stock",0.2333},
                {"Venka Prime Gauntlet",0.04}
            }
        },
        ["RewardSet702"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.17},
                {"Bronco Prime Receiver",0.2},
                {"Cernos Prime Grip",0.2},
                {"Saryn Prime Neuroptics Blueprint",0.17},
                {"Tigris Prime Stock",0.2},
                {"Venka Prime Gauntlet",0.06}
            }
        },
        ["RewardSet703"]={
            ["A"]={
                {"Ash Prime Neuroptics Blueprint",0.2},
                {"Bronco Prime Receiver",0.1667},
                {"Cernos Prime Grip",0.1667},
                {"Saryn Prime Neuroptics Blueprint",0.2},
                {"Tigris Prime Stock",0.1667},
                {"Venka Prime Gauntlet",0.1}
            }
        },
        ["RewardSet704"]={
            ["A"]={
                {"Burston Prime Barrel",0.11},
                {"Forma Blueprint",0.11},
                {"Helios Prime Carapace",0.2533},
                {"None",0.2533},
                {"Paris Prime String",0.2533},
                {"Vauban Prime Neuroptics Blueprint",0.02}
            }
        },
        ["RewardSet705"]={
            ["A"]={
                {"Burston Prime Barrel",0.13},
                {"Forma Blueprint",0.13},
                {"Helios Prime Carapace",0.2333},
                {"None",0.2333},
                {"Paris Prime String",0.2333},
                {"Vauban Prime Neuroptics Blueprint",0.04}
            }
        },
        ["RewardSet706"]={
            ["A"]={
                {"Burston Prime Barrel",0.17},
                {"Forma Blueprint",0.17},
                {"Helios Prime Carapace",0.2},
                {"None",0.2},
                {"Paris Prime String",0.2},
                {"Vauban Prime Neuroptics Blueprint",0.06}
            }
        },
        ["RewardSet707"]={
            ["A"]={
                {"Burston Prime Barrel",0.2},
                {"Forma Blueprint",0.2},
                {"Helios Prime Carapace",0.1667},
                {"None",0.1667},
                {"Paris Prime String",0.1667},
                {"Vauban Prime Neuroptics Blueprint",0.1}
            }
        },
        ["RewardSet708"]={
            ["A"]={
                {"Burston Prime Stock",0.2533},
                {"Cernos Prime Grip",0.2533},
                {"Forma Blueprint",0.2533},
                {"Fragor Prime Handle",0.11},
                {"Mirage Prime Systems Blueprint",0.11},
                {"Vauban Prime Chassis Blueprint",0.02}
            }
        },
        ["RewardSet709"]={
            ["A"]={
                {"Burston Prime Stock",0.2333},
                {"Cernos Prime Grip",0.2333},
                {"Forma Blueprint",0.2333},
                {"Fragor Prime Handle",0.13},
                {"Mirage Prime Systems Blueprint",0.13},
                {"Vauban Prime Chassis Blueprint",0.04}
            }
        },
        ["RewardSet710"]={
            ["A"]={
                {"Burston Prime Stock",0.2},
                {"Cernos Prime Grip",0.2},
                {"Forma Blueprint",0.2},
                {"Fragor Prime Handle",0.17},
                {"Mirage Prime Systems Blueprint",0.17},
                {"Vauban Prime Chassis Blueprint",0.06}
            }
        },
        ["RewardSet711"]={
            ["A"]={
                {"Burston Prime Stock",0.1667},
                {"Cernos Prime Grip",0.1667},
                {"Forma Blueprint",0.1667},
                {"Fragor Prime Handle",0.2},
                {"Mirage Prime Systems Blueprint",0.2},
                {"Vauban Prime Chassis Blueprint",0.1}
            }
        },
        ["RewardSet712"]={
            ["A"]={
                {"Forma Blueprint",0.11},
                {"Galatine Prime Handle",0.11},
                {"Nekros Prime Chassis Blueprint",0.2533},
                {"Orthos Prime Handle",0.2533},
                {"Paris Prime Blueprint",0.2533},
                {"Zephyr Prime Blueprint",0.02}
            }
        },
        ["RewardSet713"]={
            ["A"]={
                {"Forma Blueprint",0.13},
                {"Galatine Prime Handle",0.13},
                {"Nekros Prime Chassis Blueprint",0.2333},
                {"Orthos Prime Handle",0.2333},
                {"Paris Prime Blueprint",0.2333},
                {"Zephyr Prime Blueprint",0.04}
            }
        },
        ["RewardSet714"]={
            ["A"]={
                {"Forma Blueprint",0.17},
                {"Galatine Prime Handle",0.17},
                {"Nekros Prime Chassis Blueprint",0.2},
                {"Orthos Prime Handle",0.2},
                {"Paris Prime Blueprint",0.2},
                {"Zephyr Prime Blueprint",0.06}
            }
        },
        ["RewardSet715"]={
            ["A"]={
                {"Forma Blueprint",0.2},
                {"Galatine Prime Handle",0.2},
                {"Nekros Prime Chassis Blueprint",0.1667},
                {"Orthos Prime Handle",0.1667},
                {"Paris Prime Blueprint",0.1667},
                {"Zephyr Prime Blueprint",0.1}
            }
        },
        ["RewardSet716"]={
            ["A"]={
                {"Ammo Drum",0.0221},
                {"Fast Deflection",0.1518},
                {"Fast Deflection",0.1518},
                {"Fast Hands",0.0221},
                {"Lith B2 Relic",0.0221},
                {"Lith C2 Relic",0.0221},
                {"Lith H2 Relic",0.0221},
                {"Lith N3 Relic",0.0221},
                {"Lith S7 Relic",0.0221},
                {"Lith T1 Relic",0.0221},
                {"Lith Z1 Relic",0.0221},
                {"Magazine Warp",0.1518},
                {"Pressure Point",0.0201},
                {"Rush",0.0221},
                {"Trick Mag",0.1518},
                {"Vitality",0.1518}
            },
            ["B"]={
                {"Blunderbuss",0.0843},
                {"Fast Hands",0.0184},
                {"Fury",0.0201},
                {"Hornet Strike",0.0184},
                {"Meso G1 Relic",0.0184},
                {"Meso N5 Relic",0.0184},
                {"Meso O2 Relic",0.0184},
                {"Meso T1 Relic",0.0184},
                {"Meso T2 Relic",0.0184},
                {"Metal Auger",0.0184},
                {"No Return",0.0843},
                {"Piercing Hit",0.0184},
                {"Pistol Gambit",0.0843},
                {"Point Blank",0.0184},
                {"Point Strike",0.0843},
                {"Pressure Point",0.0843},
                {"Ravage",0.0843},
                {"Reflex Coil",0.0184},
                {"Serration",0.0184},
                {"Speed Trigger",0.0843},
                {"Target Cracker",0.0843},
                {"Vital Sense",0.0843}
            },
            ["C"]={
                {"50 Endo",0.1084},
                {"80 Endo",0.0184},
                {"Barrel Diffusion",0.0184},
                {"Heated Charge",0.1084},
                {"Hellfire",0.1084},
                {"Intensify",0.0184},
                {"Meso G1 Relic",0.1084},
                {"Meso N5 Relic",0.1084},
                {"Meso O2 Relic",0.1084},
                {"Meso T1 Relic",0.1084},
                {"Meso T2 Relic",0.0184},
                {"Molten Impact",0.0184},
                {"Neo B2 Relic",0.0184},
                {"Neo B4 Relic",0.0184},
                {"Neo K1 Relic",0.0184},
                {"Neo M1 Relic",0.0184},
                {"Neo S7 Relic",0.0184},
                {"Neo Z1 Relic",0.0184},
                {"Streamline",0.0184},
                {"Thunderbolt",0.0201}
            }
        },
        ["RewardSet717"]={
            ["A"]={
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0}
            },
            ["B"]={
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0}
            },
            ["C"]={
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0},
                {"Clem Clone Blueprint",1.0}
            }
        },
        ["RewardSet718"]={
            ["A"]={
                {"Mesa Chassis Blueprint",0.3872},
                {"Mesa Chassis Blueprint",0.3872},
                {"Mesa Neuroptics Blueprint",0.3872},
                {"Mesa Neuroptics Blueprint",0.3872},
                {"Mesa Systems Blueprint",0.2256},
                {"Mesa Systems Blueprint",0.2256}
            }
        },
        ["RewardSet719"]={
            ["B"]={
                {"2000 Credits Cache",0.3333},
                {"5000 Credits Cache",0.3333},
                {"80 Endo",0.3333}
            },
            ["C"]={
                {"2000 Credits Cache",0.3333},
                {"5000 Credits Cache",0.3333},
                {"80 Endo",0.3333}
            }
        },
        ["RewardSet720"]={
            ["A"]={
                {"150 Endo",0.1},
                {"240 Endo",0.1},
                {"Lith B2 Relic",0.1},
                {"Lith C2 Relic",0.1},
                {"Lith H2 Relic",0.1},
                {"Lith N3 Relic",0.1},
                {"Lith S7 Relic",0.1},
                {"Lith T1 Relic",0.1},
                {"Lith V3 Relic",0.1},
                {"Lith Z1 Relic",0.1}
            },
            ["B"]={
                {"150 Endo",0.3872},
                {"240 Endo",0.3872},
                {"Mutalist Alad V Nav Coordinate",0.2256}
            },
            ["C"]={
                {"Forma Blueprint",0.2256},
                {"Meso G1 Relic",0.1549},
                {"Meso N5 Relic",0.1549},
                {"Meso O2 Relic",0.1549},
                {"Meso T1 Relic",0.1549},
                {"Meso T2 Relic",0.1549}
            }
        },
        ["RewardSet721"]={
            ["A"]={
                {"Nekros Chassis Blueprint",0.3333},
                {"Nekros Chassis Blueprint",0.3333},
                {"Nekros Neuroptics Blueprint",0.3333},
                {"Nekros Neuroptics Blueprint",0.3333},
                {"Nekros Systems Blueprint",0.3333},
                {"Nekros Systems Blueprint",0.3333}
            }
        },
        ["RewardSet722"]={
            ["A"]={
                {"320 Endo",0.1},
                {"400 Endo",0.1},
                {"Lith B2 Relic",0.1},
                {"Lith C2 Relic",0.1},
                {"Lith H2 Relic",0.1},
                {"Lith N3 Relic",0.1},
                {"Lith S7 Relic",0.1},
                {"Lith T1 Relic",0.1},
                {"Lith V3 Relic",0.1},
                {"Lith Z1 Relic",0.1}
            },
            ["B"]={
                {"Mutalist Alad V Nav Coordinate",0.1429},
                {"Neo B2 Relic",0.1429},
                {"Neo B4 Relic",0.1429},
                {"Neo K1 Relic",0.1429},
                {"Neo M1 Relic",0.1429},
                {"Neo S7 Relic",0.1429},
                {"Neo Z1 Relic",0.1429}
            },
            ["C"]={
                {"Axi A3 Relic",0.0968},
                {"Axi E2 Relic",0.0968},
                {"Axi H3 Relic",0.0968},
                {"Axi K2 Relic",0.0968},
                {"Axi N5 Relic",0.0968},
                {"Axi O2 Relic",0.0968},
                {"Axi V6 Relic",0.0968},
                {"Axi V7 Relic",0.0968},
                {"Octavia Neuroptics Blueprint",0.2256}
            }
        },
        ["RewardSet723"]={
            ["A"]={
                {"Atlas Chassis Blueprint",0.3872},
                {"Atlas Neuroptics Blueprint",0.3872},
                {"Atlas Systems Blueprint",0.2256}
            }
        },
        ["RewardSet724"]={
            ["A"]={
                {"Hydroid Chassis Blueprint",0.3872},
                {"Hydroid Neuroptics Blueprint",0.3872},
                {"Hydroid Systems Blueprint",0.2256}
            }
        },
        ["RewardSet725"]={
            ["A"]={
                {"400 Endo",0.3872},
                {"Imperator Vandal Barrel",0.1128},
                {"Imperator Vandal Blueprint",0.3872},
                {"Imperator Vandal Receiver",0.1128}
            }
        },
        ["RewardSet726"]={
            ["A"]={
                {"Nyx Chassis Blueprint",0.3872},
                {"Nyx Neuroptics Blueprint",0.3872},
                {"Nyx Systems Blueprint",0.2256}
            }
        },
        ["RewardSet727"]={
            ["A"]={
                {"300 Endo",0.0917},
                {"Corpus Ship Freight Scene",0.0917},
                {"Grineer Sealab Centrifuge Scene",0.0917},
                {"Khora Chassis Blueprint",0.0833},
                {"Lith B2 Relic",0.0917},
                {"Lith C2 Relic",0.0917},
                {"Lith H2 Relic",0.0917},
                {"Lith N3 Relic",0.0917},
                {"Lith S7 Relic",0.0917},
                {"Lith T1 Relic",0.0917},
                {"Lith Z1 Relic",0.0917}
            },
            ["B"]={
                {"300 Endo",0.0769},
                {"Grineer Settlement Artillery Scene",0.0769},
                {"Khora Neuroptics Blueprint",0.0769},
                {"Meso G1 Relic",0.0769},
                {"Meso G1 Relic",0.0769},
                {"Meso N5 Relic",0.0769},
                {"Meso N5 Relic",0.0769},
                {"Meso O2 Relic",0.0769},
                {"Meso T1 Relic",0.0769},
                {"Meso T1 Relic",0.0769},
                {"Meso T2 Relic",0.0769},
                {"Meso T2 Relic",0.0769},
                {"Synthetic Eidolon Shard",0.0769}
            },
            ["C"]={
                {"600 Endo",0.1549},
                {"Khora Blueprint",0.0564},
                {"Khora Systems Blueprint",0.0564},
                {"Neo B2 Relic",0.1549},
                {"Neo B4 Relic",0.0564},
                {"Neo K1 Relic",0.1549},
                {"Neo M1 Relic",0.1549},
                {"Neo S7 Relic",0.0564},
                {"Neo Z1 Relic",0.1549}
            }
        },
        ["RewardSet728"]={
            ["A"]={
                {"400 Endo",0.1897},
                {"Khora Chassis Blueprint",0.0316},
                {"Kuva Fortress Crevice Scene",0.0316},
                {"Lato Vandal Receiver",0.0201},
                {"Lith B2 Relic (Radiant)",0.0316},
                {"Lith C2 Relic (Radiant)",0.1897},
                {"Lith H2 Relic (Radiant)",0.1897},
                {"Lith N3 Relic (Radiant)",0.0316},
                {"Lith S7 Relic (Radiant)",0.1897},
                {"Lith T1 Relic (Radiant)",0.0316},
                {"Lith Z1 Relic (Radiant)",0.0316},
                {"Lua Balcony Scene",0.0316}
            },
            ["B"]={
                {"400 Endo",0.0948},
                {"Braton Vandal Barrel",0.0369},
                {"Braton Vandal Receiver",0.0369},
                {"Khora Neuroptics Blueprint",0.0369},
                {"Lato Vandal Blueprint",0.0201},
                {"Meso G1 Relic (Radiant)",0.0369},
                {"Meso G1 Relic (Radiant)",0.0948},
                {"Meso N5 Relic (Radiant)",0.0369},
                {"Meso N5 Relic (Radiant)",0.0369},
                {"Meso O2 Relic (Radiant)",0.0948},
                {"Meso T1 Relic (Radiant)",0.0948},
                {"Meso T1 Relic (Radiant)",0.0948},
                {"Meso T2 Relic (Radiant)",0.0948},
                {"Meso T2 Relic (Radiant)",0.0948},
                {"Synthetic Eidolon Shard",0.0948}
            },
            ["C"]={
                {"750 Endo",0.1518},
                {"Braton Vandal Blueprint",0.0201},
                {"Braton Vandal Stock",0.0316},
                {"Khora Blueprint",0.0316},
                {"Khora Systems Blueprint",0.0316},
                {"Lato Vandal Barrel",0.0316},
                {"Neo B2 Relic (Radiant)",0.1518},
                {"Neo B4 Relic (Radiant)",0.0316},
                {"Neo K1 Relic (Radiant)",0.1518},
                {"Neo M1 Relic (Radiant)",0.1518},
                {"Neo S7 Relic (Radiant)",0.0316},
                {"Neo Z1 Relic (Radiant)",0.1518},
                {"Peculiar Bloom",0.0316}
            }
        },
        ["RewardSet729"]={
            ["A"]={
                {"Accelerated Blast",0.1897},
                {"Blaze",0.0101},
                {"Chilling Reload",0.2211},
                {"Hammer Shot",0.0101},
                {"Ice Storm",0.1897},
                {"Stunning Speed",0.1897},
                {"Wildfire",0.1897}
            },
            ["B"]={
                {"Armored Agility",0.1549},
                {"Drifting Contact",0.2256},
                {"Fortitude",0.1549},
                {"Rending Strike",0.1549},
                {"Seeking Fury",0.1549},
                {"Shred",0.1549}
            },
            ["C"]={
                {"Animal Instinct",0.1549},
                {"Constitution",0.1549},
                {"Focus Energy",0.1549},
                {"Lethal Torrent",0.1549},
                {"Streamlined Form",0.2256},
                {"Vigor",0.1549}
            }
        },
        ["RewardSet730"]={
            ["A"]={
                {"Auger Strike",0.0553},
                {"Bore",0.0553},
                {"Breach Loader",0.0553},
                {"Gorgon Wraith Barrel",0.1897},
                {"Gorgon Wraith Blueprint",0.1897},
                {"Gorgon Wraith Receiver",0.1897},
                {"Gorgon Wraith Stock",0.1897},
                {"Magma Chamber",0.0101},
                {"Piercing Caliber",0.0553},
                {"Searing Steel",0.0101}
            }
        },
        ["RewardSet731"]={
            ["A"]={
                {"Anemic Agility",0.0417},
                {"Blind Rage",0.0417},
                {"Burdened Magazine",0.0417},
                {"Corrupt Charge",0.0417},
                {"Creeping Bullseye",0.0417},
                {"Critical Deceleration",0.0417},
                {"Critical Delay",0.0417},
                {"Depleted Reload",0.0417},
                {"Fleeting Expertise",0.0417},
                {"Frail Momentum",0.0417},
                {"Heavy Caliber",0.0417},
                {"Hollow Point",0.0417},
                {"Magnum Force",0.0417},
                {"Narrow Minded",0.0417},
                {"Overextended",0.0417},
                {"Spoiled Strike",0.0417},
                {"Spoiled Strike",0.0417},
                {"Tainted Clip",0.0417},
                {"Tainted Mag",0.0417},
                {"Tainted Shell",0.0417},
                {"Transient Fortitude",0.0417},
                {"Vicious Spread",0.0417},
                {"Vile Acceleration",0.0417},
                {"Vile Precision",0.0417}
            }
        },
        ["RewardSet732"]={
            ["A"]={
                {"1000 Credits Cache",0.1265},
                {"15 Endo",0.1265},
                {"1500 Credits Cache",0.1265},
                {"5X Grokdrul",0.1265},
                {"5X Iradite",0.1265},
                {"5X Nistlepod",0.1265},
                {"Convulsion",0.0201},
                {"Deep Freeze",0.0201},
                {"Eleventh Storm",0.0201},
                {"Fever Strike",0.0201},
                {"Heated Charge",0.0201},
                {"Maprico",0.0201},
                {"Molten Impact",0.0201},
                {"North Wind",0.0201},
                {"Pathogen Rounds",0.0201},
                {"Shocking Touch",0.0201},
                {"Spinning Needle",0.0201},
                {"Target Acquired",0.0101},
                {"Tempo Royale",0.0101}
            },
            ["B"]={
                {"10X Grokdrul",0.1265},
                {"10X Iradite",0.1265},
                {"10X Nistlepod",0.1265},
                {"2000 Credits Cache",0.1265},
                {"2500 Credits Cache",0.1265},
                {"2X Maprico",0.0184},
                {"50 Endo",0.1265},
                {"Bullet Dance",0.0101},
                {"Charged Shell",0.0184},
                {"Chilling Grasp",0.0184},
                {"Contagious Spread",0.0184},
                {"Cryo Rounds",0.0184},
                {"Hellfire",0.0184},
                {"Homing Fang",0.0184},
                {"Incendiary Coat",0.0184},
                {"Infected Clip",0.0184},
                {"Sovereign Outcast",0.0184},
                {"Spring-Loaded Blade",0.0101},
                {"Stormbringer",0.0184},
                {"Sundering Weave",0.0184}
            },
            ["C"]={
                {"3000 Credits Cache",0.1265},
                {"4000 Credits Cache",0.1265},
                {"80 Endo",0.1265},
                {"Atlantis Vulcan",0.0276},
                {"Blazing Steel",0.0276},
                {"Blind Justice",0.0276},
                {"Combustion Rounds",0.0276},
                {"Eidolon Madurai Lens Blueprint",0.0029},
                {"Eidolon Naramon Lens Blueprint",0.0029},
                {"Eidolon Unairu Lens Blueprint",0.0029},
                {"Eidolon Vazarin Lens Blueprint",0.0029},
                {"Eidolon Zenurik Lens Blueprint",0.0029},
                {"Electrified Barrel",0.1265},
                {"Galvanized Blade",0.0276},
                {"Glacial Edge",0.0276},
                {"Kinetic Diversion",0.0029},
                {"Poisonous Sting",0.0276},
                {"Polar Magazine",0.1265},
                {"Shattering Storm",0.0276},
                {"Venomous Clip",0.1265},
                {"Vulpine Mask",0.0029}
            }
        },
        ["RewardSet733"]={
            ["A"]={
                {"4000 Endo",0.121},
                {"6000X Kuva",0.14},
                {"Affinity Booster",0.0327},
                {"Ayatan Anasa Sculpture",0.28},
                {"Credit Booster",0.0327},
                {"Exilus Adapter",0.025},
                {"Forma",0.025},
                {"Legendary Core",0.0018},
                {"Melee Riven Mod",0.02},
                {"Melee Riven Mod",0.0814},
                {"Orokin Catalyst Blueprint",0.025},
                {"Orokin Reactor Blueprint",0.025},
                {"Pistol Riven Mod",0.0761},
                {"Resource Drop Chance Booster",0.0327},
                {"Rifle Riven Mod",0.0679},
                {"Shotgun Riven Mod",0.0136}
            }
        },
        ["RewardSet734"]={
            ["3.00%"]={
                {"Ammo Stock",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Stock",0.0553},
                {"Endo",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            }
        },
        ["RewardSet735"]={
            ["3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            }
        },
        ["RewardSet736"]={
            ["3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            }
        },
        ["RewardSet737"]={
            ["3.00%"]={
                {"Ammo Stock",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Stock",0.0553},
                {"Endo",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            }
        },
        ["RewardSet738"]={
            ["3.00%"]={
                {"Ammo Stock",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Stock",0.0553},
                {"Endo",0.0553},
                {"Enhanced Vitality",0.2529},
                {"Gunslinger",0.0553},
                {"Insulation",0.2529},
                {"Point Strike",0.2529},
                {"Rage",0.0201},
                {"Rending Crane",0.0553}
            }
        },
        ["RewardSet739"]={
            ["3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Berserker",0.2},
                {"Decisive Judgement",0.2},
                {"Flow",0.2},
                {"Master Thief",0.2},
                {"Rage",0.2}
            }
        },
        ["RewardSet740"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Efficient Transferral",0.0201},
                {"Extend",0.2529},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Magazine Extension",0.2529},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Efficient Transferral",0.0201},
                {"Endo",0.3367},
                {"Endo",0.474},
                {"Extend",0.2529},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Magazine Extension",0.2529},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet741"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet742"]={
            ["50.00%"]={
                {"Barrel Diffusion",0.2},
                {"Brakk Blueprint",0.5},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Scimitar Fuselage Blueprint",0.5},
                {"Split Chamber",0.2}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Brakk Blueprint",0.5},
                {"Scimitar Fuselage Blueprint",0.5}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Neurodes",1.0}
            },
            ["Mod Drop Chance: 50.00%"]={
                {"Barrel Diffusion",0.2},
                {"Endo",0.2},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Split Chamber",0.2}
            }
        },
        ["RewardSet743"]={
            ["100.00%"]={
                {"Barrel Diffusion",0.2},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Split Chamber",0.2}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Brakk Receiver",0.2256},
                {"Neurodes",0.7744}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Barrel Diffusion",0.2},
                {"Endo",0.2},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Split Chamber",0.2}
            }
        },
        ["RewardSet744"]={
            ["100.00%"]={
                {"Barrel Diffusion",0.2},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Split Chamber",0.2}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Brakk Barrel",0.2256},
                {"Neurodes",0.7744}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Barrel Diffusion",0.2},
                {"Endo",0.2},
                {"Hell's Chamber",0.2},
                {"Natural Talent",0.2},
                {"Split Chamber",0.2}
            }
        },
        ["RewardSet745"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet746"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet747"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet748"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Oxium",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet749"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Oxium",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet750"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Oxium",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet751"]={
            ["3.00%"]={
                {"Convulsion",0.0737},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Convulsion",0.0737},
                {"Endo",0.3367},
                {"Fury",0.0737},
                {"Hell's Chamber",0.0101},
                {"Melee Prowess",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet752"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet753"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet754"]={
            ["3.00%"]={
                {"Diamond Skin",0.0737},
                {"Heated Charge",0.0737},
                {"Heavy Trauma",0.0067},
                {"Mobilize",0.0737},
                {"Pressure Point",0.3794},
                {"Streamline",0.0067},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.0737},
                {"Endo",0.0067},
                {"Heated Charge",0.0737},
                {"Heavy Trauma",0.0067},
                {"Mobilize",0.0737},
                {"Pressure Point",0.3794},
                {"Streamline",0.0067},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet755"]={
            ["3.00%"]={
                {"Diamond Skin",0.0737},
                {"Heated Charge",0.0737},
                {"Heavy Trauma",0.0067},
                {"Mobilize",0.0737},
                {"Pressure Point",0.3794},
                {"Streamline",0.0067},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.0737},
                {"Endo",0.0067},
                {"Heated Charge",0.0737},
                {"Heavy Trauma",0.0067},
                {"Mobilize",0.0737},
                {"Pressure Point",0.3794},
                {"Streamline",0.0067},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet756"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet757"]={
            ["100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet758"]={
            ["100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet759"]={
            ["100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Gunslinger",0.1106},
                {"Heated Charge",0.1106},
                {"Intensify",0.0201},
                {"Quickdraw",0.2529},
                {"Slip Magazine",0.2529},
                {"Vitality",0.2529}
            }
        },
        ["RewardSet760"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet761"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet762"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet763"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet764"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet765"]={
            ["100.00%"]={
                {"Cryo Rounds",0.0752},
                {"Cryo Rounds",0.0752},
                {"Lethal Momentum",0.0752},
                {"Lethal Momentum",0.0752},
                {"Shocking Touch",0.0752},
                {"Shocking Touch",0.0752},
                {"Steel Fiber",0.2581},
                {"Steel Fiber",0.2581},
                {"True Steel",0.2581},
                {"True Steel",0.2581},
                {"Vitality",0.2581},
                {"Vitality",0.2581}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258},
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.0752},
                {"Cryo Rounds",0.0752},
                {"Lethal Momentum",0.0752},
                {"Lethal Momentum",0.0752},
                {"Shocking Touch",0.0752},
                {"Shocking Touch",0.0752},
                {"Steel Fiber",0.2581},
                {"Steel Fiber",0.2581},
                {"True Steel",0.2581},
                {"True Steel",0.2581},
                {"Vitality",0.2581},
                {"Vitality",0.2581}
            }
        },
        ["RewardSet766"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet767"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet768"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet769"]={
            ["3.00%"]={
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Seismic Wave",0.1106},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Seismic Wave",0.1106},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet770"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet771"]={
            ["3.00%"]={
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Pressure Point",0.3794},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet772"]={
            ["1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Diamond Skin",0.1106},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Magazine Warp",0.1897},
                {"Pressure Point",0.3794},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Diamond Skin",0.1106},
                {"Endo",0.005},
                {"Endo",0.3103},
                {"Heated Charge",0.1106},
                {"Heavy Trauma",0.005},
                {"Iron Phoenix",0.005},
                {"Magazine Warp",0.1897},
                {"Pressure Point",0.3794},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897},
                {"Streamline",0.005},
                {"Vitality",0.3794}
            }
        },
        ["RewardSet773"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet774"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet775"]={
            ["0.50%"]={
                {"Boar Blueprint",1.0}
            },
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Patagium",0.1106},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106}
            },
            ["Blueprint Drop Chance: 0.50%"]={
                {"Boar Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Patagium",0.1106},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106}
            }
        },
        ["RewardSet776"]={
            ["3.00%"]={
                {"Melee Prowess",0.3872},
                {"Piercing Step",0.1128},
                {"Pressure Point",0.3872},
                {"Shotgun Savvy",0.1128}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Melee Prowess",0.3872},
                {"Piercing Step",0.1128},
                {"Pressure Point",0.3872},
                {"Shotgun Savvy",0.1128}
            }
        },
        ["RewardSet777"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet778"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Rending Turn",0.1106},
                {"Shocking Touch",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Rending Turn",0.1106},
                {"Shocking Touch",0.1106}
            }
        },
        ["RewardSet779"]={
            ["3.00%"]={
                {"Concussion Rounds",0.0564},
                {"Infected Clip",0.0564},
                {"Melee Prowess",0.2581},
                {"Shredder",0.2581},
                {"Sinking Talon",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concussion Rounds",0.0564},
                {"Endo",0.3145},
                {"Infected Clip",0.0564},
                {"Melee Prowess",0.2581},
                {"Shredder",0.2581},
                {"Sinking Talon",0.0564}
            }
        },
        ["RewardSet780"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet781"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet782"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet783"]={
            ["100.00%"]={
                {"Continuity",0.0101},
                {"Melee Prowess",0.3794},
                {"Pressure Point",0.3794},
                {"Shattering Storm",0.1106},
                {"Shotgun Savvy",0.1106},
                {"Split Chamber",0.0101}
            },
            ["3.00%"]={
                {"Blunderbuss",0.2581},
                {"Magazine Warp",0.2581},
                {"Shell Compression",0.2256},
                {"Slip Magazine",0.2581}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Continuity",0.0101},
                {"Melee Prowess",0.3794},
                {"Pressure Point",0.3794},
                {"Shattering Storm",0.1106},
                {"Shotgun Savvy",0.1106},
                {"Split Chamber",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.2581},
                {"Magazine Warp",0.2581},
                {"Shell Compression",0.2256},
                {"Slip Magazine",0.2581}
            }
        },
        ["RewardSet784"]={
            ["100.00%"]={
                {"Continuity",0.0101},
                {"Melee Prowess",0.3794},
                {"Pressure Point",0.3794},
                {"Shattering Storm",0.1106},
                {"Shotgun Savvy",0.1106},
                {"Split Chamber",0.0101}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Continuity",0.0101},
                {"Melee Prowess",0.3794},
                {"Pressure Point",0.3794},
                {"Shattering Storm",0.1106},
                {"Shotgun Savvy",0.1106},
                {"Split Chamber",0.0101}
            }
        },
        ["RewardSet785"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet786"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet787"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet788"]={
            ["3.00%"]={
                {"Disruptor",0.1897},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Disruptor",0.1897},
                {"Endo",0.0201},
                {"Lingering Torment",0.1897},
                {"Melee Prowess",0.1897},
                {"Pistol Gambit",0.1897},
                {"Shocking Touch",0.1106},
                {"Sundering Weave",0.1106}
            }
        },
        ["RewardSet789"]={
            ["5.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737},
                {"Stinging Thorn",0.0101}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Intact Sentient Core",1.0}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.263},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737},
                {"Stinging Thorn",0.0101}
            }
        },
        ["RewardSet790"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet791"]={
            ["3.00%"]={
                {"Fury",0.0553},
                {"Gnashing Payara",0.0067},
                {"Infected Clip",0.0553},
                {"Jagged Edge",0.0067},
                {"No Return",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.8208},
                {"Fury",0.0553},
                {"Gnashing Payara",0.0067},
                {"Infected Clip",0.0553},
                {"Jagged Edge",0.0067},
                {"No Return",0.0553}
            }
        },
        ["RewardSet792"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet793"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet794"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet795"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet796"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.273},
                {"Fury",0.0737},
                {"No Return",0.0737},
                {"Reach",0.2529},
                {"Reaping Spiral",0.0737}
            }
        },
        ["RewardSet797"]={
            ["3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Endo",0.2098},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            }
        },
        ["RewardSet798"]={
            ["10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            },
            ["Blueprint Drop Chance: 10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Chitinous Husk",0.25},
                {"Infected Palpators",0.25},
                {"Pulsating Tubercles",0.25},
                {"Severed Bile Sac",0.25}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Endo",0.2098},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            }
        },
        ["RewardSet799"]={
            ["10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            },
            ["Blueprint Drop Chance: 10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Chitinous Husk",0.25},
                {"Infected Palpators",0.25},
                {"Pulsating Tubercles",0.25},
                {"Severed Bile Sac",0.25}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Endo",0.2098},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            }
        },
        ["RewardSet800"]={
            ["3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Endo",0.2098},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            }
        },
        ["RewardSet801"]={
            ["10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            },
            ["Blueprint Drop Chance: 10.00%"]={
                {"Pherliac Pods Blueprint",1.0}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Chitinous Husk",0.25},
                {"Infected Palpators",0.25},
                {"Pulsating Tubercles",0.25},
                {"Severed Bile Sac",0.25}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Calculated Redirection",0.1897},
                {"Convulsion",0.0737},
                {"Endo",0.2098},
                {"Fracturing Wind",0.0737},
                {"Regen",0.1897},
                {"Rupture",0.1897},
                {"Speed Trigger",0.0737}
            }
        },
        ["RewardSet802"]={
            ["3.00%"]={
                {"Coolant Leak",0.0067},
                {"Fired Up",0.0067},
                {"Guardian",0.2529},
                {"Hush",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Coolant Leak",0.0067},
                {"Endo",0.4807},
                {"Fired Up",0.0067},
                {"Guardian",0.2529},
                {"Hush",0.2529}
            }
        },
        ["RewardSet803"]={
            ["3.00%"]={
                {"Aviator",0.1936},
                {"Guardian",0.1936},
                {"Redirection",0.1936},
                {"Steel Fiber",0.1936},
                {"Stretch",0.0752},
                {"Toxin Resistance",0.0752}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Aviator",0.1936},
                {"Endo",0.0752},
                {"Guardian",0.1936},
                {"Redirection",0.1936},
                {"Steel Fiber",0.1936},
                {"Stretch",0.0752},
                {"Toxin Resistance",0.0752}
            }
        },
        ["RewardSet804"]={
            ["3.00%"]={
                {"Coolant Leak",0.0067},
                {"Fired Up",0.0067},
                {"Guardian",0.2529},
                {"Hush",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Coolant Leak",0.0067},
                {"Endo",0.4807},
                {"Fired Up",0.0067},
                {"Guardian",0.2529},
                {"Hush",0.2529}
            }
        },
        ["RewardSet805"]={
            ["3.00%"]={
                {"Coiling Viper",0.0086},
                {"Fired Up",0.0086},
                {"Quick Return",0.3247},
                {"Steady Hands",0.0086},
                {"Suppress",0.3247}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Coiling Viper",0.0086},
                {"Endo",0.3247},
                {"Fired Up",0.0086},
                {"Quick Return",0.3247},
                {"Steady Hands",0.0086},
                {"Suppress",0.3247}
            }
        },
        ["RewardSet806"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet807"]={
            ["100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            }
        },
        ["RewardSet808"]={
            ["100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            }
        },
        ["RewardSet809"]={
            ["100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Eleventh Storm",0.0752},
                {"Equilibrium",0.0752},
                {"Parry",0.3872},
                {"Pressure Point",0.3872},
                {"Provoked",0.0752}
            }
        },
        ["RewardSet810"]={
            ["3.00%"]={
                {"Condition Overload",0.0067},
                {"Fast Hands",0.1897},
                {"Ice Spring",0.0067},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.1106},
                {"Shattering Impact",0.1897},
                {"Smite Grineer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Condition Overload",0.0067},
                {"Endo",0.0067},
                {"Fast Hands",0.1897},
                {"Ice Spring",0.0067},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.1106},
                {"Shattering Impact",0.1897},
                {"Smite Grineer",0.1106}
            }
        },
        ["RewardSet811"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["33.00%"]={
                {"Ash Chassis Blueprint",0.3872},
                {"Ash Neuroptics Blueprint",0.3872},
                {"Ash Systems Blueprint",0.2256}
            },
            ["50.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0067},
                {"Four Riders",0.0067},
                {"North Wind",0.0737},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0737}
            },
            ["Blueprint Drop Chance: 33.00%"]={
                {"Ash Chassis Blueprint",0.3872},
                {"Ash Neuroptics Blueprint",0.3872},
                {"Ash Systems Blueprint",0.2256}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 50.00%"]={
                {"Endo",0.2701},
                {"Fast Hands",0.1897},
                {"Flow",0.0067},
                {"Four Riders",0.0067},
                {"North Wind",0.0737},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0737}
            }
        },
        ["RewardSet812"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet813"]={
            ["80.00%"]={
                {"Fast Deflection",0.0564},
                {"Heated Charge",0.0564},
                {"Hellfire",0.0564},
                {"Magazine Warp",0.3872},
                {"Molten Impact",0.0564},
                {"Pressure Point",0.3872}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 80.00%"]={
                {"Fast Deflection",0.0564},
                {"Heated Charge",0.0564},
                {"Hellfire",0.0564},
                {"Magazine Warp",0.3872},
                {"Molten Impact",0.0564},
                {"Pressure Point",0.3872}
            }
        },
        ["RewardSet814"]={
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Heavy Impact",0.1106},
                {"Pressure Point",0.1897},
                {"Trick Mag",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Endo",0.3204},
                {"Heavy Impact",0.1106},
                {"Pressure Point",0.1897},
                {"Trick Mag",0.1897}
            }
        },
        ["RewardSet815"]={
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Heavy Impact",0.1106},
                {"Pressure Point",0.1897},
                {"Trick Mag",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Endo",0.3204},
                {"Heavy Impact",0.1106},
                {"Pressure Point",0.1897},
                {"Trick Mag",0.1897}
            }
        },
        ["RewardSet816"]={
            ["3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Endo",0.4967},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            }
        },
        ["RewardSet817"]={
            ["10.00%"]={
                {"Fast Hands",0.1897},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Slicing Feathers",0.0201},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Endo",0.245},
                {"Fast Hands",0.1897},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Slicing Feathers",0.0201},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet818"]={
            ["10.00%"]={
                {"Atlantis Vulcan",0.0369},
                {"Enduring Affliction",0.0369},
                {"Fast Hands",0.2529},
                {"North Wind",0.0369},
                {"Point Strike",0.2529},
                {"Pressure Point",0.2529},
                {"Reflex Coil",0.0369},
                {"Slicing Feathers",0.0201},
                {"Smite Grineer",0.0369}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Atlantis Vulcan",0.0369},
                {"Endo",0.0369},
                {"Enduring Affliction",0.0369},
                {"Fast Hands",0.2529},
                {"North Wind",0.0369},
                {"Point Strike",0.2529},
                {"Pressure Point",0.2529},
                {"Reflex Coil",0.0369},
                {"Slicing Feathers",0.0201},
                {"Smite Grineer",0.0369}
            }
        },
        ["RewardSet819"]={
            ["3.00%"]={
                {"Flow",0.0101},
                {"North Wind",0.1106},
                {"Pressure Point",0.7588},
                {"Seismic Wave",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.0101},
                {"Flow",0.0101},
                {"North Wind",0.1106},
                {"Pressure Point",0.7588},
                {"Seismic Wave",0.1106}
            }
        },
        ["RewardSet820"]={
            ["3.00%"]={
                {"Atlantis Vulcan",0.0369},
                {"Enduring Affliction",0.0369},
                {"Fast Hands",0.2529},
                {"North Wind",0.0369},
                {"Point Strike",0.2529},
                {"Pressure Point",0.2529},
                {"Reflex Coil",0.0369},
                {"Smite Grineer",0.0369}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Atlantis Vulcan",0.0369},
                {"Endo",0.057},
                {"Enduring Affliction",0.0369},
                {"Fast Hands",0.2529},
                {"North Wind",0.0369},
                {"Point Strike",0.2529},
                {"Pressure Point",0.2529},
                {"Reflex Coil",0.0369},
                {"Smite Grineer",0.0369}
            }
        },
        ["RewardSet821"]={
            ["3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Endo",0.4967},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            }
        },
        ["RewardSet822"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet823"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet824"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"North Wind",0.1106},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Pressure Point",0.7588},
                {"Reflex Coil",0.0553},
                {"Seismic Wave",0.1106},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.0101},
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"North Wind",0.1106},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Pressure Point",0.7588},
                {"Reflex Coil",0.0553},
                {"Seismic Wave",0.1106},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet825"]={
            ["100.00%"]={
                {"Bane Of Infested",0.1106},
                {"Incendiary Coat",0.1106},
                {"Magazine Warp",0.3794},
                {"Pressure Point",0.3794},
                {"Streamline",0.0201}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Bane Of Infested",0.1106},
                {"Incendiary Coat",0.1106},
                {"Magazine Warp",0.3794},
                {"Pressure Point",0.3794},
                {"Streamline",0.0201}
            }
        },
        ["RewardSet826"]={
            ["100.00%"]={
                {"Bane Of Infested",0.1106},
                {"Incendiary Coat",0.1106},
                {"Magazine Warp",0.3794},
                {"Pressure Point",0.3794},
                {"Streamline",0.0201}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Bane Of Infested",0.1106},
                {"Incendiary Coat",0.1106},
                {"Magazine Warp",0.3794},
                {"Pressure Point",0.3794},
                {"Streamline",0.0201}
            }
        },
        ["RewardSet827"]={
            ["1.50%"]={
                {"Kavat Incubator Upgrade Segment Blueprint",1.0}
            },
            ["3.00%"]={
                {"Fast Hands",0.2529},
                {"Flow",0.0101},
                {"Pressure Point",0.2529}
            },
            ["Blueprint Drop Chance: 1.50%"]={
                {"Kavat Incubator Upgrade Segment Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.4841},
                {"Fast Hands",0.2529},
                {"Flow",0.0101},
                {"Pressure Point",0.2529}
            }
        },
        ["RewardSet828"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Final Harbinger",0.0553},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Final Harbinger",0.0553},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553}
            }
        },
        ["RewardSet829"]={
            ["3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Endo",0.4967},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            }
        },
        ["RewardSet830"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet831"]={
            ["3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concealed Explosives",0.0067},
                {"Endo",0.4967},
                {"Metal Auger",0.0067},
                {"Pressure Point",0.3794},
                {"Sinister Reach",0.1106}
            }
        },
        ["RewardSet832"]={
            ["1.50%"]={
                {"Kavat Incubator Upgrade Segment Blueprint",1.0}
            },
            ["3.00%"]={
                {"Fast Hands",0.2529},
                {"Flow",0.0101},
                {"Pressure Point",0.2529}
            },
            ["Blueprint Drop Chance: 1.50%"]={
                {"Kavat Incubator Upgrade Segment Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.4841},
                {"Fast Hands",0.2529},
                {"Flow",0.0101},
                {"Pressure Point",0.2529}
            }
        },
        ["RewardSet833"]={
            ["3.00%"]={
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.255},
                {"Fast Hands",0.1897},
                {"Flow",0.0101},
                {"North Wind",0.0553},
                {"Point Strike",0.1897},
                {"Pressure Point",0.1897},
                {"Reflex Coil",0.0553},
                {"Smite Grineer",0.0553}
            }
        },
        ["RewardSet834"]={
            ["3.00%"]={
                {"Crowd Dispersion",0.2529},
                {"Diamond Skin",0.1106},
                {"Gleaming Talon",0.0067},
                {"Magazine Warp",0.2529},
                {"Split Chamber",0.0067},
                {"Stretch",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crowd Dispersion",0.2529},
                {"Diamond Skin",0.1106},
                {"Endo",0.2596},
                {"Gleaming Talon",0.0067},
                {"Magazine Warp",0.2529},
                {"Split Chamber",0.0067},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet835"]={
            ["3.00%"]={
                {"Crowd Dispersion",0.2529},
                {"Diamond Skin",0.1106},
                {"Gleaming Talon",0.0067},
                {"Magazine Warp",0.2529},
                {"Split Chamber",0.0067},
                {"Stretch",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crowd Dispersion",0.2529},
                {"Diamond Skin",0.1106},
                {"Endo",0.2596},
                {"Gleaming Talon",0.0067},
                {"Magazine Warp",0.2529},
                {"Split Chamber",0.0067},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet836"]={
            ["3.00%"]={
                {"Adhesive Blast",0.0101},
                {"Cleaving Whirlwind",0.0101},
                {"Expel Infested",0.1106},
                {"Flechette",0.2529},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529},
                {"Relentless Combination",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Adhesive Blast",0.0101},
                {"Cleaving Whirlwind",0.0101},
                {"Expel Infested",0.1106},
                {"Flechette",0.2529},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529},
                {"Relentless Combination",0.1106}
            }
        },
        ["RewardSet837"]={
            ["3.00%"]={
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3735},
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            }
        },
        ["RewardSet838"]={
            ["3.00%"]={
                {"Adhesive Blast",0.0101},
                {"Cleaving Whirlwind",0.0101},
                {"Expel Infested",0.1106},
                {"Flechette",0.2529},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529},
                {"Relentless Combination",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Adhesive Blast",0.0101},
                {"Cleaving Whirlwind",0.0101},
                {"Expel Infested",0.1106},
                {"Flechette",0.2529},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529},
                {"Relentless Combination",0.1106}
            }
        },
        ["RewardSet839"]={
            ["3.00%"]={
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3735},
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            }
        },
        ["RewardSet840"]={
            ["3.00%"]={
                {"Expel Infested",0.2211},
                {"Flechette",0.2529},
                {"High Noon",0.0101},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.0101},
                {"Expel Infested",0.2211},
                {"Flechette",0.2529},
                {"High Noon",0.0101},
                {"Lasting Sting",0.2529},
                {"Redirection",0.2529}
            }
        },
        ["RewardSet841"]={
            ["3.00%"]={
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3735},
                {"Flechette",0.2529},
                {"Retribution",0.0101},
                {"Smite Infested",0.1106},
                {"Thief's Wit",0.2529}
            }
        },
        ["RewardSet842"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet843"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet844"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet845"]={
            ["3.00%"]={
                {"Contagious Spread",0.1128},
                {"Gunslinger",0.1128},
                {"Redirection",0.3872},
                {"True Steel",0.3872}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Contagious Spread",0.1128},
                {"Gunslinger",0.1128},
                {"Redirection",0.3872},
                {"True Steel",0.3872}
            }
        },
        ["RewardSet846"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet847"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet848"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet849"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet850"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet851"]={
            ["3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crossing Snakes",0.0067},
                {"Endo",0.1106},
                {"Quickdraw",0.2529},
                {"Razor Shot",0.1106},
                {"Redirection",0.2529},
                {"Revenge",0.2529},
                {"Thunderbolt",0.0067},
                {"Undying Will",0.0067}
            }
        },
        ["RewardSet852"]={
            ["3.00%"]={
                {"Bane Of Corpus",0.0737},
                {"Eagle Eye",0.0737},
                {"Healing Return",0.0101},
                {"Quickdraw",0.3794},
                {"Steel Fiber",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bane Of Corpus",0.0737},
                {"Eagle Eye",0.0737},
                {"Endo",0.0838},
                {"Healing Return",0.0101},
                {"Quickdraw",0.3794},
                {"Steel Fiber",0.3794}
            }
        },
        ["RewardSet853"]={
            ["3.00%"]={
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3995},
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            }
        },
        ["RewardSet854"]={
            ["3.00%"]={
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3995},
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            }
        },
        ["RewardSet855"]={
            ["3.00%"]={
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3995},
                {"Homing Fang",0.1106},
                {"Quickdraw",0.3794},
                {"Serration",0.1106}
            }
        },
        ["RewardSet856"]={
            ["3.00%"]={
                {"Concussion Rounds",0.1106},
                {"Ghost",0.2529},
                {"Point Blank",0.1106},
                {"Reach",0.2529},
                {"Sundering Strike",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concussion Rounds",0.1106},
                {"Endo",0.263},
                {"Ghost",0.2529},
                {"Point Blank",0.1106},
                {"Reach",0.2529},
                {"Sundering Strike",0.0101}
            }
        },
        ["RewardSet857"]={
            ["3.00%"]={
                {"Concussion Rounds",0.1106},
                {"Ghost",0.2529},
                {"Point Blank",0.1106},
                {"Reach",0.2529},
                {"Sundering Strike",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Concussion Rounds",0.1106},
                {"Endo",0.263},
                {"Ghost",0.2529},
                {"Point Blank",0.1106},
                {"Reach",0.2529},
                {"Sundering Strike",0.0101}
            }
        },
        ["RewardSet858"]={
            ["3.00%"]={
                {"Hawk Eye",0.0737},
                {"Shock Absorbers",0.0101},
                {"Shotgun Spazz",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.8425},
                {"Hawk Eye",0.0737},
                {"Shock Absorbers",0.0101},
                {"Shotgun Spazz",0.0737}
            }
        },
        ["RewardSet859"]={
            ["100.00%"]={
                {"Blunderbuss",0.7588},
                {"Handspring",0.0101},
                {"Ruinous Extension",0.0737},
                {"Shell Compression",0.0737},
                {"Shock Absorbers",0.0101},
                {"Tactical Pump",0.0737}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Blunderbuss",0.7588},
                {"Handspring",0.0101},
                {"Ruinous Extension",0.0737},
                {"Shell Compression",0.0737},
                {"Shock Absorbers",0.0101},
                {"Tactical Pump",0.0737}
            }
        },
        ["RewardSet860"]={
            ["100.00%"]={
                {"Arcane Arachne",0.1376},
                {"Arcane Avenger",0.117},
                {"Arcane Fury",0.1376},
                {"Arcane Rage",0.1376},
                {"Arcane Trickery",0.2478},
                {"Arcane Velocity",0.2223},
                {"Buzz Kill",0.0833},
                {"Fanged Fusillade",0.0833},
                {"Gunslinger",0.2222},
                {"Maim",0.0833},
                {"Shotgun Spazz",0.2222},
                {"Speed Trigger",0.2222},
                {"Sweeping Serration",0.0833}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Arachne",0.1376},
                {"Arcane Avenger",0.117},
                {"Arcane Fury",0.1376},
                {"Arcane Rage",0.1376},
                {"Arcane Trickery",0.2478},
                {"Arcane Velocity",0.2223},
                {"Buzz Kill",0.0833},
                {"Fanged Fusillade",0.0833},
                {"Gunslinger",0.2222},
                {"Maim",0.0833},
                {"Shotgun Spazz",0.2222},
                {"Speed Trigger",0.2222},
                {"Sweeping Serration",0.0833}
            }
        },
        ["RewardSet861"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Energy Channel",0.0101},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.263},
                {"Energy Channel",0.0101},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            }
        },
        ["RewardSet862"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Molten Impact",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106},
                {"Tempo Royale",0.0201}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.2529},
                {"Molten Impact",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106},
                {"Tempo Royale",0.0201}
            }
        },
        ["RewardSet863"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Life Strike",0.0201},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.2529},
                {"Life Strike",0.0201},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            }
        },
        ["RewardSet864"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Astral Twilight",0.0201},
                {"Revenge",0.2529},
                {"Shocking Touch",0.1106},
                {"Smite Grineer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Astral Twilight",0.0201},
                {"Endo",0.2529},
                {"Revenge",0.2529},
                {"Shocking Touch",0.1106},
                {"Smite Grineer",0.1106}
            }
        },
        ["RewardSet865"]={
            ["3.00%"]={
                {"Ammo Drum",0.2529},
                {"Energy Channel",0.0101},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Drum",0.2529},
                {"Endo",0.263},
                {"Energy Channel",0.0101},
                {"North Wind",0.1106},
                {"Revenge",0.2529},
                {"Smite Grineer",0.1106}
            }
        },
        ["RewardSet866"]={
            ["3.00%"]={
                {"Charged Shell",0.0553},
                {"Cleanse Grineer",0.0553},
                {"Handspring",0.0201},
                {"Point Strike",0.3794},
                {"Swirling Tiger",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Charged Shell",0.0553},
                {"Cleanse Grineer",0.0553},
                {"Endo",0.4347},
                {"Handspring",0.0201},
                {"Point Strike",0.3794},
                {"Swirling Tiger",0.0553}
            }
        },
        ["RewardSet867"]={
            ["3.00%"]={
                {"Charged Shell",0.0553},
                {"Cleanse Grineer",0.0553},
                {"Handspring",0.0201},
                {"Point Strike",0.3794},
                {"Swirling Tiger",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Charged Shell",0.0553},
                {"Cleanse Grineer",0.0553},
                {"Endo",0.4347},
                {"Handspring",0.0201},
                {"Point Strike",0.3794},
                {"Swirling Tiger",0.0553}
            }
        },
        ["RewardSet868"]={
            ["3.00%"]={
                {"Blunderbuss",0.3794},
                {"Fever Strike",0.0442},
                {"Flow",0.0101},
                {"North Wind",0.0442},
                {"Perpetual Agony",0.3794},
                {"Reflex Coil",0.0442},
                {"Rifle Aptitude",0.0442},
                {"Tranquil Cleave",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.3794},
                {"Endo",0.0442},
                {"Fever Strike",0.0442},
                {"Flow",0.0101},
                {"North Wind",0.0442},
                {"Perpetual Agony",0.3794},
                {"Reflex Coil",0.0442},
                {"Rifle Aptitude",0.0442},
                {"Tranquil Cleave",0.0101}
            }
        },
        ["RewardSet869"]={
            ["100.00%"]={
                {"Magazine Warp",0.3872},
                {"Reflex Coil",0.1504},
                {"Shocking Touch",0.0752},
                {"Thief's Wit",0.3872}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Magazine Warp",0.3872},
                {"Reflex Coil",0.1504},
                {"Shocking Touch",0.0752},
                {"Thief's Wit",0.3872}
            }
        },
        ["RewardSet870"]={
            ["100.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["Miscellaneous Drop Chance: 10.00%"]={
                {"Neural Sensors",0.5}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Neural Sensors",0.5}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet871"]={
            ["5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["Miscellaneous Drop Chance: 10.00%"]={
                {"Neural Sensors",0.5}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet872"]={
            ["5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["Miscellaneous Drop Chance: 10.00%"]={
                {"Neural Sensors",0.5}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet873"]={
            ["5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            },
            ["Miscellaneous Drop Chance: 10.00%"]={
                {"Neural Sensors",0.5}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Organ Shatter",0.3794},
                {"Reach",0.3794},
                {"Reflex Coil",0.1106},
                {"Split Chamber",0.0201},
                {"Stretch",0.1106}
            }
        },
        ["RewardSet874"]={
            ["3.00%"]={
                {"Blunderbuss",0.3794},
                {"Fever Strike",0.0442},
                {"Flow",0.0101},
                {"North Wind",0.0442},
                {"Perpetual Agony",0.3794},
                {"Reflex Coil",0.0442},
                {"Rifle Aptitude",0.0442},
                {"Tranquil Cleave",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.3794},
                {"Endo",0.0442},
                {"Fever Strike",0.0442},
                {"Flow",0.0101},
                {"North Wind",0.0442},
                {"Perpetual Agony",0.3794},
                {"Reflex Coil",0.0442},
                {"Rifle Aptitude",0.0442},
                {"Tranquil Cleave",0.0101}
            }
        },
        ["RewardSet875"]={
            ["60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            }
        },
        ["RewardSet876"]={
            ["60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            }
        },
        ["RewardSet877"]={
            ["60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            }
        },
        ["RewardSet878"]={
            ["60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            }
        },
        ["RewardSet879"]={
            ["60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 60.00%"]={
                {"Master Thief",0.0201},
                {"North Wind",0.2211},
                {"Trick Mag",0.3794},
                {"True Steel",0.3794}
            }
        },
        ["RewardSet880"]={
            ["100.00%"]={
                {"Cryo Rounds",0.2292},
                {"Energy Channel",0.0833},
                {"Killing Blow",0.2292},
                {"Molten Impact",0.2292},
                {"Stretch",0.2292}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.2292},
                {"Energy Channel",0.0833},
                {"Killing Blow",0.2292},
                {"Molten Impact",0.2292},
                {"Stretch",0.2292}
            }
        },
        ["RewardSet881"]={
            ["100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Endo",0.8131},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442}
            }
        },
        ["RewardSet882"]={
            ["100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Cryo Rounds",0.0442},
                {"Energy Channel",0.0101},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442},
                {"Stretch",0.0442}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258},
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Cryo Rounds",0.0442},
                {"Endo",0.8131},
                {"Endo",0.8131},
                {"Energy Channel",0.0101},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442},
                {"Stretch",0.0442}
            }
        },
        ["RewardSet883"]={
            ["3.00%"]={
                {"Cryo Rounds",0.1106},
                {"Piercing Hit",0.2529},
                {"Pointed Wind",0.0101},
                {"Stretch",0.1106},
                {"Trick Mag",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cryo Rounds",0.1106},
                {"Endo",0.263},
                {"Piercing Hit",0.2529},
                {"Pointed Wind",0.0101},
                {"Stretch",0.1106},
                {"Trick Mag",0.2529}
            }
        },
        ["RewardSet884"]={
            ["100.00%"]={
                {"Cryo Rounds",0.2292},
                {"Energy Channel",0.0833},
                {"Killing Blow",0.2292},
                {"Molten Impact",0.2292},
                {"Stretch",0.2292}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.2292},
                {"Energy Channel",0.0833},
                {"Killing Blow",0.2292},
                {"Molten Impact",0.2292},
                {"Stretch",0.2292}
            }
        },
        ["RewardSet885"]={
            ["100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Cryo Rounds",0.0442},
                {"Endo",0.8131},
                {"Energy Channel",0.0101},
                {"Killing Blow",0.0442},
                {"Molten Impact",0.0442},
                {"Stretch",0.0442}
            }
        },
        ["RewardSet886"]={
            ["100.00%"]={
                {"Blind Justice",0.3056},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            },
            ["50.00%"]={
                {"Despair Blueprint",0.1106},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.1106},
                {"Scimitar Engines Blueprint",0.0201}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Despair Blueprint",0.1106},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.1106},
                {"Scimitar Engines Blueprint",0.0201}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Blind Justice",0.3056},
                {"Endo",0.0278},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            }
        },
        ["RewardSet887"]={
            ["100.00%"]={
                {"Blind Justice",0.3056},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            },
            ["50.00%"]={
                {"Broken War Blueprint",0.0553},
                {"Despair Blueprint",0.0553},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.0553},
                {"Scimitar Engines Blueprint",0.0201},
                {"War Blueprint",0.0553}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Broken War Blueprint",0.0553},
                {"Despair Blueprint",0.0553},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.0553},
                {"Scimitar Engines Blueprint",0.0201},
                {"War Blueprint",0.0553}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Blind Justice",0.3056},
                {"Endo",0.0278},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            }
        },
        ["RewardSet888"]={
            ["100.00%"]={
                {"Blind Justice",0.3056},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            },
            ["50.00%"]={
                {"Despair Blueprint",0.1106},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.1106},
                {"Scimitar Engines Blueprint",0.0201}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Despair Blueprint",0.1106},
                {"Dread Blueprint",0.7588},
                {"Hate Blueprint",0.1106},
                {"Scimitar Engines Blueprint",0.0201}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Blind Justice",0.3056},
                {"Endo",0.0278},
                {"Energy Channel",0.0278},
                {"Heavy Impact",0.3056},
                {"Intensify",0.0278},
                {"Molten Impact",0.3056}
            }
        },
        ["RewardSet889"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            }
        },
        ["RewardSet890"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Battering Maneuver",0.0737},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Battering Maneuver",0.0737},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588}
            }
        },
        ["RewardSet891"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            }
        },
        ["RewardSet892"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            }
        },
        ["RewardSet893"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            }
        },
        ["RewardSet894"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Barrel Diffusion",0.0067},
                {"Crushing Ruin",0.0067},
                {"Endo",0.0067},
                {"Killing Blow",0.0737},
                {"Sawtooth Clip",0.7588},
                {"Shimmering Blight",0.0737}
            }
        },
        ["RewardSet895"]={
            ["3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            },
            ["Miscellaneous Drop Chance: 25.00%"]={
                {"Nav Coordinate",0.2256}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            }
        },
        ["RewardSet896"]={
            ["3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            },
            ["Miscellaneous Drop Chance: 25.00%"]={
                {"Nav Coordinate",0.2256}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            }
        },
        ["RewardSet897"]={
            ["3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            },
            ["Miscellaneous Drop Chance: 25.00%"]={
                {"Nav Coordinate",0.2256}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bite",0.0022},
                {"Dig",0.0022},
                {"Ferocity",0.0022},
                {"Hastened Deflection",0.0369},
                {"Howl",0.0022},
                {"Hunt",0.0022},
                {"Link Armor",0.0369},
                {"Link Health",0.0369},
                {"Link Shields",0.0369},
                {"Loyal Companion",0.2529},
                {"Maul",0.0369},
                {"Pack Leader",0.2529},
                {"Protect",0.0022},
                {"Savagery",0.0022},
                {"Scavenge",0.2529},
                {"Shelter",0.0369},
                {"Stalk",0.0022},
                {"Unleashed",0.0022}
            }
        },
        ["RewardSet898"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.2835},
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            }
        },
        ["RewardSet899"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.2835},
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            }
        },
        ["RewardSet900"]={
            ["3.00%"]={
                {"Crimson Dervish",0.005},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crimson Dervish",0.005},
                {"Endo",0.258},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet901"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.2835},
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            }
        },
        ["RewardSet902"]={
            ["10.00%"]={
                {"Expel Grineer",0.1106},
                {"Sovereign Outcast",0.0201},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Endo",0.2529},
                {"Expel Grineer",0.1106},
                {"Sovereign Outcast",0.0201},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet903"]={
            ["3.00%"]={
                {"Crimson Dervish",0.005},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crimson Dervish",0.005},
                {"Endo",0.258},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet904"]={
            ["10.00%"]={
                {"Expel Grineer",0.1106},
                {"Sovereign Outcast",0.0201},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Endo",0.2529},
                {"Expel Grineer",0.1106},
                {"Sovereign Outcast",0.0201},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet905"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.2835},
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            }
        },
        ["RewardSet906"]={
            ["3.00%"]={
                {"Crimson Dervish",0.005},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crimson Dervish",0.005},
                {"Endo",0.258},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet907"]={
            ["3.00%"]={
                {"Crimson Dervish",0.005},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Crimson Dervish",0.005},
                {"Endo",0.258},
                {"Expel Grineer",0.1106},
                {"Sanctuary",0.005},
                {"Sure Footed",0.005},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet908"]={
            ["40.00%"]={
                {"Expel Grineer",0.1106},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Vermillion Storm",0.0067},
                {"Vulpine Mask",0.0067},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 40.00%"]={
                {"Endo",0.2596},
                {"Expel Grineer",0.1106},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Vermillion Storm",0.0067},
                {"Vulpine Mask",0.0067},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet909"]={
            ["40.00%"]={
                {"Expel Grineer",0.1106},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Vermillion Storm",0.0067},
                {"Vulpine Mask",0.0067},
                {"Warm Coat",0.2529}
            },
            ["Mod Drop Chance: 40.00%"]={
                {"Endo",0.2596},
                {"Expel Grineer",0.1106},
                {"Tactical Pump",0.1106},
                {"True Steel",0.2529},
                {"Vermillion Storm",0.0067},
                {"Vulpine Mask",0.0067},
                {"Warm Coat",0.2529}
            }
        },
        ["RewardSet910"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.2835},
                {"Enhanced Vitality",0.1897},
                {"Fast Deflection",0.0737},
                {"Hellfire",0.0737},
                {"Trick Mag",0.1897},
                {"True Steel",0.1897}
            }
        },
        ["RewardSet911"]={
            ["20.00%"]={
                {"Organ Shatter",0.3794},
                {"Toxic Flight",0.0201}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",0.6005},
                {"Organ Shatter",0.3794},
                {"Toxic Flight",0.0201}
            }
        },
        ["RewardSet912"]={
            ["3.00%"]={
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.5101},
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            }
        },
        ["RewardSet913"]={
            ["3.00%"]={
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.5101},
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            }
        },
        ["RewardSet914"]={
            ["30.00%"]={
                {"Continuous Misery",0.2529},
                {"Firewalker",0.0201},
                {"Organ Shatter",0.2529},
                {"Terminal Velocity",0.2211}
            },
            ["Mod Drop Chance: 30.00%"]={
                {"Continuous Misery",0.2529},
                {"Endo",0.2529},
                {"Firewalker",0.0201},
                {"Organ Shatter",0.2529},
                {"Terminal Velocity",0.2211}
            }
        },
        ["RewardSet915"]={
            ["3.00%"]={
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.5101},
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.1106}
            }
        },
        ["RewardSet916"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Endo",0.2255},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            }
        },
        ["RewardSet917"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Endo",0.2255},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            }
        },
        ["RewardSet918"]={
            ["3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Accelerated Deflection",0.0737},
                {"Brutal Tide",0.0101},
                {"Endo",0.2255},
                {"Firestorm",0.0101},
                {"Hornet Strike",0.0737},
                {"Organ Shatter",0.1518},
                {"Shredder",0.1518},
                {"Slip Magazine",0.1518},
                {"Warm Coat",0.1518}
            }
        },
        ["RewardSet919"]={
            ["3.00%"]={
                {"Continuous Misery",0.2529},
                {"Organ Shatter",0.2529},
                {"Stormbringer",0.1106},
                {"Terminal Velocity",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Continuous Misery",0.2529},
                {"Endo",0.273},
                {"Organ Shatter",0.2529},
                {"Stormbringer",0.1106},
                {"Terminal Velocity",0.1106}
            }
        },
        ["RewardSet920"]={
            ["3.00%"]={
                {"Continuous Misery",0.2529},
                {"Organ Shatter",0.2529},
                {"Stormbringer",0.1106},
                {"Terminal Velocity",0.1106}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Continuous Misery",0.2529},
                {"Endo",0.273},
                {"Organ Shatter",0.2529},
                {"Stormbringer",0.1106},
                {"Terminal Velocity",0.1106}
            }
        },
        ["RewardSet921"]={
            ["3.00%"]={
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.2211}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3995},
                {"Organ Shatter",0.3794},
                {"Stormbringer",0.2211}
            }
        },
        ["RewardSet922"]={
            ["3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Endo",0.3367},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            }
        },
        ["RewardSet923"]={
            ["3.00%"]={
                {"Charged Chamber",0.1128},
                {"Trick Mag",0.3872}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Charged Chamber",0.1128},
                {"Endo",0.5},
                {"Trick Mag",0.3872}
            }
        },
        ["RewardSet924"]={
            ["3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Endo",0.3367},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            }
        },
        ["RewardSet925"]={
            ["3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Endo",0.3367},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            }
        },
        ["RewardSet926"]={
            ["3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cleanse Corpus",0.0737},
                {"Endo",0.3367},
                {"Enemy Sense",0.0101},
                {"Flame Repellent",0.2529},
                {"Rifle Aptitude",0.0737},
                {"Trick Mag",0.2529}
            }
        },
        ["RewardSet927"]={
            ["1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Endo",0.3103},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            }
        },
        ["RewardSet928"]={
            ["1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Endo",0.3103},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            }
        },
        ["RewardSet929"]={
            ["1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"Gorgon Blueprint",1.0}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Blunderbuss",0.1897},
                {"Decisive Judgement",0.0101},
                {"Endo",0.3103},
                {"Magazine Warp",0.1897},
                {"Shell Compression",0.1106},
                {"Slip Magazine",0.1897}
            }
        },
        ["RewardSet930"]={
            ["3.00%"]={
                {"Chilling Grasp",0.1106},
                {"Guardian Derision",0.005},
                {"Metal Fiber",0.3794},
                {"Pistol Gambit",0.3794},
                {"Rapid Resilience",0.005},
                {"Shotgun Savvy",0.1106},
                {"Vital Sense",0.005}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Chilling Grasp",0.1106},
                {"Endo",0.005},
                {"Guardian Derision",0.005},
                {"Metal Fiber",0.3794},
                {"Pistol Gambit",0.3794},
                {"Rapid Resilience",0.005},
                {"Shotgun Savvy",0.1106},
                {"Vital Sense",0.005}
            }
        },
        ["RewardSet931"]={
            ["3.00%"]={
                {"Antitoxin",0.0553},
                {"Enhanced Vitality",0.1897},
                {"Rush",0.0553},
                {"Self Destruct",0.0101},
                {"Smite Corpus",0.0553},
                {"Thief's Wit",0.1897},
                {"Vaporize",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Antitoxin",0.0553},
                {"Endo",0.255},
                {"Enhanced Vitality",0.1897},
                {"Rush",0.0553},
                {"Self Destruct",0.0101},
                {"Smite Corpus",0.0553},
                {"Thief's Wit",0.1897},
                {"Vaporize",0.1897}
            }
        },
        ["RewardSet932"]={
            ["3.00%"]={
                {"Bane Of Infested",0.0553},
                {"Calculated Redirection",0.3794},
                {"Grim Fury",0.0553},
                {"Malicious Raptor",0.0101},
                {"Seeking Force",0.0101},
                {"Target Cracker",0.0553},
                {"Vaporize",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bane Of Infested",0.0553},
                {"Calculated Redirection",0.3794},
                {"Endo",0.0553},
                {"Grim Fury",0.0553},
                {"Malicious Raptor",0.0101},
                {"Seeking Force",0.0101},
                {"Target Cracker",0.0553},
                {"Vaporize",0.3794}
            }
        },
        ["RewardSet933"]={
            ["3.00%"]={
                {"Bane Of Infested",0.0553},
                {"Calculated Redirection",0.3794},
                {"Grim Fury",0.0553},
                {"Malicious Raptor",0.0101},
                {"Seeking Force",0.0101},
                {"Target Cracker",0.0553},
                {"Vaporize",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bane Of Infested",0.0553},
                {"Calculated Redirection",0.3794},
                {"Endo",0.0553},
                {"Grim Fury",0.0553},
                {"Malicious Raptor",0.0101},
                {"Seeking Force",0.0101},
                {"Target Cracker",0.0553},
                {"Vaporize",0.3794}
            }
        },
        ["RewardSet934"]={
            ["3.00%"]={
                {"Contagious Spread",0.0553},
                {"Rupture",0.7588},
                {"Serration",0.0553},
                {"Sure Shot",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Contagious Spread",0.0553},
                {"Endo",0.0754},
                {"Rupture",0.7588},
                {"Serration",0.0553},
                {"Sure Shot",0.0553}
            }
        },
        ["RewardSet935"]={
            ["20.00%"]={
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737},
                {"Slicing Feathers",0.0101}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",0.4531},
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737},
                {"Slicing Feathers",0.0101}
            }
        },
        ["RewardSet936"]={
            ["3.00%"]={
                {"Defiled Snapdragon",0.0101},
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Defiled Snapdragon",0.0101},
                {"Endo",0.4531},
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737}
            }
        },
        ["RewardSet937"]={
            ["3.00%"]={
                {"Defiled Snapdragon",0.0101},
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Defiled Snapdragon",0.0101},
                {"Endo",0.4531},
                {"Heavy Impact",0.0737},
                {"Lightning Rod",0.3794},
                {"Master Thief",0.0101},
                {"Serration",0.0737}
            }
        },
        ["RewardSet938"]={
            ["3.00%"]={
                {"Combustion Beam",0.005},
                {"Incendiary Coat",0.1106},
                {"Ravage",0.005},
                {"Stalking Fan",0.005},
                {"Warrior",0.7588}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Combustion Beam",0.005},
                {"Endo",0.1156},
                {"Incendiary Coat",0.1106},
                {"Ravage",0.005},
                {"Stalking Fan",0.005},
                {"Warrior",0.7588}
            }
        },
        ["RewardSet939"]={
            ["3.00%"]={
                {"Combustion Beam",0.005},
                {"Incendiary Coat",0.1106},
                {"Ravage",0.005},
                {"Stalking Fan",0.005},
                {"Warrior",0.7588}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Combustion Beam",0.005},
                {"Endo",0.1156},
                {"Incendiary Coat",0.1106},
                {"Ravage",0.005},
                {"Stalking Fan",0.005},
                {"Warrior",0.7588}
            }
        },
        ["RewardSet940"]={
            ["3.00%"]={
                {"Enhanced Vitality",0.3872},
                {"Pathogen Rounds",0.0752},
                {"Shotgun Savvy",0.0752},
                {"Swirling Tiger",0.0752},
                {"Thief's Wit",0.3872}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Enhanced Vitality",0.3872},
                {"Pathogen Rounds",0.0752},
                {"Shotgun Savvy",0.0752},
                {"Swirling Tiger",0.0752},
                {"Thief's Wit",0.3872}
            }
        },
        ["RewardSet941"]={
            ["3.00%"]={
                {"Flame Repellent",0.2529},
                {"Lightning Rod",0.2529},
                {"Seeker",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.4841},
                {"Flame Repellent",0.2529},
                {"Lightning Rod",0.2529},
                {"Seeker",0.0101}
            }
        },
        ["RewardSet942"]={
            ["3.00%"]={
                {"Flame Repellent",0.2529},
                {"Lightning Rod",0.2529},
                {"Seeker",0.0101}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.4841},
                {"Flame Repellent",0.2529},
                {"Lightning Rod",0.2529},
                {"Seeker",0.0101}
            }
        },
        ["RewardSet943"]={
            ["3.00%"]={
                {"Bane Of Grineer",0.0564},
                {"Sure Shot",0.0564},
                {"Swift Deth",0.3872},
                {"Swirling Tiger",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bane Of Grineer",0.0564},
                {"Endo",0.4436},
                {"Sure Shot",0.0564},
                {"Swift Deth",0.3872},
                {"Swirling Tiger",0.0564}
            }
        },
        ["RewardSet944"]={
            ["10.00%"]={
                {"Bane Of Grineer",0.0553},
                {"Slicing Feathers",0.0201},
                {"Sure Shot",0.0553},
                {"Swift Deth",0.3794},
                {"Swirling Tiger",0.0553}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Bane Of Grineer",0.0553},
                {"Endo",0.4347},
                {"Slicing Feathers",0.0201},
                {"Sure Shot",0.0553},
                {"Swift Deth",0.3794},
                {"Swirling Tiger",0.0553}
            }
        },
        ["RewardSet945"]={
            ["3.00%"]={
                {"Bane Of Grineer",0.0564},
                {"Sure Shot",0.0564},
                {"Swift Deth",0.3872},
                {"Swirling Tiger",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bane Of Grineer",0.0564},
                {"Endo",0.4436},
                {"Sure Shot",0.0564},
                {"Swift Deth",0.3872},
                {"Swirling Tiger",0.0564}
            }
        },
        ["RewardSet946"]={
            ["3.00%"]={
                {"Cleanse Infested",0.0737},
                {"Fatal Acceleration",0.0737},
                {"Seismic Palm",0.0201},
                {"Spinning Needle",0.0737},
                {"Swift Deth",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cleanse Infested",0.0737},
                {"Endo",0.3794},
                {"Fatal Acceleration",0.0737},
                {"Seismic Palm",0.0201},
                {"Spinning Needle",0.0737},
                {"Swift Deth",0.3794}
            }
        },
        ["RewardSet947"]={
            ["100.00%"]={
                {"Blind Justice",0.3636},
                {"Crimson Dervish",0.0606},
                {"Growing Power",0.0606},
                {"Pistol Amp",0.5152}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Blind Justice",0.3636},
                {"Crimson Dervish",0.0606},
                {"Growing Power",0.0606},
                {"Pistol Amp",0.5152}
            }
        },
        ["RewardSet948"]={
            ["3.00%"]={
                {"Bleeding Willow",0.0101},
                {"Fatal Attraction",0.2529},
                {"Gemini Cross",0.2211},
                {"Reflex Guard",0.0101},
                {"Striker",0.2529}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Willow",0.0101},
                {"Endo",0.2529},
                {"Fatal Attraction",0.2529},
                {"Gemini Cross",0.2211},
                {"Reflex Guard",0.0101},
                {"Striker",0.2529}
            }
        },
        ["RewardSet949"]={
            ["3.00%"]={
                {"Ammo Case",0.3794},
                {"Burning Wasp",0.0553},
                {"Finishing Touch",0.0553},
                {"Infected Clip",0.0553},
                {"Power Throw",0.0201},
                {"Thumper",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Case",0.3794},
                {"Burning Wasp",0.0553},
                {"Endo",0.0553},
                {"Finishing Touch",0.0553},
                {"Infected Clip",0.0553},
                {"Power Throw",0.0201},
                {"Thumper",0.3794}
            }
        },
        ["RewardSet950"]={
            ["3.00%"]={
                {"Ammo Case",0.3794},
                {"Burning Wasp",0.0553},
                {"Dispatch Overdrive",0.0553},
                {"Finishing Touch",0.0553},
                {"Infected Clip",0.0553},
                {"Power Throw",0.0201},
                {"Thumper",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Ammo Case",0.3794},
                {"Burning Wasp",0.0553},
                {"Dispatch Overdrive",0.0553},
                {"Finishing Touch",0.0553},
                {"Infected Clip",0.0553},
                {"Power Throw",0.0201},
                {"Thumper",0.3794}
            }
        },
        ["RewardSet951"]={
            ["100.00%"]={
                {"Quick Return",0.3794},
                {"Rebound",0.3794},
                {"Spare Parts",0.2211},
                {"Stabilizer",0.0201}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Quick Return",0.3794},
                {"Rebound",0.3794},
                {"Spare Parts",0.2211},
                {"Stabilizer",0.0201}
            }
        },
        ["RewardSet952"]={
            ["3.00%"]={
                {"Berserker",0.0101},
                {"Clashing Forest",0.0737},
                {"Maglev",0.0737},
                {"Quick Thinking",0.0101},
                {"Reflection",0.3794}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Berserker",0.0101},
                {"Clashing Forest",0.0737},
                {"Endo",0.4531},
                {"Maglev",0.0737},
                {"Quick Thinking",0.0101},
                {"Reflection",0.3794}
            }
        },
        ["RewardSet953"]={
            ["3.00%"]={
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.1173},
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            }
        },
        ["RewardSet954"]={
            ["3.00%"]={
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.1173},
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            }
        },
        ["RewardSet955"]={
            ["3.00%"]={
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.1173},
                {"Flailing Branch",0.0067},
                {"Intruder",0.7588},
                {"Spare Parts",0.1106},
                {"Whirlwind",0.0067}
            }
        },
        ["RewardSet956"]={
            ["100.00%"]={
                {"Arcane Consequence",0.1495},
                {"Arcane Ice",0.1495},
                {"Arcane Momentum",0.1495},
                {"Arcane Nullifier",0.1495},
                {"Arcane Resistance",0.0678},
                {"Arcane Tempo",0.185},
                {"Arcane Warmth",0.1495},
                {"Collision Force",0.0833},
                {"Crash Course",0.0833},
                {"Fatal Acceleration",0.2222},
                {"Full Contact",0.0833},
                {"Lethal Momentum",0.2222},
                {"Pummel",0.0833},
                {"Terminal Velocity",0.2222}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Consequence",0.1495},
                {"Arcane Ice",0.1495},
                {"Arcane Momentum",0.1495},
                {"Arcane Nullifier",0.1495},
                {"Arcane Resistance",0.0678},
                {"Arcane Tempo",0.185},
                {"Arcane Warmth",0.1495},
                {"Collision Force",0.0833},
                {"Crash Course",0.0833},
                {"Fatal Acceleration",0.2222},
                {"Full Contact",0.0833},
                {"Lethal Momentum",0.2222},
                {"Pummel",0.0833},
                {"Terminal Velocity",0.2222}
            }
        },
        ["RewardSet957"]={
            ["100.00%"]={
                {"Arcane Acceleration",0.102},
                {"Arcane Agility",0.102},
                {"Arcane Awakening",0.1825},
                {"Arcane Eruption",0.102},
                {"Arcane Guardian",0.1568},
                {"Arcane Phantasm",0.102},
                {"Arcane Precision",0.0702},
                {"Arcane Strike",0.1825},
                {"Auger Strike",0.0084},
                {"Bore",0.0084},
                {"Breach Loader",0.0084},
                {"Continuous Misery",0.3221},
                {"Lingering Torment",0.3221},
                {"Perpetual Agony",0.3221},
                {"Piercing Caliber",0.0084}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Acceleration",0.102},
                {"Arcane Agility",0.102},
                {"Arcane Awakening",0.1825},
                {"Arcane Eruption",0.102},
                {"Arcane Guardian",0.1568},
                {"Arcane Phantasm",0.102},
                {"Arcane Precision",0.0702},
                {"Arcane Strike",0.1825},
                {"Auger Strike",0.0084},
                {"Bore",0.0084},
                {"Breach Loader",0.0084},
                {"Continuous Misery",0.3221},
                {"Lingering Torment",0.3221},
                {"Perpetual Agony",0.3221},
                {"Piercing Caliber",0.0084}
            }
        },
        ["RewardSet958"]={
            ["2.50%"]={
                {"Astral Twilight",0.2},
                {"Firewalker",0.2},
                {"Ice Spring",0.2},
                {"Lightning Dash",0.2},
                {"Toxic Flight",0.2}
            },
            ["Miscellaneous Drop Chance: 5.00%"]={
                {"Orvius Disc",1.0}
            },
            ["Mod Drop Chance: 2.50%"]={
                {"Astral Twilight",0.2},
                {"Firewalker",0.2},
                {"Ice Spring",0.2},
                {"Lightning Dash",0.2},
                {"Toxic Flight",0.2}
            }
        },
        ["RewardSet959"]={
            ["40.00%"]={
                {"Vermillion Storm",0.0101}
            },
            ["Miscellaneous Drop Chance: 5.00%"]={
                {"Orvius Blade",1.0}
            },
            ["Mod Drop Chance: 40.00%"]={
                {"Endo",0.99},
                {"Vermillion Storm",0.0101}
            }
        },
        ["RewardSet960"]={
            ["3.00%"]={
                {"Auxiliary Power",0.0564},
                {"Energy Inversion",0.3872},
                {"Furor",0.0564},
                {"Galvanized Blade",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Auxiliary Power",0.0564},
                {"Endo",0.4436},
                {"Energy Inversion",0.3872},
                {"Furor",0.0564},
                {"Galvanized Blade",0.0564}
            }
        },
        ["RewardSet961"]={
            ["3.00%"]={
                {"Bleeding Edge",0.2581},
                {"Electrified Barrel",0.0737},
                {"Energy Inversion",0.2581},
                {"Furor",0.0737},
                {"Hollowed Bullets",0.0101},
                {"Hyperion Thrusters",0.0101},
                {"Modified Munitions",0.1128}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Edge",0.2581},
                {"Electrified Barrel",0.0737},
                {"Endo",0.3709},
                {"Endo",0.8325},
                {"Energy Inversion",0.2581},
                {"Furor",0.0737},
                {"Hollowed Bullets",0.0101},
                {"Hyperion Thrusters",0.0101},
                {"Modified Munitions",0.1128}
            }
        },
        ["RewardSet962"]={
            ["3.00%"]={
                {"Bleeding Edge",0.2581},
                {"Energy Inversion",0.2581},
                {"Modified Munitions",0.1128}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Circuits",0.6802}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Edge",0.2581},
                {"Endo",0.3709},
                {"Energy Inversion",0.2581},
                {"Modified Munitions",0.1128}
            }
        },
        ["RewardSet963"]={
            ["3.00%"]={
                {"Enhanced Durability",0.0564},
                {"Furor",0.0564},
                {"Superior Defenses",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.8308},
                {"Enhanced Durability",0.0564},
                {"Furor",0.0564},
                {"Superior Defenses",0.0564}
            }
        },
        ["RewardSet964"]={
            ["5.00%"]={
                {"Argon Plating",0.3794},
                {"Automatic Trigger",0.0201},
                {"Furor",0.0737},
                {"Venomous Clip",0.0737}
            },
            ["Mod Drop Chance: 5.00%"]={
                {"Argon Plating",0.3794},
                {"Automatic Trigger",0.0201},
                {"Endo",0.4531},
                {"Furor",0.0737},
                {"Venomous Clip",0.0737}
            }
        },
        ["RewardSet965"]={
            ["3.00%"]={
                {"Enhanced Durability",0.0564},
                {"Furor",0.0564},
                {"Superior Defenses",0.0564}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.8308},
                {"Enhanced Durability",0.0564},
                {"Furor",0.0564},
                {"Superior Defenses",0.0564}
            }
        },
        ["RewardSet966"]={
            ["12.50%"]={
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["Mod Drop Chance: 12.50%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            }
        },
        ["RewardSet967"]={
            ["12.50%"]={
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            },
            ["Mod Drop Chance: 12.50%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Endo",0.3266},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            }
        },
        ["RewardSet968"]={
            ["12.50%"]={
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            },
            ["Mod Drop Chance: 12.50%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Endo",0.3266},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            }
        },
        ["RewardSet969"]={
            ["12.50%"]={
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["Mod Drop Chance: 12.50%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            }
        },
        ["RewardSet970"]={
            ["12.50%"]={
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            },
            ["Mod Drop Chance: 12.50%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.2529},
                {"System Reroute",0.0201}
            }
        },
        ["RewardSet971"]={
            ["25.00%"]={
                {"Cutting Edge",0.3794},
                {"Dual Rounds",0.0101},
                {"Poisonous Sting",0.1106},
                {"System Reroute",0.0101}
            },
            ["Mod Drop Chance: 25.00%"]={
                {"Cutting Edge",0.3794},
                {"Dual Rounds",0.0101},
                {"Endo",0.49},
                {"Poisonous Sting",0.1106},
                {"System Reroute",0.0101}
            }
        },
        ["RewardSet972"]={
            ["25.00%"]={
                {"Cutting Edge",0.3794},
                {"Dual Rounds",0.0101},
                {"Poisonous Sting",0.1106},
                {"System Reroute",0.0101}
            },
            ["Mod Drop Chance: 25.00%"]={
                {"Cutting Edge",0.3794},
                {"Dual Rounds",0.0101},
                {"Endo",0.49},
                {"Poisonous Sting",0.1106},
                {"System Reroute",0.0101}
            }
        },
        ["RewardSet973"]={
            ["20.00%"]={
                {"Hyperion Thrusters",0.0201},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.3794}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",0.49},
                {"Hyperion Thrusters",0.0201},
                {"Rubedo-Lined Barrel",0.1106},
                {"Sudden Impact",0.3794}
            }
        },
        ["RewardSet974"]={
            ["3.00%"]={
                {"Electrified Barrel",0.0553},
                {"Energy Amplifier",0.0553},
                {"Extend",0.3794},
                {"Morphic Transformer",0.0201},
                {"Venomous Clip",0.0553}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Electrified Barrel",0.0553},
                {"Endo",0.4347},
                {"Energy Amplifier",0.0553},
                {"Extend",0.3794},
                {"Morphic Transformer",0.0201},
                {"Venomous Clip",0.0553}
            }
        },
        ["RewardSet975"]={
            ["10.00%"]={
                {"Extend",0.2529},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.2529},
                {"Polar Magazine",0.1106}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Endo",0.3635},
                {"Extend",0.2529},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.2529},
                {"Polar Magazine",0.1106}
            }
        },
        ["RewardSet976"]={
            ["3.00%"]={
                {"Enhanced Durability",0.0752},
                {"Magazine Extension",0.2581},
                {"Modified Munitions",0.0752},
                {"Sudden Impact",0.2581}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Endo",0.3333},
                {"Enhanced Durability",0.0752},
                {"Magazine Extension",0.2581},
                {"Modified Munitions",0.0752},
                {"Sudden Impact",0.2581}
            }
        },
        ["RewardSet977"]={
            ["100.00%"]={
                {"Atlantis Vulcan",0.2105},
                {"Brief Respite",0.386},
                {"Crossing Snakes",0.1053},
                {"Stand United",0.2982}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Atlantis Vulcan",0.2105},
                {"Brief Respite",0.386},
                {"Crossing Snakes",0.1053},
                {"Stand United",0.2982}
            }
        },
        ["RewardSet978"]={
            ["100.00%"]={
                {"Carving Mantis",0.005},
                {"Spring-Loaded Blade",0.005},
                {"Vigilante Armaments",0.3794},
                {"Vigilante Fervor",0.1106},
                {"Vigilante Offense",0.005},
                {"Vigilante Pursuit",0.1106},
                {"Vigilante Supplies",0.005},
                {"Vigilante Vigor",0.3794}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Carving Mantis",0.005},
                {"Spring-Loaded Blade",0.005},
                {"Vigilante Armaments",0.3794},
                {"Vigilante Fervor",0.1106},
                {"Vigilante Offense",0.005},
                {"Vigilante Pursuit",0.1106},
                {"Vigilante Supplies",0.005},
                {"Vigilante Vigor",0.3794}
            }
        },
        ["RewardSet979"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet980"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet981"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet982"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet983"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet984"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet985"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet986"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet987"]={
            ["4.00%"]={
                {"Combustion Beam",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            },
            ["Mod Drop Chance: 4.00%"]={
                {"Combustion Beam",0.25},
                {"Endo",0.25},
                {"Gaia's Tragedy",0.25},
                {"Vulpine Mask",0.25}
            }
        },
        ["RewardSet988"]={
            ["100.00%"]={
                {"Focused Defense",0.5152},
                {"Guided Ordnance",0.2222},
                {"Narrow Barrel",0.0404},
                {"Targeting Subsystem",0.2222}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Focused Defense",0.5152},
                {"Guided Ordnance",0.2222},
                {"Narrow Barrel",0.0404},
                {"Targeting Subsystem",0.2222}
            }
        },
        ["RewardSet989"]={
            ["100.00%"]={
                {"Argon Scope",0.0067},
                {"Bladed Rounds",0.037},
                {"Blood Rush",0.037},
                {"Body Count",0.0857},
                {"Catalyzer Link",0.0857},
                {"Embedded Catalyzer",0.037},
                {"Focused Defense",0.2538},
                {"Guided Ordnance",0.037},
                {"Hydraulic Crosshairs",0.0857},
                {"Laser Sight",0.037},
                {"Maiming Strike",0.0067},
                {"Nano-Applicator",0.0067},
                {"Narrow Barrel",0.0067},
                {"Pressurized Magazine",0.0067},
                {"Repeater Clip",0.037},
                {"Sharpened Bullets",0.037},
                {"Shrapnel Shot",0.0857},
                {"Spring-Loaded Chamber",0.037},
                {"Targeting Subsystem",0.037},
                {"Weeping Wounds",0.037}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Argon Scope",0.0067},
                {"Bladed Rounds",0.037},
                {"Blood Rush",0.037},
                {"Body Count",0.0857},
                {"Catalyzer Link",0.0857},
                {"Embedded Catalyzer",0.037},
                {"Focused Defense",0.2538},
                {"Guided Ordnance",0.037},
                {"Hydraulic Crosshairs",0.0857},
                {"Laser Sight",0.037},
                {"Maiming Strike",0.0067},
                {"Nano-Applicator",0.0067},
                {"Narrow Barrel",0.0067},
                {"Pressurized Magazine",0.0067},
                {"Repeater Clip",0.037},
                {"Sharpened Bullets",0.037},
                {"Shrapnel Shot",0.0857},
                {"Spring-Loaded Chamber",0.037},
                {"Targeting Subsystem",0.037},
                {"Weeping Wounds",0.037}
            }
        },
        ["RewardSet990"]={
            ["100.00%"]={
                {"Augur Accord",0.1106},
                {"Augur Message",0.3794},
                {"Augur Pact",0.3794},
                {"Augur Reach",0.1106},
                {"Augur Secrets",0.005},
                {"Augur Seeker",0.005},
                {"Target Acquired",0.005},
                {"Twirling Spire",0.005}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Augur Accord",0.1106},
                {"Augur Message",0.3794},
                {"Augur Pact",0.3794},
                {"Augur Reach",0.1106},
                {"Augur Secrets",0.005},
                {"Augur Seeker",0.005},
                {"Target Acquired",0.005},
                {"Twirling Spire",0.005}
            }
        },
        ["RewardSet991"]={
            ["100.00%"]={
                {"Gladiator Aegis",0.3794},
                {"Gladiator Finesse",0.005},
                {"Gladiator Might",0.1106},
                {"Gladiator Resolve",0.1106},
                {"Gladiator Rush",0.3794},
                {"Gladiator Vice",0.005},
                {"Kinetic Diversion",0.005},
                {"Swooping Falcon",0.005}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Gladiator Aegis",0.3794},
                {"Gladiator Finesse",0.005},
                {"Gladiator Might",0.1106},
                {"Gladiator Resolve",0.1106},
                {"Gladiator Rush",0.3794},
                {"Gladiator Vice",0.005},
                {"Kinetic Diversion",0.005},
                {"Swooping Falcon",0.005}
            }
        },
        ["RewardSet992"]={
            ["50.00%"]={
                {"Hunter Command",0.0101},
                {"Hunter Recovery",0.7588},
                {"Hunter Synergy",0.2211},
                {"Quartakk Blueprint",1.0},
                {"Slicing Feathers",0.0101}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Quartakk Blueprint",1.0}
            },
            ["Mod Drop Chance: 50.00%"]={
                {"Hunter Command",0.0101},
                {"Hunter Recovery",0.7588},
                {"Hunter Synergy",0.2211},
                {"Slicing Feathers",0.0101}
            }
        },
        ["RewardSet993"]={
            ["100.00%"]={
                {"Hunter Adrenaline",0.2895},
                {"Hunter Command",0.1053},
                {"Hunter Munitions",0.1053},
                {"Hunter Recovery",0.2895},
                {"Hunter Synergy",0.1053},
                {"Hunter Track",0.1053}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Hunter Adrenaline",0.2895},
                {"Hunter Command",0.1053},
                {"Hunter Munitions",0.1053},
                {"Hunter Recovery",0.2895},
                {"Hunter Synergy",0.1053},
                {"Hunter Track",0.1053}
            }
        },
        ["RewardSet994"]={
            ["50.00%"]={
                {"Hunter Adrenaline",0.7588},
                {"Hunter Munitions",0.2211},
                {"Hunter Track",0.0101},
                {"Slicing Feathers",0.0101},
                {"Stubba Blueprint",1.0}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Stubba Blueprint",1.0}
            },
            ["Mod Drop Chance: 50.00%"]={
                {"Hunter Adrenaline",0.7588},
                {"Hunter Munitions",0.2211},
                {"Hunter Track",0.0101},
                {"Slicing Feathers",0.0101}
            }
        },
        ["RewardSet995"]={
            ["100.00%"]={
                {"Malignant Force",0.25},
                {"Pistol Pestilence",0.25},
                {"Toxic Barrage",0.25},
                {"Virulent Scourge",0.25}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Argon Crystal",0.5},
                {"Orokin Cell",0.5}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Malignant Force",0.25},
                {"Pistol Pestilence",0.25},
                {"Toxic Barrage",0.25},
                {"Virulent Scourge",0.25}
            }
        },
        ["RewardSet996"]={
            ["25.00%"]={
                {"Air Recon",0.3056},
                {"Broad Eye",0.3056},
                {"Eject Magazine",0.0167},
                {"Gun Glide",0.0167},
                {"Lock And Load",0.0167},
                {"Overview",0.3056},
                {"Strafing Slide",0.0167},
                {"Tactical Reload",0.0167}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 25.00%"]={
                {"Air Recon",0.3056},
                {"Broad Eye",0.3056},
                {"Eject Magazine",0.0167},
                {"Gun Glide",0.0167},
                {"Lock And Load",0.0167},
                {"Overview",0.3056},
                {"Strafing Slide",0.0167},
                {"Tactical Reload",0.0167}
            }
        },
        ["RewardSet997"]={
            ["25.00%"]={
                {"Air Recon",0.3056},
                {"Broad Eye",0.3056},
                {"Eject Magazine",0.0167},
                {"Gun Glide",0.0167},
                {"Lock And Load",0.0167},
                {"Overview",0.3056},
                {"Strafing Slide",0.0167},
                {"Tactical Reload",0.0167}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 25.00%"]={
                {"Air Recon",0.3056},
                {"Broad Eye",0.3056},
                {"Eject Magazine",0.0167},
                {"Gun Glide",0.0167},
                {"Lock And Load",0.0167},
                {"Overview",0.3056},
                {"Strafing Slide",0.0167},
                {"Tactical Reload",0.0167}
            }
        },
        ["RewardSet998"]={
            ["1.00%"]={
                {"War Blade",0.5},
                {"War Hilt",0.5}
            },
            ["15.00%"]={
                {"Agile Aim",0.1528},
                {"Double-Barrel Drift",0.0278},
                {"Reflex Draw",0.1528},
                {"Snap Shot",0.1528},
                {"Soft Hands",0.1528},
                {"Spring-Loaded Broadhead",0.0278},
                {"Spry Sights",0.1528},
                {"Twitch",0.1528},
                {"Vengeful Revenant",0.0278}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"War Blade",0.5},
                {"War Hilt",0.5}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 15.00%"]={
                {"Agile Aim",0.1528},
                {"Double-Barrel Drift",0.0278},
                {"Reflex Draw",0.1528},
                {"Snap Shot",0.1528},
                {"Soft Hands",0.1528},
                {"Spring-Loaded Broadhead",0.0278},
                {"Spry Sights",0.1528},
                {"Twitch",0.1528},
                {"Vengeful Revenant",0.0278}
            }
        },
        ["RewardSet999"]={
            ["1.00%"]={
                {"War Blade",0.5},
                {"War Hilt",0.5}
            },
            ["15.00%"]={
                {"Agile Aim",0.1528},
                {"Double-Barrel Drift",0.0278},
                {"Reflex Draw",0.1528},
                {"Snap Shot",0.1528},
                {"Soft Hands",0.1528},
                {"Spring-Loaded Broadhead",0.0278},
                {"Spry Sights",0.1528},
                {"Twitch",0.1528},
                {"Vengeful Revenant",0.0278}
            },
            ["Blueprint Drop Chance: 1.00%"]={
                {"War Blade",0.5},
                {"War Hilt",0.5}
            },
            ["Miscellaneous Drop Chance: 50.00%"]={
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 15.00%"]={
                {"Agile Aim",0.1528},
                {"Double-Barrel Drift",0.0278},
                {"Reflex Draw",0.1528},
                {"Snap Shot",0.1528},
                {"Soft Hands",0.1528},
                {"Spring-Loaded Broadhead",0.0278},
                {"Spry Sights",0.1528},
                {"Twitch",0.1528},
                {"Vengeful Revenant",0.0278}
            }
        },
        ["RewardSet1000"]={
            ["20.00%"]={
                {"Blazing Steel",0.0737},
                {"Bleeding Edge",0.3794},
                {"Dual Rounds",0.0201},
                {"Energy Amplifier",0.0737}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Blazing Steel",0.0737},
                {"Bleeding Edge",0.3794},
                {"Dual Rounds",0.0201},
                {"Endo",0.4531},
                {"Energy Amplifier",0.0737}
            }
        },
        ["RewardSet1001"]={
            ["30.00%"]={
                {"Argon Plating",0.3794},
                {"Dual Rounds",0.0201}
            },
            ["Mod Drop Chance: 30.00%"]={
                {"Argon Plating",0.3794},
                {"Dual Rounds",0.0201},
                {"Endo",0.6005}
            }
        },
        ["RewardSet1002"]={
            ["3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Bleeding Edge",0.2529},
                {"Efficient Transferral",0.0201},
                {"Endo",0.3266},
                {"Glacial Edge",0.0737},
                {"Magazine Extension",0.2529},
                {"Modified Munitions",0.0737}
            }
        },
        ["RewardSet1003"]={
            ["100.00%"]={
                {"Acid Shells",0.1111},
                {"Acid Shells",0.1111},
                {"Electromagnetic Shielding",0.1111},
                {"Electromagnetic Shielding",0.1111},
                {"Fomorian Accelerant",0.1111},
                {"Fomorian Accelerant",0.1111},
                {"Harkonar Scope",0.1111},
                {"Harkonar Scope",0.1111},
                {"Hunter's Bonesaw",0.1111},
                {"Hunter's Bonesaw",0.1111},
                {"Medi-Ray",0.1111},
                {"Medi-Ray",0.1111},
                {"Nightwatch Napalm",0.1111},
                {"Nightwatch Napalm",0.1111},
                {"Rift Strike",0.1111},
                {"Rift Strike",0.1111},
                {"Vulcan Blitz",0.1111},
                {"Vulcan Blitz",0.1111}
            },
            ["25.00%"]={
                {"Twin Kohmak Blueprint",1.0},
                {"Twin Kohmak Blueprint",1.0}
            },
            ["Blueprint Drop Chance: 25.00%"]={
                {"Twin Kohmak Blueprint",1.0},
                {"Twin Kohmak Blueprint",1.0}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Orokin Cell",0.0258},
                {"Orokin Cell",0.0258}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Acid Shells",0.1111},
                {"Acid Shells",0.1111},
                {"Electromagnetic Shielding",0.1111},
                {"Electromagnetic Shielding",0.1111},
                {"Fomorian Accelerant",0.1111},
                {"Fomorian Accelerant",0.1111},
                {"Harkonar Scope",0.1111},
                {"Harkonar Scope",0.1111},
                {"Hunter's Bonesaw",0.1111},
                {"Hunter's Bonesaw",0.1111},
                {"Medi-Ray",0.1111},
                {"Medi-Ray",0.1111},
                {"Nightwatch Napalm",0.1111},
                {"Nightwatch Napalm",0.1111},
                {"Rift Strike",0.1111},
                {"Rift Strike",0.1111},
                {"Vulcan Blitz",0.1111},
                {"Vulcan Blitz",0.1111}
            }
        },
        ["RewardSet1004"]={
            ["100.00%"]={
                {"Empowered Blades",0.0606},
                {"Final Harbinger",0.3636},
                {"High Noon",0.0606},
                {"Shotgun Amp",0.5152}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Empowered Blades",0.0606},
                {"Final Harbinger",0.3636},
                {"High Noon",0.0606},
                {"Shotgun Amp",0.5152}
            }
        },
        ["RewardSet1005"]={
            ["20.00%"]={
                {"Charm",0.0417},
                {"Reflect",0.0417},
                {"Sharpened Claws",0.4583},
                {"Swipe",0.4583}
            },
            ["Miscellaneous Drop Chance: 25.00%"]={
                {"Nav Coordinate",0.2256}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Charm",0.0417},
                {"Reflect",0.0417},
                {"Sharpened Claws",0.4583},
                {"Swipe",0.4583}
            }
        },
        ["RewardSet1006"]={
            ["20.00%"]={
                {"Cat’S Eye",0.0417},
                {"Mischief",0.0417},
                {"Pounce",0.3056},
                {"Sense Danger",0.3056},
                {"Territorial Aggression",0.3056}
            },
            ["Miscellaneous Drop Chance: 25.00%"]={
                {"Nav Coordinate",0.2256}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Cat’S Eye",0.0417},
                {"Mischief",0.0417},
                {"Pounce",0.3056},
                {"Sense Danger",0.3056},
                {"Territorial Aggression",0.3056}
            }
        },
        ["RewardSet1007"]={
            ["3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Endo",0.3003},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            }
        },
        ["RewardSet1008"]={
            ["3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Endo",0.3003},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            }
        },
        ["RewardSet1009"]={
            ["3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Endo",0.3003},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            }
        },
        ["RewardSet1010"]={
            ["3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Argon Plating",0.1897},
                {"Combustion Rounds",0.1106},
                {"Cutting Edge",0.1897},
                {"Endo",0.3003},
                {"Morphic Transformer",0.0201},
                {"Parallax Scope",0.1897}
            }
        },
        ["RewardSet1011"]={
            ["3.00%"]={
                {"Cutting Edge",0.1897},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cutting Edge",0.1897},
                {"Endo",0.4108},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            }
        },
        ["RewardSet1012"]={
            ["3.00%"]={
                {"Cutting Edge",0.1897},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cutting Edge",0.1897},
                {"Endo",0.4108},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            }
        },
        ["RewardSet1013"]={
            ["3.00%"]={
                {"Cutting Edge",0.1897},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cutting Edge",0.1897},
                {"Endo",0.4108},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            }
        },
        ["RewardSet1014"]={
            ["3.00%"]={
                {"Cutting Edge",0.1897},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            },
            ["Mod Drop Chance: 3.00%"]={
                {"Cutting Edge",0.1897},
                {"Endo",0.4108},
                {"Hollowed Bullets",0.0201},
                {"Parallax Scope",0.1897},
                {"Tempered Blade",0.1897}
            }
        },
        ["RewardSet1015"]={
            ["100.00%"]={
                {"Argon Scope",0.0404},
                {"Blood Rush",0.2222},
                {"Hydraulic Crosshairs",0.5152},
                {"Laser Sight",0.2222}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Argon Scope",0.0404},
                {"Blood Rush",0.2222},
                {"Hydraulic Crosshairs",0.5152},
                {"Laser Sight",0.2222}
            }
        },
        ["RewardSet1016"]={
            ["100.00%"]={
                {"Body Count",0.5152},
                {"Pressurized Magazine",0.0404},
                {"Repeater Clip",0.2222},
                {"Spring-Loaded Chamber",0.2222}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Body Count",0.5152},
                {"Pressurized Magazine",0.0404},
                {"Repeater Clip",0.2222},
                {"Spring-Loaded Chamber",0.2222}
            }
        },
        ["RewardSet1017"]={
            ["100.00%"]={
                {"Catalyzer Link",0.5152},
                {"Embedded Catalyzer",0.2222},
                {"Nano-Applicator",0.0404},
                {"Weeping Wounds",0.2222}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Catalyzer Link",0.5152},
                {"Embedded Catalyzer",0.2222},
                {"Nano-Applicator",0.0404},
                {"Weeping Wounds",0.2222}
            }
        },
        ["RewardSet1018"]={
            ["100.00%"]={
                {"Bladed Rounds",0.2222},
                {"Maiming Strike",0.0404},
                {"Sharpened Bullets",0.2222},
                {"Shrapnel Shot",0.5152}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Bladed Rounds",0.2222},
                {"Maiming Strike",0.0404},
                {"Sharpened Bullets",0.2222},
                {"Shrapnel Shot",0.5152}
            }
        },
        ["RewardSet1019"]={
            ["100.00%"]={
                {"Arcane Acceleration",0.0925},
                {"Arcane Aegis",0.0529},
                {"Arcane Agility",0.0925},
                {"Arcane Awakening",0.1463},
                {"Arcane Eruption",0.0925},
                {"Arcane Guardian",0.1192},
                {"Arcane Phantasm",0.0925},
                {"Arcane Precision",0.0592},
                {"Arcane Pulse",0.0529},
                {"Arcane Strike",0.1463},
                {"Arcane Ultimatum",0.0529}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Acceleration",0.0925},
                {"Arcane Aegis",0.0529},
                {"Arcane Agility",0.0925},
                {"Arcane Awakening",0.1463},
                {"Arcane Eruption",0.0925},
                {"Arcane Guardian",0.1192},
                {"Arcane Phantasm",0.0925},
                {"Arcane Precision",0.0592},
                {"Arcane Pulse",0.0529},
                {"Arcane Strike",0.1463},
                {"Arcane Ultimatum",0.0529}
            }
        },
        ["RewardSet1020"]={
            ["100.00%"]={
                {"Arcane Arachne",0.1274},
                {"Arcane Avenger",0.1124},
                {"Arcane Barrier",0.05},
                {"Arcane Energize",0.05},
                {"Arcane Fury",0.1124},
                {"Arcane Grace",0.05},
                {"Arcane Rage",0.1274},
                {"Arcane Trickery",0.2024},
                {"Arcane Velocity",0.1679}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Arachne",0.1274},
                {"Arcane Avenger",0.1124},
                {"Arcane Barrier",0.05},
                {"Arcane Energize",0.05},
                {"Arcane Fury",0.1124},
                {"Arcane Grace",0.05},
                {"Arcane Rage",0.1274},
                {"Arcane Trickery",0.2024},
                {"Arcane Velocity",0.1679}
            }
        },
        ["RewardSet1021"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1022"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1023"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1024"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1025"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1026"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1027"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1028"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1029"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1030"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1031"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1032"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1033"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1034"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1035"]={
            ["10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            },
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1036"]={
            ["20.00%"]={
                {"Silent Battery",0.4583}
            },
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",0.5417},
                {"Silent Battery",0.4583}
            }
        },
        ["RewardSet1037"]={
            ["100.00%"]={
                {"Arcane Consequence",0.1205},
                {"Arcane Deflection",0.0602},
                {"Arcane Healing",0.0602},
                {"Arcane Ice",0.1205},
                {"Arcane Momentum",0.1205},
                {"Arcane Nullifier",0.1205},
                {"Arcane Resistance",0.0602},
                {"Arcane Tempo",0.1568},
                {"Arcane Victory",0.0602},
                {"Arcane Warmth",0.1205}
            },
            ["Mod Drop Chance: 100.00%"]={
                {"Arcane Consequence",0.1205},
                {"Arcane Deflection",0.0602},
                {"Arcane Healing",0.0602},
                {"Arcane Ice",0.1205},
                {"Arcane Momentum",0.1205},
                {"Arcane Nullifier",0.1205},
                {"Arcane Resistance",0.0602},
                {"Arcane Tempo",0.1568},
                {"Arcane Victory",0.0602},
                {"Arcane Warmth",0.1205}
            }
        },
        ["RewardSet1038"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1039"]={
            ["Mod Drop Chance: 10.00%"]={
                {"Flux Overdrive",0.125},
                {"Kinetic Ricochet",0.125},
                {"Medi-Pet Kit",0.125},
                {"Pain Threshold",0.125},
                {"Shield Charger",0.125},
                {"Static Discharge",0.125},
                {"Tether Grenades",0.125},
                {"Thermagnetic Shells",0.125}
            }
        },
        ["RewardSet1040"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1041"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1042"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1043"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1044"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1045"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1046"]={
            ["Mod Drop Chance: 20.00%"]={
                {"Endo",1.0}
            }
        },
        ["RewardSet1047"]={
            ["50.00%"]={
                {"Detron Blueprint",0.5},
                {"Scimitar Avionics Blueprint",0.5}
            },
            ["Blueprint Drop Chance: 50.00%"]={
                {"Detron Blueprint",0.5},
                {"Scimitar Avionics Blueprint",0.5}
            },
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Detron Barrel",0.5},
                {"Detron Receiver",0.5}
            }
        },
        ["RewardSet1048"]={
            ["3.00%"]={
                {"Harrow Chassis Blueprint",1.0}
            },
            ["Blueprint Drop Chance: 3.00%"]={
                {"Harrow Chassis Blueprint",1.0}
            }
        },
        ["RewardSet1049"]={
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Circuits",0.6802}
            }
        },
        ["RewardSet1050"]={
            ["Miscellaneous Drop Chance: 70.00%"]={
                {"Circuits",0.6802}
            }
        },
        ["RewardSet1051"]={
            ["Miscellaneous Drop Chance: 70.00%"]={
                {"Circuits",0.6802}
            }
        },
        ["RewardSet1052"]={
            ["Miscellaneous Drop Chance: 70.00%"]={
                {"Circuits",0.6802}
            }
        },
        ["RewardSet1053"]={
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Kuaka Spinal Claw",1.0}
            }
        },
        ["RewardSet1054"]={
            ["Miscellaneous Drop Chance: 100.00%"]={
                {"Kuaka Spinal Claw",1.0}
            }
        }
    }
}
return RewardTableData
