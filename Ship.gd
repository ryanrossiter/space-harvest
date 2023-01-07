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
	
	var gravity = -global_position.normalized() * GRAVITY * delta / (global_position / 200).length_squared()
	if gravity.length() > 1:
		velocity *= 1 / gravity.length()
		angularVelocity *= 1 / gravity.length()
		rotation += Vector2.RIGHT.rotated(rotation).angle_to(Vector2.RIGHT.rotated(global_position.angle_to_point(Vector2.ZERO) + PI / 2)) * 0.1
	velocity += gravity

	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation) * ACCELERATION * delta

	velocity = move_and_slide(velocity)
