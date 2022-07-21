dofile("mods/moles_souls/files/utils.lua")
local player = EntityGetWithTag( "player_unit" )[1]
local px, py = EntityGetTransform( player )

local walletcomp = EntityGetFirstComponent( player, "WalletComponent" )
if walletcomp ~= nil then
    local money = ComponentGetValue2( walletcomp, "money" )
    local moneyspent = ComponentGetValue2( walletcomp, "money_spent" )
    if money * 0.05 >= 1000 then
        local cost = 1000 + ( money * 0.5 )
        ComponentSetValue2( walletcomp, "money", money - cost)
        ComponentSetValue2( walletcomp, "money_spent", moneyspent + cost)
        EntityAddChild( player, EntityLoad( "mods/moles_souls/files/entities/souls/soul_synthetic.xml", px, py ) ) 
        
    else
        GamePrint("You are too poor!")
    end
end