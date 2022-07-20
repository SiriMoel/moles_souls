dofile("mods/moles_souls/files/utils.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )

local soul = EntityGetInRadiusWithTag( x, y, radius, "soul")[1]

--[[

TODO

orcs gives more explosion and radius + slithering path? + spark_green 

mage gives more curse + projectile area teleport + spark_blue

slime gives more cold + personal gravity field + spark_purple

bat gives homing + spark_purple

fly gives more projectile + chaotic path + spark_green

spider gives matter eater + poison trail + venemous curse + less projectile + spark_pink (is that a thing?)

gilded gives gold (the material) trail + ALL weakening curses + gold

]]--

local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
local projdamage = ComponentGetValue2( comp, "damage" )
local expdamage = ComponentObjectGetValue( comp, "config_explosion", "damage" )
local exprad = ComponentObjectGetValue( comp, "config_explosion", "explosion_radius" )
local cursedamage = ComponentObjectGetValue( comp, "damage_by_type", "curse" )


if soul == nil then
    EntityKill(entity_id)
end

if EntityHasTag( soul, "soul_orcs" ) then

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

if EntityHasTag( soul, "soul_gilded" ) then

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
		create_real_particles="1",
		is_emitting="1",
    } )
    
end

if EntityHasTag( soul, "soul_mage" ) then

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

EntityKill(soul)