dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/lib/mod_settings.lua")

--THANKYOU HORSCHT

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

function ModSettingsGuiCount()
	return 1
end

function ModSettingsUpdate(init_scope)
	local function set_defaults(setting)
		if setting.type == "group" then
			for i, item in ipairs(setting.items) do
				set_defaults(item)
			end
		else
			if setting.value_default ~= nil then
				ModSettingSetNextValue(get_setting_id(setting.id), setting.value_default, true)
			end
		end
	end
	local function save_setting(setting)
		if setting.type == "group" then
			for i, item in ipairs(setting.items) do
				save_setting(item)
			end
		elseif setting.id ~= nil and setting.scope ~= nil and setting.scope >= init_scope then
			local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
			if next_value ~= nil then
				ModSettingSet(get_setting_id(setting.id), next_value)
			end
		end
	end
	for i, setting in ipairs(settings) do
		set_defaults(setting)
		save_setting(setting)
	end
	ModSettingSet(get_setting_id("_version"), mod_settings_version)
end

function ModSettingsGui( gui, in_main_menu )
	local id = 0
	local function get_id()
		id = id + 1
		return id
	end

	for i, setting in ipairs(settings) do
		if not setting.requires or (setting.requires and (ModSettingGetNextValue(get_setting_id(setting.requires.id)) == setting.requires.value)) then
			if setting.type == "group" then
				GuiOptionsAddForNextWidget(gui, GUI_OPTION.DrawSemiTransparent)
				GuiText(gui, 0, 0, setting.label)
				if setting.description then
					GuiTooltip(gui, setting.description, "")
				end
				GuiLayoutBeginHorizontal(gui, 0, 0)
				local offset = setting.offset or 0
	
				-- Render labels
				GuiLayoutBeginVertical(gui, 0, 0)
				for i, setting in ipairs(setting.items) do
					GuiText(gui, 0, 0, setting.label)
				end
				GuiLayoutEnd(gui)
	
				-- Render sliders
				GuiLayoutBeginVertical(gui, 0, 0)
				for i, setting in ipairs(setting.items) do
					local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
					local new_value = GuiSlider(gui, get_id(), 10 + offset, 2, "", next_value, setting.value_min, setting.value_max, setting.value_default, setting.value_display_multiplier, " " or setting.value_display_formatting, 80)
					GuiLayoutAddVerticalSpacing(gui, 1)
					if new_value ~= next_value then
						ModSettingSetNextValue(get_setting_id(setting.id), new_value, false)
					end
				end
				GuiLayoutEnd(gui)
	
				-- Render values
				GuiLayoutBeginVertical(gui, 0, 0)
				for i, setting in ipairs(setting.items) do
					local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
					GuiText(gui, offset + 30, 0, setting.format_fn and setting.format_fn(next_value) or tostring(next_value))
				end
				GuiLayoutEnd(gui)
	
				GuiLayoutEnd(gui)
				-- Need to do this because the game doesn't count how many items are in the vertical group
				for i=2, #setting.items do
					GuiText(gui, 0, 0, " ")
				end
				-- A little margin at the bottom before the next group or items
				GuiLayoutAddVerticalSpacing(gui, 5)
			else
				if type(setting.value_default) == "boolean" then
					local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
					local text = ("(%s) %s"):format(next_value and "*" or "  ", setting.label)
					local clicked, right_clicked = GuiButton(gui, 0, 0, text, get_id())
					if setting.description then
						GuiTooltip(gui, setting.description, "")
					end
					if clicked then
						ModSettingSetNextValue(get_setting_id(setting.id), not next_value, false)
					end
					if right_clicked then
						ModSettingSetNextValue(get_setting_id(setting.id), setting.value_default, false)
					end
				elseif setting.type == "fine_tuner" then
					local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
					local new_value = next_value
					GuiLayoutBeginHorizontal(gui, 0, 0)
					GuiText(gui, 0, 0, setting.label .. " ")
					if setting.description then
						GuiTooltip(gui, setting.description, "")
					end
					local function revert_to_default()
						new_value = setting.value_default or 0
					end
					local left_clicked, right_clicked = GuiButton(gui, get_id(), 0, 0, "[--]")
					if left_clicked then
						new_value = new_value - 10
					elseif right_clicked then
						revert_to_default()
					end
					local left_clicked, right_clicked = GuiButton(gui, get_id(), 0, 0, "[-]")
					if left_clicked then
						new_value = new_value - 1
					elseif right_clicked then
						revert_to_default()
					end
					new_value = math.max(setting.value_min or -999999, new_value)
					GuiText(gui, 0, 0, (" %s "):format(new_value))
					local left_clicked, right_clicked = GuiButton(gui, get_id(), 0, 0, "[+]")
					if left_clicked then
						new_value = new_value + 1
					elseif right_clicked then
						revert_to_default()
					end
					local left_clicked, right_clicked = GuiButton(gui, get_id(), 0, 0, "[++]")
					if left_clicked then
						new_value = new_value + 10
					elseif right_clicked then
						revert_to_default()
					end
					GuiLayoutEnd(gui)
					new_value = math.min(setting.value_max or 999999, new_value)
					if new_value ~= next_value then
						ModSettingSetNextValue(get_setting_id(setting.id), new_value, false)
					end
				elseif type(setting.value_default) == "number" then
					local next_value = ModSettingGetNextValue(get_setting_id(setting.id))
					local new_value = GuiSlider(gui, get_id(), 0, 0, setting.label .. " ", next_value, setting.value_min, setting.value_max, setting.value_default, setting.value_display_multiplier or 1, setting.value_display_formatting or " $0", 80)
					if new_value ~= next_value then
						ModSettingSetNextValue(get_setting_id(setting.id), new_value, false)
					end
				end
			end
		end
	end
end