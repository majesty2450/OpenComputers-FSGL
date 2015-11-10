
local dev = require("libdev/dev")
dev.defaultPackages()

local Color = require("FSGL/Color")

local color = Color:new(0.5, 255, 0, 128)

print(0.5, 255, 0, 128)
print(color:getAlpha(), color:getRed(), color:getGreen(), color:getBlue())

print(0xFF0080)
print(color:getRGB())
