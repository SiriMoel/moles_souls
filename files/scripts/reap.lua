dofile("mods/moles_souls/files/utils.lua")
local souls = dofile("mods/moles_souls/files/scripts/souls.lua")
function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )
    local entity_id = GetUpdatedEntityID()
    local herd_id_number = ComponentGetValue2( EntityGetFirstComponent( entity_id, "GenomeDataComponent" ), "herd_id")
    local herd_id = HerdIdToString(herd_id_number)

    local soul_reaped = herd_id

    local dogilded = math.random(1,100)

    if dogilded == 1 then
        soul_reaped = "gilded"
    end

    if ModSettingGet( "moles_souls.say_soul" ) == true then
        if table.contains(soulTypes, soul_reaped) == false then return end
        GamePrint( "You have acquired a " .. soul_reaped .. " soul!")
    end

    souls:add(soul_reaped)
end