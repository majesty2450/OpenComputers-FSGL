-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Class = require("soul/Class")
local Color = require("FSGL/Color")

--------------------------------------------------------------------------
-- @module  Cell
--          
-- @desc    A Terminal Element.
--
-- @summary Contains a character, foreground, and background.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local Cell = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a Cell.
-- 
-- @param   self        Table to perform operations on.
-- @param   character   Character.
-- @param   foreground  Foreground Color.
-- @param   background  Background Color.
--------------------------------------------------------------------------
function Cell:__init (character, foreground, background)
    Class.__init(self)
    
    self.character = character or ' '
    self.foreground = foreground or Color:new(1, 255, 255, 255)
    self.background = background or Color:new(1, 0, 0, 0)
end


return Cell