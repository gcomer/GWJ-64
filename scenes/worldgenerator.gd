extends Node2D


# Declare member variables here. Examples:
export var width := 128
export var height := 128
onready var tilemap := $TileMap
var openSimplexNoise := OpenSimplexNoise.new()

var matrix = []

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	openSimplexNoise.seed = randi()
	openSimplexNoise.octaves = 5
	generate_map()

func generate_map():
	for x in width:
		matrix.append([])
		for y in height:
			matrix[x].append(floor((abs(openSimplexNoise.get_noise_2d(x,y)))*5))
			tilemap.set_cell(x,y, matrix[x][y])
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _input(event: InputEvent):
#	if event.is_action_pressed("ui_end"):
#		matrix = []
#		randomize()
#		openSimplexNoise.seed = randi()
#		openSimplexNoise.octaves = 5
#		generate_map()


