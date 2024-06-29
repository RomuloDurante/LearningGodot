extends LevelParent


func _on_exite_gate_area_body_entered(_body):
	var tween = get_tree().create_tween()
	tween.tween_property($Player, "speed",0,0.5)
	get_tree().change_scene_to_file.bind("res://scenes/levels/outside.tscn").call_deferred()
