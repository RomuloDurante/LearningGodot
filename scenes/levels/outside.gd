extends LevelParent


func _on_gate_player_entered_gate(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed",0,0.5)
	Transition.change_scene("res://scenes/levels/inside.tscn")

