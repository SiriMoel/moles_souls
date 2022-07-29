dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/souls.lua")

local player = EntityGetWithTag("player_unit")[1]
local px, py = EntityGetTransform(player)

local soul = souls:get(1)

if soul ~= nil then
    local effect_id = EntityLoad( "mods/moles_souls/files/entities/misc/status_entities/shroud.xml", px, py )
	EntityAddChild( entity_id, effect_id )

    souls:remove(soul)
end