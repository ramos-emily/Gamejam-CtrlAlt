extends Node

signal lives_changed
signal time_changed
signal win

var lives := 3
var time_left := 60.0 

func reset():
	lives = 3
	time_left = 60.0
	emit_signal("lives_changed")
	emit_signal("time_changed")

func lose_life():
	lives -= 1
	emit_signal("lives_changed")
	if lives <= 0:
		game_over()

func game_over():
	await get_tree().create_timer(0.2).timeout
	reset()
	get_tree().reload_current_scene()

func win_game():
	print("YOU WIN!")
	await get_tree().create_timer(0.2).timeout
	reset()
	get_tree().reload_current_scene()
