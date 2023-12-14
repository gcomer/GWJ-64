extends Area2D

export var fuel_value = 1.0
export var base_texture : StreamTexture
export var highlighted_texture : StreamTexture
var player

onready var sprite = $Sprite
onready var hint = $Control/PickupHint
onready var can_pickup = false

func _on_Area2D_area_entered(area):
	if area.get_name() != "player":
		pass
	else:
		if Globals.show_pickup_hint:
			hint.visible = true
		can_pickup = true
		sprite.texture = highlighted_texture

func _on_Area2D_area_exited(area):
	if area.get_name() != "player":
		pass
	else:
		hint.visible = false
		can_pickup = false
		sprite.texture = base_texture

func _process(delta):
	if can_pickup:
		if Input.is_action_just_pressed("interact"):
			pickup()

func pickup():
	Globals.fuel_collected += fuel_value
	queue_free()
