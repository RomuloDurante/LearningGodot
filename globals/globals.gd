extends Node

signal stat_change


var laser_ammount:int = 20:
	set(value):
		laser_ammount = value
		stat_change.emit()
		
var grenade_ammount:int = 3:
	set(value):
		grenade_ammount = value
		stat_change.emit()
		
var player_vulnerable:bool = true
var health: int = 60: 
	set(value):
		if value > min(health,100):
			health = value
		else:
			if player_vulnerable:
				health = value
				player_vulnerable = false
				player_invunerable_timer()
		stat_change.emit()
			
func player_invunerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true

var player_position:Vector2
