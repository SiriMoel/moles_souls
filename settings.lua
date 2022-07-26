dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/lib/mod_settings.lua")

local mod_id = "moles_souls"
mod_settings_version = 1

local function get_setting_id(name)
	return mod_id .. "." .. name
end

local function format_fn_occurence(val)
	return string.format("%.f%%", val * 100)
end

local function format_fn_buffamount(val)
	return string.format("%.1f", val)
end

local settings = {
    {
        id = "show_souls",
        label = "Show Souls",
        description = "This is for if you want to see souls around your player in game.",
        value_default = true,
        scope = MOD_SETTING_SCOPE_RUNTIME,
    }
}