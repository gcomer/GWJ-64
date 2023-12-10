extends Node

signal timeout()

export var wait_time = 60.0
export var time_scale = 1.0

onready var running = false
onready var current_time = wait_time

func _process(delta):
	if running:
		current_time -= delta * time_scale
		if current_time <= 0.0:
			emit_signal("timeout")
			stop()

func time_left():
	return current_time

func total_time():
	return wait_time

func set_time_scale(s):
	time_scale = s

func start(s):
	wait_time = s
	current_time = wait_time
	running = true

func resume():
	running = true

func stop():
	running = false
