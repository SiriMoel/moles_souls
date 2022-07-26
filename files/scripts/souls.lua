dofile_once("mods/moles_souls/files/utils.lua")
dofile("mods/moles_souls/lib/stringstore/stringstore.lua")
local noitaGlobalStore = dofile("mods/moles_souls/lib/stringstore/noitaglobalstore.lua")
local souls = {};
local soulTypes = {
    "bat",
    "fly",
    "friendly",
    "gilded",
    "mage",
    "orcs",
    "slimes",
    "spider",
    "synthetic",
    "zombie",
    "worm"
}


function tableSearch(t, x)
    for i, v in ipairs(t) do
        if v == x then
            return i, v
        end
    end
end

function getSoulList() 
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    local list = {}
    for i, v in ipairs(soulTypes) do
        for i=1,store[v] do
            table.insert(list, v)
        end
    end
    return list
end
function souls.spawn(type)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    local player = EntityGetWithTag("player_unit")[1]
    local px, py = EntityGetTransform(player)

    if not ModSettingGet( "moles_souls.show_souls" ) then return end
    
    if type == "synthetic" then
        EntityAddChild(player, EntityLoad("mods/moles_souls/files/entities/souls/soul_synthetic.xml", px, py))
        return
    end
    if ("mods/moles_souls/files/entities/souls/soul_" .. type .. ".xml") ~= nil then
        local is_gilded = math.random(2, 100)
        if is_gilded == 1 then
            type = "gilded"
        end
        local child_id = EntityLoad("mods/moles_souls/files/entities/souls/soul_" .. type .. ".xml", px, py)
        EntityAddChild(player, child_id)
    end
end

function souls.kill(type)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    local tag = "soul_" .. type
    if type == "any" then
        tag = "soul"
    end
    local souls = EntityGetWithTag(tag);
    if (souls == nil) then
        return error("");
    end
    EntityKill(souls[math.random(1, #souls)]);
end

function souls:add(type, num)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    num = num or 1
    for i = 1, num do
        if pcall(self.spawn, type) then
            store[type] = store[type] + 1;
            store.total = store.total + 1;
        else 
            GamePrint("Failed to spawn soul of type " .. type)
        end
    end

end

function souls:remove(type, num)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    num = num or 1
    type = type or "any"
    for i = 1, num do
        if pcall(self.kill, type) then
            if type ~= "any" then
                if store[type] == 0 then return end
                store[type] = store[type] - 1
                store.total = store.total - 1;
            else
                local x = getSoulList()[math.random(1, #getSoulList())]
                store[x] = store[x] - 1;
                store.total = store.total - 1;
            end
        else

        end
    end
end

function souls:count(type)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    type = type or "total"
    return store[type]
end

function souls:get(num)
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    num = num or 1
    if num ~= 1 then
        local arr = {}
        for i = 1, num do
            local a = math.random(1, #getSoulList())
            table.insert(arr, getSoulList()[a])
        end
        return arr
    else
        local a = math.random(1, #getSoulList())
        return getSoulList()[a]
    end
end

function souls:init()
    local store = stringstore.open_store(noitaGlobalStore, "moles_souls")
    for i, v in ipairs(soulTypes) do
        store[v] = 0
    end
    store.total = 0
end
return souls
