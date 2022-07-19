local to_insert = {
    {
		id          = "REAPING_SHOT",
		name 		= "Reaping Shot",
		description = "Marks enemies to drop their souls on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/reaping_shot.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/reaping_shot.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
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
		description = "Consumes a portion of your souls to increase a projectile's damage.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/souls_to_power.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/souls_to_power.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,10",
		spawn_probability                 = "1,1,1", 
		price = 120,
		mana = 50,
		-- max_uses = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/souls_to_power.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 20
			draw_actions( 1, true )
		end,
	},
	{
		id          = "SOUL_BATTERY",
		name 		= "Soul Battery",
		description = "Consumes all your souls to increase a projectile's damage.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_battery.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/soul_battery.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "2,3,6,10",
		spawn_probability                 = "1,1,1,1", 
		price = 200,
		mana = 70,
		-- max_uses = 20,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/soul_battery.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 40
			draw_actions( 1, true )
		end,
	},
	{
		id          = "REAPING_FIELD",
		name 		= "Circle of Reaping",
		description = "Marks enemies in a large field to drop their souls on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/reaping_field.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/reaping_field.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 200,
		mana = 70,
		max_uses = 5,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/reaping_field.xml")
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	{
		id          = "SOUL_FUELED_HEALING_BOLT",
		name 		= "Soul Fueled Healing Bolt",
		description = "Consumes a portion of your souls to create a healing projectie.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_fueled_healing_bolt.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_fueled_healing_bolt.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 120,
		mana = 30,
		max_uses = 15,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_fueled_healing_bolt.xml")
			c.fire_rate_wait = c.fire_rate_wait + 5
		end,
	},
	{
		id          = "WHISPER_SOUL_COUNT",
		name 		= "Whisper Souls",
		description = "Makes your wand whisper how many souls you have.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/whisper_soul_count.png",
		sprite_unidentified = "data/ui_gfx/gun_actions/homing_unidentified.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/whisper_soul_count.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
		price = 50,
		mana = 0,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/whisper_soul_count.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 0
			draw_actions( 1, true )
		end,
	},
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
end