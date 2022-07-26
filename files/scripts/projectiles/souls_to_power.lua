dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul_count = souls:count()

local count = soul_count

if count == 1 then
	GamePrint(count .. " soul consumed!")
else
	GamePrint(count .. " souls consumed!")
end

--GamePrint(count)

--increase damage
local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

local damage = ComponentGetValue2( comp, "damage" )
--local expdamage = ComponentObjectGetValue( comp, "config_explosion", "damage" )
--local exprad = ComponentObjectGetValue( comp, "config_explosion", "explosion_radius" )

damage = damage + count * 2.8

ComponentSetValue2( comp, "damage", damage )

--effects
local effect_id = EntityLoad("mods/moles_souls/files/entities/particles/souls_to_power.xml", x, y)
EntityAddChild( root_id, effect_id )

edit_component( effect_id, "ParticleEmitterComponent", function(comp3,vars)
	local part_min = 30 * count
	local part_max = 50 * count
	
	ComponentSetValue2( comp3, "count_min", part_min )
	ComponentSetValue2( comp3, "count_max", part_max )
end)

souls:remove("any", math.ceil(soul_count))