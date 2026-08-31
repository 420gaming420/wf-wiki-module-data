var url = new URL('https://wiki.warframe.com/api.php?');
var searchParams = new URLSearchParams({
	action: 'scribunto-console',
	format: 'json',
	title: 'Module:Weapons',
	// Alternatively, run "return require('Module:LuaSerializer')._serialize('Weapons/data')"
	// If you want to convert Lua tables to native JSON, run "return require('Module:JSON').stringify(require('Module:Weapons/data'))"
	content: "return require('Module:Weapons/data')",
	question: '=p',
	clear: 1
});
fetch(url + searchParams)
	.then(data => data.json())
	.then(json => console.log(json.return));
