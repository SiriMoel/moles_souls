dofile_once("data/scripts/lib/utilities.lua")

function death( damage_type_bit_field, damage_message, entity_thats_responsible, drop_items )

    local entity_id = GetUpdatedEntityID()
    local x, y = EntityGetTransform( entity_id )

    local player = EntityGetWithTag("player_unit")[1]
    local px, py = EntityGetTransform(player)

    local GenomeComp = EntityGetFirstComponent( entity_id, "GenomeDataComponent" )
    local herd_id_number = ComponentGetValue2( GenomeComp, "herd_id")
    local herd_id = HerdIdToString(herd_id_number)

    GamePrint(herd_id)

    if ( "mods/moles_souls/files/entities/souls/soul_" .. herd_id .. ".xml" ) ~= nil then
        
        local is_gilded = math.random(1, 300)

        local child_id

        if is_gilded == 1 then 
            child_id = EntityLoad( "mods/moles_souls/files/entities/souls/soul_gilded.xml", px, py )
        else
            child_id = EntityLoad( "mods/moles_souls/files/entities/souls/soul_" .. herd_id .. ".xml", px, py )
        end
    
        EntityAddTag( child_id, "soul_entity" )
        EntityAddChild( player, child_id ) 
    end


end