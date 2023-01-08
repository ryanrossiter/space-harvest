extends RigidBody2D


export(float) var angular_velocity_range = 0.5
export(float) var linear_velocity_range = 10

var velocity = Vector2.ZERO

func _ready():
	angular_velocity = rand_range(-angular_velocity_range, angular_velocity_range)
	linear_velocity = Vector2.UP.rotated(rand_range(0, PI * 2)) * linear_velocity_range
