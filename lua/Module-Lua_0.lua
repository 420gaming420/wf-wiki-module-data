--- '''Lua''' is for calling lua functions, that do not fit specifically in other modules, on articles.<br />
--	
--	On this Wiki, Lua is used in:
--	
--	@module	 lua
--	@alias		p
--	@author			[[User:Flaicher|Flaicher]]
--	@attribution	[[User:Gigamicro|Gigamicro]]
--	@image		
--	@require	[[Module:Math]]
--	@require	[[Module:Arguments]]
--	@release	stable
--	

local p = {}

local Math = require('Module:Math')
local Args = require('Module:Arguments');

--- For getting frame or parent arguments.
--	@function		p.getArgs
--	@param			{table} frame The input arguments
--	@param			{table} options Options for getting the args
--	@return			{table} The arguments
function p.getArgs(frame, options)
	if type(frame[1]) == 'table' and table.getn(frame) < 2 then frame = frame[1]; end
	if type(options) ~= 'table' then options = {options}; end
	
	local args = Args.getArgs(frame, options);
	local tempArgs = {};
	local str;
	if options.replace then
		for i, v in pairs(args) do
			if type(i) ~= 'number' or type(v) ~= 'string' then tempArgs[i] = v;
			else
				str = '('..Math.replace(v)..')';
				if options.eval then tempArgs[i] = tonumber(Math.eval(str));
				else tempArgs[i] = str; end
			end
		end
		args = tempArgs;
	end
	
	local j = 1;
	tempArgs = {};
	if options.noNil then
		for i, v in pairs(args) do
			if type(i) ~= 'number' then tempArgs[i] = v;
			elseif v then tempArgs[j] = v; j = j + 1; end
		end
		args = tempArgs;
	end
	
	return args;
end

--- Returns raw wikitext.
--	@function		 p.Raw
--	@param			{table} frame
--	@return		 {string} Unrendered wikitext
function p.Raw(frame)
	return frame:preprocess(table.concat{'',(frame.args[1] or ''),''})
end

--- Makes a tabber out of a list of pages.<br />
--	{{#invoke:lua|Tabber|a|b|c|sub=(putsomethingornothingheretolinktosubpages)|class=tabber-borderless}}
--	@function		p.Tabber
--	@param			{table} frame
--	@return			{string} Rendered wikitext of tabber elements
function p.Tabber(frame)
	local f = frame.args-- or frame
	local t = {'<div class="',f.class or '','"><tabber>'}
	for i,v in ipairs(f) do
		table.insert(t,'\n|-|'..--[[)
		table.insert(t,	--]]v..--[[)
		table.insert(t,	--]]'={{')
		if f.sub then table.insert(t,frame:getParent():getTitle()..'/') end
		table.insert(t,v..--[[)
		table.insert(t,	--]]'}}')
	end
	table.insert(t,'\n</tabber></div>')
	return frame:preprocess(table.concat(t))
end

--- Makes a tabber out of all subpages to a page.
--	@function		p.SubTabber
--	@param			{table} frame
--	@return			{string} Rendered wikitext of tabber elements
function p.SubTabber(frame)
	local subs = frame:getParent():preprocess '{{Special:PrefixIndex/{{FULLPAGENAME}}/}}'
	-- local t = {}
	-- for m in subs:gmatch '(.)' do
		-- table.insert(t,m)
	-- endtable.concat(t)
	return subs:gsub('\127','~!~')
end

--- Page Template:X = {{#invoke:lua|CALL|Module:<module>|<function>}}
--	Page Y transcludes Template:X: {{X|a|b|c}}
--	<module>.<function> is called with the frame/args given to Template:X
--	In other words, allows editors to pass arguments directly to a transcluded #invoke function
--	without defining template parameters on source template article.
--	@function		p.CALL
--	@param			{table} frame
--	@return			Return type depends on called function
function p.CALL(frame)
	return require(frame.args[1])[frame.args[2]](frame:getParent())
end

--- Returns serialized table of a module's contents
--	@function		p.dump
--	@param			{table} frame Frame object
--	@return			{string} Serialized table
function p.dump(frame)
	local data = mw.loadData(frame.args[1] or 
			error('p.dump(frame): Empty frame argument, must have at least one argument: the module name'))
	return mw.dumpObject(data)
end

return p
