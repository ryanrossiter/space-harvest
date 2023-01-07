extends Control

const TextFloater = preload("res://TextFloater.tscn")

func _ready():
	PlayerStats.connect("resource_added", self, "on_resource_added")

func on_resource_added(resource_type):
	var textFloater = TextFloater.instance()
	textFloater.text = "+1 %s" % ResourceTypes.RESOURCE_ATTRIBUTES[resource_type].label
	add_child(textFloater)
