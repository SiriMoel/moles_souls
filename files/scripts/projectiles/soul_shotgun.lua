dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = souls:get(1)
--local soul = EntityGetInRadiusWithTag( x, y, radius, "soul")[1]

local projcomp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

if soul == nil then
	
	GamePrint("You have no souls.")

	ComponentSetValue2( projcomp, "on_death_explode", false )
	ComponentSetValue2( projcomp, "on_lifetime_out_explode", false )
	ComponentSetValue2( projcomp, "collide_with_entities", false )
	ComponentSetValue2( projcomp, "collide_with_world", false )
	ComponentSetValue2( projcomp, "lifetime", 1 )

    EntityKill(entity_id)
end

GamePrint(soul)

souls:remove(soul)