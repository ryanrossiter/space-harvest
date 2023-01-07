extends Sprite

func _process(delta):
	self.material.set_shader_param("offset", global_position * Vector2(1, -1))
