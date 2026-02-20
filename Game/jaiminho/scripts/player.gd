extends CharacterBody2D

@export var speed := 200.0
const GAME_WIDTH := 320

@onready var sprite := $Sprite2D

var sprite_idle = preload("res://assets/Person/Person.png")
var sprite_move = preload("res://assets/Person/Person-ba.png")
var sprite_eat = preload("res://assets/Person/Person-bf.png")
var sprite_dead = preload("res://assets/Person/Person-dead.png")

var is_dead := false
var eat_timer := 0.0
var eat_duration := 0.3

func _physics_process(delta):
	if is_dead:
		return
	
	var dir := 0.0
	
	if Input.is_action_pressed("ui_left"):
		dir -= 1
	if Input.is_action_pressed("ui_right"):
		dir += 1
	
	global_position.x += dir * speed * delta
	
	wrap_screen()
	global_position.x = floor(global_position.x)
	
	update_sprite(dir, delta)

func update_sprite(dir, delta):
	# Se estiver no estado de comer
	if eat_timer > 0:
		eat_timer -= delta
		if eat_timer <= 0:
			eat_timer = 0
		sprite.texture = sprite_eat
		return
	
	# Movimento
	if dir != 0:
		sprite.texture = sprite_move
	else:
		sprite.texture = sprite_idle

func play_eat_animation():
	eat_timer = eat_duration

func play_dead():
	is_dead = true
	sprite.texture = sprite_dead

func wrap_screen():
	if global_position.x < 0:
		global_position.x += GAME_WIDTH
	elif global_position.x >= GAME_WIDTH:
		global_position.x -= GAME_WIDTH
