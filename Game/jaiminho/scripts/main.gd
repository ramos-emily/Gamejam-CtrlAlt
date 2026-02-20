extends Node2D

var lives := 3
var time_left := 60.0

# referência para o AudioStreamPlayer2D
@onready var bgm := $AudioStreamPlayer2D
@onready var timer_label := $TimerLabel
@onready var player := $Player

func _ready():
	GameManager.time_changed.connect(update_timer)

	if player:
		player.died.connect(_on_player_died)

	update_timer()

func _process(delta):
	if not GameManager.playing:
		return

	# tocar música quando o jogo começar
	if not bgm.playing:
		bgm.play()

	GameManager.time_left -= delta

	if GameManager.time_left <= 0:
		GameManager.win_game()
		stop_bgm() # parar música
	else:
		GameManager.emit_signal("time_changed")

func lose_life():
	lives -= 1
	if lives <= 0:
		game_over()

func win():
	print("GANHOU")
	get_tree().paused = true
	stop_bgm() # parar música

func game_over():
	print("PERDEU")
	get_tree().paused = true
	stop_bgm() # parar música

func update_timer():
	var seconds := int(GameManager.time_left)
	var minutes := seconds / 60
	var secs := seconds % 60
	timer_label.text = "%02d:%02d" % [minutes, secs]

func stop_bgm():
	if bgm.playing:
		bgm.stop()

func _on_player_died():
	# para a música IMEDIATAMENTE ao morrer
	if bgm.playing:
		bgm.stop()
