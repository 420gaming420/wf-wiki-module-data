	["Ability Name"] = {
		ins = {
		    { name='Input Name', max='Input Max Value', cont='Content to place around the input (dictated by data-input-place)' },
		    'Input wikitext string',
		},
		outs = {
		    { 'Right column wikitext', { name='Output Name', expr='Output Formula', suff='Text placed after the output (e.g. units)' }},
		    { { expr='Output Formula', fmt='7sig' }, 'Left column wikitext' }
		},
		post = 'Any wikitext to insert after the calculator'
	},
