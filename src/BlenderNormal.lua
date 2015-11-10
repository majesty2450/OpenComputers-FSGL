-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Blender = require("FSGL/Blender")
local Color = require("FSGL/Color")

--------------------------------------------------------------------------
-- @module  BlenderNormal
--          
-- @desc    Combines two Colors normally.
--
-- @summary Alpha blended...
-- @link https://en.wikipedia.org/wiki/Alpha_compositing
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local BlenderNormal = Blender:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a BlenderNormal.
-- 
-- @param   self    Table to perform operations on.
--------------------------------------------------------------------------
function BlenderNormal:__init ()
    Blender.__init(self)
end

function BlenderNormal:blend (src, dest)
    local output = Color:new(1, 0, 0, 0)
    
    output:setAlpha(src:getAlpha() + dest:getAlpha() * (1 - src:getAlpha()))

    if output:getAlpha() == 0 then
        output:setRGB(0)
    else
        output:setRed(src:getRed() * src:getAlpha() + dest:getRed() * 
            dest:getAlpha() * (1 - src:getAlpha()) / output:getAlpha())
        output:setGreen(src:getGreen() * src:getAlpha() + dest:getGreen() * 
            dest:getAlpha() * (1 - src:getAlpha()) / output:getAlpha())
        output:setBlue(src:getBlue() * src:getAlpha() + dest:getBlue() * 
            dest:getAlpha() * (1 - src:getAlpha()) / output:getAlpha())
    end

    return output
end


return BlenderNormal
