---
title: "Module:FactionScript"
wiki_url: "https://wiki.warframe.com/w/Module/FactionScript"
wiki_timestamp: "2023-06-18T23:52:33Z"
---

**FactionScript** translates English phrases and sentences to [WARFRAME](/w/WARFRAME "WARFRAME")-unique [languages](/w/Category:Language "Category:Language").

On this wiki, FactionScript is used in:

* [Template:FactionScript](/w/Template:FactionScript "Template:FactionScript")
* [Template:CorpusScript](/w/Template:CorpusScript "Template:CorpusScript")
* [Template:GrineerScript](/w/Template:GrineerScript "Template:GrineerScript")
* [Template:TennoScript](/w/Template:TennoScript "Template:TennoScript")

Associated CSS stylesheet is stored on [MediaWiki:FactionScript.css](/w/MediaWiki:FactionScript.css "MediaWiki:FactionScript.css").

## Contents

* [1 Usage](#Usage)
  + [1.1 Template](#Template)
* [2 Documentation](#Documentation)
  + [2.1 Package items](#Package_items)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Template

In template: `{{#invoke:FactionScript|function|input1|input2|...}}`  
In articles: `{{template|function|input1|input2|...}}`

## Documentation

### Package items

`factionscript.gen_script(faction, human_words, size)` (function)
:   Generates WARFRAME language glyph sequence for an English phrase/sentence.
:   **Parameters**:

    * `faction` WARFRAME language (e.g. 'grineer' or 'corpus') (string)
    * `human_words` English phrase/sentence to be translated (string)
    * `size` Image sizes in pixels; default 14 for Corpus language and 16 for Grineer (number; optional)
:   **Returns**: HTML of resultant glyph sequence (string)

`factionscript.get_img(image_name, size)` (function)
:   Gets glyph image.
:   **Parameters**:

    * `image_name` Image name (string)
    * `size` Image size in pixels (number)
:   **Returns**: Wikitext of image file (string)

`factionscript.create_span(output_string, size)` (function)
:   Creates span elements for a string.
:   **Parameters**:

    * `output_string` String to be wrapped around with span tags (string)
    * `size` Image sizes in pixels (number)
:   **Returns**: resultant HTML (string)

`factionscript.corpus(frame)` (function)
:   Creates [Corpus Language](/w/Corpus_Language "Corpus Language") translation of an English phrase/sentence.
:   **Parameter**: `frame`

    * {string} string\_input English phrase/sentence to be translated
    * {number} size Image sizes in pixels; default 14
:   (table)
:   **Returns**: HTML of resultant glyph sequence (string)

`factionscript.grineer(frame)` (function)
:   Creates [Grineer Language](/w/Grineer_Language "Grineer Language") translation of an English phrase/sentence.
:   **Parameter**: `frame`

    * {string} string\_input English phrase/sentence to be translated
    * {number} size Image sizes in pixels; default 16
:   (table)
:   **Returns**: HTML of resultant glyph sequence (string)

`factionscript._tenno(human_words, size)` (function)
:   Creates [Orokin Language](/w/Orokin_Language "Orokin Language") translation of an English phrase/sentence.
:   **Parameters**:

    * `human_words` English phrase/sentence to be translated (string)
    * `size` Image sizes in pixels; default 16 (number; optional)
:   **Returns**: HTML of resultant glyph sequence (string)

`factionscript.tenno(frame)` (function)
:   Creates [Orokin Language](/w/Orokin_Language "Orokin Language") translation of an English phrase/sentence.
:   **Parameter**: `frame`

    * {string} human\_words English phrase/sentence to be translated
    * {number} size Image sizes in pixels; default 16
:   (table)
:   **Returns**: HTML of resultant glyph sequence (string)

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [FactionScript/data](/w/Module:FactionScript/data "Module:FactionScript/data")
* [FactionScript/data/doc](/w/Module:FactionScript/data/doc "Module:FactionScript/data/doc")
* [FactionScript/doc](/w/Module:FactionScript/doc "Module:FactionScript/doc")

| Modules and Lua Libraries [Edit](https://wiki.warframe.com/w/Template:ModuleNav?action=edit) | | |
| --- | --- | --- |
| Standard Libraries (STL) | Included | [Scribunto](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") (optional [bit32](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#bit32 "mw:Extension:Scribunto/Lua reference manual") & [libraryUtil](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual#libraryUtil "mw:Extension:Scribunto/Lua reference manual")) |
| Extensions | [M:Math](/w/Module:Math "Module:Math") • [M:String](/w/Module:String "Module:String") • [M:Table](/w/Module:Table "Module:Table") |
| Data Stores / Databases | General | [M:Codex](/w/Module:Codex "Module:Codex") ([/data](/w/Module:Codex/data "Module:Codex/data")) • [M:Companions](/w/Module:Companions?action=edit&redlink=1 "Module:Companions (page does not exist)") ([/data](/w/Module:Companions/data "Module:Companions/data")) • [M:Conservation](/w/Module:Conservation "Module:Conservation") ([/data](/w/Module:Conservation/data "Module:Conservation/data")) • [M:DamageTypes](/w/Module:DamageTypes "Module:DamageTypes") ([/data](/w/Module:DamageTypes/data "Module:DamageTypes/data")) • [M:DojoRoom/data](/w/Module:DojoRoom/data "Module:DojoRoom/data") • [M:Enemies](/w/Module:Enemies?action=edit&redlink=1 "Module:Enemies (page does not exist)") ([/data](/w/Module:Enemies/data "Module:Enemies/data")) • [M:Factions/data](/w/Module:Factions/data "Module:Factions/data") • M:FactionScript ([/data](/w/Module:FactionScript/data "Module:FactionScript/data")) • [M:GuaranteedRewards/data](/w/Module:GuaranteedRewards/data "Module:GuaranteedRewards/data") • [M:Icon](/w/Module:Icon "Module:Icon") ([/data](/w/Module:Icon/data "Module:Icon/data")) • [M:Keys/data](/w/Module:Keys/data "Module:Keys/data") • [M:KeyBindings](/w/Module:KeyBindings "Module:KeyBindings") ([/data](/w/Module:KeyBindings/data "Module:KeyBindings/data")) • [M:Missions](/w/Module:Missions "Module:Missions") ([/data](/w/Module:Missions/data "Module:Missions/data")) • [M:Music/data](/w/Module:Music/data "Module:Music/data") • [Module:TextIcons](/w/Module:TextIcons "Module:TextIcons") ([/data](/w/Module:TextIcons/data "Module:TextIcons/data")) • [M:Upgrades/data](/w/Module:Upgrades/data "Module:Upgrades/data") • [M:Version](/w/Module:Version "Module:Version") ([/data](/w/Module:Version/data "Module:Version/data")) |
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
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''FactionScript''' translates English phrases and sentences to [[WARFRAME]]-unique [[:Category:Language|languages]].  

--	
--	On this wiki, FactionScript is used in:
--	* [[Template:FactionScript]]
--	* [[Template:CorpusScript]]
--	* [[Template:GrineerScript]]
--- * [[Template:TennoScript]]
--	
--	Associated CSS stylesheet is stored on [[MediaWiki:FactionScript.css]].
--	
--	@module		factionscript
--	@alias		p
--	@author		[[User:ChickenBar|ChickenBar]]
--	@image		Tennobet2.png
--	@require	[[Module:FactionScript/data]]
--	@release	stable
--	

local p = {}

local CharData = mw.loadData( 'Module:FactionScript/data' )

--- Generates WARFRAME language glyph sequence for an English phrase/sentence.
--	@function		p.gen_script
--	@param			{string} faction WARFRAME language (e.g. 'grineer' or 'corpus')
--	@param			{string} human_words English phrase/sentence to be translated
--	@param[opt]		{number} size Image sizes in pixels; default 14 for Corpus language and 16 for Grineer
--	@return			{string} HTML of resultant glyph sequence
function p.gen_script(faction, human_words, size)
    local output_string = {}
    local human_words = string.lower(human_words)
    local human_length = string.len(human_words)
    local char_data
    local human_char
    local replacement
    
    if faction == 'corpus' then
        char_data = CharData['CorpusChar']
        if (size == '') or (size == nil) then size = '14' end
        for i=1, human_length do
            human_char = human_words:sub(i,i)
            replacement = char_data[human_char]
            if replacement then
                table.insert(output_string, get_img(replacement, size))
            else
            
            -- adding spaces between words
                table.insert(output_string,'   ')
            end
        end
    else
        char_data = CharData['GrineerChar']
        if (size == '') or (size == nil) then size = '16' end
        for i=1, human_length do
            human_char = human_words:sub(i,i)
            -- no letter "Q" in Grineer language, replace with "K" + "Q" characters
            if human_char == 'q' then
                table.insert(output_string,get_img(char_data['k'], size)..get_img(char_data['w'], size))
            
            -- no letter "X" in Grineer language, replace with "K" + "S" characters
            elseif human_char == 'x' then
                table.insert(output_string,get_img(char_data['k'], size)..get_img(char_data['s'], size))
            else
                replacement = char_data[human_char]
                if replacement then
                    table.insert(output_string, get_img(replacement, size))
                    
                -- adding spaces between words
                else
                    table.insert(output_string,'   ')
                end
            end
        end
    end
    return create_span(output_string, size)
end

--- Gets glyph image.
--	@function		p.get_img
--	@param			{string} image_name Image name
--	@param			{number} size Image size in pixels
--	@return			{string} Wikitext of image file
function get_img(image_name, size)
    return '[[File:'..image_name..'|x'..size..'px|link=]]'
end

--- Creates span elements for a string.
--	@function		p.create_span
--	@param			{string} output_string String to be wrapped around with span tags
--	@param			{number} size Image sizes in pixels
--	@return			{string} resultant HTML
function create_span(output_string, size)
    local span = mw.html.create('span')
    span:css('font-size', size..'px'):wikitext(table.concat(output_string))
    return tostring(span)
end

--- Creates [[Corpus Language]] translation of an English phrase/sentence.
--	@function		p.corpus
--	@param			{table} frame
--					* {string} string_input English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 14
--	@return			{string} HTML of resultant glyph sequence
function p.corpus(frame)
    local string_input = frame.args[1]
    local size = frame.args[2]
    return p.gen_script('corpus', string_input, size)
end

--- Creates [[Grineer Language]] translation of an English phrase/sentence.
--	@function		p.grineer
--	@param			{table} frame
--					* {string} string_input English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p.grineer(frame)
    local string_input = frame.args[1]
    local size = frame.args[2]
    return p.gen_script('grineer', string_input, size)
end

--- Creates [[Orokin Language]] translation of an English phrase/sentence.
--	@function		p._tenno
--	@param			{string} human_words English phrase/sentence to be translated
--	@param[opt]		{number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p._tenno(human_words, size)
	local human_words = string.lower(human_words)
	if (size == nil or size == '') then size='10' end
	local tennobet_list = {}    --list of tennobet pics of the chars
	local phonetic_list = {}    --list of phonetic types (vowel/consonant) of the chars
	local output_list = {}      --final output list
	
	-- converting "normal human spelling" to English phonetic spelling
	local i = string.len(human_words)
	
	while i > 0 do
    	local this_char = human_words:sub(i,i)
    	local prev_char = human_words:sub(i-1,i-1)
		if this_char == "h" then
			if (prev_char == "t" or
				prev_char == "d" or
				prev_char == "s" or
				prev_char == "z" or
				prev_char == "c" or
				prev_char == "k" or
				prev_char == "i" or
				prev_char == "e" or
				prev_char == "u") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."h"][1])
				table.insert(phonetic_list,CharData["TennoChar"][prev_char.."h"][2])
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["h"][1])
				table.insert(phonetic_list,"c")
				i=i-1
			end
		elseif this_char == "g" then
			if prev_char == "n" then
				table.insert(tennobet_list,CharData["TennoChar"]["ng"][1])
				table.insert(phonetic_list,"c")
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["g"][1])
				table.insert(phonetic_list,"c")
				i=i-1
			end
		elseif  this_char == "e" then
			if human_words:sub(i-2,i-2)..prev_char == "ay" then
				table.insert(tennobet_list,CharData["TennoChar"]["aye"][1])
				i=i-3
			elseif (prev_char == "e" or
					prev_char == "a") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."e"][1])
				i=i-2
			else 
				table.insert(tennobet_list,CharData["TennoChar"]["e"][1])
				i=i-1
			end
			table.insert(phonetic_list,"v")
		elseif this_char == ("w") then
			if (prev_char == "a" or
				prev_char == "o") then
				table.insert(tennobet_list,CharData["TennoChar"][prev_char.."w"][1])
				i=i-2
			else
				table.insert(tennobet_list,CharData["TennoChar"]["oo"][1])
				i=i-1
			end
				table.insert(phonetic_list,"v")
		elseif this_char == ("o") then
			if prev_char == "o" then
				table.insert(tennobet_list,CharData["TennoChar"]["oo"][1])
				i=i-2
			else 
				table.insert(tennobet_list,CharData["TennoChar"]["o"][1])
				i=i-1
			end
				table.insert(phonetic_list,"v")
		elseif CharData["TennoChar"][this_char] == " " then
				table.insert(tennobet_list,CharData["TennoChar"]["."][1])
				table.insert(phonetic_list,"space")
			    i=i-1
		elseif CharData["TennoChar"][this_char] ~= nil then
				table.insert(tennobet_list,CharData["TennoChar"][this_char][1])
				table.insert(phonetic_list,CharData["TennoChar"][this_char][2])
			    i=i-1
		else
				table.insert(tennobet_list," ")
				table.insert(phonetic_list,"unknown")
			    i=i-1
		end
    end

    -- building resultant sequence of Tennobet character images 
    local j = #phonetic_list      --size of phoetic_list
    
	while j > 0 do
	    if phonetic_list[j] == "c" then         --consonant
            local stack_consonant = mw.html.create('div')
            	:attr( 'class', 'tennoscript_C' )
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
	    	table.insert(output_list,tostring(stack_consonant))
		    j = j - 1
		elseif phonetic_list[j] == "v" then     --vowel
		    local stack_vowel = mw.html.create('div')
            	:attr( 'class', 'tennoscript_V' )
            repeat
                stack_vowel:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
                j = j - 1
            until phonetic_list[j] ~= "v"
		    table.insert(output_list,tostring(stack_vowel))
		elseif phonetic_list[j] == "s" then     --signs/numbers
            local stack_symbol = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_symbol))
		    j = j - 1
		elseif phonetic_list[j] == "p" then    --periods/commas
            local stack_ep = mw.html.create('div'):done()
            if (phonetic_list[j + 1] == "c" and (phonetic_list[j-1] == nil or phonetic_list[j-1] == "space")) then 
                stack_ep:attr( 'class', 'tennoscript_EPeriod' ):done()
            elseif (phonetic_list[j - 1] == "c" and (phonetic_list[j+1] == nil or phonetic_list[j+1] == "space")) then
                stack_ep:attr( 'class', 'tennoscript_SPeriod' ):done()
            else
                stack_ep:attr( 'class', 'tennoscript_S' ):done()
            end
            stack_ep:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j = j - 1
		elseif phonetic_list[j] == "r" then     --r
            local stack_ep = mw.html.create('div')
            	:attr( 'class', 'tennoscript_C' )
            	:css('text-align','center')
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_ep))
		    j = j - 1
		elseif phonetic_list[j] == "space" then
            local stack_space = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:css('visibility','hidden')
            	:wikitext("[[File:"..tennobet_list[j].."|x"..size.."px|link=]]"):done()
		    table.insert(output_list,tostring(stack_space))
		    j = j - 1
        else 
            local stack_space = mw.html.create('div')
            	:attr( 'class', 'tennoscript_S' )
            	:wikitext(" "):done()
		    table.insert(output_list,tostring(stack_space))
		    j =	j - 1
	    end
	end
	return table.concat(output_list)
end

--- Creates [[Orokin Language]] translation of an English phrase/sentence.
--	@function		p.tenno
--	@param			{table} frame
--					* {string} human_words English phrase/sentence to be translated
--					* {number} size Image sizes in pixels; default 16
--	@return			{string} HTML of resultant glyph sequence
function p.tenno(frame)
    local string_input = frame.args[1]
    local num_input = frame.args[2]
    return p._tenno(string_input,num_input)
end

return p
```

