--- '''Shared''' contains useful utilities, including extensions of STL libraries.<br />
--  
--  On this Wiki, Shared is used in:
--  * [[Module:VoidByReward]]
--  
--  @module     shared
--  @alias      p
--  @author     [[User:FINNER|FINNER]]
--  @author     [[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution    [[User:Falterfire|Falterfire]]
--  @attribution    [[User:Cephalon Scientia|Cephalon Scientia]]
--  @attribution    [[User:FINNER|FINNER]]
--  @attribution    [[User:Gigamicro|Gigamicro]]
--  @attribution    [[User:NoBrainz|NoBrainz]]
--  @image      
--  @require    [[w:c:dev:Module:Arguments|Module:Arguments]]
--  @release    unmaintained
--  
local p = {}

--  Module Dependencies  -------------------------------------------------------
local Args --= require('Dev:Arguments');-- defined later

--- For getting frame or parent arguments.
--  @function       p.getArgs
--  @param          {table} frame The input arguments
--  @param          {table} options Options for getting the args
--  @return         {table} The arguments
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
                str = '('..math.replace(v)..')';
                if options.eval then tempArgs[i] = tonumber(math.eval(str));
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

--upk by [[User:gigamicro]], serializes any object (table) to a string
do
    local conversion = {
        string=function(v) 
            v = v:gsub('\n','\\n'):gsub('%c',function(s) return '\\'..s:byte() end)
            if not v:match"'" then 
                return "'"..v.."'" 
            elseif not v:match '"' then 
                return '"'..v..'"' 
            else 
                local n=0; while v:match(']'..(('='):rep(n))..']') do n=n+1 end; local s = (('='):rep(n)); return table.concat{'[',s,'[',v,']',s,']'}
            end
            end,
        boolean=function(v) return v and 'true' or 'false' end,
        number=function(v) return tostring(v) end,
        table=function(v, linedepth)
            local str = {'{'}
            local index = 1
            if linedepth and linedepth > 0 then table.insert(str, '\n') end
            for k,val in pairs(v) do 
                --print (k, '(', type(val), ')')
                if k==index then index=index+1 else table.insert(str, '['..p.upk(k)..'] = ') end
                if v ~= val and k~='_G' and k~='loaded' then
                    table.insert(str, p.upk(val, linedepth and linedepth>0 and linedepth-1))
                else
                    table.insert(str, '<repeat>')
                end --print (k,'=',str[#str])
                table.insert(str, ', ')
                if linedepth and linedepth>0 then table.insert(str, '\n') end
            end
            table.insert(str,'}')
            --if print then print (table.concat(str)) end
            return table.concat(str)
            end,
        ['function'] = function() return '<function>' end,--function()end' end,
        ['nil']      = function() return 'nil' end,
        userdata     = function() return '<userdata>' end,
        thread       = function() return '<thread>' end,
    }

--- Reversable table-to-string conversion
--  @function       p.upk
--  @author         Gigamicro
--  @param          {any} v
--  @return         {string}
    function p.upk(v, linedepth) return conversion[type(v)](v,linedepth) end
    --(conversion[type(v)..'e'] or function(v,ld) error(type(v)..' is not a recognized type') end)(v, linedepth or 0) end
end--upk

--  @function       p.Cache
--  @author         Gigamicro
--  @param          {string} s
--  @return         {string}
function p.Cache(frame) return p.upk(require(frame.args[1])[frame.args[2]][frame.args[3]]) end

--- A replacement <code>assert</code> for blaming other places in the call stack
--  @function       p.assert
--  @author         Gigamicro
--  @param          {bool} cond The condition under which to not throw the error, passes through
--  @param          {string} message The error message
--  @param          {int} layer The layer whose fault the error is, 1 being the line calling this function
--  @return         {any} cond
function p.assert(cond, message, layer)
	return cond or error(message, (layer or 1) + 1)
end

--- An alternative <code>assert</code> for checking the type of parameters
--  @function       p.assertType
--  @author         Gigamicro
--  @param          {any} cond The value to be tested, passes through
--  @param          {string} tipe The type the condition will be tested for
--  @param          {string} message The error message, defaults to a generic "Improper value"
--  @return         {any} cond
function p.assertType(cond, tipe, message)
	return type(cond)~=tipe and error(message or 'Improper value: expected '..tipe..', got '..type(cond)..' ('..p.upk(cond)..')', 2) or cond
end

--- Delays the require()ment of a module until it is indexed (call to return main table)
--  @function       p.delayRequire
--  @author         Gigamicro
--  @param          {string} mdule The module to require
--  @param[opt]     {boolean} data Whether to use mw.loadData
--  @return         {any} cond
function p.delayRequire(module, data)
	return setmetatable({},{
		__call=function(self)
			local loaded = (data and mw.loadData or require)(module)
			setmetatable(self,{
				__call=function(self)
					--the require()d module's __call event can be triggered by s.dR'm:w/e'()()
					return getmetatable(self).__index
				end,
				__index=loaded,
			})
			return loaded
		end,
		__index=function(self, index)
			return self()[index]
		end,
	})
end
function p.delayLoadData(module)
	return p.delayRequire(module, true)
end

Args=p.delayRequire[[Dev:Arguments]]

return p
