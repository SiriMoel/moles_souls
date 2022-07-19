dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local mark_radius = 30

local targets = EntityGetInRadiusWithTag( x, y, mark_radius, "homing_target" )

local effect_id = EntityLoad("mods/moles_souls/files/entities/particles/reaping_particles.xml", x, y)
EntityAddChild( root_id, effect_id )

edit_component( effect_id, "ParticleEmitterComponent", function(comp3,vars)
    local part_min = math.random( 1, 100 )
    local part_max = math.random( 100, 300 )
    
    ComponentSetValue2( comp3, "count_min", part_min )
    ComponentSetValue2( comp3, "count_max", part_max )
end)

if ( #targets > 0 ) then
    for i,target_id in ipairs( targets ) do

        if ( EntityHasTag( target_id, "reap_marked" ) == false ) then

            EntityAddComponent( target_id, "LuaComponent", 
            {
                script_death = "mods/moles_souls/files/scripts/reap.lua",
                execute_every_n_frame = "-1",
            } )

            local effect_id = EntityLoad("mods/moles_souls/files/entities/particles/marked_particles.xml", x, y)
            EntityAddChild( target_id, effect_id )

            EntityAddTag( target_id, "reap_marked")
        end
    end
end