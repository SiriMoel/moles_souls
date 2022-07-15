dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local root_id = EntityGetRootEntity( entity_id )
local x, y = EntityGetTransform( entity_id )
local radius = 160

local count = 0

local souls = EntityGetInRadiusWithTag( x, y, radius, "soul" )

local comp = EntityGetFirstComponent( entity_id, "ProjectileComponent" )
local who_shot

if ( comp ~= nil ) then
    who_shot = ComponentGetValue2( comp, "mWhoShot" )
end

if ( who_shot ~= nil ) and ( comp ~= nil ) then
	for i,projectile_id in ipairs(souls) do
		if ( projectile_id ~= root_id ) and ( projectile_id ~= entity_id ) and ( projectile_id ~= who_shot ) and ( EntityHasTag( projectile_id, "souls_to_power_target" ) == false ) then
			local comp2 = EntityGetFirstComponent( projectile_id, "DamageModelComponent" )
			
			if ( comp2 ~= nil ) then
				local amount = 0.5
				
				count = count + math.max( 0.5, amount * 0.25 )
				
				EntityAddTag( projectile_id, "souls_to_power_target" )
			end
		end
	end
	
	local damage = ComponentGetValue2( comp, "damage" )
	local expdamage = ComponentObjectGetValue( comp, "config_explosion", "damage" )
	local exprad = ComponentObjectGetValue( comp, "config_explosion", "explosion_radius" )
	
	damage = damage + math.min( 120, count * 0.25 )
	expdamage = expdamage + math.min( 120, count * 0.25 )
	exprad = math.max( exprad,  math.min( 120, math.floor( exprad + math.log( count * 5.5 ) ) ) )
	
	-- print("FINAL: " .. tostring(count))
	
	ComponentSetValue2( comp, "damage", damage )
	ComponentObjectSetValue( comp, "config_explosion", "damage", expdamage )
	ComponentObjectSetValue( comp, "config_explosion", "explosion_radius", exprad )
	
    local effect_id = EntityLoad("mods/moles_souls/files/entities/particles/souls_to_power.xml", x, y)
	EntityAddChild( root_id, effect_id )
	
	edit_component( effect_id, "ParticleEmitterComponent", function(comp3,vars)
		local part_min = math.min( math.floor( count * 0.5 ), 100 )
		local part_max = math.min( count + 1, 120 )
		
		ComponentSetValue2( comp3, "count_min", part_min )
		ComponentSetValue2( comp3, "count_max", part_max )
	end)

    EntityKill(souls)
end