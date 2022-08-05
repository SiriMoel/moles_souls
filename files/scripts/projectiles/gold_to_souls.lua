dofile("mods/moles_souls/files/utils.lua")
local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local player = EntityGetWithTag("player_unit")[1]

local walletcomp = EntityGetFirstComponent( player, "WalletComponent" )

if walletcomp ~= nil then
    local money = ComponentGetValue2( walletcomp, "money" )
    if money * 0.05 >= 1000 then
        local cost = 1000 + ( money * 0.05 )
        ComponentSetValue2( walletcomp, "money", money - cost)
        ComponentSetValue2( walletcomp, "money_spent", ComponentGetValue2( walletcomp, "money_spent" ) + cost)
        GamePrint("Success!")
        souls:add("synthetic")
    else
        GamePrint("You are too poor!")
    end
end