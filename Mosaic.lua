-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Class = require("soul/Class")

--------------------------------------------------------------------------
-- @module  Mosaic
--          
-- @desc    A 2D buffer.
--
-- @summary Contains a 2D array of Cells.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local Mosaic = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a Mosaic.
-- 
-- @param   self    Table to perform operations on.
-- @param   width   The x dimension size.
-- @param   height  The y dimension size.
-- @param   default The cell to copy to each position.    
--------------------------------------------------------------------------
function Mosaic:__init (width, height, default)
    Class.__init(self)

    self.data = {}
    for i = 1, height do
        self.data[i] = {}
        for j = 1, width do
            self.data[i][j] = default:copy()
        end
    end
end

function Mosaic:getWidth ()
    return #self.data[1]
end

function Mosaic:getHeight ()
    return #self.data
end

function Mosaic:resize (width, height, default)
    local temp = {}
    for i = 1, height do
        temp[i] = {}
        for j = 1, width do
            temp[i][j] = self.data:get(j, i) or default:copy()
        end
    end

    self.data = temp
end

function Mosaic:get (x, y)
    return self.data[y][x]
end

function Mosaic:set (x, y, cell)
    self.data[y][x] = cell:copy()
end


return Mosaic