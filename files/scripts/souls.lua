dofile_once("mods/moles_souls/files/utils.lua")
dofile_once("mods/moles_souls/lib/stringstore.lua")
dofile_once("mods/moles_souls/lib/noitavariablestore.lua")
local souls = {};
local store = stringstore.open_store(stringstore.noita.variable_storage_components(EntityGetWithTag("player_unit")[1]))
                  .souls;
GamePrint(type(store))

function souls:spawn(herd)
    GamePrint(herd)
    local player = EntityGetWithTag("player_unit")[1]
    local px, py = EntityGetTransform(player)
    if herd == "synthetic" then
        EntityAddChild(player, EntityLoad("mods/moles_souls/files/entities/souls/soul_synthetic.xml", px, py))
        return
    end
    if ("mods/moles_souls/files/entities/souls/soul_" .. herd .. ".xml") ~= nil then
        local is_gilded = math.random(1, 100)
        if is_gilded == 1 then
            herd = "guilded"
        end
        local child_id = EntityLoad("mods/moles_souls/files/entities/souls/soul_" .. herd .. ".xml", px, py)
        EntityAddChild(player, child_id)
    end
end

function souls:kill(herd)
    local tag = "soul_" .. herd
    if herd == "any" then tag = "soul" end
    local souls = EntityGetWithTag(tag)
    EntityKill(souls[math.random(1, #souls)])
end

function souls:add(herd, num)
    for i=1,num do
        self.spawn(herd);
    end

end

function souls:remove(herd, num)
    for i=1,num do
        self.kill(herd);
    end
end

return souls
