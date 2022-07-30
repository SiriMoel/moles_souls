dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

EntityLoad("mods/moles_souls/files/particles/ritual_catalyst.xml", x, y)

local soul_count = souls:count()

local count = soul_count * 0.5 + 1

if soul_count == 0 then return end

if soul_count == 1 then
	GamePrint(count .. " soul consumed!")
else
	GamePrint(count .. " souls consumed!")
end

--stuff


--remove souls
souls:remove("any", math.ceil(soul_count))