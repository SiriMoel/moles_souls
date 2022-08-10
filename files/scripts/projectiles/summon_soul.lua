dofile("mods/moles_souls/files/utils.lua")
local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local player = EntityGetWithTag("player_unit")[1]
local entity = GetUpdatedEntityID()

local soul = souls:get(1)

local x, y = EntityGetTransform(entity)

local e = {
    {
        soul = "spider",
        path = "data/entities/animals/longleg.xml",
    },
    {
        soul = "mage",
        path = "data/entities/animals/firemage.xml",
    },
    {
        soul = "orcs",
        path = "data/entities/animals/shotgunner.xml",
    },
    {
        soul = "slimes",
        path = "data/entities/animals/slimeshooter.xml",
    },
    {
        soul = "zombie",
        path = "data/entities/animals/zombie.xml",
    },
}

function f(soul_type)
    local shuffled = {}
    for i, v in ipairs(e) do
    local pos = math.random(1, #shuffled+1)
    table.insert(shuffled, pos, v)
    end
    for i, v in ipairs(shuffled) do 
        local x;
        if table.contains(v["soul"], soul_type) then x = v else x = 0 end
        if (x ~= 0) then return x 
    end
end
end

local r = f(soul)

if r ~= nil then
    EntityLoad(r["path"], x, y)
    souls:remove(soul)
else
    GamePrint("Issue.")
end