-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Target = require("FSGL/Target")
local Cell = require("FSGL/Cell")
local Color = require("FSGL/Color")
local component = require("component")
local gpu = component.gpu

--------------------------------------------------------------------------
-- @module  TargetScreen
--          
-- @desc    Defines a universal interface for drawing.
--
-- @summary Uses viewports for clipping.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
-- @todo    Finish documentation.
--------------------------------------------------------------------------
local TargetScreen = Target:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a TargetScreen.
-- 
-- @param   self      Table to perform operations on.
--------------------------------------------------------------------------
function TargetScreen:__init ()
    Target.__init(self)
end

--------------------------------------------------------------------------
-- @method  getMaxSize
-- 
-- @desc    Gets the maximum size that can be set.
-- 
-- @summary Returns the width and height of maxResolution.
-- 
-- @param   self      Table to perform operations on.
-- @return  The max width and height.
--------------------------------------------------------------------------
function TargetScreen:getMaxSize ()
    local w, h = gpu.maxResolution()
    return w, h
end

--------------------------------------------------------------------------
-- @method  getSize
-- 
-- @desc    Gets the current size that is set.
-- 
-- @summary Returns the width and height of getResolution.
-- 
-- @param   self      Table to perform operations on.
-- @return  The current width and height.
--------------------------------------------------------------------------
function TargetScreen:getSize ()
    local w, h = gpu.getResolution()
    return w, h
end

--------------------------------------------------------------------------
-- @method  setSize
-- 
-- @desc    Sets the size of the screen.
-- 
-- @summary Calls setResolution for the given size.
-- 
-- @param   self    Table to perform operations on.
-- @param   width   The width to set in Cells.
-- @param   height  The height to set in Cells.  
--------------------------------------------------------------------------
function TargetScreen:setSize (width, height)
    gpu.setResolution(width, height)
end

function TargetScreen:get (x, y)
    local char, fore, back = gpu.get(x, y)
    
    local foreground = Color:new(1, 0, 0, 0)
    foreground:setRGB(fore)
    local background = Color:new(1, 0, 0, 0)
    background:setRGB(back)

    return Cell:new(char, foreground, background)
end

function TargetScreen:set (x, y, cell)
    gpu.setForeground(cell.foreground:getRGB())
    gpu.setBackground(cell.background:getRGB())
    gpu.set(x, y, cell.character)
end

function TargetScreen:fill(x, y, width, height, cell)
    gpu.setForeground(cell.foreground:getRGB())
    gpu.setBackground(cell.background:getRGB())
    gpu.fill(x, y, width, height, cell.character)
end


return TargetScreen
