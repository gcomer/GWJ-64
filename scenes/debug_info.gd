extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	var timer = "%d:%02d" % [floor($"../FreezeTimer".time_left() / 60), int($"../FreezeTimer".time_left()) % 60]
	$Label.text = "DEBUG INFO\nTIMER 1 : " + timer
