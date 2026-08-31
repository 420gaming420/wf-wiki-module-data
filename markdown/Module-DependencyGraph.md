---
title: "Module:DependencyGraph"
wiki_url: "https://wiki.warframe.com/w/Module/DependencyGraph"
wiki_timestamp: "2022-11-07T06:32:39Z"
---

**DependencyGraph** outputs a module dependency graph of this wiki's modules using the [DOT language](https://en.wikipedia.org/wiki/DOT_(graph_description_language) "wikipedia:DOT (graph description language)").

Requires [Extension:DynamicPageList](/w/Community:Help:DynamicPageList?action=edit&redlink=1 "Community:Help:DynamicPageList (page does not exist)") enabled on your wiki.

Recommended layout algorithms for rendering resultant DOT file:

* `fdp`/`sfdp` - useful for viewing entire codebase w/ clustering of module families
* `circo` - circular layout, useful for finding modules/submodules with the fewest dependencies

See <https://www.rdocumentation.org/packages/Rgraphviz/versions/2.16.0/topics/GraphvizLayouts> for more details on these layout algorithms.

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Module DOT Output](#Module_DOT_Output)
  + [2.1 Non-clustered](#Non-clustered)
  + [2.2 Clustered](#Clustered)
  + [2.3 Cleaning up non-clustered graph](#Cleaning_up_non-clustered_graph)
* [3 Wiki's Dependency Graphs](#Wiki's_Dependency_Graphs)
* [4 Documentation](#Documentation)
  + [4.1 Package items](#Package_items)
* [5 See Also](#See_Also)
* [6 Code](#Code)

## Usage

### Direct Invocation

```lua
{{#invoke:DependencyGraph|main}}
```

## Module DOT Output

### Non-clustered

View DOT file▾▾

**Lua error: Module:DependencyGraph:76: "Module:Enemies/data/pre" does not exist
table#1 {**

**```lua
   ["Module:Ability"] = table#2 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
   },
   ["Module:Ability/Conclave/data"] = table#3 {
   },
   ["Module:Ability/infobox"] = table#4 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Ability/infoboxTEST"] = table#5 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
       ["Module:Maximization"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Acquisition"] = table#6 {
       ["Module:Blueprints/data"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Acquisition/dev"] = table#7 {
       ["Dev:Entrypoint"] = 0,
       ["Dev:User error"] = 0,
       ["Module:Acquisition/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Lua"] = 0,
       ["Module:Math"] = 0,
       ["Module:String"] = 0,
   },
   ["Module:Acquisition/testcases"] = table#8 {
       ["Dev:User error"] = 0,
   },
   ["Module:AnexeraTest1"] = table#9 {
       ["Module:Arguments"] = 0,
       ["Module:Baro/data"] = 0,
       ["Module:Baro/data/typeConfigs"] = 0,
       ["Module:Entrypoint"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Animal/infobox"] = table#10 {
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Resources/data"] = 0,
   },
   ["Module:Arcane"] = table#11 {
       ["Module:Arcane/data"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Arcane/dev"] = table#12 {
   },
   ["Module:Arcane/infobox"] = table#13 {
       ["Module:Arcane/data"] = 0,
       ["Module:DropTables"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Table"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:ArchModBox"] = table#14 {
       ["Module:InfoboxBuilder"] = 0,
   },
   ["Module:Arguments"] = table#15 {
       ["Module:Arguments"] = 0,
       ["Module:I18n"] = 0,
   },
   ["Module:Arguments/i18n"] = table#16 {
   },
   ["Module:Avionics"] = table#17 {
       ["Module:Avionics/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Avionics/data"] = table#18 {
       ["Module:Avionics/data/desc"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Avionics/data/desc"] = table#19 {
   },
   ["Module:Baro"] = table#20 {
       ["Module:Arguments"] = 0,
       ["Module:Baro/data"] = 0,
       ["Module:Baro/data/typeConfigs"] = 0,
       ["Module:Entrypoint"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Baro/data/typeConfigs"] = table#21 {
   },
   ["Module:Baro/data/visits"] = table#22 {
       ["Module:Baro/data"] = 0,
   },
   ["Module:Baro/history"] = table#23 {
       ["Module:Baro/data"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Baro/testcases"] = table#24 {
   },
   ["Module:Blueprints/data/dev"] = table#25 {
   },
   ["Module:BuildRequire"] = table#26 {
       ["Module:Icon"] = 0,
   },
   ["Module:CSV"] = table#27 {
       ["Module:CSV"] = 0,
   },
   ["Module:ChickenArchive"] = table#28 {
       ["Module:ChickenTest/data"] = 0,
       ["Module:Icon/data"] = 0,
   },
   ["Module:ChickenTest"] = table#29 {
       ["Module:Icon/data"] = 0,
   },
   ["Module:ChickenTest/data"] = table#30 {
   },
   ["Module:ChickenTest2"] = table#31 {
       ["Module:ChickenTest/data"] = 0,
   },
   ["Module:Codex"] = table#32 {
       ["Module:Codex/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Common"] = table#33 {
       ["Module:Entrypoint"] = 0,
   },
   ["Module:Common/i18n"] = table#34 {
   },
   ["Module:Companions/infobox"] = table#35 {
       ["Module:Baro"] = 0,
       ["Module:Companions/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Math"] = 0,
       ["Module:Polarity"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Conservation"] = table#36 {
       ["Module:Conservation/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Conservation/infobox"] = table#37 {
       ["Module:Conservation/data"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Math"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Tooltips/icon"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Conservation/testcases"] = table#38 {
   },
   ["Module:Cosmetics"] = table#39 {
       ["Module:Companions/data"] = 0,
       ["Module:Cosmetics/data"] = 0,
       ["Module:Delay"] = 0,
       ["Module:Warframes/data"] = 0,
       ["Module:Weapons/data"] = 0,
   },
   ["Module:Cosmetics/data"] = table#40 {
       ["Module:Cosmetics/data/animationset"] = 0,
       ["Module:Cosmetics/data/archwingskin"] = 0,
       ["Module:Cosmetics/data/armor"] = 0,
       ["Module:Cosmetics/data/atomicyclelivery"] = 0,
       ["Module:Cosmetics/data/auxiliary"] = 0,
       ["Module:Cosmetics/data/emblem"] = 0,
       ["Module:Cosmetics/data/emotionmodule"] = 0,
       ["Module:Cosmetics/data/ephemera"] = 0,
       ["Module:Cosmetics/data/face"] = 0,
       ["Module:Cosmetics/data/facialaccessory"] = 0,
       ["Module:Cosmetics/data/genemaskingkit"] = 0,
       ["Module:Cosmetics/data/holster"] = 0,
       ["Module:Cosmetics/data/kahlarmor"] = 0,
       ["Module:Cosmetics/data/kaithe"] = 0,
       ["Module:Cosmetics/data/kavatarmor"] = 0,
       ["Module:Cosmetics/data/kdriveskin"] = 0,
       ["Module:Cosmetics/data/kubrowarmor"] = 0,
       ["Module:Cosmetics/data/kubrowcollar"] = 0,
       ["Module:Cosmetics/data/landingcraftlivery"] = 0,
       ["Module:Cosmetics/data/lotusskin"] = 0,
       ["Module:Cosmetics/data/moaskin"] = 0,
       ["Module:Cosmetics/data/necramechskin"] = 0,
       ["Module:Cosmetics/data/parazonskin"] = 0,
       ["Module:Cosmetics/data/pattern"] = 0,
       ["Module:Cosmetics/data/railjackskin"] = 0,
       ["Module:Cosmetics/data/scrawl"] = 0,
       ["Module:Cosmetics/data/sentinelarmor"] = 0,
       ["Module:Cosmetics/data/sentinelskin"] = 0,
       ["Module:Cosmetics/data/signa"] = 0,
       ["Module:Cosmetics/data/sugatra"] = 0,
       ["Module:Cosmetics/data/sumdali"] = 0,
       ["Module:Cosmetics/data/syandana"] = 0,
       ["Module:Cosmetics/data/texture"] = 0,
       ["Module:Cosmetics/data/transferencesuit"] = 0,
       ["Module:Cosmetics/data/uncategorized"] = 0,
       ["Module:Cosmetics/data/visageink"] = 0,
       ["Module:Cosmetics/data/warframehelmet"] = 0,
       ["Module:Cosmetics/data/warframeskin"] = 0,
       ["Module:Cosmetics/data/weaponskin"] = 0,
       ["Module:Cosmetics/userdata"] = 0,
       ["Module:Sigils/data"] = 0,
       ["Module:TennoGen/data"] = 0,
   },
   ["Module:Cosmetics/data/archwingskin"] = table#41 {
   },
   ["Module:Cosmetics/data/atomicyclelivery"] = table#42 {
   },
   ["Module:Cosmetics/data/auxiliary"] = table#43 {
   },
   ["Module:Cosmetics/data/emotionmodule"] = table#44 {
   },
   ["Module:Cosmetics/data/holster"] = table#45 {
   },
   ["Module:Cosmetics/data/kahlarmor"] = table#46 {
   },
   ["Module:Cosmetics/data/kaithe"] = table#47 {
   },
   ["Module:Cosmetics/data/kavatarmor"] = table#48 {
   },
   ["Module:Cosmetics/data/kdriveskin"] = table#49 {
   },
   ["Module:Cosmetics/data/kubrowarmor"] = table#50 {
   },
   ["Module:Cosmetics/data/kubrowcollar"] = table#51 {
   },
   ["Module:Cosmetics/data/landingcraftlivery"] = table#52 {
   },
   ["Module:Cosmetics/data/lotusskin"] = table#53 {
   },
   ["Module:Cosmetics/data/moaskin"] = table#54 {
   },
   ["Module:Cosmetics/data/necramechskin"] = table#55 {
   },
   ["Module:Cosmetics/data/parazonskin"] = table#56 {
   },
   ["Module:Cosmetics/data/pattern"] = table#57 {
   },
   ["Module:Cosmetics/data/railjackskin"] = table#58 {
   },
   ["Module:Cosmetics/data/scrawl"] = table#59 {
   },
   ["Module:Cosmetics/data/sentinelskin"] = table#60 {
   },
   ["Module:Cosmetics/data/signa"] = table#61 {
   },
   ["Module:Cosmetics/data/sugatra"] = table#62 {
   },
   ["Module:Cosmetics/data/sumdali"] = table#63 {
   },
   ["Module:Cosmetics/data/texture"] = table#64 {
   },
   ["Module:Cosmetics/data/uncategorized"] = table#65 {
   },
   ["Module:Cosmetics/data/validate"] = table#66 {
       ["Module:Cosmetics/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Cosmetics/data/visageink"] = table#67 {
   },
   ["Module:Cosmetics/infobox"] = table#68 {
       ["Module:Baro"] = 0,
       ["Module:Cosmetics/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Cost"] = table#69 {
       ["Module:Blueprints/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Math"] = 0,
       ["Module:Research/data"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:CroqueTest"] = table#70 {
       ["Module:CroqueTest/BKT"] = 0,
       ["Module:CroqueTest/data"] = 0,
       ["Module:CroqueTest/keywords"] = 0,
       ["Module:Research/data"] = 0,
       ["Module:Warframes/data"] = 0,
       ["Module:Weapons/data"] = 0,
   },
   ["Module:CroqueTest/data"] = table#71 {
   },
   ["Module:CroqueTest2"] = table#72 {
       ["Module:Shared"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:CroqueTestModular/modulstats"] = table#73 {
   },
   ["Module:DamageTypes"] = table#74 {
       ["Module:DamageTypes/data"] = 0,
       ["Module:Icon/data"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:DamageTypes/colorContrastAdjuster"] = table#75 {
   },
   ["Module:DamageTypes/testcases"] = table#76 {
   },
   ["Module:Database"] = table#77 {
   },
   ["Module:DatastoreManifest"] = table#78 {
   },
   ["Module:Decorations"] = table#79 {
       ["Module:Decorations/data"] = 0,
       ["Module:Math"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Delay"] = table#80 {
   },
   ["Module:DevstreamParticipantsList"] = table#81 {
   },
   ["Module:Docbunto/cli"] = table#82 {
       ["Dev:CLI"] = 0,
       ["Dev:Docbunto"] = 0,
       ["Dev:FrameTools"] = 0,
       ["Dev:Json"] = 0,
   },
   ["Module:Docbunto/i18n"] = table#83 {
   },
   ["Module:DojoRoom/data"] = table#84 {
   },
   ["Module:DropTables/JSON"] = table#85 {
       ["Module:DropTables/JSON/"] = 0,
   },
   ["Module:DropTables/JSON/Sorties"] = table#86 {
   },
   ["Module:DropTables/JSON/Transient"] = table#87 {
   },
   ["Module:Emptylord"] = table#88 {
       ["Module:Emptylord/data"] = 0,
   },
   ["Module:Emptylord/getter"] = table#89 {
       ["Module:Emptylord/data"] = 0,
   },
   ["Module:Enemies/data"] = table#90 {
       ["Module:Enemies/data"] = 0,
       ["Module:LuaSerializer"] = 0,
   },
   ["Module:Enemies/data/anarchs"] = table#91 {
   },
   ["Module:Enemies/data/narmer"] = table#92 {
   },
   ["Module:Enemies/data/orokin"] = table#93 {
   },
   ["Module:Enemies/data/pre"] = table#94 {
   },
   ["Module:Enemies/data/scaldra"] = table#95 {
   },
   ["Module:Enemies/data/sentient"] = table#96 {
   },
   ["Module:Enemies/data/stalker"] = table#97 {
   },
   ["Module:Enemies/data/techrot"] = table#98 {
   },
   ["Module:Enemies/data/themurmur"] = table#99 {
   },
   ["Module:Enemies/infobox/dev"] = table#100 {
   },
   ["Module:Entrypoint"] = table#101 {
   },
   ["Module:Enum/data"] = table#102 {
   },
   ["Module:FINNER DropTables Test"] = table#103 {
   },
   ["Module:FINNER Icon Test"] = table#104 {
   },
   ["Module:FINNER Test/data"] = table#105 {
   },
   ["Module:FINNER Test/data/4"] = table#106 {
   },
   ["Module:FINNER Test/data/5"] = table#107 {
   },
   ["Module:FINNER Test/data/8"] = table#108 {
   },
   ["Module:FINNER Warframe Test"] = table#109 {
   },
   ["Module:FINNER Weapon Test"] = table#110 {
   },
   ["Module:FactionScript"] = table#111 {
   },
   ["Module:FactionScript/data"] = table#112 {
   },
   ["Module:Factions/data"] = table#113 {
   },
   ["Module:FallbackList"] = table#114 {
   },
   ["Module:FalterTest"] = table#115 {
   },
   ["Module:FalterTest/data"] = table#116 {
   },
   ["Module:Flaicher"] = table#117 {
   },
   ["Module:Flaicher/Conv"] = table#118 {
   },
   ["Module:Flaicher/Mods"] = table#119 {
   },
   ["Module:Flaicher/dispoData"] = table#120 {
   },
   ["Module:FlaicherTest"] = table#121 {
   },
   ["Module:Focus"] = table#122 {
   },
   ["Module:Focus/data/archived"] = table#123 {
   },
   ["Module:Focus/infobox"] = table#124 {
   },
   ["Module:FormatingTool"] = table#125 {
   },
   ["Module:FormatingTool/data"] = table#126 {
   },
   ["Module:FormatingTool/missions"] = table#127 {
   },
   ["Module:Gallery"] = table#128 {
   },
   ["Module:Gallery/testcases"] = table#129 {
   },
   ["Module:GigaTest"] = table#130 {
   },
   ["Module:GuaranteedRewards/data"] = table#131 {
   },
   ["Module:HexTest"] = table#132 {
   },
   ["Module:I18n"] = table#133 {
   },
   ["Module:I18n/testcases"] = table#134 {
   },
   ["Module:Icon"] = table#135 {
   },
   ["Module:Icon/data"] = table#136 {
   },
   ["Module:Icon/testcases"] = table#137 {
   },
   ["Module:Infobox"] = table#138 {
   },
   ["Module:Infobox/i18n"] = table#139 {
   },
   ["Module:InfoboxBuilder"] = table#140 {
   },
   ["Module:InfoboxBuilder/dev"] = table#141 {
   },
   ["Module:InfoboxGallery"] = table#142 {
   },
   ["Module:Inspect"] = table#143 {
   },
   ["Module:InternalNames"] = table#144 {
   },
   ["Module:JSON"] = table#145 {
   },
   ["Module:KeyBindings"] = table#146 {
   },
   ["Module:KeyBindings/data"] = table#147 {
   },
   ["Module:Keys/data"] = table#148 {
   },
   ["Module:Lang/ISO 639 synonyms"] = table#149 {
   },
   ["Module:Lang/configuration"] = table#150 {
   },
   ["Module:Lang/data"] = table#151 {
   },
   ["Module:Lang/data/iana regions"] = table#152 {
   },
   ["Module:Lang/data/iana scripts"] = table#153 {
   },
   ["Module:Lang/data/iana suppressed scripts"] = table#154 {
   },
   ["Module:Lang/data/iana variants"] = table#155 {
   },
   ["Module:Lang/data/is latn data"] = table#156 {
   },
   ["Module:LanguageList"] = table#157 {
   },
   ["Module:Lexer"] = table#158 {
   },
   ["Module:Localization"] = table#159 {
   },
   ["Module:Lua"] = table#160 {
   },
   ["Module:LuaClassSystem"] = table#161 {
   },
   ["Module:LuaSerializer"] = table#162 {
   },
   ["Module:LuaSerializer/dev"] = table#163 {
   },
   ["Module:LuaSerializerTwo"] = table#164 {
   },
   ["Module:Map"] = table#165 {
   },
   ["Module:Map/testcases"] = table#166 {
   },
   ["Module:MasteryRank"] = table#167 {
   },
   ["Module:MasteryRank/dev"] = table#168 {
   },
   ["Module:Math/i18n"] = table#169 {
   },
   ["Module:Math/testcases"] = table#170 {
   },
   ["Module:Math/testcases/module"] = table#171 {
   },
   ["Module:Maximization"] = table#172 {
   },
   ["Module:Maximization/data"] = table#173 {
   },
   ["Module:Mbox"] = table#174 {
   },
   ["Module:Mbox/i18n"] = table#175 {
   },
   ["Module:Missions"] = table#176 {
   },
   ["Module:Missions/dev"] = table#177 {
   },
   ["Module:Missions/infobox"] = table#178 {
   },
   ["Module:Missions/page"] = table#179 {
   },
   ["Module:Mods"] = table#180 {
   },
   ["Module:Mods/csv"] = table#181 {
   },
   ["Module:Mods/csv2"] = table#182 {
   },
   ["Module:Mods/data/validate"] = table#183 {
   },
   ["Module:Mods/infobox"] = table#184 {
   },
   ["Module:Mods/itemCompatibility"] = table#185 {
   },
   ["Module:Mods/itemCompatibility/data"] = table#186 {
   },
   ["Module:Mods/testcases"] = table#187 {
   },
   ["Module:Modular/data"] = table#188 {
   },
   ["Module:Modular/generator"] = table#189 {
   },
   ["Module:ModuleTest"] = table#190 {
   },
   ["Module:Music/data"] = table#191 {
   },
   ["Module:MyCodex"] = table#192 {
   },
   ["Module:Navbox"] = table#193 {
   },
   ["Module:Navigation"] = table#194 {
   },
   ["Module:Navigation/dev"] = table#195 {
   },
   ["Module:NightwaveActs"] = table#196 {
   },
   ["Module:NightwaveActs/acts.json"] = table#197 {
   },
   ["Module:NightwaveActs/dev"] = table#198 {
   },
   ["Module:Placeholder"] = table#199 {
   },
   ["Module:Polarity"] = table#200 {
   },
   ["Module:Reference"] = table#201 {
   },
   ["Module:ReleaseStatus"] = table#202 {
   },
   ["Module:ReleaseStatus/data"] = table#203 {
   },
   ["Module:ReleaseStatus/i18n"] = table#204 {
   },
   ["Module:RemoveCategory"] = table#205 {
   },
   ["Module:Resources"] = table#206 {
   },
   ["Module:Resources/data/validate"] = table#207 {
   },
   ["Module:Resources/infobox"] = table#208 {
   },
   ["Module:Sandbox"] = table#209 {
   },
   ["Module:Sandbox/ArbitraryMary/SigilGallery"] = table#210 {
   },
   ["Module:Sandbox/DutyS12345"] = table#211 {
   },
   ["Module:Sandbox/Hilycker/SortTest"] = table#212 {
   },
   ["Module:Sandbox/Hilycker/SortTest/data"] = table#213 {
   },
   ["Module:Sandbox/Moxian"] = table#214 {
   },
   ["Module:Sandbox/ScribuntoDebugConsole"] = table#215 {
   },
   ["Module:Sandbox/Sean/Tooltips"] = table#216 {
   },
   ["Module:Sandbox/Sean/Tooltips/icon"] = table#217 {
   },
   ["Module:Sandbox/Sean/Warframes"] = table#218 {
   },
   ["Module:Sandbox/Sean/Warframes/infobox"] = table#219 {
   },
   ["Module:Sandbox/Sean/Weapons/nav"] = table#220 {
   },
   ["Module:Sandbox/SkipThisAd/DropTables"] = table#221 {
   },
   ["Module:Sandbox/Vondak/Test"] = table#222 {
   },
   ["Module:Sandbox/lonnstyle/Warframes/infobox"] = table#223 {
   },
   ["Module:ScientiaStances/data"] = table#224 {
   },
   ["Module:ScientiaStances/sharedCombosData"] = table#225 {
   },
   ["Module:ScientiaTest"] = table#226 {
   },
   ["Module:ScientiaTest/i18n"] = table#227 {
   },
   ["Module:Shared"] = table#228 {
   },
   ["Module:Shared/testcases"] = table#229 {
   },
   ["Module:SnekwTest"] = table#230 {
   },
   ["Module:SpxceVendor"] = table#231 {
   },
   ["Module:Stances"] = table#232 {
   },
   ["Module:Stances/dev"] = table#233 {
   },
   ["Module:StatObject"] = table#234 {
   },
   ["Module:String"] = table#235 {
   },
   ["Module:String/testcases"] = table#236 {
   },
   ["Module:Switch Infobox"] = table#237 {
   },
   ["Module:Syndicates/data"] = table#238 {
   },
   ["Module:SynthTest"] = table#239 {
   },
   ["Module:Table"] = table#240 {
   },
   ["Module:Table/testcases"] = table#241 {
   },
   ["Module:Tabs"] = table#242 {
   },
   ["Module:TennoGen"] = table#243 {
   },
   ["Module:TennoScript"] = table#244 {
   },
   ["Module:TestHarness/i18n"] = table#245 {
   },
   ["Module:Text"] = table#246 {
   },
   ["Module:TextIcons"] = table#247 {
   },
   ["Module:Tooltips"] = table#248 {
   },
   ["Module:Tooltips/data"] = table#249 {
   },
   ["Module:Tooltips/data/Ability"] = table#250 {
   },
   ["Module:Tooltips/data/Arcane"] = table#251 {
   },
   ["Module:Tooltips/data/DamageTypes"] = table#252 {
   },
   ["Module:Tooltips/data/Mods"] = table#253 {
   },
   ["Module:Tooltips/data/Void"] = table#254 {
   },
   ["Module:Tooltips/data/Warframes"] = table#255 {
   },
   ["Module:Tooltips/data/Weapons"] = table#256 {
   },
   ["Module:Tooltips/dev"] = table#257 {
   },
   ["Module:Tooltips/icon"] = table#258 {
   },
   ["Module:Tooltips/icon/dev"] = table#259 {
   },
   ["Module:Tooltips/testcases"] = table#260 {
   },
   ["Module:Tooltips/tip/dev"] = table#261 {
   },
   ["Module:TrajosAcquisition"] = table#262 {
   },
   ["Module:TrajosVoid"] = table#263 {
   },
   ["Module:TranslationExamples"] = table#264 {
   },
   ["Module:Unicode data"] = table#265 {
   },
   ["Module:Unindent"] = table#266 {
   },
   ["Module:Upgrades/data"] = table#267 {
   },
   ["Module:User"] = table#268 {
   },
   ["Module:UserError"] = table#269 {
   },
   ["Module:Vehicles/data"] = table#270 {
   },
   ["Module:Vehicles/infobox"] = table#271 {
   },
   ["Module:Vendors"] = table#272 {
   },
   ["Module:Version"] = table#273 {
   },
   ["Module:VideoGallery"] = table#274 {
   },
   ["Module:Void/data/validate"] = table#275 {
   },
   ["Module:Void/dev"] = table#276 {
   },
   ["Module:Void/page"] = table#277 {
   },
   ["Module:VoidByReward"] = table#278 {
   },
   ["Module:WDSButton"] = table#279 {
   },
   ["Module:WDSButton/data"] = table#280 {
   },
   ["Module:Warframes"] = table#281 {
   },
   ["Module:Warframes/Conclave/data"] = table#282 {
   },
   ["Module:Warframes/infobox"] = table#283 {
   },
   ["Module:Warframes/testcases"] = table#284 {
   },
   ["Module:Weapons/Conclave/data"] = table#285 {
   },
   ["Module:Weapons/characteristics"] = table#286 {
   },
   ["Module:Weapons/compare"] = table#287 {
   },
   ["Module:Weapons/comptable"] = table#288 {
   },
   ["Module:Weapons/csv"] = table#289 {
   },
   ["Module:Weapons/data"] = table#290 {
   },
   ["Module:Weapons/data/credits"] = table#291 {
   },
   ["Module:Weapons/data/misc"] = table#292 {
   },
   ["Module:Weapons/data/validate"] = table#293 {
   },
   ["Module:Weapons/dev"] = table#294 {
   },
   ["Module:Weapons/infobox"] = table#295 {
   },
   ["Module:Weapons/nav"] = table#296 {
   },
   ["Module:Weapons/ppdata/seeder"] = table#297 {
   },
   ["Module:Weapons/preprocess"] = table#298 {
   },
   ["Module:Weapons/sandbox"] = table#299 {
   },
   ["Module:Weapons/testcases"] = table#300 {
   },
   ["Module:WorldState"] = table#301 {
   },
   ["Module:Worldstate/data"] = table#302 {
   },
   ["Module:Yesno"] = table#303 {
   },
   ["Module:Yesno/testcases"] = table#304 {
   },
```**

**}.**

### Clustered

View DOT file▾▾

**Lua error: Module:DependencyGraph:76: "Module:Enemies/data/pre" does not exist
table#1 {**

**```lua
   ["Module:Ability"] = table#2 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
   },
   ["Module:Ability/Conclave/data"] = table#3 {
   },
   ["Module:Ability/infobox"] = table#4 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Ability/infoboxTEST"] = table#5 {
       ["Module:Ability/Conclave/data"] = 0,
       ["Module:Ability/data"] = 0,
       ["Module:Maximization"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Acquisition"] = table#6 {
       ["Module:Blueprints/data"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Acquisition/dev"] = table#7 {
       ["Dev:Entrypoint"] = 0,
       ["Dev:User error"] = 0,
       ["Module:Acquisition/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Lua"] = 0,
       ["Module:Math"] = 0,
       ["Module:String"] = 0,
   },
   ["Module:Acquisition/testcases"] = table#8 {
       ["Dev:User error"] = 0,
   },
   ["Module:AnexeraTest1"] = table#9 {
       ["Module:Arguments"] = 0,
       ["Module:Baro/data"] = 0,
       ["Module:Baro/data/typeConfigs"] = 0,
       ["Module:Entrypoint"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Animal/infobox"] = table#10 {
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Resources/data"] = 0,
   },
   ["Module:Arcane"] = table#11 {
       ["Module:Arcane/data"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Arcane/dev"] = table#12 {
   },
   ["Module:Arcane/infobox"] = table#13 {
       ["Module:Arcane/data"] = 0,
       ["Module:DropTables"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Table"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:ArchModBox"] = table#14 {
       ["Module:InfoboxBuilder"] = 0,
   },
   ["Module:Arguments"] = table#15 {
       ["Module:Arguments"] = 0,
       ["Module:I18n"] = 0,
   },
   ["Module:Arguments/i18n"] = table#16 {
   },
   ["Module:Avionics"] = table#17 {
       ["Module:Avionics/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Avionics/data"] = table#18 {
       ["Module:Avionics/data/desc"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Avionics/data/desc"] = table#19 {
   },
   ["Module:Baro"] = table#20 {
       ["Module:Arguments"] = 0,
       ["Module:Baro/data"] = 0,
       ["Module:Baro/data/typeConfigs"] = 0,
       ["Module:Entrypoint"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Baro/data/typeConfigs"] = table#21 {
   },
   ["Module:Baro/data/visits"] = table#22 {
       ["Module:Baro/data"] = 0,
   },
   ["Module:Baro/history"] = table#23 {
       ["Module:Baro/data"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Baro/testcases"] = table#24 {
   },
   ["Module:Blueprints/data/dev"] = table#25 {
   },
   ["Module:BuildRequire"] = table#26 {
       ["Module:Icon"] = 0,
   },
   ["Module:CSV"] = table#27 {
       ["Module:CSV"] = 0,
   },
   ["Module:ChickenArchive"] = table#28 {
       ["Module:ChickenTest/data"] = 0,
       ["Module:Icon/data"] = 0,
   },
   ["Module:ChickenTest"] = table#29 {
       ["Module:Icon/data"] = 0,
   },
   ["Module:ChickenTest/data"] = table#30 {
   },
   ["Module:ChickenTest2"] = table#31 {
       ["Module:ChickenTest/data"] = 0,
   },
   ["Module:Codex"] = table#32 {
       ["Module:Codex/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Common"] = table#33 {
       ["Module:Entrypoint"] = 0,
   },
   ["Module:Common/i18n"] = table#34 {
   },
   ["Module:Companions/infobox"] = table#35 {
       ["Module:Baro"] = 0,
       ["Module:Companions/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Math"] = 0,
       ["Module:Polarity"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Conservation"] = table#36 {
       ["Module:Conservation/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Conservation/infobox"] = table#37 {
       ["Module:Conservation/data"] = 0,
       ["Module:DropTables/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:Math"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Tooltips/icon"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Conservation/testcases"] = table#38 {
   },
   ["Module:Cosmetics"] = table#39 {
       ["Module:Companions/data"] = 0,
       ["Module:Cosmetics/data"] = 0,
       ["Module:Delay"] = 0,
       ["Module:Warframes/data"] = 0,
       ["Module:Weapons/data"] = 0,
   },
   ["Module:Cosmetics/data"] = table#40 {
       ["Module:Cosmetics/data/animationset"] = 0,
       ["Module:Cosmetics/data/archwingskin"] = 0,
       ["Module:Cosmetics/data/armor"] = 0,
       ["Module:Cosmetics/data/atomicyclelivery"] = 0,
       ["Module:Cosmetics/data/auxiliary"] = 0,
       ["Module:Cosmetics/data/emblem"] = 0,
       ["Module:Cosmetics/data/emotionmodule"] = 0,
       ["Module:Cosmetics/data/ephemera"] = 0,
       ["Module:Cosmetics/data/face"] = 0,
       ["Module:Cosmetics/data/facialaccessory"] = 0,
       ["Module:Cosmetics/data/genemaskingkit"] = 0,
       ["Module:Cosmetics/data/holster"] = 0,
       ["Module:Cosmetics/data/kahlarmor"] = 0,
       ["Module:Cosmetics/data/kaithe"] = 0,
       ["Module:Cosmetics/data/kavatarmor"] = 0,
       ["Module:Cosmetics/data/kdriveskin"] = 0,
       ["Module:Cosmetics/data/kubrowarmor"] = 0,
       ["Module:Cosmetics/data/kubrowcollar"] = 0,
       ["Module:Cosmetics/data/landingcraftlivery"] = 0,
       ["Module:Cosmetics/data/lotusskin"] = 0,
       ["Module:Cosmetics/data/moaskin"] = 0,
       ["Module:Cosmetics/data/necramechskin"] = 0,
       ["Module:Cosmetics/data/parazonskin"] = 0,
       ["Module:Cosmetics/data/pattern"] = 0,
       ["Module:Cosmetics/data/railjackskin"] = 0,
       ["Module:Cosmetics/data/scrawl"] = 0,
       ["Module:Cosmetics/data/sentinelarmor"] = 0,
       ["Module:Cosmetics/data/sentinelskin"] = 0,
       ["Module:Cosmetics/data/signa"] = 0,
       ["Module:Cosmetics/data/sugatra"] = 0,
       ["Module:Cosmetics/data/sumdali"] = 0,
       ["Module:Cosmetics/data/syandana"] = 0,
       ["Module:Cosmetics/data/texture"] = 0,
       ["Module:Cosmetics/data/transferencesuit"] = 0,
       ["Module:Cosmetics/data/uncategorized"] = 0,
       ["Module:Cosmetics/data/visageink"] = 0,
       ["Module:Cosmetics/data/warframehelmet"] = 0,
       ["Module:Cosmetics/data/warframeskin"] = 0,
       ["Module:Cosmetics/data/weaponskin"] = 0,
       ["Module:Cosmetics/userdata"] = 0,
       ["Module:Sigils/data"] = 0,
       ["Module:TennoGen/data"] = 0,
   },
   ["Module:Cosmetics/data/archwingskin"] = table#41 {
   },
   ["Module:Cosmetics/data/atomicyclelivery"] = table#42 {
   },
   ["Module:Cosmetics/data/auxiliary"] = table#43 {
   },
   ["Module:Cosmetics/data/emotionmodule"] = table#44 {
   },
   ["Module:Cosmetics/data/holster"] = table#45 {
   },
   ["Module:Cosmetics/data/kahlarmor"] = table#46 {
   },
   ["Module:Cosmetics/data/kaithe"] = table#47 {
   },
   ["Module:Cosmetics/data/kavatarmor"] = table#48 {
   },
   ["Module:Cosmetics/data/kdriveskin"] = table#49 {
   },
   ["Module:Cosmetics/data/kubrowarmor"] = table#50 {
   },
   ["Module:Cosmetics/data/kubrowcollar"] = table#51 {
   },
   ["Module:Cosmetics/data/landingcraftlivery"] = table#52 {
   },
   ["Module:Cosmetics/data/lotusskin"] = table#53 {
   },
   ["Module:Cosmetics/data/moaskin"] = table#54 {
   },
   ["Module:Cosmetics/data/necramechskin"] = table#55 {
   },
   ["Module:Cosmetics/data/parazonskin"] = table#56 {
   },
   ["Module:Cosmetics/data/pattern"] = table#57 {
   },
   ["Module:Cosmetics/data/railjackskin"] = table#58 {
   },
   ["Module:Cosmetics/data/scrawl"] = table#59 {
   },
   ["Module:Cosmetics/data/sentinelskin"] = table#60 {
   },
   ["Module:Cosmetics/data/signa"] = table#61 {
   },
   ["Module:Cosmetics/data/sugatra"] = table#62 {
   },
   ["Module:Cosmetics/data/sumdali"] = table#63 {
   },
   ["Module:Cosmetics/data/texture"] = table#64 {
   },
   ["Module:Cosmetics/data/uncategorized"] = table#65 {
   },
   ["Module:Cosmetics/data/validate"] = table#66 {
       ["Module:Cosmetics/data"] = 0,
       ["Module:Table"] = 0,
   },
   ["Module:Cosmetics/data/visageink"] = table#67 {
   },
   ["Module:Cosmetics/infobox"] = table#68 {
       ["Module:Baro"] = 0,
       ["Module:Cosmetics/data"] = 0,
       ["Module:InfoboxBuilder"] = 0,
       ["Module:TextIcons"] = 0,
       ["Module:Tooltips"] = 0,
       ["Module:Vendors"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:Cost"] = table#69 {
       ["Module:Blueprints/data"] = 0,
       ["Module:Icon"] = 0,
       ["Module:Math"] = 0,
       ["Module:Research/data"] = 0,
       ["Module:String"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:CroqueTest"] = table#70 {
       ["Module:CroqueTest/BKT"] = 0,
       ["Module:CroqueTest/data"] = 0,
       ["Module:CroqueTest/keywords"] = 0,
       ["Module:Research/data"] = 0,
       ["Module:Warframes/data"] = 0,
       ["Module:Weapons/data"] = 0,
   },
   ["Module:CroqueTest/data"] = table#71 {
   },
   ["Module:CroqueTest2"] = table#72 {
       ["Module:Shared"] = 0,
       ["Module:Version"] = 0,
   },
   ["Module:CroqueTestModular/modulstats"] = table#73 {
   },
   ["Module:DamageTypes"] = table#74 {
       ["Module:DamageTypes/data"] = 0,
       ["Module:Icon/data"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:DamageTypes/colorContrastAdjuster"] = table#75 {
   },
   ["Module:DamageTypes/testcases"] = table#76 {
   },
   ["Module:Database"] = table#77 {
   },
   ["Module:DatastoreManifest"] = table#78 {
   },
   ["Module:Decorations"] = table#79 {
       ["Module:Decorations/data"] = 0,
       ["Module:Math"] = 0,
       ["Module:Table"] = 0,
       ["Module:Tooltips"] = 0,
   },
   ["Module:Delay"] = table#80 {
   },
   ["Module:DevstreamParticipantsList"] = table#81 {
   },
   ["Module:Docbunto/cli"] = table#82 {
       ["Dev:CLI"] = 0,
       ["Dev:Docbunto"] = 0,
       ["Dev:FrameTools"] = 0,
       ["Dev:Json"] = 0,
   },
   ["Module:Docbunto/i18n"] = table#83 {
   },
   ["Module:DojoRoom/data"] = table#84 {
   },
   ["Module:DropTables/JSON"] = table#85 {
       ["Module:DropTables/JSON/"] = 0,
   },
   ["Module:DropTables/JSON/Sorties"] = table#86 {
   },
   ["Module:DropTables/JSON/Transient"] = table#87 {
   },
   ["Module:Emptylord"] = table#88 {
       ["Module:Emptylord/data"] = 0,
   },
   ["Module:Emptylord/getter"] = table#89 {
       ["Module:Emptylord/data"] = 0,
   },
   ["Module:Enemies/data"] = table#90 {
       ["Module:Enemies/data"] = 0,
       ["Module:LuaSerializer"] = 0,
   },
   ["Module:Enemies/data/anarchs"] = table#91 {
   },
   ["Module:Enemies/data/narmer"] = table#92 {
   },
   ["Module:Enemies/data/orokin"] = table#93 {
   },
   ["Module:Enemies/data/pre"] = table#94 {
   },
   ["Module:Enemies/data/scaldra"] = table#95 {
   },
   ["Module:Enemies/data/sentient"] = table#96 {
   },
   ["Module:Enemies/data/stalker"] = table#97 {
   },
   ["Module:Enemies/data/techrot"] = table#98 {
   },
   ["Module:Enemies/data/themurmur"] = table#99 {
   },
   ["Module:Enemies/infobox/dev"] = table#100 {
   },
   ["Module:Entrypoint"] = table#101 {
   },
   ["Module:Enum/data"] = table#102 {
   },
   ["Module:FINNER DropTables Test"] = table#103 {
   },
   ["Module:FINNER Icon Test"] = table#104 {
   },
   ["Module:FINNER Test/data"] = table#105 {
   },
   ["Module:FINNER Test/data/4"] = table#106 {
   },
   ["Module:FINNER Test/data/5"] = table#107 {
   },
   ["Module:FINNER Test/data/8"] = table#108 {
   },
   ["Module:FINNER Warframe Test"] = table#109 {
   },
   ["Module:FINNER Weapon Test"] = table#110 {
   },
   ["Module:FactionScript"] = table#111 {
   },
   ["Module:FactionScript/data"] = table#112 {
   },
   ["Module:Factions/data"] = table#113 {
   },
   ["Module:FallbackList"] = table#114 {
   },
   ["Module:FalterTest"] = table#115 {
   },
   ["Module:FalterTest/data"] = table#116 {
   },
   ["Module:Flaicher"] = table#117 {
   },
   ["Module:Flaicher/Conv"] = table#118 {
   },
   ["Module:Flaicher/Mods"] = table#119 {
   },
   ["Module:Flaicher/dispoData"] = table#120 {
   },
   ["Module:FlaicherTest"] = table#121 {
   },
   ["Module:Focus"] = table#122 {
   },
   ["Module:Focus/data/archived"] = table#123 {
   },
   ["Module:Focus/infobox"] = table#124 {
   },
   ["Module:FormatingTool"] = table#125 {
   },
   ["Module:FormatingTool/data"] = table#126 {
   },
   ["Module:FormatingTool/missions"] = table#127 {
   },
   ["Module:Gallery"] = table#128 {
   },
   ["Module:Gallery/testcases"] = table#129 {
   },
   ["Module:GigaTest"] = table#130 {
   },
   ["Module:GuaranteedRewards/data"] = table#131 {
   },
   ["Module:HexTest"] = table#132 {
   },
   ["Module:I18n"] = table#133 {
   },
   ["Module:I18n/testcases"] = table#134 {
   },
   ["Module:Icon"] = table#135 {
   },
   ["Module:Icon/data"] = table#136 {
   },
   ["Module:Icon/testcases"] = table#137 {
   },
   ["Module:Infobox"] = table#138 {
   },
   ["Module:Infobox/i18n"] = table#139 {
   },
   ["Module:InfoboxBuilder"] = table#140 {
   },
   ["Module:InfoboxBuilder/dev"] = table#141 {
   },
   ["Module:InfoboxGallery"] = table#142 {
   },
   ["Module:Inspect"] = table#143 {
   },
   ["Module:InternalNames"] = table#144 {
   },
   ["Module:JSON"] = table#145 {
   },
   ["Module:KeyBindings"] = table#146 {
   },
   ["Module:KeyBindings/data"] = table#147 {
   },
   ["Module:Keys/data"] = table#148 {
   },
   ["Module:Lang/ISO 639 synonyms"] = table#149 {
   },
   ["Module:Lang/configuration"] = table#150 {
   },
   ["Module:Lang/data"] = table#151 {
   },
   ["Module:Lang/data/iana regions"] = table#152 {
   },
   ["Module:Lang/data/iana scripts"] = table#153 {
   },
   ["Module:Lang/data/iana suppressed scripts"] = table#154 {
   },
   ["Module:Lang/data/iana variants"] = table#155 {
   },
   ["Module:Lang/data/is latn data"] = table#156 {
   },
   ["Module:LanguageList"] = table#157 {
   },
   ["Module:Lexer"] = table#158 {
   },
   ["Module:Localization"] = table#159 {
   },
   ["Module:Lua"] = table#160 {
   },
   ["Module:LuaClassSystem"] = table#161 {
   },
   ["Module:LuaSerializer"] = table#162 {
   },
   ["Module:LuaSerializer/dev"] = table#163 {
   },
   ["Module:LuaSerializerTwo"] = table#164 {
   },
   ["Module:Map"] = table#165 {
   },
   ["Module:Map/testcases"] = table#166 {
   },
   ["Module:MasteryRank"] = table#167 {
   },
   ["Module:MasteryRank/dev"] = table#168 {
   },
   ["Module:Math/i18n"] = table#169 {
   },
   ["Module:Math/testcases"] = table#170 {
   },
   ["Module:Math/testcases/module"] = table#171 {
   },
   ["Module:Maximization"] = table#172 {
   },
   ["Module:Maximization/data"] = table#173 {
   },
   ["Module:Mbox"] = table#174 {
   },
   ["Module:Mbox/i18n"] = table#175 {
   },
   ["Module:Missions"] = table#176 {
   },
   ["Module:Missions/dev"] = table#177 {
   },
   ["Module:Missions/infobox"] = table#178 {
   },
   ["Module:Missions/page"] = table#179 {
   },
   ["Module:Mods"] = table#180 {
   },
   ["Module:Mods/csv"] = table#181 {
   },
   ["Module:Mods/csv2"] = table#182 {
   },
   ["Module:Mods/data/validate"] = table#183 {
   },
   ["Module:Mods/infobox"] = table#184 {
   },
   ["Module:Mods/itemCompatibility"] = table#185 {
   },
   ["Module:Mods/itemCompatibility/data"] = table#186 {
   },
   ["Module:Mods/testcases"] = table#187 {
   },
   ["Module:Modular/data"] = table#188 {
   },
   ["Module:Modular/generator"] = table#189 {
   },
   ["Module:ModuleTest"] = table#190 {
   },
   ["Module:Music/data"] = table#191 {
   },
   ["Module:MyCodex"] = table#192 {
   },
   ["Module:Navbox"] = table#193 {
   },
   ["Module:Navigation"] = table#194 {
   },
   ["Module:Navigation/dev"] = table#195 {
   },
   ["Module:NightwaveActs"] = table#196 {
   },
   ["Module:NightwaveActs/acts.json"] = table#197 {
   },
   ["Module:NightwaveActs/dev"] = table#198 {
   },
   ["Module:Placeholder"] = table#199 {
   },
   ["Module:Polarity"] = table#200 {
   },
   ["Module:Reference"] = table#201 {
   },
   ["Module:ReleaseStatus"] = table#202 {
   },
   ["Module:ReleaseStatus/data"] = table#203 {
   },
   ["Module:ReleaseStatus/i18n"] = table#204 {
   },
   ["Module:RemoveCategory"] = table#205 {
   },
   ["Module:Resources"] = table#206 {
   },
   ["Module:Resources/data/validate"] = table#207 {
   },
   ["Module:Resources/infobox"] = table#208 {
   },
   ["Module:Sandbox"] = table#209 {
   },
   ["Module:Sandbox/ArbitraryMary/SigilGallery"] = table#210 {
   },
   ["Module:Sandbox/DutyS12345"] = table#211 {
   },
   ["Module:Sandbox/Hilycker/SortTest"] = table#212 {
   },
   ["Module:Sandbox/Hilycker/SortTest/data"] = table#213 {
   },
   ["Module:Sandbox/Moxian"] = table#214 {
   },
   ["Module:Sandbox/ScribuntoDebugConsole"] = table#215 {
   },
   ["Module:Sandbox/Sean/Tooltips"] = table#216 {
   },
   ["Module:Sandbox/Sean/Tooltips/icon"] = table#217 {
   },
   ["Module:Sandbox/Sean/Warframes"] = table#218 {
   },
   ["Module:Sandbox/Sean/Warframes/infobox"] = table#219 {
   },
   ["Module:Sandbox/Sean/Weapons/nav"] = table#220 {
   },
   ["Module:Sandbox/SkipThisAd/DropTables"] = table#221 {
   },
   ["Module:Sandbox/Vondak/Test"] = table#222 {
   },
   ["Module:Sandbox/lonnstyle/Warframes/infobox"] = table#223 {
   },
   ["Module:ScientiaStances/data"] = table#224 {
   },
   ["Module:ScientiaStances/sharedCombosData"] = table#225 {
   },
   ["Module:ScientiaTest"] = table#226 {
   },
   ["Module:ScientiaTest/i18n"] = table#227 {
   },
   ["Module:Shared"] = table#228 {
   },
   ["Module:Shared/testcases"] = table#229 {
   },
   ["Module:SnekwTest"] = table#230 {
   },
   ["Module:SpxceVendor"] = table#231 {
   },
   ["Module:Stances"] = table#232 {
   },
   ["Module:Stances/dev"] = table#233 {
   },
   ["Module:StatObject"] = table#234 {
   },
   ["Module:String"] = table#235 {
   },
   ["Module:String/testcases"] = table#236 {
   },
   ["Module:Switch Infobox"] = table#237 {
   },
   ["Module:Syndicates/data"] = table#238 {
   },
   ["Module:SynthTest"] = table#239 {
   },
   ["Module:Table"] = table#240 {
   },
   ["Module:Table/testcases"] = table#241 {
   },
   ["Module:Tabs"] = table#242 {
   },
   ["Module:TennoGen"] = table#243 {
   },
   ["Module:TennoScript"] = table#244 {
   },
   ["Module:TestHarness/i18n"] = table#245 {
   },
   ["Module:Text"] = table#246 {
   },
   ["Module:TextIcons"] = table#247 {
   },
   ["Module:Tooltips"] = table#248 {
   },
   ["Module:Tooltips/data"] = table#249 {
   },
   ["Module:Tooltips/data/Ability"] = table#250 {
   },
   ["Module:Tooltips/data/Arcane"] = table#251 {
   },
   ["Module:Tooltips/data/DamageTypes"] = table#252 {
   },
   ["Module:Tooltips/data/Mods"] = table#253 {
   },
   ["Module:Tooltips/data/Void"] = table#254 {
   },
   ["Module:Tooltips/data/Warframes"] = table#255 {
   },
   ["Module:Tooltips/data/Weapons"] = table#256 {
   },
   ["Module:Tooltips/dev"] = table#257 {
   },
   ["Module:Tooltips/icon"] = table#258 {
   },
   ["Module:Tooltips/icon/dev"] = table#259 {
   },
   ["Module:Tooltips/testcases"] = table#260 {
   },
   ["Module:Tooltips/tip/dev"] = table#261 {
   },
   ["Module:TrajosAcquisition"] = table#262 {
   },
   ["Module:TrajosVoid"] = table#263 {
   },
   ["Module:TranslationExamples"] = table#264 {
   },
   ["Module:Unicode data"] = table#265 {
   },
   ["Module:Unindent"] = table#266 {
   },
   ["Module:Upgrades/data"] = table#267 {
   },
   ["Module:User"] = table#268 {
   },
   ["Module:UserError"] = table#269 {
   },
   ["Module:Vehicles/data"] = table#270 {
   },
   ["Module:Vehicles/infobox"] = table#271 {
   },
   ["Module:Vendors"] = table#272 {
   },
   ["Module:Version"] = table#273 {
   },
   ["Module:VideoGallery"] = table#274 {
   },
   ["Module:Void/data/validate"] = table#275 {
   },
   ["Module:Void/dev"] = table#276 {
   },
   ["Module:Void/page"] = table#277 {
   },
   ["Module:VoidByReward"] = table#278 {
   },
   ["Module:WDSButton"] = table#279 {
   },
   ["Module:WDSButton/data"] = table#280 {
   },
   ["Module:Warframes"] = table#281 {
   },
   ["Module:Warframes/Conclave/data"] = table#282 {
   },
   ["Module:Warframes/infobox"] = table#283 {
   },
   ["Module:Warframes/testcases"] = table#284 {
   },
   ["Module:Weapons/Conclave/data"] = table#285 {
   },
   ["Module:Weapons/characteristics"] = table#286 {
   },
   ["Module:Weapons/compare"] = table#287 {
   },
   ["Module:Weapons/comptable"] = table#288 {
   },
   ["Module:Weapons/csv"] = table#289 {
   },
   ["Module:Weapons/data"] = table#290 {
   },
   ["Module:Weapons/data/credits"] = table#291 {
   },
   ["Module:Weapons/data/misc"] = table#292 {
   },
   ["Module:Weapons/data/validate"] = table#293 {
   },
   ["Module:Weapons/dev"] = table#294 {
   },
   ["Module:Weapons/infobox"] = table#295 {
   },
   ["Module:Weapons/nav"] = table#296 {
   },
   ["Module:Weapons/ppdata/seeder"] = table#297 {
   },
   ["Module:Weapons/preprocess"] = table#298 {
   },
   ["Module:Weapons/sandbox"] = table#299 {
   },
   ["Module:Weapons/testcases"] = table#300 {
   },
   ["Module:WorldState"] = table#301 {
   },
   ["Module:Worldstate/data"] = table#302 {
   },
   ["Module:Yesno"] = table#303 {
   },
   ["Module:Yesno/testcases"] = table#304 {
   },
```**

**}.**

### Cleaning up non-clustered graph

If using `dot` algorithm to render a non-clustered graph, then use the [unflatten](https://linux.die.net/man/1/unflatten) preprocessor to improve graph's aspect ratio:

```lua
unflatten -f -l5 -c13 fileName.dot
```

## Wiki's Dependency Graphs

Dependency graphs of this wiki's codebase can be viewed on the [Category:Dependency Graphs](/w/Category:Dependency_Graphs "Category:Dependency Graphs") category.

## Documentation

### Package items

`dependencygraph.enableClusters` (member; boolean)
:   Denotes whether or not clustering of nodes will occur

`dependencygraph.main(frame)` (function)
:   Entry point of program.
:   **Parameter**: `frame` Frame object (table)
:   **Returns**: Preformatted text of resultant DOT graph (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [DependencyGraph/doc](/w/Module:DependencyGraph/doc "Module:DependencyGraph/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | [M:Modular](/w/Module:Modular "Module:Modular") ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • M:DependencyGraph • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''DependencyGraph''' outputs a module dependency graph of this wiki's modules
--	using the [[wikipedia:DOT (graph description language)|DOT language]].  
 
--	
--	Requires [[community:Help:DynamicPageList|Extension:DynamicPageList]] enabled on your wiki.
--	
--	Recommended layout algorithms for rendering resultant DOT file:
--	* fdp/sfdp - useful for viewing entire codebase w/ clustering of module families
--	* circo - circular layout, useful for finding modules/submodules with the fewest dependencies
--	
--	See https://www.rdocumentation.org/packages/Rgraphviz/versions/2.16.0/topics/GraphvizLayouts
--	for more details on these layout algorithms.
--	
--	@module		dependencygraph
--	@alias		p
--	@author		[[User:Cephalon Scientia|Cephalon Scientia]]
--	@image		EN WARFRAME Wiki Dependency Graph.png
--	@require	[[Module:Table]]
--	@release	beta
--	

-- TODO: Module names inside documentation is being treated as dependencies even though
-- they may not be actual dependencies. Somehow get the strings within mw.loadData() and require()
-- functions instead to use as a module's actual dependencies. Note on limitations of Lua patterns.

-- @todo Explore way to output to GraphML format or convert DOT to GraphML to import into yED Graph Editor
local p = {}
-- TODO: If porting this module to the Dev wiki for global use, remove this import and directly implement
-- any used functions here
local Table = require('Module:Table')
local MODULE_LOCALIZATION = mw.site.namespaces[828].name
local MODULE_NAME_PATTERN = MODULE_LOCALIZATION..':[%a%d. /]+'
local DEV_MODULE_NAME_PATTERN = 'Dev:[%w /]+'
-- Capturing all possible characters that can be in a import function call,
-- includes possible characters in Module page name as well as Lua tokens
local POSSIBLE_CHAR_PATTERN = '[%w%[%]()\'" :/.=]+'
-- TODO: There are still false positives with require() and mw.loadData() statements that
-- are commented out
local IMPORT_STATEMENT_PATTERNS = { 'require'..POSSIBLE_CHAR_PATTERN, 'mw.loadData'..POSSIBLE_CHAR_PATTERN }
local DEV_WIKI_URL = 'https://dev.fandom.com/wiki/'

--- Denotes whether or not clustering of nodes will occur
--	@member			{boolean} p.enableClusters
p.enableClusters = false	-- By default, clustering of submodules with their main modules is disabled

--- Returns a set of this wiki's module pages.
--	@function		getModuleSet
--	@param			{string} dplResult HTML of result returned by DPL parser function
--	@returns		{table} Set of module page names on this wiki
local function getModuleSet(dplResult)
	local moduleSet = {}
	for moduleName in mw.ustring.gmatch(dplResult, MODULE_NAME_PATTERN) do
		-- Ignoring documentation subpages
		if (string.find(moduleName, '/doc') == nil) then
			moduleSet[moduleName] = 0
		end
	end
	return moduleSet
end

--- Returns a table of each module's dependencies.
--	@function		getModuleDependencies
--	@param			{string} moduleSet Set of module page names on this wiki
--	@returns		{table} Map of modules and their dependencies inside a set
local function getModuleDependencies(moduleSet)
	local moduleDependencies = {}	-- mapping modules with their dependencies
	
	-- Initializing table entries
	for moduleName, _ in pairs(moduleSet) do
		-- Ignoring documentation subpages
		moduleDependencies[moduleName] = {}
	end
	
	-- Finding dependencies
	for moduleName, _ in Table.skpairs(moduleSet) do
		local moduleCode = mw.title.new(moduleName):getContent()
		assert(moduleCode ~= nil, '"'..moduleName..'" does not exist\n'..mw.dumpObject(moduleDependencies))
		-- Define a Lua module dependency as one that is imported using
		-- require() or mw.loadData() functions
		-- First, find all import statements in module code
		for _, importStatementPattern in ipairs(IMPORT_STATEMENT_PATTERNS) do
			for importStatement in mw.ustring.gmatch(moduleCode, importStatementPattern) do
				-- Second, extract the module names from import statements
				for dependency in mw.ustring.gmatch(importStatement, MODULE_NAME_PATTERN) do
					moduleDependencies[moduleName][dependency] = 0
				end
				-- For modules imported from Dev wiki
				for dependency in mw.ustring.gmatch(importStatement, DEV_MODULE_NAME_PATTERN) do
					moduleDependencies[moduleName][dependency] = 0
				end
			end
		end
	end
	return moduleDependencies
end

--- Builds a map of each main module's subpages.
--	@function		getModuleSubpageMap
--	@param			{table} moduleSet Set of modules on this wiki including submodules
--	@returns		{table} Map of main modules' root text to a table of the full names of their submodules (including main module)
local function getModuleSubpageMap(moduleSet)
	local subpageMap = {}
	for moduleName, _ in Table.skpairs(moduleSet) do
		local title = mw.title.new(moduleName)
		local rootText = title['rootText']
		if (subpageMap[rootText] == nil) then
			subpageMap[rootText] = {}
		end
		table.insert(subpageMap[rootText], moduleName)
	end
	return subpageMap
end

--- Builds a directed graph visualization in the form of a DOT file.
--	@function		buildDOTOutput
--	@param			{table} moduleDependencies Map of modules and their dependencies
--	@param			{table} subpageMap Map of main modules and their submodules
--	@returns		{string} DOT output
local function buildDOTOutput(moduleDependencies, subpageMap)
	local dotResult = { 'strict digraph G {' }
	local nodeTemplate = '\t"%s" [label="%s\\n# dep.: %d", URL="%s"]'
	
	-- Initializing nodes
	for moduleName, dependencies in Table.skpairs(moduleDependencies) do
		local canonicalUrl = tostring(mw.uri.canonicalUrl(moduleName))
		local dependencyCount = Table.size(dependencies)
		table.insert(dotResult, string.format(nodeTemplate, moduleName, moduleName, dependencyCount, canonicalUrl))
	end
	
	if (p.enableClusters) then
		-- Adding clusters based on root text (e.g. "Module:Weapons" and "Module:Weapons/data"
		-- will be in the same cluster since they both have "Weapons")
		for rootText, subpages in Table.skpairs(subpageMap) do
			local moduleSubpages = { '\tsubgraph "cluster_'..rootText..'" {' }
			for _, subpage in Table.skpairs(subpages) do
				table.insert(moduleSubpages, '"'..subpage..'"')
			end
			table.insert(moduleSubpages, '}')
			table.insert(dotResult, table.concat(moduleSubpages, ' '))
		end
	end
	
	-- Adding graph edges
	for moduleName, dependencies in Table.skpairs(moduleDependencies) do
		local graphEdges = { '\t"'..moduleName..'" -> {' }
		for dependency, _ in pairs(dependencies) do
			table.insert(graphEdges, '"'..dependency..'"')
			
			-- Adding additional nodes of modules from dev wiki as DPL will not 
			-- get them since they are not located on this wiki
			if (string.find(dependency, 'Dev:') ~= nil) then
				local canonicalUrl = DEV_WIKI_URL..string.gsub(dependency, 'Dev:', 'Module:')
				-- Dev modules have 0 dependencies from this wiki
				table.insert(dotResult, string.format(nodeTemplate, dependency, dependency, 0, canonicalUrl))
			end
		end
		table.insert(graphEdges, '}')
		table.insert(dotResult, table.concat(graphEdges, ' '))
	end
	
	table.insert(dotResult, '}')
	return table.concat(dotResult, '\n')
end

--- Entry point of program.
--	@function		p.main
--	@param			{table} frame Frame object
--	@returns		{string} Preformatted text of resultant DOT graph
function p.main(frame)
	-- Any argument assigned to "cluster" when module invoked will enable clustering
	p.enableClusters = (frame.args['cluster'] and true)
	-- TODO: Replace the below statement with call of Extension:DynamicPageListEngine's
	-- mw.ext.dpl.getPages() if extension is available on your wiki, ignore this 
	-- TODO otherwise
	local dplResult = mw.getCurrentFrame():preprocess('{{#dpl:|namespace='..MODULE_LOCALIZATION..'}}')
	local moduleSet = getModuleSet(dplResult)
	local subpageMap = getModuleSubpageMap(moduleSet)
	local moduleDependencies = getModuleDependencies(moduleSet)
	return '

```lua
\n'..buildDOTOutput(moduleDependencies, subpageMap)..'\n
```

'
end

return p
```

