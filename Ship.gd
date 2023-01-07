extends KinematicBody2D

onready var booster = $Booster
onready var drillParticles = $DrillParticles

export(float) var drill_damage = 1

const ROTATION_ACCELERATION = 0.1
const MAX_ROTATION_SPEED = 1.2
const MAX_SPEED = 200
const ACCELERATION = 100
const GRAVITY = 10

var velocity = Vector2.ZERO
var angularVelocity = 0
var drillTarget = null

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
	
	if drillTarget != null:
		# Rotate towards it and accellerate slightly towards it
		rotation += Vector2.UP.rotated(rotation).angle_to(
			Vector2.UP.rotated(global_position.angle_to_point(drillTarget.global_position) - PI / 2)
		) * 0.1
		velocity += global_position.direction_to(drillTarget.global_position) * ACCELERATION * delta * 0.5
		drillTarget.damage(drill_damage * delta)
		

	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP.rotated(rotation) * ACCELERATION * delta
		booster.visible = true
	else:
		booster.visible = false

	velocity = move_and_slide(velocity)


func _on_FrontDetector_body_entered(body):
	# drill it
	drillParticles.emitting = true
	drillTarget = body


func _on_FrontDetector_body_exited(body):
	drillParticles.emitting = false
	drillTarget = null
