extends Area2D
@onready var sprite_2d = $Sprite2D

var rotation_speed:int = 5
var available_options = ["laser","laser","laser", "grenade", "health"]
#var type = available_options[randi()%len(available_options)]
var type = available_options.pick_random()

func _ready():
	if type == "laser":
		sprite_2d.modulate = Color.SKY_BLUE
	if type == "grenade":
		sprite_2d.modulate = Color.ORANGE_RED
	if type == "health":
		sprite_2d.modulate = Color.LAWN_GREEN

func _process(delta):
	rotation += rotation_speed * delta


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
