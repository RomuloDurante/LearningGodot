extends ItemContainerParent
@onready var lid_sprite = $LidSprite


func hit():
	if !item_is_opened:
		
		item_is_opened = true
		lid_sprite.hide()
		open_item.emit($SpawnPosition.global_position, current_direction)
