-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local bit32 = require("bit32")
local Class = require("soul/Class")

--------------------------------------------------------------------------
-- @module  Color
--          
-- @desc    Provides Color objects.
--
-- @summary Stores RGB and Alpha components.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local Color = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes an Color color.
-- 
-- @param   self    Table to perform operations on.
-- @param   rgb     RGB hex value.
-- @param   alpha   Alpha component.
--------------------------------------------------------------------------
function Color:__init (alpha, red, green, blue)
    Class.__init(self)

    alpha = alpha or 1
    red = red or 0
    green = green or 0
    blue = blue or 0
    
    self.argb = 0xFFFFFFFF
    self:setAlpha(alpha)
    self:setRed(red)
    self:setGreen(green)
    self:setBlue(blue)
end

function Color:setRGB (rgb)
    self.argb = bit32.replace(self.argb, rgb, 0)
end

function Color:getRGB ()
    return bit32.extract(self.argb, 0, 24)
end

function Color:setAlpha (alpha)
    self.argb = bit32.replace(self.argb, 0xFF * alpha, 24, 8)
end

function Color:getAlpha ()
    return bit32.extract(self.argb, 24, 8) / 0xFF
end

function Color:setRed (red)
    self.argb = bit32.replace(self.argb, red, 16, 8)
end

function Color:getRed ()
    return bit32.extract(self.argb, 16, 8)
end

function Color:setGreen (green)
    self.argb = bit32.replace(self.argb, green, 8, 8)
end

function Color:getGreen ()
    return bit32.extract(self.argb, 8, 8)
end

function Color:setBlue (blue)
    self.argb = bit32.replace(self.argb, blue, 0, 8)
end

function Color:getBlue ()
    return bit32.extract(self.argb, 0, 8)
end


return Color
