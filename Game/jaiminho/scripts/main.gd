extends Node2D

var lives := 3
var time_left := 120.0

func _process(delta):
	time_left -= delta
	if time_left <= 0:
		win()

func lose_life():
	lives -= 1
	if lives <= 0:
		game_over()

func win():
	print("GANHOU")
	get_tree().paused = true

func game_over():
	print("PERDEU")
	get_tree().paused = true
