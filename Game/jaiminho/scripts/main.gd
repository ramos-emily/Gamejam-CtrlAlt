extends Node2D

var lives := 3
var time_left := 60.0

func _process(delta):
	if not GameManager.playing:
		return

	GameManager.time_left -= delta

	if GameManager.time_left <= 0:
		GameManager.win_game()
	else:
		GameManager.emit_signal("time_changed")

func lose_life():
	lives -= 1
	if lives <= 0:
		game_over()

func win():
	print("GANHOU")
	get_tree().paused = true
	
@onready var timer_label := $TimerLabel

func _ready():
	GameManager.time_changed.connect(update_timer)
	update_timer()

func update_timer():
	var seconds := int(GameManager.time_left)
	var minutes := seconds / 60
	var secs := seconds % 60
	timer_label.text = "%02d:%02d" % [minutes, secs]

func game_over():
	print("PERDEU")
	get_tree().paused = true
