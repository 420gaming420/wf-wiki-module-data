// Saves a file to local machine
var saveData = (function() {
	// Creating a temporary DOM element so we can 'click' on an element to download the file.
	// For obvious security reasons, JS running in browser environment does not have direct access to read/writes
	// to local storage. Browser is sandboxed to prevent arbitrary scripts causing damage to clients.
	var a = document.createElement("a");
	// document.body.appendChild(a);
	// a.style = "display: none";
	return function (data, fileName) {
		var json = JSON.stringify(data);
		// Unescaping escape characters
		json = json.replace(/\\n/gm, "\n").replace(/\\t/gm, "\t").replace(/\\"/gm, "\"")
		blob = new Blob([json], {type: "octet/stream"});
		blob = blob.slice(1, blob.size - 1); // Removing first and last quotation mark that designate json as a string
		url = window.URL.createObjectURL(blob);

		a.href = url;
		a.download = fileName;
		a.click();
		window.URL.revokeObjectURL(url);
	};
}() );

// Uses fetch API to interface with MediaWiki's Action API to get gun weapon data
// from the wiki's Module:Weapons/data subpages in a CSV format
function fetchGunData(slot) {
	let origin = "https://wiki.warframe.com";
	let path = "/api.php";
	let params = {
		action: "scribunto-console",
		format: "json",
		title: "Module:Weapons/csv",
		content: "",
		question: `
	local CSV = require('Module:Weapons/csv')
	print(CSV._csvGunComparisonTable('${slot}'))`,
		clear: 1
	};

	// [ ["action", "scribunto-console"], ["format","json"], ... ] to "action=scribunto-console&format=json&..."
	let queryString = new URLSearchParams([ ...Object.entries(params) ]).toString();

	let url = new URL(`${origin}${path}?${queryString}`);

	fetch(url)
		.then((data) => data.json())
		.then((json) => {
			if (json.print !== undefined) {
				saveData(json.print, `${slot} Weapon Comparison.csv`);
			} else {
				throw json.html;	// Lua script error has occured
			}
		})
		.catch((error) => console.log(error));
}

let weaponSlots = ['Primary', 'Secondary', 'Robotic', 'Arch-Gun', 'Arch-Gun (Atmosphere)', 'Amp'];
// Making multiple fetch calls for each primary weapon slot b/c of performance limitations with Lua scripts
weaponSlots.forEach((slot) => fetchGunData(slot));
