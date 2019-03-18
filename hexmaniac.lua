--Hex Maniac by LavenderTheGreat, feel free to remove this for compression purposes.
local func = {}

function func.rgb(stringtolove)
	return {
        (1/255)*tonumber(string.sub(stringtolove, 1, 2),16),
        (1/255)*tonumber(string.sub(stringtolove, 3, 4),16),
        (1/255)*tonumber(string.sub(stringtolove, 5, 6),16)
    }
end

function func.rgba(stringtolove)
    return {
        (1/255)*tonumber(string.sub(stringtolove, 1, 2),16),
        (1/255)*tonumber(string.sub(stringtolove, 3, 4),16),
        (1/255)*tonumber(string.sub(stringtolove, 5, 6),16),
        (1/255)*tonumber(string.sub(stringtolove, 7, 8),16)
    }
end

function func.rgbo(stringtolove, opacity)
	return {
        (1/255)*tonumber(string.sub(stringtolove, 1, 2),16),
        (1/255)*tonumber(string.sub(stringtolove, 3, 4),16),
        (1/255)*tonumber(string.sub(stringtolove, 5, 6),16),
        opacity
    }
end

return func