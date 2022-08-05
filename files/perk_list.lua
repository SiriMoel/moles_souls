local to_insert = {
	--[[{
		id = "MOLES_SOULS_SOUL_SHEDDING",
		ui_name = "$perk_moles_souls_soul_shedding",
		ui_description = "$perkdesc_moles_souls_soul_shedding",
		ui_icon = "data/ui_gfx/perk_icons/saving_grace.png",
		perk_icon = "data/items_gfx/perks/saving_grace.png",
		game_effect = "SAVING_GRACE",
		stackable = STACKABLE_NO,
		usable_by_enemies = true,
		func = function( entity_perk_item, entity_who_picked, item_name )
			add_halo_level(entity_who_picked, 1)
		end,
	},]]--
}

for k, v in ipairs(to_insert) do
    table.insert(perk_list, v)
end