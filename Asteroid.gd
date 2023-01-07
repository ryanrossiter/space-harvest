extends RigidBody2D

export(float) var max_random_linear_velocity = 1;
export(float) var max_random_angular_velocity = 0.2;

onready var sprite = $Sprite

func _ready():
	sprite.frame = randi() % sprite.hframes
	#linear_velocity = Vector2(rand_range(-max_random_linear_velocity, max_random_linear_velocity), rand_range(-max_random_linear_velocity, max_random_linear_velocity))
	angular_velocity = rand_range(-max_random_angular_velocity, max_random_angular_velocity)


