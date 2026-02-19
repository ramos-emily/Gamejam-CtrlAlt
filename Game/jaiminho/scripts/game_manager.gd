extends Node

var lives := 3
var is_game_over := false
signal lives_changed

func lose_life():
	lives -= 1
	emit_signal("lives_changed")
	if lives <= 0:
		game_over()


func reset():
	lives = 3
	is_game_over = false

func game_over():
	if is_game_over:
		return
	
	is_game_over = true
	print("GAME OVER")
	
	await get_tree().create_timer(0.2).timeout
	reset()
	get_tree().reload_current_scene()
