extends Label

export(float) var lifetime = 1.5
export(float) var speed = 20

func _process(delta):
	rect_global_position.y -= speed * delta
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
