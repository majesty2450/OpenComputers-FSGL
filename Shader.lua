-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local Class = require("soul/Class")

--------------------------------------------------------------------------
-- @module  Shader
--          
-- @desc    Effects a Cell.
--
-- @summary Shades a Cell of a Mosaic to create a new Cell.
--
-- @todo    Create formal tests.
-- @todo    Add argument checking.
--------------------------------------------------------------------------
local Shader = Class:extend()

--------------------------------------------------------------------------
-- @method  __init
-- 
-- @desc    Constructor.
-- 
-- @summary Initializes a Shader.
-- 
-- @param   self    Table to perform operations on.
--------------------------------------------------------------------------
function Shader:__init ()
    Class.__init(self)
end

function Shader:shade (mosaic, x, y)
    error("Not Implemented!")
end


return Shader