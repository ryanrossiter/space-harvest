extends StaticBody2D

const AsteroidFragment = preload("res://AsteroidFragment.tscn")
const ResourceCls = preload("res://Resource.tscn")

export(float) var max_random_linear_velocity = 1;
export(float) var max_random_angular_velocity = 0.2;

export(int) var health = 5;
export(int) var fragments = 5

onready var sprite = $Sprite

func _ready():
	sprite.frame = randi() % sprite.hframes
	#linear_velocity = Vector2(rand_range(-max_random_linear_velocity, max_random_linear_velocity), rand_range(-max_random_linear_velocity, max_random_linear_velocity))
	#angular_velocity = rand_range(-max_random_angular_velocity, max_random_angular_velocity)

func damage(pts):
	if health <= 0:
		return # already dead

	health -= pts
	if health <= 0:
		queue_free()
		
		for n in fragments:
			var fragment = AsteroidFragment.instance()
			fragment.global_position = global_position + Vector2(rand_range(-20, 20), rand_range(-20, 20))
			get_parent().add_child(fragment)

		var resource = ResourceCls.instance()
		resource.resource_type = ResourceTypes.ResourceType.values()[randi() % ResourceTypes.ResourceType.size()]
		resource.global_position = global_position
		get_parent().add_child(resource)
