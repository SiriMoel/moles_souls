noitaGlobalStore = function(base_name)
	if (GlobalsGetValue(base_name) == "") then GlobalsSetValue(base_name, "<managed>") end

	return {
		set_type = function(key, val)
			print("set_type " .. base_name .. "." .. key .. ".type" .. " " .. val)
			GlobalsSetValue(base_name .. "." .. key .. ".type", val)
		end,

		set = function(key, val)
			print("set " .. base_name .. "." .. key .. " " .. val)
			GlobalsSetValue(base_name .. "." .. key, val)
		end,

		get_type = function(key)
			print("get_type " .. base_name .. "." .. key .. ".type")
			return GlobalsGetValue(base_name .. "." .. key .. ".type")
		end,

		get = function(key)
			print("get " .. base_name .. "." .. key)
			return GlobalsGetValue(base_name .. "." .. key)
		end,

		get_meta = function() 
			GlobalsGetValue(base_name .. ":meta")
		end,

		set_meta = function(value)
			GlobalsSetValue(base_name .. ":meta", value)
		end,

		restrict = function(key)
			if key:find("\\.") or key:find(":") then
				error("Cannot use the dot ('.') or colon (':') characters in the Globals stringstore")
			end
		end
	}
end

return noitaGlobalStore