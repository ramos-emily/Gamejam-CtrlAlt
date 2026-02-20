extends CharacterBody2D

@export var speed := 200.0

func _physics_process(_delta):
	var dir := 0.0
	
	# Teclado
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if Input.is_action_pressed("ui_right"):
		dir += 1
	
	velocity.x = dir * speed
	move_and_slide()
	
	## Mouse (prioridade)
	#if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) == false:
		#var mouse_x = get_global_mouse_position().x
		#global_position.x = lerp(global_position.x, mouse_x, 0.2)
	#else:
		#velocity.x = dir * speed
		#move_and_slide()

func _on_area_entered(area):
	if area.is_food:
		area.queue_free()
	else:
		get_tree().quit()
