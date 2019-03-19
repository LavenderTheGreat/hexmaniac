--Hex Maniac by LavenderTheGreat, feel free to remove this for compression purposes.
local func = {}

local split = function (str, start) 
    return tonumber(string.sub(str, start, start+1), 16)
end

local convert = function (num)
    if love._version_major < 11 then
        return num
    else
        return (1/255)*num
    end
end

local clamp = function (num, low, high)
    return math.min(math.max(low, num), high)
end

func.rgb = function (stringToLove)
    local color = {}
    for i=1, 5, 2 do
        table.insert(color, convert(split(stringToLove, i)))
    end
    return color
end

func.rgbo = function (stringToLove, opacity)
    local color = func.rgb(stringToLove)
    table.insert(color, clamp(opacity, 0, 1))
    return color
end

func.rgba = function (stringToLove)
    local color = func.rgb(string.sub(stringToLove, 1, 6))
    table.insert(color, convert(split(stringToLove, 7)))
    return color
end

func = setmetatable(func, {
    __call = function (f, code, opacity)
        if opacity == nil then
            length = string.len(code)
            if length == 6 then 
                return func.rgb(code)
            elseif length == 8 then
                return func.rgba(code)
            else
                error("invalid argument")
            end
        end
        return func.rgbo(code, opacity)
    end
})

return func