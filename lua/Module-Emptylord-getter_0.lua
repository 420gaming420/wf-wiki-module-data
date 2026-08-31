-- <pre>
local p    = {}
local data      = require('Module:Emptylord/data')

--Warframe
function p.getWarframeData(warframe)
    return data[warframe] or {}
end

function p.equip_type(warframe)
    return getAbilityData(warframe).equip_type or "Warframe"
end

function p.equip_avail(warframe)
    return getAbilityData(warframe).equip_avail or "Official"
end

--Ability
function p.getAbilityData(warframe, ability)
    return data[warframe] and data[warframe].abilities[ability] or {}
end

function p.disp_name(warframe, ability)
    return getAbilityData(warframe, ability).disp_name or false
end

function p.hotkey(warframe, ability)
    return getAbilityData(warframe, ability).hotkey or false
end

--Augment
function p.getAugmentData(warframe, ability, augment)
    return data[warframe] and data[warframe].abilities[ability] and data[warframe].abilities[ability].augments[augment] or {}
end

function p.mod_image(warframe, ability, augment)
    return getAugmentData(warframe, ability, augment).mod_image or "BlankMod.png"
end

function p.mod_avail(warframe, ability, augment)
    return getAugmentData(warframe, ability, augment).mod_avail or "Custom"
end

function p.mod_desc(warframe, ability, augment)
    return getAugmentData(warframe, ability, augment).mod_desc or false
end

function p.volume(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).volume or false
end

function p.revised(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).revised or false
end

function p.polarity(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).polarity or "Zenurik"
end

function p.drain(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).drain or "6 / 7 / 8 / 9"
end

function p.credit(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).credit or false
end

function p.aura(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).aura or false
end

function p.coop(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).coop or false
end

function p.exilus(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).exilus or false
end

function p.posture(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).posture or false
end

function p.set(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).set or false
end

function p.stance(warframe, ability, augment)
	return getAugmentData(warframe, ability, augment).stance or false
end

return p
-- </pre>
