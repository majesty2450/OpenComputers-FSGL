-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Target = require("FSGL/Target")
local Cell = require("FSGL/Cell")
local Color = require("FSGL/Color")

--------------------------------------------------------------------------
-- @module  TargetMosaic
--          
-- @desc    Defines a universal interface for drawing.
--
-- @summary Lib Rendering. (offscreen)
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
-- @todo    Finish documentation.
--------------------------------------------------------------------------
local TargetMosaic = Target:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a TargetMosaic.
-- 
-- @param   self      Table to perform operations on.
-- @param   position  Vector2 position.
-- @param   size      Vector2 size.
--------------------------------------------------------------------------
function TargetMosaic:__init (width, height)
    Target.__init(self)

    self.buffer = Mosaic:new(width, height, Cell:new())
end

function TargetMosaic:getMaxSize ()
    return nil
end

function TargetMosaic:getSize ()
    return self.buffer:getWidth(), self.buffer:getHeight()
end

function TargetMosaic:setSize (width, height)
    self.buffer:resize(width, height, Cell:new())
end

function TargetMosaic:get (x, y)
    return self.buffer:get(x, y)
end

function TargetMosaic:set (x, y, cell)
    self.buffer:set(x, y, cell)
end

function TargetMosaic:fill(x, y, width, height, cell)
    for i = 1, height do
        for j = 1, width do
            self.buffer:set(j + x - 1, i + y - 1, cell)
        end
    end
end


return TargetMosaic
