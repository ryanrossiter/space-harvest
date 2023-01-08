extends Node2D

#var Asteroid = preload("res://Asteroid.tscn")

var rand_x
var rand_y

func _ready():
	randomize()
	for i in range(100):
		var asteroid = preload("res://Asteroid.tscn").instance()
		rand_x = rand_range(-2000, 2000)
		rand_y = rand_range(-2000, 2000)
		if rand_x > -200 and rand_x < 200 and rand_y > -200 and rand_y < 200 :
			pass
		else:
			asteroid.global_position = Vector2(rand_x, rand_y)
			add_child(asteroid)
