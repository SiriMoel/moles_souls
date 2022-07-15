local to_insert = {
    {
		id          = "REAPING_SHOT",
		name 		= "Reaping Shot",
		description = "Marks hit enemies to drop their souls on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/reaping_shot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,10", -- AREA_DAMAGE
		spawn_probability                 = "0.2,0.5,0.5,0.1", -- AREA_DAMAGE
		price = 120,
		mana = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/reaping_shot.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 5
			draw_actions( 1, true )
		end,
	},
    {
		id          = "SOULS_TO_POWER",
		name 		= "Souls to Power",
		description = "Consume all of your souls to increase a projectile's damage.",
		sprite 		= "mods/moles_souls/files/ui_gfx/souls_to_power.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/souls_to_power.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,10", -- AREA_DAMAGE
		spawn_probability                 = "0.2,0.5,0.5,0.1", -- AREA_DAMAGE
		price = 120,
		mana = 70,
		-- max_uses = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/souls_to_power.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end