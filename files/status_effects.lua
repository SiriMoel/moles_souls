local to_insert = {
    {
		id="SHROUD",
		ui_name="Shroud",
		ui_description="You are spooky.",
		ui_icon="mods/moles_souls/files/ui_gfx/gun_actionss/shroud.png",
		effect_entity="mods/moles_souls/files/entities/misc/effect_shroud.xml",
	},
}

for i,v in ipairs(to_insert) do
    table.insert(status_effects, v)
end