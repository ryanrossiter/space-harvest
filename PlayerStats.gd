extends Node

var max_health = 7
var health = 7
var storage_capacity = 12
var storage_used = 0

var inventory = {}

signal resource_added(resource_type)

func add_resource(resource_type):
	if storage_used >= storage_capacity:
		return false
	
	if !inventory.has(resource_type):
		inventory[resource_type] = 0
	inventory[resource_type] += 1
	emit_signal("resource_added", resource_type)
	print("added resource", resource_type)
	
	return true
