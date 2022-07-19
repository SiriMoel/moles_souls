dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = EntityGetInRadiusWithTag( x, y, radius, "soul")[1]

--[[

TODO

change projectilecomponent to have damage_by_type



orcs gives more projectile + slithering path? + spark_green 

mage gives more curse + projectile area teleport + spark_blue

slime gives more cold + personal gravity field + spark_purple

bat gives homing + spark_purple

fly gives more projectile + chaotic path + spark_green

spider gives matter eater + poison trail + venemous curse + less projectile + spark_pink (is that a thing?)

gilded gives gold (the material) trail + ALL weakening curses + gold

]]

if soul == nil then
    EntityKill(entity_id)
end

if EntityHasTag(soul, "soul_orcs") then

    EntityAddComponent( entity_id, "SineWaveComponent", {
        _enabled="1",
        sinewave_freq="1.0",
        sinewave_m="0.6",
        lifetime="-1",
    } )

    --[[EntityAddComponent( entity_id, "ParticleEmitterComponent", {

    } )]]--
end

EntityKill(soul)

--[[


]]--