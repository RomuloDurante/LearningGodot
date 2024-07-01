extends ItemContainerParent

@onready var lid_sprite = $LidSprite

func hit():
	if !item_is_opened:
		item_is_opened = true
		lid_sprite.hide()
		for i in range(5):
			var random_position = $SpawnPosition.get_children().pick_random().global_position
			open_item.emit(random_position, current_direction)
		
