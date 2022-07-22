dofile_once("mods/moles_souls/files/utils.lua")
dofile_once("mods/moles_souls/lib/stringstore.lua")
dofile_once("mods/moles_souls/lib/noitavariablestore.lua")
gui = gui or GuiCreate()
local souls = {};
local store = stringstore.open_store(stringstore.noita.variable_storage_components(EntityGetWithTag("player_unit")[1]))
                  .souls;
GamePrint(type(store))

function souls:spawn(type)
    GamePrint(type)
    local player = EntityGetWithTag("player_unit")[1]
    local px, py = EntityGetTransform(player)
    if type == "synthetic" then
        EntityAddChild(player, EntityLoad("mods/moles_souls/files/entities/souls/soul_synthetic.xml", px, py))
        return
    end
    if ("mods/moles_souls/files/entities/souls/soul_" .. type .. ".xml") ~= nil then
        local is_gilded = math.random(1, 100)
        if is_gilded == 1 then
            type = "gilded"
        end
        local child_id = EntityLoad("mods/moles_souls/files/entities/souls/soul_" .. type .. ".xml", px, py)
        EntityAddChild(player, child_id)
    end
end

function souls:kill(type)
    local tag = "soul_" .. type
    if type == "any" then tag = "soul" end
    local souls = EntityGetWithTag(tag);
    if (souls == nil) then 
        return error("");
    end
    EntityKill(souls[math.random(1, #souls)]);
end

function souls:add(type, num)
    for i=1,num do
        if pcall(self.spawn(type)) then
            GamePrint("Err: Soul of type " .. type .. "could not be spawned");
            return error("Soul of type " .. type .. "could not be spawned"); 
        end;
        store[type] = store[type] + 1;
        store["total"] = store["total"] + 1;

    end
    
end

function souls:remove(type, num)
    for i=1,num do
        if pcall(self.kill(type)) then
            
        else 
        if type ~= "any" then store[type] = store[type] - 1 end;
        store["total"] = store["total"] - 1;
        end
    end
end

function souls:count(type) 
    type = type or "total"
    return store[type]
end

function souls:init()
    store["total"] = 0
    store["bat"] = 0
    store["fly"] = 0
    store["friendly"] = 0
    store["gilded"] = 0
    store["mage"] = 0 
    store["orcs"] = 0
    store["slimes"] = 0
    store["spider"] = 0
    store["synthetic"] = 0
    store["zombie"] = 0
end

function guiStart()

end
return souls
