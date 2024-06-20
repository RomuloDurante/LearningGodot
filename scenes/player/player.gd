extends CharacterBody2D

const SPEED = 500

func _process(_delta):
	#move
	var direction = Input.get_vector("left","right","up","down")
	move_and_slide()
	velocity = direction * 500 
	
	#laser shooting
	if Input.is_action_just_pressed("primary action"):
		print("Shooting laser")
	
	#launch granade
	if Input.is_action_just_pressed("secondary action"):
		print("Lancing Granade")
	
	
