dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local souls = EntityGetInRaduisWithTag( x, y, radius, "soul")
local count = #souls

if count == 1 then
	GamePrint("You have " .. count .. " soul!")
else
	GamePrint("You have " .. count .. " souls!")
end