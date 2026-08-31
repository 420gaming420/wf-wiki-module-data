---
title: "Module:Modular"
wiki_url: "https://wiki.warframe.com/w/Module/Modular"
wiki_timestamp: "2026-08-29T06:49:59Z"
---

**Modular** retrieves and stores [Modular](/w/Modular "Modular") data of [WARFRAME](/w/WARFRAME "WARFRAME").

On this Wiki, Modular is used in:

* [Zaw](/w/Zaw "Zaw")
* [Kitgun](/w/Kitgun "Kitgun")
* [MOA (Companion)](/w/MOA_(Companion) "MOA (Companion)")
* [Hound (Companion)](/w/Hound_(Companion) "Hound (Companion)")

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
* [2 Documentation](#Documentation)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Modular|function|input1|input2|...}}`

## Documentation

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Modular/data](/w/Module:Modular/data "Module:Modular/data")
* [Modular/data/doc](/w/Module:Modular/data/doc "Module:Modular/data/doc")
* [Modular/data/kitgun](/w/Module:Modular/data/kitgun "Module:Modular/data/kitgun")
* [Modular/doc](/w/Module:Modular/doc "Module:Modular/doc")
* [Modular/generator](/w/Module:Modular/generator "Module:Modular/generator")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • [M:FactionScript](/w/Module:FactionScript "Module:FactionScript") ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
| [Warframes](/w/Warframes "Warframes") / Avatars | [M:Ability](/w/Module:Ability "Module:Ability") ([/data](/w/Module:Ability/data "Module:Ability/data")) • [M:Maximization](/w/Module:Maximization "Module:Maximization") ([/data](/w/Module:Maximization/data "Module:Maximization/data")) • [M:Warframes](/w/Module:Warframes "Module:Warframes") ([/data](/w/Module:Warframes/data "Module:Warframes/data")) |
| [Weapons](/w/Weapons "Weapons") | M:Modular ([/data](/w/Module:Modular/data "Module:Modular/data")) • [M:Weapons](/w/Module:Weapons "Module:Weapons") ([/data](/w/Module:Weapons/data "Module:Weapons/data"), [/ppdata](/w/Module:Weapons/ppdata "Module:Weapons/ppdata")) |
| [Upgrades](/w/Upgrade "Upgrade") | [M:Arcane](/w/Module:Arcane "Module:Arcane") ([/data](/w/Module:Arcane/data "Module:Arcane/data")) • [M:Decrees/data](/w/Module:Decrees/data "Module:Decrees/data") • [M:Focus](/w/Module:Focus "Module:Focus") ([/data](/w/Module:Focus/data "Module:Focus/data")) • [M:Mods](/w/Module:Mods "Module:Mods") ([/data](/w/Module:Mods/data "Module:Mods/data")) • [M:Stances](/w/Module:Stances "Module:Stances") ([/data](/w/Module:Stances/data "Module:Stances/data")) |
| [Drop Tables](/w/Drop_Tables "Drop Tables") | [M:Acquisition](/w/Module:Acquisition "Module:Acquisition") ([/data](/w/Module:Acquisition/data "Module:Acquisition/data")) • [M:DropTables](/w/Module:DropTables "Module:DropTables") ([/data](/w/Module:DropTables/data "Module:DropTables/data")) • [M:Void](/w/Module:Void "Module:Void") ([/data](/w/Module:Void/data "Module:Void/data")) |
| Vendors | [M:Baro](/w/Module:Baro "Module:Baro") ([/data](/w/Module:Baro/data "Module:Baro/data")) • [M:Vendors](/w/Module:Vendors "Module:Vendors") ([/data](/w/Module:Vendors/data "Module:Vendors/data")) |
| Crafting | [M:Blueprints/data](/w/Module:Blueprints/data "Module:Blueprints/data") • [M:Cost](/w/Module:Cost "Module:Cost") • [M:Research](/w/Module:Research?action=edit&redlink=1 "Module:Research (page does not exist)") ([/data](/w/Module:Research/data "Module:Research/data")) • [M:Resources](/w/Module:Resources "Module:Resources") ([/data](/w/Module:Resources/data "Module:Resources/data")) |
| Cosmetics | [M:Decorations](/w/Module:Decorations "Module:Decorations") ([/data](/w/Module:Decorations/data "Module:Decorations/data")) • [M:Cosmetics](/w/Module:Cosmetics "Module:Cosmetics") ([/data](/w/Module:Cosmetics/data "Module:Cosmetics/data")) • [M:Sigils/data](/w/Module:Sigils/data "Module:Sigils/data") • [M:TennoGen](/w/Module:TennoGen "Module:TennoGen") ([/data](/w/Module:TennoGen/data "Module:TennoGen/data")) |
| Infoboxes | [M:Animal/infobox](/w/Module:Animal/infobox "Module:Animal/infobox") • [M:Arcane/infobox](/w/Module:Arcane/infobox "Module:Arcane/infobox") • [M:ArchModBox](/w/Module:ArchModBox "Module:ArchModBox") • [Module:Companions/infobox](/w/Module:Companions/infobox "Module:Companions/infobox") • [M:Conservation/infobox](/w/Module:Conservation/infobox "Module:Conservation/infobox") • [M:Cosmetics/infobox](/w/Module:Cosmetics/infobox "Module:Cosmetics/infobox") • [M:Enemies/infobox](/w/Module:Enemies/infobox "Module:Enemies/infobox") • [M:Missions/infobox](/w/Module:Missions/infobox "Module:Missions/infobox") • [M:Mods/infobox](/w/Module:Mods/infobox "Module:Mods/infobox") • [M:Resources/infobox](/w/Module:Resources/infobox "Module:Resources/infobox") • [M:Vehicles/infobox](/w/Module:Vehicles/infobox "Module:Vehicles/infobox") • [M:Void/page](/w/Module:Void/page "Module:Void/page") • [M:Warframes/infobox](/w/Module:Warframes/infobox "Module:Warframes/infobox") • [M:Weapons/infobox](/w/Module:Weapons/infobox "Module:Weapons/infobox") | |
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • [M:Reference](/w/Module:Reference "Module:Reference") • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''Modular''' retrieves and stores [[Modular]] data of [[WARFRAME]].  

--	
--	On this Wiki, Modular is used in:
--	* [[Zaw]]
--	* [[Kitgun]]
--	* [[MOA (Companion)]]
--	* [[Hound (Companion)]]
--	
--	@module		modular
--	@alias		p
--  @author		[[User:Croquemorttime|Croquemorttime]]
--	@image		IconCraftingKitgunChamber.png
--	@require	[[Module:Modular/data]]
--	@require	[[Module:Math]]
--	@release	stable
--  

local p = {}

local ModularData = mw.loadData('Module:Modular/data')
local Math = require('Module:Math')

-- TODO: Could just make these maps into arrays; iterating over arrays using ipairs
-- will still iterate in the order that the elements appear in.
local DamageList={
    ["Impact"]=1,
    ["Puncture"]=2,
    ["Slash"]=3,
    ["Cold"]=4,
    ["Electricity"]=5,
    ["Heat"]=6,
    ["Toxin"]=7,
    ["Blast"]=8,
    ["Corrosive"]=9,
    ["Gas"]=10,
    ["Magnetic"]=11,
    ["Radiation"]=12,
    ["Viral"]=13,
    ["True"]=14,
    ["Void"]=15,
    ["Tau"]=16,
    }
local ZawStrikeList={
    ["Balla"]=1,
    ["Cyath"]=2,
    ["Dehtat"]=3,
    ["Dokrahm"]=4,
    ["Kronsh"]=5,
    ["Mewan"]=6,
    ["Ooltha"]=7,
    ["Rabvee"]=8,
    ["Sepfahn"]=9,
    ["Plague Keewar"]=10,
    ["Plague Kripath"]=11,
    }
local ZawGripList={
    ["Korb"]=1,
    ["Kwath"]=2,
    ["Laka"]=3,
    ["Peye"]=4,
    ["Plague Akwin"]=5,
    ["Jayap"]=6,
    ["Kroostra"]=7,
    ["Seekalla"]=8,
    ["Shtung"]=9,
    ["Plague Bokwin"]=10,
    }
local ZawLinkList={
    ["Jai"]=1,
    ["Ruhang"]=2,
    ["Jai II"]=3,
    ["Ruhang II"]=4,
    ["Vargeet Jai"]=5,
    ["Vargeet Ruhang"]=6,
    ["Ekwana Jai"]=7,
    ["Ekwana Ruhang"]=8,
    ["Vargeet II Jai"]=9,
    ["Vargeet II Ruhang"]=10,
    ["Ekwana II Jai"]=11,
    ["Ekwana II Ruhang"]=12,
    ["Vargeet Jai II"]=13,
    ["Vargeet Ruhang II"]=14,
    ["Ekwana Jai II"]=15,
    ["Ekwana Ruhang II"]=16,
    }
local KitgunChamberList={
    ["Catchmoon"]=1,
    ["Gaze"]=2,
    ["Rattleguts"]=3,
    ["Tombfinger"]=4,
    ["Sporelacer"]=5,
    ["Vermisplicer"]=6,
    }
local KitgunGripList={
    ["Gibber"]=1,
    ["Ramble"]=2,
    ["Lovetap"]=3,
    ["Haymaker"]=4,
    ["Ulnaris"]=5,
    }
local KitgunPrimaryGripList={
    ["Brash"]=1,
    ["Shrewd"]=2,
    ["Steadyslam"]=3,
    ["Tremor"]=4,
    ["Palmaris"]=5,
    }
local KitgunLoaderList={
    ["Bashrack"]=1,
    ["Bellows"]=2,
    ["Deepbreath"]=3,
    ["Flutterfire"]=4,
    ["Killstream"]=5,
    ["Ramflare"]=6,
    ["Slap"]=7,
    ["Slapneedle"]=8,
    ["Sparkfire"]=9,
    ["Splat"]=10,
    ["Stitch"]=11,
    ["Swiftfire"]=12,
    ["Thunderdrum"]=13,
    ["Zip"]=14,
    ["Zipfire"]=15,
    ["Zipneedle"]=16,
    ["Arcroid"]=17,
    ["Macro Arcroid"]=18,
    ["Macro Thymoid"]=19,
    ["Thymoid"]=20,
    }
local MOACoreList={
    ["Drex"]=1,
    ["Alcrom"]=2,
    ["Krisys"]=3,
    ["Lehan"]=4,
    }
local MOAGyroList={
    ["Aegron"]=1,
    ["Atheca"]=2,
    ["Harpen"]=3,
    ["Hextra"]=4,
    ["Munit"]=5,
    ["Phazor"]=6,
    ["Trux"]=7,
    ["Tyli"]=8,
    }
local HoundBracketList={
	["Cela"]=1,
	["Urga"]=2,
	["Zubb"]=3,
	}
local HoundCoreList={
	["Adlet"]=1,
	["Garmr"]=2,
	["Raiju"]=3,
	}

local function ordertable(InTable,SortingHat)
    local result={}
    local altorder={}
    
    for DT, i in pairs(SortingHat) do
        table.insert(altorder,"0")
    end
    
    for i, DT in ipairs(InTable) do
        altorder[SortingHat[DT]]=DT
    end
    for i, DT in ipairs(altorder) do
        if altorder[i]~="0" then
            table.insert(result,DT)
        end
    end
 --   for i, val in ipairs(InTable) do mw.log(i,val) end
 --   for i, val in ipairs(altorder) do mw.log(i,val) end
 --   for i, val in ipairs(result) do mw.log(i,val) end
    return result
end
 
local function asMultiplier(val)
    if(val == nil) then
        return "1.0x"
    end
    return Math.round(val, 0.1).."x"
end

local function getValue(Type,PrimaryName,SecondaryName,TertiaryName,ValName,AsString)
    local result=''
    local PrimaryType=nil
    local SecondaryType=nil
    local TertiaryType=nil
    
    if Type=="KitgunSecondary" then
        PrimaryType="Chamber"
        SecondaryType="Grip"
        TertiaryType="Loader"
    end
    if Type=="KitgunPrimary" then
        PrimaryType="Chamber"
        SecondaryType="Grip"
        TertiaryType="Loader"
    end
    if Type=="Zaw" then
        PrimaryType="Strike"
        SecondaryType="Grip"
        TertiaryType="Link"
    end
    if Type=="MOA" then
        PrimaryType="Bracket"
        SecondaryType="Core"
        TertiaryType="Gyro"
    end
	if Type=="Hound" then
		PrimaryType="Stabilizer"
		SecondaryType="Core"
		TertiaryType="Bracket"
	end
    if PrimaryType==nil then return "Error: Wrong Type   
" end

    
    local ValNameAlt=ValName
    if (DamageList[ValName]~=nil) then ValName="SingleDamage" end

    if ValName=="StrikeName" then
        if (ModularData[Type][PrimaryType][PrimaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName]["Name"]
            if AsString then
                return '[['..result..']]'
            else
                return result
            end
        end
    end   
    if ValName=="ChamberName" then
        if (ModularData[Type][PrimaryType][PrimaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName]["Name"]
            if AsString then
                return '[['..result..']]'
            else
                return result
            end
        end
    end  
    if ValName=="BracketName" then
		if Type=="Hound" then
			if (ModularData[Type][TertiaryType][TertiaryName]["Name"]==nil) then 
				if AsString then
					return "N/A"
				else
					return 0
				end
			else
				result=ModularData[Type][TertiaryType][TertiaryName]["Name"]
				if AsString then
					return '[[Bracket#'..result..'|'..result..']]'
				else
					return result
				end
			end
		else
			if (ModularData[Type][PrimaryType][PrimaryName]["Name"]==nil) then 
				if AsString then
					return "N/A"
				else
					return 0
				end
			else
				result=ModularData[Type][PrimaryType][PrimaryName]["Name"]
				if AsString then
					return '[[Bracket#'..result..'|'..result..']]'
				else
					return result
				end
			end
		end
    end 
    if ValName=="StabilizerName" then
        if (ModularData[Type][PrimaryType][PrimaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName]["Name"]
            if AsString then
                return '[[Stabilizer_(Component)#'..result..'|'..result..']]'
            else
                return result
            end
        end
    end 
    if ValName=="GripName" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][SecondaryType][SecondaryName]["Name"]
            if AsString then
                return '[['..result..']]'
            else
                return result
            end
        end
    end 
    if ValName=="CoreName" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][SecondaryType][SecondaryName]["Name"]
            if AsString then
                return '[[Core_(Component)#'..result..'|'..result..']]'
            else
                return result
            end
        end
    end 
    if ValName=="LinkName" then
        if (ModularData[Type][TertiaryType][TertiaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][TertiaryType][TertiaryName]["Name"]
            if AsString then
                return '[['..result..']]'
            else
                return result
            end
        end
    end    
    if ValName=="LoaderName" then
        if (ModularData[Type][TertiaryType][TertiaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][TertiaryType][TertiaryName]["Name"]
            if AsString then
                return '[['..result..']]'
            else
                return result
            end
        end
    end    
    if ValName=="GyroName" then
        if (ModularData[Type][TertiaryType][TertiaryName]["Name"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][TertiaryType][TertiaryName]["Name"]
            if AsString then
                return '[[Gyro#'..result..'|'..result..']]'
            else
                return result
            end
        end
    end  
    if (Type=="Zaw" and ValName=="Damage") then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            result=0
            for i, dmg in pairs(ModularData[Type][PrimaryType][PrimaryName][ValName]) do
                result=result+dmg
            end
            result=result+ModularData[Type][SecondaryType][SecondaryName][ValName]
            result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
            local GripType=ModularData[Type][SecondaryType][SecondaryName]["Type"]
            result=result*ModularData[Type][PrimaryType][PrimaryName]["Multi"][GripType]["Base"]
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    if (Type=="Zaw" and ValName=="SingleDamage") then
        if (ModularData[Type][PrimaryType][PrimaryName]["Damage"][ValNameAlt]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            local totaldamage=getValue(Type,PrimaryName,SecondaryName,TertiaryName,"Damage",false)
            local basedamage=0
            for i, dmg in pairs(ModularData[Type][PrimaryType][PrimaryName]["Damage"]) do
                basedamage=basedamage+dmg
            end
            if(PrimaryName=="Plague Kripath" or PrimaryName=="Plague Keewar") then
                result=ModularData[Type][PrimaryType][PrimaryName]["Damage"][ValNameAlt]+(totaldamage-basedamage)/4
            else    
                result=ModularData[Type][PrimaryType][PrimaryName]["Damage"][ValNameAlt]*totaldamage/basedamage
            end
            
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    if (Type=="Zaw" and ValName=="SlideDamage") then
        if (ModularData[Type][PrimaryType][PrimaryName]["Damage"]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            local totaldamage=getValue(Type,PrimaryName,SecondaryName,TertiaryName,"Damage",false)
            local GripType=ModularData[Type][SecondaryType][SecondaryName]["Type"]
            result=totaldamage*ModularData[Type][PrimaryType][PrimaryName]["Multi"][GripType]["Slide"]
            
            if AsString then
                return ''..Math.round(math.floor(result),0.1)..''
            else
                return result
            end
        end
    end
    if (Type=="KitgunSecondary" and ValName=="Damage") then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            result=0
            for i, dmg in pairs(ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]) do
                result=result+dmg
            end
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    if (Type=="KitgunSecondary" and ValName=="SingleDamage") then
        if (ModularData[Type][PrimaryType][PrimaryName]["Damage"][SecondaryName][ValNameAlt]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName]["Damage"][SecondaryName][ValNameAlt]
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    
    if (Type=="KitgunPrimary" and ValName=="Damage") then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            result=0
            for i, dmg in pairs(ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]) do
                result=result+dmg
            end
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    if (Type=="KitgunPrimary" and ValName=="SingleDamage") then
        if (ModularData[Type][PrimaryType][PrimaryName]["Damage"][SecondaryName][ValNameAlt]==nil) then 
            if AsString then
                return "0"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName]["Damage"][SecondaryName][ValNameAlt]
            if AsString then
                return ''..Math.round(result,0.1)..''
            else
                return result
            end
        end
    end
    
    if ValName=="CritChance" then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName][ValName]
            if (ModularData[Type][TertiaryType][TertiaryName][ValName]~=nil) then
                result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
            end
            if AsString then
                return Math.percentage(result)
            else
                return result
            end
        end
    end
    if ValName=="CritMultiplier" then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName][ValName]
            if (ModularData[Type][TertiaryType][TertiaryName][ValName]~=nil) then
                result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
            end
            if AsString then
                return asMultiplier(result)
            else
                return result
            end
        end
    end
    if ValName=="StatusChance" then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName][ValName]
            if (ModularData[Type][TertiaryType][TertiaryName][ValName]~=nil) then
                result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
            end
            if AsString then
                return Math.percentage(result)
            else
                return result
            end
        end
    end
    if ValName=="FireRate" then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName][ValName][SecondaryName]
            if AsString then
                return ''..(result)..''
            else
                return result
            end
        end
    end
    if ValName=="Magazine" then
        if (ModularData[Type][PrimaryType][PrimaryName][ValName]==nil or ModularData[Type][TertiaryType][TertiaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][PrimaryType][PrimaryName][ValName][ModularData[Type][TertiaryType][TertiaryName][ValName]]
            if AsString then
                return ''..(result)..''
            else
                return result
            end
        end
    end
    if ValName=="Speed" then
        if (ModularData[Type][SecondaryType][SecondaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][SecondaryType][SecondaryName][ValName]
            result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
            result=result+ModularData[Type][PrimaryType][PrimaryName][ValName]
            if AsString then
                return ''..(Math.round(result,0.001))..''
            else
                return result
            end
        end
    end
	if ValName=="Health" then
		if (ModularData[Type][SecondaryType][SecondaryName][ValName]==nil) then 
			if AsString then
				return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName][ValName]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName][ValName])
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
				result=350*(1+result)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="Shield" then
        if (ModularData[Type][SecondaryType][SecondaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][SecondaryType][SecondaryName][ValName]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName][ValName])
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
				result=350*(1+result)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="Armor" then
        if (ModularData[Type][SecondaryType][SecondaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][SecondaryType][SecondaryName][ValName]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName][ValName])
            else
				result=result+ModularData[Type][TertiaryType][TertiaryName][ValName]
				result=350*(1+result)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="HealthG" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Health"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName]["Health"]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName]["Health"]*2)
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName]["Health"]
				result=350*(1+result*2)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="ShieldG" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Shield"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName]["Shield"]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName]["Shield"]*2)
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName]["Shield"]
				result=350*(1+result*2)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="ArmorG" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Armor"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName]["Armor"]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName]["Armor"]*2)
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName]["Armor"]
				result=350*(1+result*2)
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="EHPG" then
        if (ModularData[Type][SecondaryType][SecondaryName]["Health"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName]["Health"]
			armor=ModularData[Type][SecondaryType][SecondaryName]["Armor"]
			shield=ModularData[Type][SecondaryType][SecondaryName]["Shield"]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName]["Health"]*2)
				armor=armor*(1+ModularData[Type][TertiaryType][TertiaryName]["Armor"]*2)
				shield=shield*(1+ModularData[Type][TertiaryType][TertiaryName]["Shield"]*2)
				result=result*((armor+300)/300)+shield*2
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName]["Health"]
				armor=armor+ModularData[Type][TertiaryType][TertiaryName]["Armor"]
				shield=shield+ModularData[Type][TertiaryType][TertiaryName]["Shield"]
				result=350*(1+result*2)
				armor=350*(1+armor*2)
				shield=350*(1+shield*2)
				result=result*((armor+300)/300)+shield*2
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="EHP_CRG" then --when using Calculated Redirection
        if (ModularData[Type][SecondaryType][SecondaryName]["Health"]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
			result=ModularData[Type][SecondaryType][SecondaryName]["Health"]
			armor=ModularData[Type][SecondaryType][SecondaryName]["Armor"]
			shield=ModularData[Type][SecondaryType][SecondaryName]["Shield"]
			if Type=="Hound" then
				result=result*(1+ModularData[Type][TertiaryType][TertiaryName]["Health"]*2)
				armor=armor*(1+ModularData[Type][TertiaryType][TertiaryName]["Armor"]*2)
				shield=shield*(1+ModularData[Type][TertiaryType][TertiaryName]["Shield"]*2)
				result=result*((armor+300)/300)+shield*2*3.5
			else
				result=result+ModularData[Type][TertiaryType][TertiaryName]["Health"]
				armor=armor+ModularData[Type][TertiaryType][TertiaryName]["Armor"]
				shield=shield+ModularData[Type][TertiaryType][TertiaryName]["Shield"]
				result=350*(1+result*2)
				armor=350*(1+armor*2)
				shield=350*(1+shield*2)
				result=result*((armor+300)/300)+shield*2*3.5
			end
            if AsString then
                return ''..(Math.round(result,1))..''
            else
                return result
            end
        end
    end
    if ValName=="Reload" then
        if (ModularData[Type][TertiaryType][TertiaryName][ValName]==nil) then 
            if AsString then
                return "N/A"
            else
                return 0
            end
        else
            result=ModularData[Type][TertiaryType][TertiaryName][ValName]
            if AsString then
                return ''..(Math.round(result,0.1))..'s'
            else
                return result
            end
        end
    end
-- you really shouldn't be here after all
    return 'Nothing Returned'

end

local function BuildKitgunRow(Head,Type,PrimaryName,SecondaryName,TertiaryName)
    local styleString = ""--"border: 1px solid lightgray;"
    local td = ''
    local result = ''
    local ValNameZ = nil
    local ValName = nil
    
        
    	result = '\n|-\n|'
    	
        for i, Hline in ipairs(Head) do
            ValName = Hline[1]
            
            if(i == 1) then td = '' else td='||' end
            if(getValue(ChamberName,GripName,LoaderName,ValName,false)~=nil) then
                local Value=getValue(Type,PrimaryName,SecondaryName,TertiaryName,ValName,false)
                local ValueS=getValue(Type,PrimaryName,SecondaryName,TertiaryName,ValName,true)
                --Add a data sort value if requested
                if(Hline[2]) then 
                    result = result..td..'data-sort-value="'..Value..'" style="'..styleString..'"|'..ValueS
                else
                    result = result..td..'style="'..styleString..'"|'..ValueS
                end
            else 
                result = result..td..'style = "'..styleString..'"|'.."N/A" 
            end
        end
    return result
end

local function BuildKitgunTable(Head,Type,PrimaryNames,SecondaryNames,TertiaryNames)
    local styleString = "border: 1px solid black;border-collapse: collapse;"
    local tHeader = ""
    tHeader = tHeader..'\n{| cellpadding="1" cellspacing="0" class="wikitable sortable" style="font-size:11px;"'
	for i, Hline in ipairs(Head) do
		if(Hline[2] == true) then
			tHeader = tHeader..'\n! data-sort-type="number" style="'..styleString..'"|'..Hline[3]..''
		else
			tHeader = tHeader..'\n! style="'..styleString..'"|'..Hline[3]..'' 
		end
	end
--	mw.log(tHeader)

    local tRows = ""
    for k, PrimaryName in ipairs(PrimaryNames) do
        for j, SecondaryName in ipairs(SecondaryNames) do
            for i, TertiaryName in ipairs(TertiaryNames) do
                rowStr = BuildKitgunRow(Head,Type,PrimaryName,SecondaryName,TertiaryName)
                tRows = tRows..rowStr
            end     
        end
    end

--    mw.log(tRows)
    return  tHeader..tRows.."\n|}[[Category:Automatic Comparison Table]]"
end

function p.getKitgunTable(frame)
    local ChamberName=frame.args ~= nil and frame.args[1]
    local SecondaryName=frame.args ~= nil and frame.args[2]

    --parameter validation
    if (ModularData["KitgunSecondary"]["Chamber"][ChamberName]==nil) then return "Error : Wrong Chamber name  
" end
    if (SecondaryName~="All" and SecondaryName~="Grips" and SecondaryName~="Loaders" 
    	and ModularData["KitgunSecondary"]["Grip"][SecondaryName]==nil) then return "Error : Wrong Grip name  
" end
    
    --list of damage types on chamber
    local DamageTypes={}
    for DT, val in pairs(ModularData["KitgunSecondary"]["Chamber"][ChamberName]["Damage"]["Base"]) do
        table.insert(DamageTypes,DT)
    end
    DamageTypes=ordertable(DamageTypes,DamageList)
    
    local Type="KitgunSecondary"
    local ChamberNames={ChamberName}
    
    local GripNames={}
    if (SecondaryName=="All" or SecondaryName=="Grips") then
        for i, grip in pairs(ModularData[Type]["Grip"]) do
            table.insert(GripNames,grip["Name"])
        end  
	    GripNames=ordertable(GripNames,KitgunGripList)
    else
    	if (SecondaryName~="Loaders") then
        	GripNames={SecondaryName}
    	else	
    		GripNames={"-"}
        end
    end 
    
    local LoaderNames={}
	if (SecondaryName~="Grips") then
	    for i, loader in pairs(ModularData[Type]["Loader"]) do
	            table.insert(LoaderNames,loader["Name"])
	    end
	    LoaderNames=ordertable(LoaderNames,KitgunLoaderList)
	else
		LoaderNames={"-"}
	end	
    
    local Head={}

 	 -- better if Name is always the first column !!!
    if (SecondaryName=="All") then
        Head={{"GripName",false,"Grip"}}
        table.insert(Head,{"LoaderName",false,"Loader"})
    else
    	if (SecondaryName=="Grips") then
	        Head={{"GripName",false,"Grip"}}
    	else	
        	Head={{"LoaderName",false,"Loader"}}
        end	
    end
    
	if (SecondaryName~="Loaders") then
		table.insert(Head,{"Damage",true,"[[Damage]]"})
		for i, DT in ipairs(DamageTypes) do
	        table.insert(Head,{DT,true,"[["..DT.."]]"})
	    end
	end    
	if (SecondaryName~="Grips") then
		table.insert(Head,{"CritChance",true,"[[Critical Chance|Crit. Chance]]"})
		table.insert(Head,{"CritMultiplier",true,"[[Critical multiplier|Crit. Mult.]]"})
		table.insert(Head,{"StatusChance",true,"[[Status Chance|Status]]"})
	end
	if (SecondaryName~="Loaders") then
        -- When Kitgun is a continuous weapon, grip affects the range of Kitgun and not the fire rate
		if (ChamberName=="Gaze" or ChamberName=="Vermisplicer") then
		    table.insert(Head,{"FireRate",true,"Beam Range"})
	    else
	    	table.insert(Head,{"FireRate",true,"[[Fire Rate]]"})
		end
	end	
	if (SecondaryName~="Grips") then
		table.insert(Head,{"Magazine",true,"[[Ammo#Magazine Capacity|Magazine Size]]"})
		table.insert(Head,{"Reload",true,"[[Reload Speed|Reload Time]]"})
	end
	
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
    return BuildKitgunTable(Head,Type,ChamberNames,GripNames,LoaderNames)
end

function p.getKitgunPrimaryTable(frame)
    local ChamberName=frame.args ~= nil and frame.args[1]
    local SecondaryName=frame.args ~= nil and frame.args[2]
    
    --parameter validation
    if (ModularData["KitgunPrimary"]["Chamber"][ChamberName]==nil) then return "Error : Wrong Chamber name  
" end
    if (SecondaryName~="All" and SecondaryName~="Grips" and SecondaryName~="Loaders" 
    	and ModularData["KitgunPrimary"]["Grip"][SecondaryName]==nil) then return "Error : Wrong Grip name  
" end
    
    --list of damage types on chamber
    local DamageTypes={}
    for DT, val in pairs(ModularData["KitgunPrimary"]["Chamber"][ChamberName]["Damage"]["Base"]) do
        table.insert(DamageTypes,DT)
    end
    DamageTypes=ordertable(DamageTypes,DamageList)
    
    local Type="KitgunPrimary"
    local ChamberNames={ChamberName}
    
    local GripNames={}
    if (SecondaryName=="All" or SecondaryName=="Grips") then
        for i, grip in pairs(ModularData[Type]["Grip"]) do
            table.insert(GripNames,grip["Name"])
        end  
	    GripNames=ordertable(GripNames,KitgunPrimaryGripList)
    else
    	if (SecondaryName~="Loaders") then
        	GripNames={SecondaryName}
        else
        	GripNames={"-"}
        end	
    end 
    
    local LoaderNames={}
    if (SecondaryName~="Grips") then
	    for i, tertiary in pairs(ModularData[Type]["Loader"]) do
	            table.insert(LoaderNames,tertiary["Name"])
	    end     
	    LoaderNames=ordertable(LoaderNames,KitgunLoaderList)
	else
		LoaderNames={"-"}
	end	
    
    local Head={}
	-- better if Name is always the first column !!!
    if (SecondaryName=="All") then
        Head={{"GripName",false,"Grip"}}
        table.insert(Head,{"LoaderName",false,"Loader"})
    else
    	if (SecondaryName=="Grips") then
	        Head={{"GripName",false,"Grip"}}
    	else
        	Head={{"LoaderName",false,"Loader"}}
        end	
    end

	if (SecondaryName~="Loaders") then
		table.insert(Head,{"Damage",true,"[[Damage]]"})
		for i, DT in ipairs(DamageTypes) do
	        table.insert(Head,{DT,true,"[["..DT.."]]"})
	    end
	end    
	if (SecondaryName~="Grips") then
		table.insert(Head,{"CritChance",true,"[[Critical Chance|Crit. Chance]]"})
		table.insert(Head,{"CritMultiplier",true,"[[Critical multiplier|Crit. Mult.]]"})
		table.insert(Head,{"StatusChance",true,"[[Status Chance|Status]]"})
	end		
	if (SecondaryName~="Loaders") then
		if(ChamberName=="Gaze" or ChamberName=="Vermisplicer") then
		    table.insert(Head,{"FireRate",true,"Beam Range"})
	    else
	    	table.insert(Head,{"FireRate",true,"[[Fire Rate]]"})
		end
	end
	if (SecondaryName~="Grips") then
		table.insert(Head,{"Magazine",true,"[[Ammo#Magazine Capacity|Magazine Size]]"})
		table.insert(Head,{"Reload",true,"[[Reload Speed|Reload Time]]"})
	end
	
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
    return BuildKitgunTable(Head,Type,ChamberNames,GripNames,LoaderNames)
end

function p.getZawTable(frame)
    local StrikeName=frame.args ~= nil and frame.args[1]
    local GripName=frame.args ~= nil and frame.args[2]
    if (ModularData["Zaw"]["Strike"][StrikeName]==nil) then return "Error : Wrong Strike name  
" end
    if (GripName~="All" and ModularData["Zaw"]["Grip"][GripName]==nil) then return "Error : Wrong Grip name  
" end
    --list of damage types on chamber
    
    
    local DamageTypes={}
    for DT, val in pairs(ModularData["Zaw"]["Strike"][StrikeName]["Damage"]) do
        table.insert(DamageTypes,DT)
     --   mw.log(DT)
    end
    DamageTypes=ordertable(DamageTypes,DamageList)
    
    local Type="Zaw"
    local StrikeNames={StrikeName}
    local GripNames={}
    local TertiaryType="Link"
    if (GripName=="All") then
        for i, grip in pairs(ModularData[Type]["Grip"]) do
            table.insert(GripNames,grip["Name"])
        end  
    else
        GripNames={GripName}
    end   
    GripNames=ordertable(GripNames,ZawGripList)
    
    local TertiaryNames={}
    for i, tertiary in pairs(ModularData[Type][TertiaryType]) do
            table.insert(TertiaryNames,tertiary["Name"])
    end     
    TertiaryNames=ordertable(TertiaryNames,ZawLinkList)
    
    local Head={}
    if (GripName=="All") then
        Head={{"GripName",false,"Grip"}}
        table.insert(Head,{"LinkName",false,"Link"})
    else
        Head={{"LinkName",false,"Link"}}
    end
	 -- better if Name is always the first column !!!
	table.insert(Head,{"Damage",true,"[[Damage]]"})
	for i, DT in ipairs(DamageTypes) do
        table.insert(Head,{DT,true,"[["..DT.."]]"})
    end
    table.insert(Head,{"SlideDamage",true,"Slide"})
	table.insert(Head,{"CritChance",true,"[[Critical Chance|Crit. Chance]]"})
	table.insert(Head,{"CritMultiplier",true,"[[Critical multiplier|Crit. Mult.]]"})
	table.insert(Head,{"StatusChance",true,"[[Status Chance|Status]]"})
	table.insert(Head,{"Speed",true,"Speed"})
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
    return BuildKitgunTable(Head,Type,StrikeNames,GripNames,TertiaryNames)
end

function p.getZawTypeTable(frame)
    local ZawTypeName=frame.args ~= nil and frame.args[1]
    local GripType=frame.args ~= nil and frame.args[2]

    if (GripType~="OneHanded" and GripType~="TwoHanded") then return "Error : Wrong GripType name  
" end
    --list of damage types on chamber
    local StrikeNames={}
    local nostrike=true
    for i, strike in pairs(ModularData["Zaw"]["Strike"]) do
        if (strike["Type"][GripType]==ZawTypeName) then
            table.insert(StrikeNames,strike["Name"])
            nostrike=false
        end
    end
    if nostrike then return "Error : Wrong Zaw Type name  
" end
    StrikeNames=ordertable(StrikeNames,ZawStrikeList)
    
    local DamageTypes={}
    local DamagePresent={}
    for DT, i in pairs(DamageList) do
        table.insert(DamagePresent,false)
    end
    for i, StrikeName in ipairs(StrikeNames) do
        for DT, val in pairs(ModularData["Zaw"]["Strike"][StrikeName]["Damage"]) do
            DamagePresent[DamageList[DT]]=true
            --mw.log(DT)
        end
    end
    --for i,l in ipairs(DamagePresent) do mw.log(l) end
    for DT, Val in pairs(DamageList) do
        if (DamagePresent[Val]) then
            table.insert(DamageTypes,DT)
        end
    end
    DamageTypes=ordertable(DamageTypes,DamageList)

    local Type="Zaw"
    local GripNames={}
    local TertiaryType="Link"
    for i, grip in pairs(ModularData[Type]["Grip"]) do
        if (grip["Type"]==GripType) then
            table.insert(GripNames,grip["Name"])
        end
    end  
    GripNames=ordertable(GripNames,ZawGripList)
    
    local TertiaryNames={}
    for i, tertiary in pairs(ModularData[Type][TertiaryType]) do
            table.insert(TertiaryNames,tertiary["Name"])
    end     
    TertiaryNames=ordertable(TertiaryNames,ZawLinkList)
    
    local Head={}
    Head={{"StrikeName",false,"Strike"}}
    table.insert(Head,{"GripName",false,"Grip"})
    table.insert(Head,{"LinkName",false,"Link"})
	 -- better if Name is always the first column !!!
	table.insert(Head,{"Damage",true,"[[Damage]]"})
	for i, DT in ipairs(DamageTypes) do
        table.insert(Head,{DT,true,"[["..DT.."]]"})
    end
    table.insert(Head,{"SlideDamage",true,"Slide"})
	table.insert(Head,{"CritChance",true,"[[Critical Chance|Crit. Chance]]"})
	table.insert(Head,{"CritMultiplier",true,"[[Critical multiplier|Crit. Mult.]]"})
	table.insert(Head,{"StatusChance",true,"[[Status Chance|Status]]"})
	table.insert(Head,{"Speed",true,"Speed"})
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
	--for i,l in ipairs(StrikeNames) do mw.log(l) end
    return BuildKitgunTable(Head,Type,StrikeNames,GripNames,TertiaryNames)
end

function p.getMOATable(frame)
    local BracketName=frame.args ~= nil and frame.args[1]
    local CoreName=frame.args ~= nil and frame.args[2]
    if (ModularData["MOA"]["Bracket"][BracketName]==nil) then return "Error : Wrong Bracket name  
" end
    if (CoreName~="All" and ModularData["MOA"]["Core"][CoreName]==nil) then return "Error : Wrong Core name  
" end

    
    local Type="MOA"
    local BracketNames={BracketName}
    local CoreNames={}
    local TertiaryType="Gyro"
    if (CoreName=="All") then
        for i, core in pairs(ModularData[Type]["Core"]) do
            table.insert(CoreNames,core["Name"])
        end  
    else
        CoreNames={CoreName}
    end 
    CoreNames=ordertable(CoreNames,MOACoreList)
    
    local TertiaryNames={}
    for i, tertiary in pairs(ModularData[Type][TertiaryType]) do
            table.insert(TertiaryNames,tertiary["Name"])
    end     
    TertiaryNames=ordertable(TertiaryNames,MOAGyroList)
    
    local Head={}
    if (CoreName=="All") then
        Head={{"CoreName",false,"Core"}}
        table.insert(Head,{"GyroName",false,"Gyro"})
    else
        Head={{"GyroName",false,"Gyro"}}
    end
	 -- better if Name is always the first column !!!
	table.insert(Head,{"HealthG",true,"[[Health]]"})
	table.insert(Head,{"ShieldG",true,"[[Shield]]"})
	table.insert(Head,{"ArmorG",true,"[[Armor]]"})
	table.insert(Head,{"EHPG",false,"[[EHP]]"})
	table.insert(Head,{"EHP_CRG",false,"EHP + [[Calculated Redirection|CR]]"})
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
    return BuildKitgunTable(Head,Type,BracketNames,CoreNames,TertiaryNames)
end

function p.getHoundTable(frame)
    local StabilizerName=frame.args ~= nil and frame.args[1]
    local CoreName=frame.args ~= nil and frame.args[2]
    if (ModularData["Hound"]["Stabilizer"][StabilizerName]==nil) then return "Error : Wrong Stabilizer name  
" end
    if (CoreName~="All" and ModularData["Hound"]["Core"][CoreName]==nil) then return "Error : Wrong Core name  
" end

    
    local Type="Hound"
    local StabilizerNames={StabilizerName}
    local CoreNames={}
    local TertiaryType="Bracket"
    if (CoreName=="All") then
        for i, core in pairs(ModularData[Type]["Core"]) do
            table.insert(CoreNames,core["Name"])
        end  
    else
        CoreNames={CoreName}
    end 
    CoreNames=ordertable(CoreNames,HoundCoreList)
    
    local TertiaryNames={}
    for i, tertiary in pairs(ModularData[Type][TertiaryType]) do
            table.insert(TertiaryNames,tertiary["Name"])
    end     
    TertiaryNames=ordertable(TertiaryNames,HoundBracketList)
    
    local Head={}
    if (CoreName=="All") then
        Head={{"CoreName",false,"Core"}}
        table.insert(Head,{"BracketName",false,"Bracket"})
    else
        Head={{"BracketName",false,"Bracket"}}
    end
	 -- better if Name is always the first column !!!
	table.insert(Head,{"HealthG",true,"[[Health]]"})
	table.insert(Head,{"ShieldG",true,"[[Shield]]"})
	table.insert(Head,{"ArmorG",true,"[[Armor]]"})
	table.insert(Head,{"EHPG",false,"[[EHP]]"})
	table.insert(Head,{"EHP_CRG",false,"EHP + [[Calculated Redirection|CR]]"})
	--for _, temp in pairs (Head) do for k, temp2 in pairs(temp) do  mw.log(temp2) end end
    return BuildKitgunTable(Head,Type,StabilizerNames,CoreNames,TertiaryNames)
end

return p
```

