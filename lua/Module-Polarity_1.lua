---	'''Polarity''' maps [[WARFRAME]]'s [[polarity]] names to their appropriate image on the wiki.<br />
--	
--	This module is meant to be used in other modules.<br />
--	
--	On this Wiki, Polarity is used in:
--	* [[Module:Tooltips]]
--	* [[Module:Weapons]]
--	* [[Template:Pol]]
--	* [[Template:TableWarframePol]]
--	
--	@module		polarity
--	@alias		p
--	@author		[[User:Gigamicro|Gigamicro]]
--	@attribution		[[User:Cephalon Scientia|User:Cephalon Scientia]]
--	@image		Madurai Pol.svg
--	@release	stable
--	

local p = {}

-- Mapping official polarity names to image files
p.IMAGE_MAP = {
	-- Black polarity icons
	Zenurik = 'Zenurik_Pol.svg',
	Naramon = 'Naramon_Pol.svg',
	Vazarin = 'Vazarin_Pol.svg',
	Penjaga = 'Penjaga_Pol.svg',
	Exilus = 'Exilus_Pol.svg',
	Madurai = 'Madurai_Pol.svg',
	Koneksi = 'Koneksi_Pol.svg',
	Umbra = 'Umbra_Pol.svg',
	Unairu = 'Unairu_Pol.svg',
	Any = 'Any_Pol.svg',
	Universal = 'Spacer.png',
}

-- Mapping nicknames/internal names to official names
p.POLARITY_NICKNAME_MAP = {
	Ability = 'Zenurik', AP_POWER = 'Zenurik',
	Bar = 'Naramon', AP_TACTIC = 'Naramon',
	D = 'Vazarin', AP_DEFENSE = 'Vazarin',
	Y = 'Penjaga', Sila = 'Penjaga', Sentinel = 'Penjaga', Precept = 'Penjaga', AP_PRECEPT = 'Penjaga',
	V = 'Madurai', AP_ATTACK = 'Madurai',
	O = 'Koneksi', Core = 'Koneksi', Fusion = 'Koneksi', Pengetikan = 'Koneksi', AP_FUSION = 'Koneksi',
	U = 'Umbra', Q = 'Umbra', AP_UMBRA = 'Umbra',
	Ward = 'Unairu', R = 'Unairu', AP_WARD = 'Unairu',
	Aura = 'Any', AP_ANY = 'Any',
	None = 'Universal', [''] = 'Universal', AP_UNIVERSAL = 'Universal'
}

---	Returns the image file wikitext link of the corresponding polarity.
--	@function		p._polarity
--	@param			{string} pol Polarity name, could be shorthand/nickname or official name
--	@param			{boolean} lightIconOnly If true, black polarity icon will always be inverted regardless of theme, otherwise
--							  icon will only be inverted on dark theme
--	@return			{string} Wikitext link of image of polarity
function p._polarity(pol, lightIconOnly)
	return string.format('[[File:%s|20px|class=icon '..(lightIconOnly and 'invert' or 'dark-invert')..']]', 
		p.IMAGE_MAP[p.POLARITY_NICKNAME_MAP[pol] or pol] or error('p._polarity(pol): Could not find polarity: '..mw.dumpObject(pol)))
end

---	Returns multiple image file wikitext links of the corresponding polarities.
--	@function		p._pols
--	@param			{table} pols Array of polarity names
--	@param			{boolean} lightIconOnly If true, black polarity icon will always be inverted regardless of theme, otherwise
--							  icon will only be inverted on dark theme
--	@return			{string} Wikitext links of images of polarities
function p._pols(pols, lightIconOnly)
	if not (pols and pols[1]) then return 'None' end
	local polarities = {}
	for i, v in ipairs(pols or {'None'}) do
		polarities[i] = p._polarity(v, lightIconOnly)
	end
	return table.concat(polarities)
end

---	Returns the image file wikitext link of the corresponding polarity.
--	@function		p.getPolarityImage
--	@param			{table} frame Frame object
--	@return			{string} Wikitext link of image of polarity
function p.getPolarityImage(frame)
	return p._polarity(frame.args[1] or frame.args or frame)
end

return p
