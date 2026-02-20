extends Node

signal lives_changed
signal time_changed
signal game_overed
signal win

var lives := 3
var time_left := 60.0
var playing := false
var skip_intro := false

func start_game():
	playing = true
	reset()

func reset():
	lives = 3
	time_left = 60.0
	emit_signal("lives_changed")
	emit_signal("time_changed")

func lose_life():
	if not playing:
		return

	lives -= 1
	emit_signal("lives_changed")

	if lives <= 0:
		game_over()

func game_over():
	if not playing:
		return

	playing = false
	
	await get_tree().create_timer(0.5).timeout
	
	emit_signal("game_overed")

func win_game():
	if not playing:
		return

	playing = false
	emit_signal("win")

# CHAMADO PELO MENU
func restart_game(direct_start := false):
	skip_intro = direct_start
	get_tree().reload_current_scene()
