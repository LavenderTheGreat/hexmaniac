--Hex Maniac by LavenderTheGreat, feel free to remove this for compression purposes.
local f={}
function f.rgb(s)
	return {
        (1/255)*tonumber(string.sub(s, 1, 2),16),
        (1/255)*tonumber(string.sub(s, 3, 4),16),
        (1/255)*tonumber(string.sub(s, 5, 6),16)
    }
end
function f.rgba(s)
    return {
        (1/255)*tonumber(string.sub(s, 1, 2),16),
        (1/255)*tonumber(string.sub(s, 3, 4),16),
        (1/255)*tonumber(string.sub(s, 5, 6),16),
        (1/255)*tonumber(string.sub(s, 7, 8),16)
    }
end
function f.rgbo(s, opacity)
	return {
        (1/255)*tonumber(string.sub(s, 1, 2),16),
        (1/255)*tonumber(string.sub(s, 3, 4),16),
        (1/255)*tonumber(string.sub(s, 5, 6),16),
        opacity
    }
end
return func