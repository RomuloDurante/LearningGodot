extends CharacterBody2D

const SPEED = 500

func _process(_delta):
	#move
	var direction = Vector2.RIGHT
	velocity = direction * 100 
	move_and_slide()



