ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/moles_souls/files/actions.lua" )
ModMaterialsFileAdd("mods/moles_souls/files/materials.xml")

local nxml = dofile_once("mods/moles_souls/lib/nxml.lua")

local translations = ModTextFileGetContent( "data/translations/common.csv" );
if translations ~= nil then
	while translations:find("\r\n\r\n") do
		translations = translations:gsub("\r\n\r\n","\r\n");
	end
	local new_translations = ModTextFileGetContent( "mods/moles_souls/files/translations/t.csv" );
	translations = translations .. new_translations;
	ModTextFileSetContent( "data/translations/common.csv", translations );
end

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
