extends Node

var lives := 3

func lose_life():
	lives -= 1
	print("Vida perdida! Vidas:", lives)
	if lives <= 0:
		game_over()

func game_over():
	print("GAME OVER")
	get_tree().reload_current_scene()
