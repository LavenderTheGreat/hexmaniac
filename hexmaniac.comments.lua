--Hex Maniac by LavenderTheGreat, feel free to remove this for compression purposes.
local func = {}

-- Function: split
-- Usage: Gets two characters from the string and returns the base 10 version
-- Parameters:
--              [1] (string) str: String to split
--              [2] (number) start: Where in the string to get the characters from
-- Return: (number): The Base 10 version of the number
local split = function (str, start) 
    return tonumber(string.sub(str, start, start+1), 16)
end

-- Function: convert
-- Usage: Returns the number in a form usable by the version of LOVE it is being ran in
-- Parameters:
--              [1] (number) num: The number to convert
-- Return: (number): The number in 0-255 form if the LOVE version is older than 11, otherwise in 0-1 form
local convert = function (num)
    if love._version_major < 11 then
        return num
    else
        return (1/255)*num
    end
end

-- Function: clamp
-- Usage: Clamps a number between a minimum and a maximum
-- Parameters:
--              [1] (number) num: number to clamp
--              [2] (number) low: the lower end of the clamp
--              [3] (number) high: the higher end of the clamp
-- Return (number): the number after clamping
local clamp = function (num, low, high)
    return math.min(math.max(low, num), high)
end

-- Function: func.rgb
-- Usage: Converts Hex RGB color codes to a table usable by LOVE
-- Parameters:
--              [1] (string) stringToLove: the hex color code
-- Return: (table): a table of values usable by LOVE
func.rgb = function (stringToLove)
    local color = {}
    for i=1, 5, 2 do
        table.insert(color, convert(split(stringToLove, i)))
    end
    return color
end

-- Function: func.rgbo
-- Usage: Converts Hex RGB color codes and opacity value to a table usable by LOVE,
-- Parameters:
--              [1] (string) stringToLove: the hex color code
--              [2] (number) opacity: opacity value
-- Return: (table): a table of values usable by LOVE
func.rgbo = function (stringToLove, opacity)
    local color = func.rgb(stringToLove)
    table.insert(color, clamp(opacity, 0, 1))
    return color
end

-- Function: func.rgbq
-- Usage: Converts Hex RGBA color codes to a table usable by LOVE
-- Parameters:
--              [1] (string) stringToLove: the hex color code
-- Return: (table): a table of values usable by LOVE
func.rgba = function (stringToLove)
    local color = func.rgb(string.sub(stringToLove, 1, 6))
    table.insert(color, convert(split(stringToLove, 7)))
    return color
end

-- Function: func
-- Usage: Simple interface for library
-- Parameters:
--              [1] (string) code: the hex color code
--              [2] (number) opacity: optional
-- Return: (table): a table of values usable by LOVE
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
                error("invalid argument")
            end
        end

        return func.rgbo(code, opacity)
    end
})
return func