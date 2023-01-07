extends KinematicBody2D

const ROTATION_ACCELERATION = 0.1
const MAX_ROTATION_SPEED = 1.2
const MAX_SPEED = 200
const ACCELERATION = 100
const GRAVITY = 5

var velocity = Vector2.ZERO
var angularVelocity = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		angularVelocity += ROTATION_ACCELERATION * delta
	if Input.is_action_pressed("ui_left"):
		angularVelocity -= ROTATION_ACCELERATION * delta
	angularVelocity = clamp(angularVelocity, -MAX_ROTATION_SPEED, MAX_ROTATION_SPEED) * 0.99
	rotation += angularVelocity
	
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation) * ACCELERATION * delta
	var gravity = -global_position.normalized() * GRAVITY * delta / (global_position / 200).length_squared()
	velocity += gravity

	velocity = move_and_slide(velocity)
