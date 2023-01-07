extends Node2D

const MIN_DISTANCE = 300

func _process(delta):
	if global_position.distance_to(Vector2.ZERO) > MIN_DISTANCE:
		visible = true
		look_at(Vector2.ZERO)
		rotation += PI / 2
		#rotation = -get_parent().rotation + global_position.angle_to_point(Vector2.ZERO) - PI / 2
	else:
		visible = false
