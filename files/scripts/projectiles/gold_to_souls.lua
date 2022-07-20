dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local player = EntityGetWithTag( "player_unit" )[1]
local px, py = EntityGetTransform( player )

local walletcomp = EntityGetFirstComponent( player, "WalletComponent" )

if walletcomp ~= nil then
    local money = ComponentGetValue2( walletcomp, "money" )
    local cost
    local moneyspent = ComponentGetValue2( walletcomp, "money_spent" )

    local child_id = EntityLoad( "mods/moles_souls/files/entities/souls/soul_synthetic.xml", px, py )

    if money * 0.05 >= 1000 then
        cost = 1000 + ( money * 0.5 )
        moneyspent = moneyspent + cost

        money = money - cost

        ComponentSetValue2( walletcomp, "money", money )
        ComponentSetValue2( walletcomp, "money_spent", moneyspent )

        EntityAddChild( player, child_id ) 
        
    else
        cost = 0
        GamePrint("You are too poor!")
    end
end