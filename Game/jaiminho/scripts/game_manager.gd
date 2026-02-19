extends Node

var lives := 3
var is_game_over := false

func reset():
	lives = 3
	is_game_over = false

func lose_life():
	if is_game_over:
		return
	
	lives -= 1
	print("Vida:", lives)
	
	if lives <= 0:
		game_over()

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	print("GAME OVER")
	
	await get_tree().create_timer(0.2).timeout
	reset()
	get_tree().reload_current_scene()
