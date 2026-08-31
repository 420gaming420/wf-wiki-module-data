local p = {}

function cleanfilename(f)
	f = mw.text.trim(tostring(f)):gsub('^File:', '')
	return 'File:'..f
end
function cleantabname(f)
	f = mw.text.trim(tostring(f))
	f = string.gsub(f, '^<span class.*<span style="white%-space:normal;">%[%[(.*)%]%]</span></span>', function(x)
		local spl = mw.text.split(x, '|')
		return spl[#spl]
	end)
	return f
end
function has_content(arg)
	return string.find(arg or '', '%S')
end
function trim(x)
	if x then
		return mw.text.trim(tostring(x))
	end
	return x
end


function p.main(frame)
	local args = frame:getParent().args
	-- pairs to handle empty args
	local vals = {}
	for k,v in pairs(args) do
		local x = mw.text.trim(v)
		local autotabname = nil
		local caption,tabname
		if x ~= '' then
			local spl = mw.text.split(x, '¦')
			if #spl < 2 then
				tabname = k
				autotabname = true
			elseif #spl == 2 then
				tabname = cleantabname(spl[2])
				caption = mw.text.trim(spl[2])
			else
				tabname = cleantabname(spl[2])
				caption = mw.text.trim(spl[3])
			end
			table.insert(vals, {key=k, tabname=tabname, caption=caption, file=cleanfilename(spl[1]), autotabname=autotabname})
		end
	end
	mw.logObject(vals)
	if #vals == 0 then
		error('no images provided')
	end
	if #vals == 1 then
		local img = vals[1]
		local outcap=''
		out = '[['..img.file
		if has_content(img.caption) or (has_content(img.tabname) and not vals[1].autotabname) then
			local cap = has_content(img.caption) and img.caption or img.tabname
			out = out .. '|x280px|'..cap
			outcap = '<div class="infobox-caption">'..cap..'</div>'
		end
		return out .. ']]'..outcap
	end
		
	table.sort(vals, function(a,b)
		if tonumber(a.key) and tonumber(b.key) then
			return tonumber(a.key) < tonumber(b.key)
		end
		return a.key < b.key
	end)
	local content = ''
	for i,v in ipairs(vals) do
		local outcap = ''
		content = content .. '|-| '..v.tabname..' = \n[['..v.file
		if has_content(v.caption) then
			content = content ..'|x280px|'..v.caption
			outcap = '<div class="infobox-caption">'..v.caption..'</div>'
		end
		content = content..']]' .. outcap
	end
	
	return frame:extensionTag('tabber', content)
end

-- similar, but uses named params
function p.main2(frame)
	local args = frame:getParent().args
	-- pairs to handle empty args
	local vals = {}
	local i = 1
	while true do
		local img = args['image'..i]
		local label = args['label'..i]
		if has_content(img) then
			local caption = args['caption'..i]
			vals[i] = { cleanfilename(img), trim(label), trim(caption) }
		else
			break
		end
		i = i + 1
	end
	if #vals == 0 then
		error('no images provided')
	end
	local out
	if #vals == 1 then
		out = '[['..vals[1][1]
		if has_content(vals[1][3]) then
			out = out .. '|'..vals[1][3]
		end
		return out .. ']]'
	end
	local content = ''
	for i,v in ipairs(vals) do
		content = content .. '|-| '..v[2]..' = \n[['..v[1]
		if has_content(v[3]) then
			content = content..'|'..v[3]
		end
		content = content .. ']]'
		return
	end
	
	return frame:extensionTag('tabber', content)
	
end

function p.detect(frame)
	local invargs = frame.args
	local args = frame:getParent().args
	local imgargnames = invargs.param
	for imgargname in mw.text.gsplit(imgargnames, '[¦;]') do
		imgargname = trim(imgargname)
		local imgargval = args[imgargname]
		if has_content(imgargval) then
			local capargname = invargs.captionparam
			local capargval = args[capargname]
			local out2 = ''
			if has_content(capargval) then
				out2 = '<div class="infobox-caption">'..capargval..'</div>'
			end
			if string.find(imgargval, 'UNIQ%-%-tabber') then
				return '<div class="infobox-gallery">'..imgargval..out2..'</div>'
			end
			if string.find(imgargval, 'UNIQ%-%-gallery') then
				return '<div class="infobox-gallery infobox-gallery-unconverted">'..imgargval..'[[Category:Unconverted Infobox Gallery]]</div>'
			end
			if string.find(imgargval, '%[%[File:') then
				if string.find(imgargval, 'infobox%-caption') then
					out2 = ''
				end
				return '<div class="infobox-image">'..imgargval..out2..'</div>'
			end
			local imgname = cleanfilename(imgargval)
			local imgsize = invargs.imagesize
			local out = '[['..imgname
			if has_content(imgsize) then
					out = out..'|'..imgsize
			end
			if has_content(capargval) then
				out = out .. '|'..capargval
			end
			out = out .. ']]'
			return '<div class="infobox-image">'..out..out2..'</div>'
		end
	end
	if has_content(invargs.default) then
		return '<div class="infobox-image infobox-image-default">'..(invargs.default or '')..'</div>'
	end
	return ''
end

return p
