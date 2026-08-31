local data = {}

local slots = {
	{'primary', 'secondary', 'melee', 'archwing', 'companion', 'railjack', 'modular', 'misc'},

	primary = 'primary',
	secondary = 'secondary',
	melee = 'melee',

	archwing = 'archwing',
	['arch-gun'] = 'archwing',
	['arch-melee'] = 'archwing',

	companion = 'companion',
	['robotic'] = 'companion',
	['hound'] = 'companion',

	railjack = 'railjack',
	['railjack turret'] = 'railjack',
	['railjack ordanance'] = 'railjack',

	modular = 'modular',
	['amp'] = 'modular',
	['kitgun'] = 'modular',
	['zaw'] = 'modular',

	misc = 'misc',
	['emplacement'] = 'misc',
	['gear'] = 'misc',
	['nech-melee'] = 'misc',
	['unique'] = 'misc',
	['vehicle'] = 'misc',
}

setmetatable(data, {
	__pairs = function(table)
		local temp = {}
		for i, slot in ipairs(slots[1]) do
			temp[i] = mw.loadData('Module:Weapons/data/'.. slot)
		end

		function next(t, key)
			return pairs(t)(t, key)
		end

		function __next(t, key)
			if not key then
				return next(t[1])
			else
				for i = 1, #t - 1 do
					if t[i][key] then
						if next(t[i], key) then
							return next(t[i], key)
						else
							return next(t[i + 1])
						end
					end
				end
				return next(t[#t], key)
			end
		end

		return __next, temp, nil
	end,
	__index = function(table, key)
		if key and slots[key:lower()] then return mw.loadData('Module:Weapons/data/'.. slots[key:lower()]) end

		local weapon
		for _, slot in ipairs(slots[1]) do
			weapon = mw.loadData('Module:Weapons/data/'.. slot)[key]
			if weapon then return weapon end
		end
	end
})

return data
