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
