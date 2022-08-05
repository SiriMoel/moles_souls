local to_insert = {
    {
		id="SHROUD",
		ui_name="Shroud",
		ui_description="You are spooky.",
		ui_icon="mods/moles_souls/files/ui_gfx/gun_actions/shroud.png",
		effect_entity="mods/moles_souls/files/entities/misc/status_entities/shroud.xml",
	},
	{
		id="SOULS_AS_MANA",
		ui_name="",
		ui_description="",
		ui_icon="mods/moles_souls/files/ui_gfx/gun_actions/shroud.png",
		effect_entity="mods/moles_souls/files/entities/misc/status_entities/souls_as_mana.xml",
	}

}

for i,v in ipairs(to_insert) do
    table.insert(status_effects, v)
end