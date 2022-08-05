dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul_count = souls:count()

local count = math.ceil(soul_count * 0.3) + 1

if soul_count == 0 then 
	EntityKill(entity_id)
end

if soul_count == 1 then
	GamePrint(count .. " soul consumed!")
else
	GamePrint(count .. " souls consumed!")
end

--GamePrint(count)

--increase damage
local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

local healing = ComponentObjectGetValue( comp, "damage_by_type", "healing" )

healing = healing + count * -0.3

ComponentObjectSetValue( comp, "damage_by_type", "healing", healing )

souls:remove(count)