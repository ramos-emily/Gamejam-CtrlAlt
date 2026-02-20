extends Node2D

@export var food_scene: PackedScene
@export var junk_scene: PackedScene

@export var spawn_delay := 1.0

const GAME_WIDTH := 320

func _ready():
	start_spawn()

func start_spawn():
	await wait_for_game_start()
	spawn_loop()

func wait_for_game_start():
	while not GameManager.playing:
		await get_tree().process_frame
	
	await get_tree().create_timer(2.0).timeout

func spawn_loop():
	while true:
		await get_tree().create_timer(spawn_delay).timeout
		
		if not GameManager.playing:
			continue
			
		spawn_object()

func spawn_object():
	var scene := food_scene if randf() < 0.6 else junk_scene
	var obj = scene.instantiate()
	
	obj.position = Vector2(
		randf_range(0, GAME_WIDTH),
		-10
	)
	
	add_child(obj)
