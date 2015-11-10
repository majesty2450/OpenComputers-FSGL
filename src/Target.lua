-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Class = require("soul/Class")
local Cell = require("FSGL/Cell")
local component = require("component")

--------------------------------------------------------------------------
-- @module  Target
--          
-- @desc    Defines a universal interface for drawing.
--
-- @summary Uses viewports for clipping.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
-- @todo    Finish documentation.
--------------------------------------------------------------------------
local Target = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a Target.
-- 
-- @param   self      Table to perform operations on.
-- @param   position  Vector2 position.
-- @param   size      Vector2 size.
--------------------------------------------------------------------------
function Target:__init ()
    if not component.gpu or not component.screen then
        error("gpu and screen required!")
    end

    Class.__init(self)
end

function Target:getMaxSize ()
    error("not implemented!")
end

function Target:getSize ()
    error("not implemented!")
end

function Target:setSize (width, height)
    error("not implemented!")
end

function Target:get (x, y)
    error("not implemented!")
end

function Target:set (x, y, cell)
    error("not implemented!")
end

function Target:getRect (x, y, width, height)
    local mosaic = Mosaic:new(width, height, Cell:new())

    for i = 1, height do
        for j = 1, width do
            mosaic:set(j, i, self:get(j + x - 1, i + y - 1))
        end
    end

    return mosaic
end

function Target:setRect (x1, y1, width, height, x2, y2, mosaic)
    for i = 1, height do
        for j = 1, width do
            self:set(j + x1 - 1, i + y1 - 1,
                          mosaic:get(j + x2 - 1, i + y2 - 1))
        end
    end
end

function Target:fill (x, y, width, height, cell)
    error("not implemented!")
end

function Target:draw (x, y, blender, mosaic)
    for i = 1, mosaic:getHeight() do
        for j = 1, mosaic:getWidth() do
            local foreground = blender:blend(mosaic:get(j, i).foreground, 
                self:get(j, i).foreground)
            local background = blender:blend(mosaic:get(j, i).background, 
                self:get(j, i).background)
            self:set(j + x - 1, i + y - 1, 
                Cell:new(mosaic:get(j, i).character, 
                    foreground, background))
        end
    end
end


return Target
