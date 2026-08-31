local delay = require[[Module:Delay]]
-- run this module now and give me the return value in m:
local m = require[[Module:XYZ]] 
-- when i index m, run the module and give me the corresponding value from its return:
local m = delay.require[[Module:XYZ]] 
-- when i do anything with m, replace the value of m with the module's return value:
local m;m = delay.require_([[Module:XYZ]],function(t)m=t;end)
