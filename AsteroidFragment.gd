extends RigidBody2D

const regions = [
	Rect2(10, 20, 16, 16),
	Rect2(88, 3, 17, 16),
	Rect2(38, 30, 16, 18),
	Rect2(171, 24, 16, 16)
];

export(float) var angular_velocity_range = 0.5
export(float) var linear_velocity_range = 10
export(float) var min_lifetime = 10
onready var sprite = $Sprite

var lifetime

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.region_rect = regions[randi() % regions.size()]
	angular_velocity = rand_range(-angular_velocity_range, angular_velocity_range)
	linear_velocity = Vector2.UP.rotated(rand_range(0, PI * 2)) * linear_velocity_range
	lifetime = min_lifetime + rand_range(0, 3) # Add some randomness to lifetime

func _process(delta):
	lifetime -= delta
	if lifetime <= 0:
		queue_free()
