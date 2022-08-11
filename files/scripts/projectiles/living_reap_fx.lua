dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local effect_id = EntityLoad("mods/moles_souls/files/entities/particles/reaping_particles_living.xml", x, y)
EntityAddChild( root_id, effect_id )

edit_component( effect_id, "ParticleEmitterComponent", function(comp3,vars)
    local part_min = math.random( 1, 100 )
    local part_max = math.random( 100, 300 )
    
    ComponentSetValue2( comp3, "count_min", part_min )
    ComponentSetValue2( comp3, "count_max", part_max )
end)