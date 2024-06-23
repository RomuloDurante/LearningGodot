extends Node2D




func _on_gate_player_entered_gate(body):
	print("Player has entered gate !")


func _on_player_laser_is_shooting():
	print("laser is shoting from player")


func _on_player_grenade_is_fire():
	print("Grenade is firing !")
