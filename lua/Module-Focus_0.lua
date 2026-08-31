--- '''Focus''' contains all the data on [[Focus]] trees.<br />
--  
--  On this Wiki, Focus is used in:
--  * [[Focus]] and its subpages
--	* [[Template:FocusModular]]
--  
--  @module	 focus
--  @alias	  p
--  @author	 [[User:Flaicher|Flaicher]]
--  @image	  FocusLensFocus b.png
--  @require	[[Module:Focus/data]]
--	@require	[[Module:String]]
--  @release	stable
--  

local p = {}

local FocusData = mw.loadData('Module:Focus/data')
local String = require('Module:String')

function p.getValueRaw(frame)
	local FocusName = frame.args[1]
	local ValName = frame.args[2]
	return FocusData["Ways"][FocusName][ValName]
end

function p.getValue(frame)
	local FocusName = frame.args[1] or error('p.getValue(frame): No focus way specified')
	local ValName = frame.args[2] or error('p.getValue(frame): No value specified')
	
	FocusName = String.trim(FocusName)
	ValName = String.trim(ValName)
	
	local Focus = FocusData["Ways"][FocusName] or error('p.getValue(frame): "'..FocusName..'" not found in [[Module:Focus/data]]')
	
	local UpName = string.upper(ValName)
	if(UpName == "NAME") then
		return FocusName
	elseif(UpName == "IMAGE") then
		if(Focus.Image ~= nil) then
			return Focus.Image
		else
			return "FocusLensFocus_b.png"
		end
	elseif(UpName == "DESCRIPTION") then
		if(Focus.Description ~= nil) then
			return Focus.Description
		else
			return "nil"
		end
	elseif(UpName == "SCHOOL") then
		if(Focus.School ~= nil) then
			return Focus.School
		else
			return "nil"
		end
	elseif(UpName == "TYPE") then
		if(Focus.Type ~= nil) then
			return Focus.Type
		end
	elseif(UpName == "UNLOCK") then
		if(Focus.Unlock ~= nil) then
			return Focus.Unlock
		else
			return "Unknown"
		end
	elseif(UpName == "RANKUP") then
		if(Focus.Rankup ~= nil) then
			return Focus.Rankup
		end
	elseif(UpName == "POOL") then
		if(Focus.Pool ~= nil) then
			return Focus.Pool
		end
	else
		return FocusData["Ways"][FocusName][ValName]
	end
end

return p
