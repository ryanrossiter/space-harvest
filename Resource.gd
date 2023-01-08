extends Area2D

export(ResourceTypes.ResourceType) var resource_type;

onready var sprite = $Sprite
onready var resource_attributes = ResourceTypes.RESOURCE_ATTRIBUTES[resource_type]
var collected = false

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.frame = randi() % sprite.hframes
	sprite.material.set_shader_param("color", resource_attributes.color)

func _on_Resource_body_entered(body):
	# Collected by the player
	if !collected and PlayerStats.add_resource(resource_type):
		collected = true
		queue_free()
