stringstore = {}
function convert_to_string(val)
    local val_type = type(val)
    if val_type == "function" then
        error("Serializing functions is not supported")
    end
    if val_type == "userdata" then
        error("Serializing C userdata is not supported")
    end
    if val_type == "thread" then
        error("Serializing thread objects is not supported")
    end
    return tostring(val)
end

function convert_from_string(target_type, value, interfaceInit, name, key)
    if target_type == "nil" then
        return nil
    end
    if target_type == "string" then
        return value
    end
    if target_type == "number" then
        return tonumber(value)
    end
    if target_type == "table" then
        return stringstore.open_store(interfaceInit, name .. '.' .. key)
    end
    if target_type == "boolean" then
        return value == "true"
    end
    error("Unsupported target type: " .. target_type)
end

function stringstore.open_store(interfaceInit, name)
    interface = interfaceInit(name)
	if interface.get_meta() == nil then
		interface.set_meta("")
	end
    if not interface.set_type then
        error("Missing storeinfo 'set_type' field")
    end
    if not interface.set then
        error("Missing storeinfo 'set' field")
    end
    if not interface.get_type then
        error("Missing storeinfo 'get_type' field")
    end
    if not interface.get then
        error("Missing storeinfo 'get' field")
    end

    interface.restrict = interface.restrict or function(x)
    end
    local store = {};
    setmetatable(store, {
        __newindex = function(self, key, val)
            interface.restrict(tostring(key))
            if val == nil then
                local meta = interface.get_meta()

                local s = ""
                for str in string.gmatch(meta, '([^","]+)') do
                    if (str ~= key) then
                        s = s .. "," .. str
                    end
                end
                return
            end
            interface.set_meta(interface.get_meta() .. "," .. key)
            local t = type(val)
            if t == "table" then
                for k, v in pairs(val) do
                    interface.set_type(key .. "." .. k, type(v))
                    interface.set(key .. "." .. k, convert_to_string(v))
                end
                interface.set_type(key, t)
            else
                local value = convert_to_string(val)
                interface.set_type(key, t)
                interface.set(key, value)
            end
        end,

        __index = function(self, key)
            interface.restrict(tostring(key))
            local val = interface.get(key)
            local type = interface.get_type(key)
            return convert_from_string(type, val, interfaceInit, name, key)
        end,

        __len = function()
            local meta = interface.get_meta()
            local len = 0
            for str in string.gmatch(meta, '([^","]+)') do
                len = len + 1
            end
            return len
        end,
        __pairs = function(tbl)
            local data = {}
            for key in string.gmatch(interface.get_meta(), '([^","]+)') do
                data[key] = convert_from_string(interface.get_type(key), interface.get(key), interfaceInit, name, key)
            end
            local function stateless_iter(tbl, k)
                local v
                k, v = next(data, k)
                if v ~= nil then
                    return k, v
                end
            end
            return stateless_iter, tbl, nil
        end
    })
    return store
end

return stringstore
