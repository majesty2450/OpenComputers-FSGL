-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Class = require("soul/Class")

--------------------------------------------------------------------------
-- @module  Blender
--          
-- @desc    Combines two Cells.
--
-- @summary Blends two Cells togther, source and destination, to form a
--          new Cell.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local Blender = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a Blender.
-- 
-- @param   self    Table to perform operations on.
--------------------------------------------------------------------------
function Blender:__init ()
    Class.__init(self)
end

function Blender:blend (src, dest)
    error("Not Implemented!")
end

return Blender