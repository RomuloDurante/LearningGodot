extends StaticBody2D
class_name ItemContainerParent

@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)
var item_is_opened:bool = false

signal open_item(pos, direction)

