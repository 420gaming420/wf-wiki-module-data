---
title: "Module:Reference"
wiki_url: "https://wiki.warframe.com/w/Module/Reference"
wiki_timestamp: "2022-11-03T17:51:36Z"
---

**Reference** is used to create citations in [Wikipedia's Citation Style 1](https://en.wikipedia.org/wiki/Help:Citation_Style_1 "wikipedia:Help:Citation Style 1") format. Code forked from dev.fandom.com <https://dev.fandom.com/wiki/Global_Lua_Modules/Ref>

## Contents

* [1 Usage](#Usage)
  + [1.1 Direct Invocation](#Direct_Invocation)
  + [1.2 Template](#Template)
* [2 Documentation](#Documentation)
* [3 See Also](#See_Also)
* [4 Code](#Code)

## Usage

### Direct Invocation

`{{#invoke:Reference|main}}`

### Template

In template: `{{#invoke:Reference|main}}`  
In articles: `{{Ref|param1=arg1|param2=arg2|...}}`

See <https://dev.fandom.com/wiki/Global_Lua_Modules/Ref#Parameters> for full documentation.

## Documentation

---

:   *Created with [Docbunto](/w/Module:Docbunto "Module:Docbunto")*

## See Also

* [Reference/doc](/w/Module:Reference/doc "Module:Reference/doc")

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
| Wiki | [Dev Wiki](https://dev.fandom.com/wiki/Fandom_Developers_Wiki) Fork | [Module:Common](/w/Module:Common "Module:Common") ([/i18n](/w/Module:Common/i18n "Module:Common/i18n")) • [M:Docbunto](/w/Module:Docbunto "Module:Docbunto") ([/cli](/w/Module:Docbunto/cli "Module:Docbunto/cli"), [/i18n](/w/Module:Docbunto/i18n "Module:Docbunto/i18n")) • [M:Entrypoint](/w/Module:Entrypoint "Module:Entrypoint") • [M:I18n](/w/Module:I18n "Module:I18n") • [M:Infobox](/w/Module:Infobox "Module:Infobox") ([/i18n](/w/Module:Infobox/i18n "Module:Infobox/i18n")) • [M:LanguageList](/w/Module:LanguageList "Module:LanguageList") • [M:Mbox](/w/Module:Mbox "Module:Mbox") ([/i18n](/w/Module:Mbox/i18n "Module:Mbox/i18n")) • [M:ModuleTest](/w/Module:ModuleTest "Module:ModuleTest") • M:Reference • [M:ReleaseStatus](/w/Module:ReleaseStatus "Module:ReleaseStatus") ([/i18n](/w/Module:ReleaseStatus/i18n "Module:ReleaseStatus/i18n")) • [M:TestHarness](/w/Module:TestHarness "Module:TestHarness") ([/i18n](/w/Module:TestHarness/i18n "Module:TestHarness/i18n")) • [M:WDSButton](/w/Module:WDSButton "Module:WDSButton") ([/data](/w/Module:WDSButton/data "Module:WDSButton/data")) |
| [Wikipedia](https://en.wikipedia.org/wiki/Wikipedia "wikipedia:Wikipedia") Fork | [M:Arguments](/w/Module:Arguments "Module:Arguments") ([/i18n](/w/Module:Arguments/i18n "Module:Arguments/i18n")) • [M:FallbackList](/w/Module:FallbackList "Module:FallbackList") • [M:Yesno](/w/Module:Yesno "Module:Yesno") |
| Third-Party Fork | [M:Codec](/w/Module:Codec "Module:Codec") • [M:CSV](/w/Module:CSV "Module:CSV") • [M:Date](/w/Module:Date "Module:Date") • [M:Inspect](/w/Module:Inspect "Module:Inspect") • [M:JSON](/w/Module:JSON "Module:JSON") • [M:Lexer](/w/Module:Lexer "Module:Lexer") • [M:LuaClassSystem](/w/Module:LuaClassSystem "Module:LuaClassSystem") • [M:LuaSerializer](/w/Module:LuaSerializer "Module:LuaSerializer") • [M:Navbox](/w/Module:Navbox "Module:Navbox") • [M:Navigation](/w/Module:Navigation "Module:Navigation") • [M:Unindent](/w/Module:Unindent "Module:Unindent") |
| Wiki-Unique | [M:Database](/w/Module:Database "Module:Database") • [M:DatastoreManifest](/w/Module:DatastoreManifest "Module:DatastoreManifest") • [M:Delay](/w/Module:Delay "Module:Delay") • [M:DependencyGraph](/w/Module:DependencyGraph "Module:DependencyGraph") • [M:InfoboxBuilder](/w/Module:InfoboxBuilder "Module:InfoboxBuilder") • [M:Lua](/w/Module:Lua "Module:Lua") • [M:Map](/w/Module:Map "Module:Map") • [M:Placeholder](/w/Module:Placeholder "Module:Placeholder") • [M:RemoveCategory](/w/Module:RemoveCategory "Module:RemoveCategory") • [M:StatObject](/w/Module:StatObject "Module:StatObject") • [M:Text](/w/Module:Text "Module:Text") • [M:Tooltips](/w/Module:Tooltips "Module:Tooltips") |
| Other | [M:Enum/data](/w/Module:Enum/data "Module:Enum/data") • [M:InternalNames](/w/Module:InternalNames "Module:InternalNames") • [M:MasteryRank](/w/Module:MasteryRank "Module:MasteryRank") • [M:Polarity](/w/Module:Polarity "Module:Polarity") • [M:Sandbox](/w/Module:Sandbox "Module:Sandbox") • [M:WarframeUsageData2020/data](/w/Module:WarframeUsageData2020/data "Module:WarframeUsageData2020/data") | |
| Archived/Deprecated | [M:Avionics](/w/Module:Avionics "Module:Avionics") ([/data](/w/Module:Avionics/data "Module:Avionics/data")) • [M:BuildRequire](/w/Module:BuildRequire "Module:BuildRequire") • [M:FormatingTool](/w/Module:FormatingTool "Module:FormatingTool") • [M:Gallery](/w/Module:Gallery "Module:Gallery") • [M:NightwaveActs](/w/Module:NightwaveActs "Module:NightwaveActs") • [M:Shared](/w/Module:Shared "Module:Shared") • [M:Syndicates/data](/w/Module:Syndicates/data "Module:Syndicates/data") • [M:TennoScript](/w/Module:TennoScript "Module:TennoScript") • [M:TranslationExamples](/w/Module:TranslationExamples "Module:TranslationExamples") • [M:VoidByReward](/w/Module:VoidByReward "Module:VoidByReward") • [M:WorldState](/w/Module:WorldState "Module:WorldState") ([/data](/w/Module:Worldstate/data "Module:Worldstate/data")) | |
| [Bug Reports](/w/WARFRAME_Wiki:Bug_Reports "WARFRAME Wiki:Bug Reports") • [Development Guide](/w/WARFRAME_Wiki:Development_Guide "WARFRAME Wiki:Development Guide") • [Localization Guide](/w/WARFRAME_Wiki:Localization_Guide "WARFRAME Wiki:Localization Guide") ([L10n Message Data Stores](/w/WARFRAME_Wiki:L10n "WARFRAME Wiki:L10n")) • [Programming Standards](/w/WARFRAME_Wiki:Programming_Standards "WARFRAME Wiki:Programming Standards") • [Projects & Current Backlog](/w/WARFRAME_Wiki:Projects "WARFRAME Wiki:Projects") • [Updating Databases](/w/WARFRAME_Wiki:Updating_Databases "WARFRAME Wiki:Updating Databases") • [Full Module List](/w/Special:AllPages/Module: "Special:AllPages/Module:") • [Lua Reference Manual](https://www.mediawiki.org/wiki/Extension:Scribunto/Lua_reference_manual "mw:Extension:Scribunto/Lua reference manual") | | |

## Code

---

```lua
---	'''Reference''' is used to create citations in
--	[[wikipedia:Help:Citation_Style_1|Wikipedia's Citation Style 1]] format.
--	Code forked from dev.fandom.com https://dev.fandom.com/wiki/Global_Lua_Modules/Ref
--	
--	@module		reference
--	@alias		ref
--	@require	[[Module:Arguments]]
--	@author		[[User:Jak Himself]]
--	@author		[[User:Technobliterator]]
--	@release	stable
--	

local ref = {}
local getArgs = require('Module:Arguments').getArgs
local Lang = mw.language.getContentLanguage()

--sourcedata used for autofill functions
ref.sourcedata = {}

--[[--------------------------< A U T O F I L L  D A T A >-------------------------------------------------

looks for a module containing data that autofills a reference, aby finding its entry on a table using a shorthand

for example, "|game=FFVII" to autofill a reference for "Final Fantasy VII" based on a module containing as much

]]
--helper function for all to allow for recursion
local function recover(data, default_source, alternate_source, category, new, author_type)
	local target = new or category
	
	--use the currently selected version by default; if it has nothing, use the base case
	local source = default_source[category] or alternate_source[category]
	
	--if the data is an author table, split to first[n]= and last[n]=
	if type(source) == 'table' then
		if target == 'author' and author_type ~= 'developer' then
			if type(source[1]) == 'table' then
				for i, y in ipairs(source) do
					data['first' .. i] = source[i][1]
					data['last' .. i] = source[i][2]
				end
				if (author_type) then
					data['author-type'] = author_type
				end
			else
				data.first = source[1]
				data.last = source[2]
				if (author_type) then
					data['author-type'] = author_type
				end
			end
		else
			--if it is a table, split to target[n]
			for i, y in ipairs(source) do
				data[target .. i] = y
			end
		end
	else
		--if no table was found, assign as desired
		data[target] = source
	end
end

local function game_ref(data, game, game_version)
	recover(data, game_version, game, 'developer', 'author', 'developer')
	recover(data, game_version, game, 'year')
	recover(data, game_version, game, 'month')
	recover(data, game_version, game, 'day')
	data['link'] = game_version['link'] or game['link']
	data['title'] = game_version['title'] or game['title']
	data['media'] = 'game'
	data['publisher']  = game_version['publisher'] or game['publisher']
	recover(data, game_version, game, 'platform')
end

--Automatically creates a reference for movies based on shorthand data module
local function movie_ref(data, movie, movie_version)
	recover(data, movie_version, movie, 'director', 'author')
	data['author-type'] = 'Director'
	recover(data, movie_version, movie, 'year')
	recover(data, movie_version, movie, 'month')
	recover(data, movie_version, movie, 'day')
	data['link'] = movie['link']
	data['title'] = movie['title']
	data['title'] = movie_version['title'] or movie['title']
	data['media'] = 'film'
	data['publisher'] = movie_version['studio'] or movie['studio']
end

--Automatically creates a reference for series based on shorthand data module
local function series_ref(data, series)
	recover(data, series, series, 'executive', 'author', 'Executive Producer')
	recover(data, series, series, 'year')
	data['link'] = series['link']
	data['title'] = series['title']
	data['media'] = 'series'
	data['publisher'] = series['studio']
end

--Automatically creates a reference for episode based on shorthand data module
local function episode_ref(data, episode, series)
	recover(data, episode, episode, 'writer', 'author', 'Writer')
	recover(data, episode, episode, 'director', 'author', 'Director')
	recover(data, episode, episode, 'writerdirector', 'author', 'Writer & Director')
	recover(data, episode, episode, 'year')
	data['entry-link'] = episode['link']
	data['entry'] = episode['title']
	data['link'] = series['link']
	data['title'] = series['title']
	data['media'] = 'episode'
	data['publisher'] = episode['studio']
end

--Automatically creates a reference for books or manga based on shorthand data module
--Can also be used with a guide or design bible for a game
local function book_ref(data, book)
	recover(data, book, book, 'author')
	recover(data, book, book, 'year')
	recover(data, book, book, 'month')
	recover(data, book, book, 'day')
	data['link'] = book['link']
	data['title'] = book['title']
	data['media'] = 'book'
	data['additional-authors'] = book['additional-authors']
	data['publisher'] = book['publisher']
	data['isbn'] = book['isbn']
end

--Automatically creates a reference for an album based on shorthand data module
local function album_ref(data, album, album_version)
	recover(data, album_version, album, 'artist', 'author')
	recover(data, album_version, album, 'year')
	recover(data, album_version, album, 'month')
	recover(data, album_version, album, 'day')
	data['link'] = album['link']
	data['title'] = album['title']
	data['title'] = album_version['title'] or album['title']
	data['media'] = 'album'
	data['publisher'] = album_version['label']
end

--Automatically creates a reference for an album based on shorthand data module
local function song_ref(data, song, song_version)
	recover(data, song_version, song, 'artist', 'author')
	recover(data, song_version, song, 'year')
	recover(data, song_version, song, 'month')
	recover(data, song_version, song, 'day')
	data['entry-link'] = song['link']
	data['entry'] = song_version['title'] or song['title']
	data['title'] = song_version['album'] or song['album']
	data['additional-authors'] = song_version['featured']
	data['media'] = 'song'
	data['publisher'] = song_version['label']
end

--[[--------------------------< H E L P E R  F U N C T I O N S >-------------------------------------------------

helper functions for parts of the reference, applies to all formats

]]
--Assistant to generate the id
local function make_id(data)
	local id = ''
	if data['id'] then
		id = data['id']
	else
		--first half of concatenated id, either author or publisher
		local authorid = ''
		if data['last'] then authorid = data['last']
		elseif data['last1'] then
			for n = 1, 10, 1 do
				if data['last' .. n] then
					authorid = authorid .. data['last' .. n]
				end
			end
		elseif data['author'] or data['author1'] or data['publisher'] then
			if data['author'] then
				authorid = data['author']
			elseif data['author1'] then
				authorid = data['author1']
			elseif data['publisher'] then
				authorid = data['publisher']
			end
			
			authorid = authorid:gsub('%[%[(.-)%]%]', '')
			authorid = authorid:gsub('%s+', '')
			authorid = authorid:match("%|(.*)") or authorid
		end
		
		--last half of concatenated id, either year or nothing
		year = ''
		if data['year'] then
			year = data['year']
		elseif data['year1'] then
			year = data['year1']
		end
		
		id = string.format('%s%s', authorid, year)
	end
	
	return id
end

--Assistant for dates
local function format_dates(data)
	local dates = ''
	
	--up to 10 dates
	for n = 0, 10, 1 do
		local m
		if n == 0 then m = '' else m = n end
		local to_append = ''
		
		--different output depending on chosen date format; defaults to just the year
		if data['month'..m] and data['showmonth'] then
			to_append = Lang:formatDate('Y, F', data['year'..m] .. '-' .. data['month'..m])
		elseif data['day'..m] and data['showfulldate'] then
			to_append = Lang:formatDate('Y, F j', data['year'..m] .. '-' .. data['month'..m] .. '-' .. data['day'..m])
		elseif data['dateformat'] then
			to_append = Lang:formatDate(data['dateformat'], data['year'..m] .. '-' .. data['month'..m] .. '-' .. data['day'..m])
		else
			to_append = data['year'..m] or ''
		end
		
		if not (dates == '') and not (to_append == '') then dates = dates .. '; ' end
		dates = dates .. to_append
	end
	
	return dates
end

--Assistant for author section
local function format_authors(data)
	local authors = ''
	--up to 10 authors
	for n = 0, 10, 1 do
		local m
		if n == 0 then m = '' else m = n end
		local to_append = ''
		local separator = ','

		--either the first/last name of a person author, or name of the authoring group/organization
		if data['last'..m] then
			to_append = string.format('%s, %s', data['last'..m], data['first'..m])
			separator = ';'
			if data['author-link'..m] then
				to_append = string.format('[[%s|%s]]', data['author-link'..m], to_append)
			end
		elseif data['author'..m] then
			to_append = data['author'..m]
		end
			
		--the type of each author, if applicable; if all authors are the same type, 'author-type' applies
		if n > 0 and data['author-type'..m] then
			to_append = to_append .. ' (' .. (data['author-type'..m]:gsub('^%l', string.upper)) .. ')'
		end
		
		if not (authors == '') and not (to_append == '') then authors = authors .. separator .. ' ' end
		authors = authors .. to_append
	end
	
	--if referencing a tweet, add handle; a tweet can only have one author	
	if data['author-id'] and data['tweet-id'] then
		authors = authors .. string.format(
			' \[[https://www.twitter.com/%s @%s]\]',
			data['author-id'], data['author-id'])
	end
	
	--if referencing youtube, add channel name; applies to all authors 
	if data['channel-id'] and data['channel'] and data['youtube-id'] then
		authors = authors .. string.format(
			' \[[https://www.youtube.com/channel/%s %s]\]',
			data['channel-id'], data['channel'])
	end
	
	--if referencing instagram, add account name; applies to all authors 
	if data['author-id'] and data['instagram-id'] then
		authors = authors .. string.format(
			' \[[https://www.instagram.com/%s %s]\]',
			data['author-id'], data['author-id'])
	end
	
	--the type of all authors, if applicable; should not be used if individual 'author-typen' are set
	if data['author-type'] then
		authors = authors .. string.format(' (%s)', data['author-type'])
	end
	
	return authors
end

--Assistant for url links section; formats either entry or title to be a link
local function format_url(data, to_format)
	if data['archive-url'] and data['brokenlink'] then
		to_format = string.format('[%s %s]', data['archive-url'], to_format)
	elseif data['url'] then
		to_format = string.format('[%s %s]', data['url'], to_format)
	elseif data['youtube-id'] then
		to_format = string.format('[https://www.youtube.com/watch?v=%s %s]', data['youtube-id'], to_format)
	elseif data['tweet-id'] then
		to_format = string.format('[https://twitter.com/%s/status/%s %s]', data['author-id'], data['tweet-id'], to_format)
	elseif data['instagram-id'] then
		to_format = string.format('[https://instagram.com/p/%s %s]', data['instagram-id'], data['instagram-id'], to_format)
	end
	
	return to_format
end
	
--Assistant for title section
local function format_title(data)
	local title = assert(data['title'], 'Title is mandatory')
	-- Converting tokens to HTML entities so they don't render as wikitext
	title = mw.text.nowiki(title)
	
	if data['link'] then
		title = string.format("[[%s|%s]]", data['link'], title)
	elseif not data['entry'] and data['url'] then
		title = format_url(data, title)
	elseif data['youtube-id'] then
		title = string.format('[https://www.youtube.com/watch?v=%s %s]', data['youtube-id'], title)
	elseif data['tweet-id'] then
		title = string.format('[https://twitter.com/%s/status/%s %s]', data['author-id'], data['tweet-id'], title)
	elseif data['instagram-id'] then
		title = string.format('[https://www.instagram.com/p/%s %s]', data['instagram-id'], title)
	end
	
 	if not data['noitalictitle'] then
 		title = string.format("''%s''", title)
 	else
 		title = string.format('"%s"', title)
	end
	
	return title
end

--Assistant for url archives links
local function format_archive(url, accessdate, archiveurl, archivedate)
	local link = ''
	if archiveurl then
		link = archiveurl
	else
		link = string.format('https://web.archive.org/web/%s', url)
	end
	
	if archivedate then
		return string.format('Accessed %s. [%s Archived] from the original on %s. ', accessdate, link, archivedate)
	else
		return string.format('[%s Archived] from the original on %s. ', link, accessdate)
	end
end

--Assistant for additional content on the end of a reference
local function additional_content(data)
	local additional = {}
	
	if data['publisher'] then
		table.insert(additional, string.format(' %s. ', data['publisher']))
	end
	
	if data['additional-authors'] then
		table.insert(additional, string.format('%s. ', (data['additional-authors'])))
	end
	
	if data['youtube-id'] then
		table.insert(additional, '[[wikipedia:YouTube|YouTube]]. ')
	elseif data['tweet-id'] then
		table.insert(additional, '[[wikipedia:Twitter|Twitter]]. ')
	elseif data['instagram-id'] then
		table.insert(additional, '[[wikipedia:Instagram|Instagram]]. ')
	elseif data['platform'] then
		table.insert(additional, string.format(' %s. ', data['platform']))
	end

	if data['isbn'] then
		table.insert(additional, string.format('[[wikipedia:ISBN|ISBN]] [[Special:Booksources/%s|%s]]. ', (data['isbn']), (data['isbn'])))
	end
	
	if data['url'] and not data['broken-link'] then
		table.insert(additional, format_archive(data['url'], assert(data['access-date'], 'Access dates are required for website references'), data['archive-url'], data['archive-date']))
	elseif data['broken-link'] then
		table.insert(additional, string.format('Archived from the [%s original] on %s. ', data['url'], assert(data['access-date'], 'Access dates are required for website references') or data['archive-date']))
	end
	
	if data['extra'] then
		table.insert(additional, ' ' .. data['extra'] .. '.')
	end
	
	return table.concat(additional, '')
end

--[[--------------------------< C O N S T R U C T O R  F U N C T I O N S >-------------------------------------------------

fuctions to construct the full reference

(note: only constructs Wikipedia CS1 ref at this stage)

]]

--constructs reference, in standard style similar to Wikipedia's CS1.
local function construct_wiki_ref(data)
	local refcontent = ''
	
	--if author and date, print Author (Date)
	--n.d. if no date, no author if no author found
	has_author = (data['last1'] or data['last'] or data['author1'] or data['author'])
	if has_author then
		refcontent = format_authors(data) .. ' '
	end
	has_date = (data['year1'] or data['year'])
	if has_date then
		refcontent = refcontent .. string.format('(%s). ', format_dates(data))
	else
		refcontent = refcontent .. '(n.d.) . '
	end
	
	--if pointing to a location in a source, Location in Title
	if data['location'] then
		refcontent = refcontent .. string.format('"%s" in ', data['location'])
	end
	
	--if the media type is included, add this either after title or entry name
	local media = ''
	if data['media'] then
		--first letter of the media type is capitalized
		media = string.format(' [%s]', data['media']:gsub("^%l", string.upper))
	end
	
	--if pointing to an entry of a work, "Entry" before Title
	if data['entry'] then
		local entry = data['entry']
		if data['entry-link'] then
			entry = string.format('[[%s|%s]]', data['entry-link'], data['entry'])
		elseif data['url'] then
			entry = format_url(data, entry)
		end
		refcontent = refcontent .. string.format('"%s"', entry)
		if data['season'] or data['number'] then
			refcontent = refcontent .. ' (' 
			if data['season'] then
				refcontent = refcontent .. data['season']
			end
			if data['season'] and data['number'] then
				refcontent = refcontent .. ', '
			end
			if data['number'] then
				refcontent = refcontent .. data['number']
			end
			refcontent = refcontent .. ') '
		end
		if data['media'] then 
			refcontent = refcontent .. media
		end
		refcontent = refcontent .. '. From '
	end
	
	--Title is mandatory
	refcontent = refcontent .. format_title(data)
	
	--if media type here, append title
	if data['media'] and not data['entry'] then 
		refcontent = refcontent .. media
	end
	--if volume or issue no., append title
	if data['volume'] or data['issue'] then
		refcontent = refcontent .. ' (' 
		if data['volume'] then
			refcontent = refcontent .. data['volume']
		end
		if data['volume'] and data['issue'] then
			refcontent = refcontent .. ', '
		end
		if data['issue'] then
			refcontent = refcontent .. data['issue']
		end
		refcontent = refcontent .. ') '
	end
	--period after title either way
	refcontent = refcontent .. '. '
	
	--if pointing to a page number, add page number after Title
	if data['p'] or data['page'] then
		refcontent = refcontent .. string.format(' p. %s.', (data['p'] or data['page']))
	end
	
	--added additional fields to be appended at the end
	refcontent = refcontent .. string.format(' %s', additional_content(data))
	
	return refcontent
end

--[[--------------------------< M A I N  F U N C T I O N S >-------------------------------------------------

process parameter input to return reference

]]
--function to take argument inputs to pass to core functions
--parameter inputs override autogeeration
local function core_input(frame)
	--parameters/data
	local args = getArgs(frame)
	local data = {}
	
	if args['game'] then
		game = assert(ref.sourcedata[args['game']], 'Could not find an entry in shorthand data module matching this input')
		game_version = game
		if args['version'] then
			game_version = assert(game['versions'][args['version']], 'Could not find version matching this input')
		end
		game_ref(data, game, game_version)
	elseif args['movie'] then
		movie = assert(ref.sourcedata[args['movie']], 'Could not find an entry in shorthand data module matching this input')
		movie_version = movie
		if args['version'] then
			movie_version = assert(movie['versions'][args['version']], 'Could not find version matching this input')
		end
		movie_ref(data, movie, movie_version)
	elseif args['series'] then
		series = assert(ref.sourcedata[args['series']], 'Could not find an entry in shorthand data module matching this input')
		series_ref(data, series)
	elseif args['episode'] then
		episode = assert(ref.sourcedata[args['episode']], 'Could not find an entry in shorthand data module matching this input')
		series = ref.sourcedata[args['episode']]['series']
		series_ref(data, episode, series)
	elseif args['book'] then
		book = assert(ref.sourcedata[args['book']], 'Could not find an entry in shorthand data module matching this input')
		if args['version'] then
			book = assert(book['versions'][args['version']], 'Could not find version matching this input')
		end
		book_ref(data, book)
	elseif args['db'] then 
		game = assert(ref.sourcedata[args['db']], 'Could not find an entry in shorthand data module matching this input')
		db = assert(game['db'], 'Could not find a design bible for this game')
		if args['version'] then
			db = assert(db[args['version']], 'Could not find version matching this input')
		end
		book_ref(data, db)
	elseif args['guide'] then
		game = assert(ref.sourcedata[args['guide']], 'Could not find an entry in shorthand data module matching this input')
		guide = assert(game['guide'], 'Could not find a guide for this game')
		if args['version'] then
			guide = assert(guide[args['version']], 'Could not find version matching this input')
		end
		book_ref(data, guide)
	elseif args['album'] then
		album = assert(ref.sourcedata[args['album']], 'Could not find an entry in shorthand data module matching this input')
		album_version = album
		if args['version'] then
			album_version = assert(album['versions'][args['version']], 'Could not find version matching this input')
		end
		album_ref(data, album, album_version)
	elseif args['song'] then
		song = assert(ref.sourcedata[args['song']], 'Could not find an entry in shorthand data module matching this input')
		song_version = song
		if args['version'] then
			song_version = assert(song['versions'][args['version']], 'Could not find version matching this input')
		end
		song_ref(data, song, song_version)
	end

	--merge data and args, where args takes priority
	for k, v in pairs(args) do
		data[k] = v or data[k]
	end
	
	--automatic types for refs not auto-generated
	if data['url'] then
		data['showfulldate'] = true
	elseif data['youtube-id'] then
		data['media'] = 'video'
		data['showfulldate'] = true
	elseif data['tweet-id'] then
		data['media'] = 'tweet'
		data['showfulldate'] = true
	elseif data['instagram-id'] then
		data['media'] = 'instagram'
		data['showfulldate'] = true
	end
	
	local id = make_id(data)
	
	return data, id
end

--pass to this function to build reference
local function core_output(refcontent, id)
	refoutput = mw.html.create('span')
		:attr('id', id)
		:wikitext(refcontent)
	
	return refoutput
end

--returns reference in wiki-style format
function ref.wiki(frame)
	local data, id = core_input(frame)
	local refcontent = construct_wiki_ref(data)
	return core_output(refcontent, id)
end

--main function (defaults to wiki reference)
ref.main = ref.wiki

--when importing this module, fill sourcedata table from another given module or input
function ref.custom_sourcedata(...)
	local sourcedata = {...}
	for i,source in ipairs(sourcedata) do
		for k, val in pairs(source) do
			ref.sourcedata[k] = val
		end
	end
	return ref
end

return ref
```

