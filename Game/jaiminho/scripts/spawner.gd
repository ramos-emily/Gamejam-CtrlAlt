extends Node2D

@export var food_scene: PackedScene
@export var junk_scene: PackedScene

@export var spawn_delay := 0.8

func _ready():
	spawn_loop()

func spawn_loop():
	while true:
		spawn_object()
		await get_tree().create_timer(spawn_delay).timeout

func spawn_object():
	var scene: PackedScene
	
	if randf() < 0.6:
		scene = food_scene
	else:
		scene = junk_scene
	
	var obj = scene.instantiate()
	add_child(obj)
	
	var screen_width = get_viewport_rect().size.x
	obj.position = Vector2(
		randf_range(16, screen_width - 16),
		-16
	)
