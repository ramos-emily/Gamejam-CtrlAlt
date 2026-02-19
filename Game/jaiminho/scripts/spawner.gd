extends Node2D

@export var food_scene: PackedScene
@export var junk_scene: PackedScene

@export var spawn_delay := 1.5

const GAME_WIDTH := 320

func _ready():
	spawn_loop()

func spawn_loop():
	
	while true:
		await get_tree().create_timer(spawn_delay).timeout
		spawn_object()

func spawn_object():
	var scene := food_scene if randf() < 0.6 else junk_scene
	var obj = scene.instantiate()
	
	obj.position = Vector2(
		randf_range(0, GAME_WIDTH),
		-10
	)
	
	add_child(obj)
