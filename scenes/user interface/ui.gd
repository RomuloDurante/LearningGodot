extends CanvasLayer

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var label_grenade = $GrenadeCounter/VBoxContainer/Label


func _ready():
	update_laser_text()
	update_greande_text()


func update_laser_text():
	laser_label.text = str(Globals.laser_ammount)
	
func update_greande_text():
	label_grenade.text = str(Globals.grenade_ammount)
