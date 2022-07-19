dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

if ( EntityHasTag( root_id, "souls_to_power_target" ) == false ) then
	EntityAddTag( root_id, "souls_to_power_target" )
end