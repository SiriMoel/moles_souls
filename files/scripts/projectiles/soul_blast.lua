dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = souls:get(1)

local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
local projdamage = ComponentGetValue2( comp, "damage" )
local expdamage = ComponentObjectGetValue( comp, "config_explosion", "damage" )
local exprad = ComponentObjectGetValue( comp, "config_explosion", "explosion_radius" )
local cursedamage = ComponentObjectGetValue( comp, "damage_by_type", "curse" )
local icedamage = ComponentObjectGetValue( comp, "damage_by_type", "ice" )

if soul == nil then
	GamePrint("You have no souls.")

	local projcomp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

	ComponentSetValue2( projcomp, "on_death_explode", false )
	ComponentSetValue2( projcomp, "on_lifetime_out_explode", false )
	ComponentSetValue2( projcomp, "collide_with_entities", false )
	ComponentSetValue2( projcomp, "collide_with_world", false )
	ComponentSetValue2( projcomp, "lifetime", 1 )

    EntityKill(entity_id)
end

if ModSettingGet( "moles_souls.say_consumed_soul" ) then
	GamePrint( "You have consumed a " .. soul  " soul." )
end

local particlecomp = EntityGetFirstComponent(entity_id, "ParticleEmitterComponent")

if soul == "living_quest" then 
	GamePrint("QUEST - WIP")

	local projcomp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )

	ComponentSetValue2( projcomp, "on_death_explode", false )
	ComponentSetValue2( projcomp, "on_lifetime_out_explode", false )
	ComponentSetValue2( projcomp, "collide_with_entities", false )
	ComponentSetValue2( projcomp, "collide_with_world", false )
	ComponentSetValue2( projcomp, "lifetime", 1 )

    EntityKill(entity_id)
end

--ORCS
if soul == "orcs" or soul == "zombie" then
--if EntityHasTag( soul, "soul_orcs" ) or EntityHasTag( soul, "soul_zombie" ) then

    EntityAddComponent( entity_id, "SineWaveComponent", {
        _enabled="1",
        sinewave_freq="1.0",
        sinewave_m="0.6",
        lifetime="-1",
    } )

	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_green" )
	end)

	--[[


	]]

    expdamage = expdamage * 1.2
    exprad = exprad * 2
    
    ComponentObjectSetValue( comp, "config_explosion", "damage", expdamage )
	ComponentObjectSetValue( comp, "config_explosion", "explosion_radius", exprad )

end


--GILDED
if soul == "gilded" then
--if EntityHasTag( soul, "soul_gilded" ) then

	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "gold" )
	end)
    
	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/curse_wither_projectile.xml",
	} )

	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/curse_wither_melee.xml",
	} )

	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/curse_wither_explosion.xml",
	} )

	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/curse_wither_electricity.xml",
	} )

end

--SPIDER
if soul == "spider" then
--if EntityHasTag( soul, "soul_spider" ) then
	
	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_purple" )
	end)

	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/curse_init.xml",
	} )

	EntityAddComponent( entity_id, "CellEaterComponent", { 
		eat_probability="90",
        radius="16",
		ignored_material="rock_static_cursed",
		ignored_material_tag="[matter_eater_ignore_list]",
	} )

end


--MAGE
if soul == "mage" then
--if EntityHasTag( soul, "soul_mage" ) then

	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_blue" )
	end)

    EntityAddComponent( entity_id, "LuaComponent", {
		script_source_file="mods/moles_souls/files/scripts/projectiles/soul_blast_homing_area.lua",
		execute_every_n_frame="1",
    } )

    cursedamage = cursedamage + 1
    cursedamage = cursedamage * 2

    ComponentObjectSetValue( comp, "damage_by_type", "curse", cursedamage )

end

--SLIMES
if soul == "slimes" then
--if EntityHasTag( soul, "soul_slimes" ) then
	
	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_green_bright" )
	end)

	EntityAddComponent( entity_id, "HitEffectComponent", { 
		effect_hit="LOAD_UNIQUE_CHILD_ENTITY",
		value_string="data/entities/misc/gravity_field_enemy.xml",
	} )

	icedamage = icedamage + 2
	icedamage = icedamage * 2

	ComponentObjectSetValue( comp, "damage_by_type", "ice", icedamage )

end

--FLY
if soul == "fly" then
--if EntityHasTag( soul, "soul_fly" ) then

	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_red" )
	end)

	EntityAddComponent( entity_id, "LuaComponent", {
		script_source_file="data/scripts/projectiles/chaotic_arc.lua",
		execute_every_n_frame="2",
    } )

	EntityAddComponent( entity_id, "HomingComponent", {
		homing_targeting_coeff="130.0",
		homing_velocity_multiplier="0.86",
	} )

	projdamage = projdamage + 1
	projdamage = projdamage * 1.4

	ComponentSetValue2( comp, "damage", projdamage )
end


--BAT
if soul == "bat" then
--if EntityHasTag( soul, "soul_bat" ) then

	edit_component( entity_id, "ParticleEmitterComponent", function(comp3,vars)		
		ComponentSetValue2( particlecomp, "emitted_material_name", "spark_purple_bright" )
	end)

	EntityAddComponent( entity_id, "HomingComponent", {
		homing_targeting_coeff="130.0",
		homing_velocity_multiplier="0.86",
	} )

	projdamage = projdamage * 1.2

	ComponentSetValue2( comp, "damage", projdamage )
end

souls:remove(soul)