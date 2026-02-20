extends Control

@onready var card_history = $CardHistory
@onready var card_controller = $CardController
@onready var card_end = $CardEnd

enum MenuState {
	HISTORY,
	CONTROLS,
	END
}

var state := MenuState.HISTORY

func _ready():
	GameManager.game_overed.connect(_on_game_end)
	GameManager.win.connect(_on_game_end)

	if GameManager.skip_intro:
		GameManager.skip_intro = false
		visible = false
		GameManager.start_game()
	else:
		show_history()

# -------- MOSTRAR CARDS --------

func show_history():
	state = MenuState.HISTORY
	visible = true
	card_history.visible = true
	card_controller.visible = false
	card_end.visible = false

func show_controls():
	state = MenuState.CONTROLS
	card_history.visible = false
	card_controller.visible = true
	card_end.visible = false

func show_end():
	state = MenuState.END
	visible = true
	card_history.visible = false
	card_controller.visible = false
	card_end.visible = true

# -------- BOTÕES --------

func _on_btn_next_pressed():
	show_controls()

func _on_btn_prev_pressed():
	show_history()

func _on_btn_play_pressed():
	visible = false
	GameManager.start_game()

func _on_btn_replay_pressed():
	GameManager.restart_game(true)

func _on_btn_menu_pressed():
	GameManager.restart_game(false)

func _on_game_end():
	show_end()
