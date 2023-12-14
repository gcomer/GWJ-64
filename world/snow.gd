extends CPUParticles2D

# good wind grav values:
#  - low  = 25
#  - med  = 50
#  - high = 100
var wind_grav
export (String, "low", "med", "high") var wind_strength
export (String, "N", "NE", "E", "SE", "S", "SW", "W", "NW") var wind_direction

func _ready():
	match wind_strength:
		"low":
			wind_grav = 25
			initial_velocity = 50
			amount = 5000
		"med":
			wind_grav = 50
			initial_velocity = 100
			amount = 7500
		"high":
			wind_grav = 100
			initial_velocity = 100
			amount = 10000
	
	match wind_direction:
		"N":
			gravity.x = 0.0
			gravity.y = -wind_grav
			direction.x = 0.0
			direction.y = -1
		"NE":
			gravity.x = wind_grav
			gravity.y = -wind_grav
			direction.x = 1
			direction.y = -1
		"E":
			gravity.x = wind_grav
			gravity.y = 0.0
			direction.x = 1
			direction.y = 0.0
		"SE":
			gravity.x = wind_grav
			gravity.y = wind_grav
			direction.x = 1
			direction.y = 1
		"S":
			gravity.x = 0.0
			gravity.y = wind_grav
			direction.x = 0.0
			direction.y = 1
		"SW":
			gravity.x = -wind_grav
			gravity.y = wind_grav
			direction.x = -1
			direction.y = 1
		"W":
			gravity.x = -wind_grav
			gravity.y = 0.0
			direction.x = -1
			direction.y = 0.0
		"NW":
			gravity.x = -wind_grav
			gravity.y = -wind_grav
			direction.x = -1
			direction.y = -1
		
