---
title: "Module:Switch Infobox"
wiki_url: "https://wiki.warframe.com/w/Module/Switch Infobox"
wiki_timestamp: "2015-12-30T11:27:58Z"
---

*Documentation for this module may be created at [Module:Switch Infobox/doc](/w/Module:Switch_Infobox/doc?action=edit&redlink=1 "Module:Switch Infobox/doc (page does not exist)")*

```lua
local p = {}

function p.main(frame)
	local args = frame:getParent().args
	local contents = {}

	local i = 1
	while args['item'..i] do
		table.insert(contents, { text = args['text'..i] or ('Item '..i),
					content = args['item'..i] })
		i = i + 1
	end

	local ret = mw.html.create('div')
			:addClass('switch-infobox')
			:addClass('loading')
			:tag('span')
				:addClass('loading-button')
				:addClass('button')
				:wikitext('Loading...')
			:done()
	local mah_triggers = ret:tag('div')
				:addClass('switch-infobox-triggers')

	for i, v in ipairs(contents) do
		mah_triggers	:tag('span')
					:addClass('trigger')
					:addClass('button')
					:attr('data-id',i)
					:wikitext(v.text)
				:done()

		ret	:tag('div')
				:addClass('item')
				:addClass(i==1 and 'showing' or '')
				:attr('data-id',i)
				:wikitext(v.content)
			:done()
	end

	return frame:preprocess(tostring(ret))
end

return p
```

