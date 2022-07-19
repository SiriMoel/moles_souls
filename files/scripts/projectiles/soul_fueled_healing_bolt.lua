dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local total_souls = EntityGetInRadiusWithTag( x, y, radius, "soul" )

local souls = {}
for i,v in ipairs(total_souls) do 
  if i < math.ceil(#total_souls * 0.3) then table.insert(souls, v)
  else break end
end

local count = #souls

if count == 1 then
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

--kills souls
for i,soul_id in ipairs(souls) do
	EntityKill(soul_id)
end