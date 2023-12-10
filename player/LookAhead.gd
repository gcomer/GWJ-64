extends Camera2D

export var LOOKAHEAD = 10.0

const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATION = 1.0

onready var tween = $ShiftTween

func _process(delta):
	pass

func _on_player_flashlight_look_at(direction):
	tween.interpolate_property(self, "position", position, direction * LOOKAHEAD, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
	tween.start()

func _on_player_cam_reset():
	tween.interpolate_property(self, "position", position, Vector2.ZERO, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
	tween.start()
