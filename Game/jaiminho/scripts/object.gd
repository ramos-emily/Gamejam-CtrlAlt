extends Area2D

@export var fall_speed := 120.0
@export var is_food := true

func _process(delta):
	position.y += fall_speed * delta

func _on_body_entered(body):
	if body.name == "Floor":
		if is_food:
			get_node("/root/Main").lose_life()
		queue_free()
