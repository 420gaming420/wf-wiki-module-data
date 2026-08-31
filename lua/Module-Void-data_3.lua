let origin = "https://wiki.warframe.com";
let path = "/api.php";
let params = {
	action: "scribunto-console",
	format: "json",
	title: "Module:Void/data",
	content: "",
	question: `
local VoidData = require('Module:Void/data').PrimeData
local json = require('Module:JSON')
print(json.stringify(VoidData))`,
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
			throw json.html;	// Lua script error has occured
		}
	})
	.catch((error) => console.log(error));
