-- The MIT License (MIT)
-- Copyright (c) 2015 Ryan M. Wackelin

local dev = require("libdev/dev")
dev.defaultPackages()

local unicode = require("unicode")
local TargetScreen = require("FSGL/TargetScreen")
local Mosaic = require("FSGL/Mosaic")
local Cell = require("FSGL/Cell")
local Color = require("FSGL/Color")
local BlenderNormal = require("FSGL/BlenderNormal")

local screen = TargetScreen:new()
local normal_blender = BlenderNormal:new()

local BACKGROUND = Color:new(1, 0, 0, 0)
local FOREGROUND = Color:new(0.25, 255, 0, 0)

screen:fill(1, 1, 80, 25, Cell:new(unicode.char(0x2591),
            BACKGROUND, Color:new(1, 255, 255, 255)))

local mosaic = Mosaic:new(5, 5, Cell:new())
local cell = Cell:new(unicode.char(0x2588), FOREGROUND, Color:new(1, 0, 0, 0))
mosaic:set(3, 1, cell:copy())
mosaic:set(3, 2, cell:copy())
mosaic:set(3, 3, cell:copy())
mosaic:set(3, 4, cell:copy())
mosaic:set(3, 5, cell:copy())
mosaic:set(1, 3, cell:copy())
mosaic:set(2, 3, cell:copy())
mosaic:set(4, 3, cell:copy())
mosaic:set(5, 3, cell:copy())

screen:draw(76, 21, normal_blender, mosaic)
