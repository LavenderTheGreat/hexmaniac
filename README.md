![Hex Maniac: Colours for (in)sane people](https://i.imgur.com/WRgfria.png)
# Features
- Convert from hex colours in three formats (RGB, RGBA and RGB with an 0-1 opacity value).
- Under 1KB.
- Under the unlicense, allowing you to do anything with the code.
- Has 4 versions, one for each version of Love's colour formatting, plus another for each that is even smaller.

# Usage
```lua
local hex = require("hexmaniac") --Require the library

function love.draw()
  love.graphics.setColor(hex.rgb('4f5268')) --Set to colour #4f5268
  love.graphics.rectangle('fill', 0, 0, 50, 50)
  love.graphics.setColor(hex.rgbo('4f5268', 0.9)) --Set to colour #4f5268 with an opacity of 0.9
  love.graphics.rectangle('fill', 0, 50, 50, 50)
  love.graphics.setColor(hex.rgba('4f526899')) --Set to colour #4f526899
  love.graphics.rectangle('fill', 0, 100, 50, 50)
end```
