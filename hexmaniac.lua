--Hex Maniac by LavenderTheGreat, feel free to remove this for compression purposes.
local func = {}

local split = function (str, start, stop) 
    return tonumber(string.sub(str, start, stop), 16)
end

local convert = function (num)
    if love._version_major < 11 then
        return num
    else
        return (1/255)*num
    end
end

local apply = function (str, start, stop)
    return convert(split(str, start, stop))
end

func.rgb = function (stringToLove)
    local color = {}
    for i=1, 5, 2 do
        table.insert(color, apply(stringToLove, i, i+1))
    end
    return color
end

func.rgbo = function (stringToLove, opacity)
    local color = func.rgb(stringToLove)
    table.insert(color, opacity)
    return color
end

func.rgba = function (stringToLove)
    return func.rgbo(string.sub(stringToLove, 1, 6), apply(stringToLove, 7, 8))
end

return func