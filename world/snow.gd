extends CPUParticles2D

# good wind speed values:
#  - low  = 20
#  - med  = 30
#  - high = 50
export var wind_speed = 20
export (String, "N", "NE", "E", "SE", "S", "SW", "W", "NW") var wind_direction

func _ready():
	match wind_direction:
		"N":
			gravity.x = 0.0
			gravity.y = -wind_speed
			direction.x = 0.0
			direction.y = -wind_speed
		"NE":
			gravity.x = wind_speed
			gravity.y = -wind_speed
			direction.x = wind_speed
			direction.y = -wind_speed
		"E":
			gravity.x = wind_speed
			gravity.y = 0.0
			direction.x = wind_speed
			direction.y = 0.0
		"SE":
			gravity.x = wind_speed
			gravity.y = wind_speed
			direction.x = wind_speed
			direction.y = wind_speed
		"S":
			gravity.x = 0.0
			gravity.y = wind_speed
			direction.x = 0.0
			direction.y = wind_speed
		"SW":
			gravity.x = -wind_speed
			gravity.y = wind_speed
			direction.x = -wind_speed
			direction.y = wind_speed
		"W":
			gravity.x = -wind_speed
			gravity.y = 0.0
			direction.x = -wind_speed
			direction.y = 0.0
		"NW":
			gravity.x = -wind_speed
			gravity.y = -wind_speed
			direction.x = -wind_speed
			direction.y = -wind_speed
		
