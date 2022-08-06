dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = souls:get(1)

local spritepath = "mods/moles_souls/files/projectiles_gfx/soul_slice/"

local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
local projdamage = ComponentGetValue2( comp, "damage" )
local cursedamage = ComponentObjectGetValue( comp, "damage_by_type", "curse" )
local icedamage = ComponentObjectGetValue( comp, "damage_by_type", "ice" )
local slicedamage = ComponentObjectGetValue( comp, "damage_by_type", "slice" )

local spritecomp = EntityGetFirstComponent( entity_id, "SpriteComponent")

local baseslice = 1.3

if soul == nil then
    GamePrint("You have no souls.")

	local projcomp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

	ComponentSetValue2( projcomp, "on_death_explode", false )
	ComponentSetValue2( projcomp, "on_lifetime_out_explode", false )
	ComponentSetValue2( projcomp, "collide_with_entities", false )
	ComponentSetValue2( projcomp, "collide_with_world", false )

    EntityKill(entity_id)
end

if soul ~=nil then 
   EntityAddComponent(entity_id, "GameAreaEffectComponent", {
      radius="32",
      collide_with_tag="hittable",
      frame_length="1",
   } )
   ComponentObjectSetValue( comp, "damage_by_type", "slice", baseslice )
end


if soul == "orcs" or soul == "zombie" then  
   ComponentSetValue2( spritecomp, "image_file", spritepath .. "orcs" .. ".xml" )
end

if soul == "gilded" then  
    ComponentSetValue2( spritecomp, "image_file", spritepath .. "gilded" .. ".xml" )
 end

 if soul == "spider" then  
    ComponentSetValue2( spritecomp, "image_file", spritepath .. "spider" .. ".xml" )
 end

 if soul == "mage" then  
    ComponentSetValue2( spritecomp, "image_file", spritepath .. "mage" .. ".xml" )
 end

 if soul == "slimes" then  
    ComponentSetValue2( spritecomp, "image_file", spritepath .. "slimes" .. ".xml" )
 end

 if soul == "worm" then  
    ComponentSetValue2( spritecomp, "image_file", spritepath .. "worm" .. ".xml" )
 end

 souls:remove(soul)

