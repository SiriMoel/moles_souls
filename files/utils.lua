dofile_once("data/scripts/lib/utilities.lua")

--these dont need to be here but they are
local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )
local soulTypes = {
    "bat",
    "fly",
    "friendly",
    "gilded",
    "mage",
    "orcs",
    "slimes",
    "spider",
    "synthetic",
    "zombie",
    "worm",
    "fungi",
}

local radius = 160 --radius for soul consumption

return x, y, radius, root_id, entity_id, soulTypes
