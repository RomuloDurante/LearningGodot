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
		
var health: int = 60: 
	set(value):
		health = value
		stat_change.emit()
