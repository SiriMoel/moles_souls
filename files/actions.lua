local to_insert = {
    {
		id          = "MOLES_SOULS_REAPING_SHOT",
		name 		= "Reaping Shot",
		description = "Causes enemies to drop their souls on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/reaping_shot.png",
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
		id          = "MOLES_SOULS_SOULS_TO_POWER",
		name 		= "Souls to Power",
		description = "Consumes a portion of your souls to increase a projectile's damage.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/souls_to_power.png",
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
		id          = "MOLES_SOULS_SOUL_LANTERN",
		name 		= "Soul Lantern",
		description = "Consumes all your souls to increase a projectile's damage.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_lantern.png",
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
		id          = "MOLES_SOULS_REAPING_FIELD",
		name 		= "Circle of Reaping",
		description = "Causes enemies in a large field to drop their souls on death.",
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
			c.fire_rate_wait = c.fire_rate_wait + 50
		end,
	},
	{
		id          = "MOLES_SOULS_SOUL_FUELED_HEALING_BOLT",
		name 		= "Expel Healing Soul",
		description = "Consumes a portion of your souls to shoot a healing soul.",
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
			c.fire_rate_wait = c.fire_rate_wait + 15
		end,
	},
	--[[{
		id          = "MOLES_SOULS_WHISPER_SOUL_COUNT",
		name 		= "Whisper Souls",
		description = "Makes your wand whisper how many souls you have.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/whisper_soul_count.png",
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
	},]]--
	{
		id					= "MOLES_SOULS_REAPER_BLADE",
		name				= "Reaper Blade",
		description			= "Enables your wand to cut the souls from your enemies.",
		sprite      	   = "mods/moles_souls/files/ui_gfx/actions/reaper_blade.png",
		type        		= ACTION_TYPE_PASSIVE,
		spawn_level      	= "1,2,3,4,5",
		spawn_probability	= "1,2,3,4,5",
		price				= 80,
		mana				= 0,
		custom_xml_file = "mods/moles_souls/files/entities/misc/reaper_blade.xml",
		action = function()
		end,
	},
	{
		id          = "MOLES_SOULS_SOUL_BLAST",
		name 		= "Soul Blast",
		description = "Converts a single soul into a powerful projectile.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_blast.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_blast.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 200,
		mana = 60,
		max_uses = 10,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_blast.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	{
		id          = "MOLES_SOULS_GOLD_TO_SOULS",
		name 		= "Gold to Souls",
		description = "Creates a soul using a sum of gold.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/gold_to_souls.png",
		related_projectiles	= {"mods/moles_souls/files/entities/misc/gold_to_souls.xml"},
		never_unlimited = true,
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
		price = 200,
		mana = 30,
		max_uses = 3,
		custom_xml_file = "mods/moles_souls/files/entities/misc/gold_to_souls.xml",
		action 		= function()
			--dofile("mods/moles_souls/files/scripts/projectiles/gold_to_souls.lua")
		end,
	},
	{
		id          = "MOLES_SOULS_SOUL_HALO",
		name 		= "Reaping Halo",
		description = "Summons a halo of soul energy that homes and causes enemies to drop their souls.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_halo.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/reaping_halo.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 160,
		mana = 80,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/reaping_halo.xml")
			c.fire_rate_wait = c.fire_rate_wait + 40
		end,
	},
	--[[{
		id          = "MOLES_SOULS_SOUL_SHOTGUN",
		name 		= "Soul Split",
		description = "Splits a soul into 3 projectiles.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_shotgun.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_shotgun.xml",3},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 160,
		mana = 25,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.spread_degrees = c.spread_degrees + 14.0
		end,
	},]]--
	--[[{
		id          = "MOLES_SOULS_SOUL_SHOTGUN_TRIGGER",
		name 		= "Soul Split with Trigger",
		description = "Splits a soul into 3 projectiles.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_shotgun_trigger.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_shotgun.xml",3},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 160,
		mana = 25,
		action 		= function()
			add_projectile_trigger_hit_world("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			add_projectile_trigger_hit_world("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			add_projectile_trigger_hit_world("mods/moles_souls/files/entities/projectiles/soul_shotgun.xml")
			c.fire_rate_wait = c.fire_rate_wait + 20
			c.spread_degrees = c.spread_degrees + 14.0
		end,
	},]]--
	{
		id          = "MOLES_SOULS_BATTERY",
		name 		= "Soul Battery",
		description = "Makes your spells consume souls instead of mana.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_battery.png",
		type 		= ACTION_TYPE_PASSIVE,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "1,1,1,1", 
		price = 300,
		mana = 0, 
		action 		= function()
            local entity_id = GetUpdatedEntityID()
            if entity_id ~= nil and entity_id ~= 0 then
                local px, py = EntityGetTransform(entity_id)
                local effect_id = EntityLoad("mods/moles_souls/files/entities/misc/status_entities/souls_as_mana.xml", px, py)
                EntityAddChild(entity_id, effect_id)
            end
		end,
	},
	{
		id          = "MOLES_SOULS_EXPLOSION",
		name 		= "Soul Detonation",
		description = "Detonates a soul to produce an explosion.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_explosion.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_detonation.xml"},
		type 		= ACTION_TYPE_STATIC_PROJECTILE,
		spawn_level                       = "2,3,4,5",
		spawn_probability                 = "2,3,4,5", 
		price = 120,
		mana = 10,
		--max_uses = 30,
		custom_xml_file = "mods/moles_souls/files/entities/misc/soul_detonation.xml",
		is_dangerous_blast = true,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_detonation.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
			c.screenshake = c.screenshake + 0.5
		end,
	},
	{
		id          = "MOLES_SOULS_SOUL_SLICE",
		name 		= "Soul Slice",
		description = "Converts a soul into a powerful blade.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_slice.png",
		related_projectiles	= {"mods/moles_souls/files/entities/projectiles/soul_slice.xml"},
		type 		= ACTION_TYPE_PROJECTILE,
		spawn_level                       = "2,3,4,5", 
		spawn_probability                 = "1,1,1,1", 
		price = 200,
		mana = 60,
		action 		= function()
			add_projectile("mods/moles_souls/files/entities/projectiles/soul_slice.xml")
			c.fire_rate_wait = c.fire_rate_wait + 10
		end,
	},
	--[[{
		id					= "MOLES_SOULS_SHROUD",
		name				= "Shroud",
		description			= "Consumes a soul to protect you with a veil of ghostly energy.",
		sprite				= "mods/moles_souls/files/ui_gfx/actions/shroud.png",
		type				= ACTION_TYPE_UTILITY,
		spawn_level			= "2,3,4,5",
		spawn_probability	= "1,1,1,1",
		price				= 200,
		mana				= 100,
		max_uses			= 10,
		action				= function()
			c.fire_rate_wait    = c.fire_rate_wait + 20
			dofile_once("mods/moles_souls/files/scripts/projectiles/shroud.lua")
		end,
	},]]--
	{
		id          = "MOLES_SOULS_SUMMON_SOUL",
		name 		= "Summon Soul",
		description = "Converts a soul into the animal it came from.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/summon_soul.png",
		related_projectiles	= {"mods/moles_souls/files/entities/misc/summon_soul.xml"},
		type 		= ACTION_TYPE_UTILITY,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
		price = 200,
		mana = 30,
		max_uses = 3,
		custom_xml_file = "mods/moles_souls/files/entities/misc/summon_soul.xml",
		action 		= function()
			--dofile("mods/moles_souls/files/scripts/projectiles/summon_soul.lua")
		end,
	},
	{
		id          = "MOLES_SOULS_RANDOM_SOUL",
		name 		= "Random Soul",
		description = "Causes enemies to drop a random soul on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/random_soul.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/random_soul.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
		price = 200,
		mana = 40,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/random_soul.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 15
			draw_actions( 1, true )
		end,
	},
	{
		id          = "MOLES_SOULS_LIVING_REAP",
		name 		= "Living Reap",
		description = "Causes enemies to drop a living soul on death.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/living_reap.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/living_reap.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "",
		spawn_probability                 = "",
		price = 150,
		mana = 30,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/living_reap.xml,"
			c.fire_rate_wait    = c.fire_rate_wait + 10
			draw_actions( 1, true )
		end,
	},
	{
		id          = "MOLES_SOULS_SOUL_SPEED",
		name 		= "Soul Speed",
		description = "Increases the power and speed of your spells at the cost of a soul.",
		sprite 		= "mods/moles_souls/files/ui_gfx/actions/soul_speed.png",
		related_extra_entities = { "mods/moles_souls/files/entities/misc/soul_speed.xml" },
		type 		= ACTION_TYPE_MODIFIER,
		spawn_level                       = "1,2,3,4,5",
		spawn_probability                 = "1,1,1,1,1",
		price = 120,
		mana = 15,
		action 		= function()
			c.extra_entities = c.extra_entities .. "mods/moles_souls/files/entities/misc/soul_speed.xml,"
			draw_actions( 1, true )
		end,
	},
}

for k, v in ipairs(to_insert) do
    table.insert(actions, v)
	--Print("moles_souls - There are " .. #to_insert .. " spells.")
end