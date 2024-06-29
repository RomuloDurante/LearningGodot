extends LevelParent


func _on_exite_gate_area_body_entered(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed",0,0.5)
	Transition.change_scene("res://scenes/levels/outside.tscn")
