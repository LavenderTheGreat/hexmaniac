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

func.rgb = function (stringToLove)
    local color = {}
    for i=1, 5, 2 do
        table.insert(color, convert(split(stringToLove, i)))
    end
    return color
end

func.rgbo = function (stringToLove, opacity)
    local color = func.rgb(stringToLove)
    table.insert(color, opacity)
    return color
end

func.rgba = function (stringToLove)
    return func.rgbo(string.sub(stringToLove, 1, 6), convert(split(stringToLove, 7, 8)))
end

func = setmetatable(func, {
    __call = function (f, code, opacity)
        -- If there is no opacity given, then expect form of AABBCC or AABBCCDD
        if opacity == nil then
            length = string.len(code)
            -- RRGGBB
            if length == 6 then 
                return func.rgb(code)
            -- RRGGBBAA
            elseif length == 8 then
                return func.rgba(code)
            else
                love.errorhandler("invalid argument")
            end
        end
        return func.rgbo(code, opacity)
    end
})

return func