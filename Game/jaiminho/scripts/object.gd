extends Area2D

@export var speed := 100.0
@export var is_food := true
@export var possible_textures: Array[Texture2D]
@onready var sprite := $Sprite2D

func _ready():
	if possible_textures.size() > 0:
		sprite.texture = possible_textures.pick_random()

func _process(delta):
	position.y += speed * delta
	
	if position.y > get_viewport_rect().size.y:
		if is_food:
			GameManager.lose_life()
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		if is_food:
			queue_free()
		else:
			GameManager.game_over()
