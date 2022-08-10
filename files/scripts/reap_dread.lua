dofile("mods/moles_souls/files/utils.lua")
local souls = dofile("mods/moles_souls/files/scripts/souls.lua")
function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
    local entity_id = GetUpdatedEntityID()
    local herd_id_number = ComponentGetValue2( EntityGetFirstComponent( entity_id, "GenomeDataComponent" ), "herd_id")
    local herd_id = HerdIdToString(herd_id_number)

    local soultoadd = "dread"

    --[[ -- quest stup wip
    if EntityGetName(entity_id) == "$animal_gazer_big" then
        if ModSettingGet( "moles_souls.say_soul" ) == true then
            GamePrint( "QUEST - WIP")
            soultoadd = ""
        end
    else
        if ModSettingGet( "moles_souls.say_soul" ) == true then
            GamePrint( "You have acquired a dread soul!")
        end
    end

    end
    ]]--

    if ModSettingGet( "moles_souls.say_soul" ) == true then
        GamePrint( "You have acquired a dread soul!")
    end

    souls:add("dread")
end