return {
	rep = function(frame) 
		return (frame.args[1]:gsub('%[%[Category:','[[:Category:'))
	end,
	rem = function(frame)
		return (frame.args[1]:gsub('%[%[Category:.-]]',''))
	end
}
