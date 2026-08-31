local rep = setmetatable({
	['VANILLA']='U0',
	['WEAPON BALANCE']='U7.2.1',['WB']='U7.2.1',
	['LUNARO']='18.15',
	['SPECTERS OF THE RAIL']='18.16',['SOTR']='18.16',
	['THE SILVER GROVE']='18.17',['SILGRO']='18.17',['TSG']='18.17',
	['THE VACUUM WITHIN']='18.18',['TVW']='18.18',
	['THE INDEX PREVIEW']='18.19',['INDEX PREVIEW']='18.19',['TIP']='18.19',
	['RECURRING NIGHTMARES']='18.20',['RN']='18.20',
	['RECURRING DREAMS']='18.21',['RD']='18.21',
},{__index=function(self,index)return rawget(self,index) or (rawget(self,index:sub(1,-2)) or error('No number found for '..index))..'.' end})
return {['']=function(frame)
	local t={(frame.args and frame.args[1] or frame):upper():gsub('^%a[A-Z ]+ ?',rep):match '([UH]?)((%d+)[0-9.]*)'}--H 1.2.3 1
	t[2]=t[2]:gsub('^(%d+%.%d+)%.[0.]+$','%1')
	t[1]=({U='Update',H='Hotfix'})[t[1]~='' and t[1] or t[2]:find'%.%d+%.' and 'H' or 'U']
	return ('[[Update %d#%s %s|%s %s]]'):format(t[3],t[1],t[2],t[1],t[2])
end}
