ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/moles_souls/files/actions.lua" )
ModMaterialsFileAdd("mods/moles_souls/files/materials.xml")

local nxml = dofile_once("mods/moles_souls/lib/nxml.lua")

function OnModInit()

end

function OnModPostInit()

end

function OnPlayerSpawned( player_entity )
    --[[local child_id = EntityLoad( "mods/moles_souls/files/entities/souls/soul_gilded.xml", px, py )
    EntityAddChild( player_entity, child_id )]]--
end

function OnWorldPostUpdate()
end

function OnPlayerDied()

end
