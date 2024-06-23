extends Node2D


#-> load scenes
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")

func _on_gate_player_entered_gate(body):
	print("Player has entered gate !")


func _on_player_laser_is_shooting(pos):
	var laser  = laser_scene.instantiate()

	# update the laser position
	laser.position = pos
	# add laser instance to a Node2D
	$Projectiles.add_child(laser)

func _on_player_grenade_is_fire():
	print("Grenade is firing !")
