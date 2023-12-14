extends Node2D

const SHIFT_TRANS = Tween.TRANS_SINE
const SHIFT_EASE = Tween.EASE_OUT
const SHIFT_DURATION = 1.0

onready var tween = $TurnTween

func _on_player_turn(angle):
	tween.interpolate_property(self, "rotation_degrees", rotation_degrees, angle, SHIFT_DURATION, SHIFT_TRANS, SHIFT_EASE)
	tween.start()
