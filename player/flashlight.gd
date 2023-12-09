extends Node2D

onready var direction = Vector2.ZERO
onready var mouse_pos = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var new_mouse_pos = get_global_mouse_position()
	var new_direction = Vector2.ZERO
	if Input.is_action_pressed("look_left"):
		new_direction.y += Input.get_action_strength("look_left")
	if Input.is_action_pressed("look_right"):
		new_direction.y -= Input.get_action_strength("look_right")
	if Input.is_action_pressed("look_up"):
		new_direction.x -= Input.get_action_strength("look_up")
	if Input.is_action_pressed("look_down"):
		new_direction.x += Input.get_action_strength("look_down")
	
	#controller mode
	if new_direction.length() > 0:
		direction = new_direction.normalized()
		look_at(global_position + direction)
	#mouse mode
	elif new_mouse_pos != mouse_pos:
		look_at(new_mouse_pos)
		mouse_pos = new_mouse_pos
	
	#rotate beam towards direction vector
	
