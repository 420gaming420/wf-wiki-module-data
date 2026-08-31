---	'''M:Delay'''
--	For delaying the actual requirement of a module until it is needed
--	
--	@module			delay
--	@alias			p
--	@author			[[User:gigamicro|gigamicro]]
--	@image			Panel.png
--	@release		stable
--	

local p = {}

--	Delays the require()ment of a module until it is indexed
--	@function       p.require
--	@param          {string} module The module to require
--	@param          {booleaan} data use mw.loadData?
--	@param          {function} setfunc Upvalue setter
--	@return         {table} module equivalent
function p.require(module, data, setfunc)
	if type(setfunc)=='function' then
		-- note double metatable
		return setmetatable({},setmetatable({},{__index=function(self,index)
			local m = (data and mw.loadData or require)(module)
			setfunc(m)
			return getmetatable(m)[index]
		end}))
	elseif setfunc then
		error('p.require(module, data, setfunc): setfunc must be a function '..
			'of the type <co'..'de>local Table; Table = delay.require_(\'Module:Table\',function(t) Table=t end)</code>')
	end
	return setmetatable({},{
		__index=function(self, index)
			getmetatable(self).__index=(data and mw.loadData or require)(module)
			return self[index]
		end,
		__pairs=function(self)
			local _=self[nil]
			return pairs(getmetatable(self).__index)
		end,
		__ipairs=function(self)
			local _=self[nil]
			return ipairs(getmetatable(self).__index)
		end,
		__call=function(self, ...)
			local _=self[nil]
			return getmetatable(self).__index(self, ...)
		end,
	})
end

p.mw=p
--- Delays the load of a data module until it is indexed
--	@function       p.loadData
--	@param          {string} module The module to load
--	@return         {table} loadData module
function p.mw.loadData(module)
	return p.require(module, true)
end

return p
