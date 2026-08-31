local userError = require('Dev:User error');
local notEnoughArgs = userError('Not enough input arguments | $1');

return {
	_Item = {
		options = {
			mode = 'invocation',
		},
		tests = {
			{ 'Orokin Catalyst', '[[File:OrokinCatalyst64.png|x26|link=Orokin Catalyst]]' },
		},
	},
};
