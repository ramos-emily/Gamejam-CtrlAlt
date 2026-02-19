extends Node2D

@export var full_heart: Texture2D
@export var empty_heart: Texture2D

@onready var hearts := [
	$Hearts1,
	$Hearts2,
	$Hearts3
]

func _ready():
	GameManager.lives_changed.connect(update_hearts)
	update_hearts()


func update_hearts():
	for i in hearts.size():
		if i < GameManager.lives:
			hearts[i].texture = full_heart
		else:
			hearts[i].texture = empty_heart
