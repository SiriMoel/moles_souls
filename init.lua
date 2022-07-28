ModLuaFileAppend( "data/scripts/gun/gun_actions.lua", "mods/moles_souls/files/actions.lua" )
ModLuaFileAppend( "data/scripts/status_effects/status_list.lua", "mods/moles_souls/files/status_effects.lua" )
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
	local souls = dofile_once("mods/moles_souls/files/scripts/souls.lua")
	if GameHasFlagRun("moles_souls_has_init") then return end
	souls:init()
	GameAddFlagRun("moles_souls_has_init")
end

function OnWorldPostUpdate()
end

function OnPlayerDied()

end

function OnModSettingsChanged()

	if not ModSettingGet( "moles_souls.show_souls" ) then

		local souls = EntityGetWithTag("soul")

		for i,soul_id in ipairs(souls) do
			EntityKill(soul_id)
		end

	end

	if ModSettingGet( "moles_souls.show_souls" ) == true then

		local souls = dofile_once("mods/moles_souls/files/scripts/souls.lua")
		local soul_entities = EntityGetWithTag("soul")

		for i,soul_id in ipairs(soul_entities) do
			EntityKill(soul_id)
		end
		

		local soul_list = getSoulList()

		for i,v in ipairs(soul_list) do
			souls.spawn(v)
		end
		
	end
end