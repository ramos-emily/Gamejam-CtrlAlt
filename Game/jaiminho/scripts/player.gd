extends CharacterBody2D

@export var speed := 200.0
const GAME_WIDTH := 320

func _physics_process(delta):
	var dir := 0.0
	
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if Input.is_action_pressed("ui_right"):
		dir += 1
	
	# Movimento manual
	global_position.x += dir * speed * delta
	
	wrap_screen()
	
	global_position.x = floor(global_position.x)

func wrap_screen():
	if global_position.x < 0:
		global_position.x += GAME_WIDTH
	elif global_position.x >= GAME_WIDTH:
		global_position.x -= GAME_WIDTH
