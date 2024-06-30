extends CanvasLayer

#colors

var green:Color = Color("6bbfa3")
var red:Color = Color(0.9,0,0,1)

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var laser_icon:TextureRect = $LaserCounter/VBoxContainer/TextureRect

@onready var grenade_label:Label = $GrenadeCounter/VBoxContainer/Label
@onready var grenade_icon:TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar = $MarginContainer/TextureProgressBar



func _ready():
	Globals.connect("stat_change", update_stat_text)
	update_health()
	update_laser_text()
	update_greande_text()


func update_stat_text():
	update_health()
	update_laser_text()
	update_greande_text()

func update_laser_text():
	laser_label.text = str(Globals.laser_ammount)
	update_color(Globals.laser_ammount, laser_label, laser_icon)
	
func update_greande_text():
	grenade_label.text = str(Globals.grenade_ammount)
	update_color(Globals.grenade_ammount, grenade_label, grenade_icon)
	
func update_health():
	health_bar.value = Globals.health



func update_color(ammount:int, label:Label, icon:TextureRect) -> void:
	label.modulate = green
	icon.modulate = green
	if ammount == 0:
		label.modulate = red
		icon.modulate = red
		
