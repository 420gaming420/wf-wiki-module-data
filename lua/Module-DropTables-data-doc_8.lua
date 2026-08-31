let origin = "https://wiki.warframe.com";
// MediaWiki's Action API endpoint
let path = "/api.php";
// Passing Lua code to Action API to convert Lua tables containing drop table data into JSON
let params = {
	action: "scribunto-console",
	format: "json",
	title: "Module:DropTables/data",
	content: "",
	question: `
local DropData = require('Module:DropTables/data').Rewards
local json = require('Module:JSON')
print(json.stringify(DropData))`,
	clear: 1
};

// [ ["action", "scribunto-console"], ["format","json"], ... ] to "action=scribunto-console&format=json&..."
let queryString = new URLSearchParams([ ...Object.entries(params) ]).toString();

let url = new URL(`${origin}${path}?${queryString}`);

fetch(url)
	.then((data) => data.json())
	.then((json) => {
		if (json.print !== undefined) {
			console.log(JSON.parse(json.print));
		} else {
			throw json.html;	// Lua script error has occurred
		}
	})
	.catch((error) => console.log(error));
