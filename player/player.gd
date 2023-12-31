extends Area2D

export var speed = 400 
export var time_til_frozen = 60

var screen_size
const MAP_SIZE_X = 800
const MAP_SIZE_Y = 800
const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATION = 1.0

onready var tween = $TurnTween
onready var flashlight_direction = Vector2.ZERO
onready var mouse_pos = Vector2.ZERO
onready var FreezeTimer = $FreezeTimer
onready var FrostBorder = $FrostBorder
onready var target_angle = 0.0


signal flashlight_look_at(direction)
signal cam_reset()
signal turn(angle)

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	#remove this later
	#freezing should be triggered by a signal when you enter a snow zone
	FreezeTimer.start(time_til_frozen)

func _process(delta):
	flashlight(delta)
	move(delta)
	turn(delta)
	frost()

func flashlight(delta):
	var new_mouse_pos = get_global_mouse_position()
	var new_direction = Vector2.ZERO
	if Input.is_action_pressed("look_left"):
		new_direction.x -= Input.get_action_strength("look_left")
	if Input.is_action_pressed("look_right"):
		new_direction.x += Input.get_action_strength("look_right")
	if Input.is_action_pressed("look_up"):
		new_direction.y -= Input.get_action_strength("look_up")
	if Input.is_action_pressed("look_down"):
		new_direction.y += Input.get_action_strength("look_down")
	
	#controller mode
	if new_direction.length() > 0:
		flashlight_direction = new_direction.normalized()
		$Body.look_at(global_position + flashlight_direction)
	#mouse mode
	elif new_mouse_pos != mouse_pos:
		$Body.look_at(new_mouse_pos)
		mouse_pos = new_mouse_pos
		flashlight_direction = get_local_mouse_position().normalized()
	
	if Input.is_action_pressed("zoom"):
		emit_signal("flashlight_look_at", flashlight_direction)
	elif Input.is_action_just_released("zoom"):
		emit_signal("cam_reset")

func move(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		velocity = velocity.rotated(rotation)
	
	position += velocity * delta
	position.x = clamp(position.x, -MAP_SIZE_X/2, MAP_SIZE_X/2)
	position.y = clamp(position.y, -MAP_SIZE_Y/2, MAP_SIZE_Y/2)

func turn(delta):
	if Input.is_action_just_pressed("turn_left"):
		target_angle -= 45.0
		print("new target:", target_angle)
		emit_signal("turn", target_angle)
		tween.interpolate_property(self, "rotation_degrees", rotation_degrees, target_angle, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
		tween.start()
	if Input.is_action_just_pressed("turn_right"):
		target_angle += 45.0
		print("new target:", target_angle)
		emit_signal("turn", target_angle)
		tween.interpolate_property(self, "rotation_degrees", rotation_degrees, target_angle, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
		tween.start()
	

func frost():
	if FreezeTimer.time_left() > 0:
		FrostBorder.modulate.a = 1 - FreezeTimer.time_left() / FreezeTimer.total_time()
	else:
		FrostBorder.modulate.a = 1

func _on_FreezeTimer_timeout():
	print("you died")
	pass
