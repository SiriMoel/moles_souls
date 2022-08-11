dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local comp = EntityGetComponent( entity_id, "ProjectileComponent" )

local soul = souls:get(1)

if soul ~=nil then 
    local damage = ComponentGetValue2( comp, "damage" )
    local speedmin = ComponentGetValue2( comp, "speed_min") 
    local speedmax = ComponentGetValue2( comp, "speed_max") 

    speedmin = speedmin * 2
    speedmax = speedmax * 2
    damage = damage * 1.3

    ComponentSetValue2( comp, "damage", damage )
    ComponentSetValue2( comp, "speed_min", speedmin )
    ComponentSetValue2( comp, "speed_max", speedmax )

    souls:remove(soul)
else
    GamePrint("You have no souls!")
end