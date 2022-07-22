dofile("mods/moles_souls/files/utils.lua")

local souls = dofile("mods/moles_souls/files/scripts/souls.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = souls:get(1)
--local soul = EntityGetInRadiusWithTag( x, y, radius, "soul")[1]

local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
local projdamage = ComponentGetValue2( comp, "damage" )
local expdamage = ComponentObjectGetValue( comp, "config_explosion", "damage" )
local exprad = ComponentObjectGetValue( comp, "config_explosion", "explosion_radius" )
local cursedamage = ComponentObjectGetValue( comp, "damage_by_type", "curse" )
local icedamage = ComponentObjectGetValue( comp, "damage_by_type", "ice" )

if soul == nil then
	GamePrint("You have no souls.")
    EntityKill(entity_id)
end

GamePrint(tostring(soul))


--ORCS
if soul == "orcs" or "zombie" then
--if EntityHasTag( soul, "soul_orcs" ) or EntityHasTag( soul, "soul_zombie" ) then

    EntityAddComponent( entity_id, "SineWaveComponent", {
        _enabled="1",
        sinewave_freq="1.0",
        sinewave_m="0.6",
        lifetime="-1",
    } )

    EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_green",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )

    expdamage = expdamage * 1.2
    exprad = exprad * 2
    
    ComponentObjectSetValue( comp, "config_explosion", "damage", expdamage )
	ComponentObjectSetValue( comp, "config_explosion", "explosion_radius", exprad )

end


--GILDED
if soul == "gilded" then
--if EntityHasTag( soul, "soul_gilded" ) then

    EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="gold",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="60",
		count_max="80",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )
    
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
	
	EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_purple",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )

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

    EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_blue",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )

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
	
	EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_green_bright",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )

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

	EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_red",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )	

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

	EntityAddComponent( entity_id, "ParticleEmitterComponent", {
        _enabled="1",
        emitted_material_name="spark_purple_bright",
		x_pos_offset_min="0",
		x_pos_offset_max="0",
		y_pos_offset_min="0",
		y_pos_offset_max="0",
		x_vel_min="0",
		x_vel_max="0",
		y_vel_min="0",
		y_vel_max="0",
		count_min="20",
		count_max="60",
		lifetime_min="2.5",
		lifetime_max="5.5",
		is_trail="1",
		trail_gap="1.0",
		render_on_grid="1",
		fade_based_on_lifetime="1",
		airflow_force="0.1",
		airflow_time="0.001",
		airflow_scale="0.0833",
		emission_interval_min_frames="1",
		emission_interval_max_frames="1",
		emit_cosmetic_particles="1",
		create_real_particles="0",
		is_emitting="1",
    } )	

	EntityAddComponent( entity_id, "HomingComponent", {
		homing_targeting_coeff="130.0",
		homing_velocity_multiplier="0.86",
	} )

	projdamage = projdamage * 1.2

	ComponentSetValue2( comp, "damage", projdamage )
end


souls:remove(soul)