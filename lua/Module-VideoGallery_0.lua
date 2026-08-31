local p = {}

function p.main(frame)
	local out = {
		'<div class="video-gallery-wrapper">'
	}
	for k,v in ipairs(frame:getParent().args) do
		if string.find(v, '%S') then
			table.insert(out, v)
		end
	end
	table.insert(out, '</div>')
	return table.concat(out, '\n')
end

return p
