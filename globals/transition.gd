extends CanvasLayer

func change_scene(target:String) -> void:
	$AnimationPlayer.play("Fade_to_black")
	await $AnimationPlayer.animation_finished
	$AnimationPlayer.play("reveal")
	
	get_tree().change_scene_to_file.bind(target).call_deferred()
