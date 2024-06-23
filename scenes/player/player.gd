extends CharacterBody2D

#->SIGNALS
signal laser_is_shooting
signal grenade_is_fire

const SPEED = 500
var can_laser:bool = true
var can_granade:bool = true


func _process(_delta):
	#move
	var direction = Input.get_vector("left","right","up","down")
	move_and_slide()
	velocity = direction * 500 
	
	#laser shooting
	if Input.is_action_just_pressed("primary action") and can_laser:
		laser_is_shooting.emit()
		can_laser = false
		$LaserTimer.start()
		
	#launch granade
	if Input.is_action_just_pressed("secondary action") and can_granade:
		grenade_is_fire.emit()
		can_granade = false
		$GranadeTimer.start()

	


func _on_laser_timer_timeout():
	can_laser = true


func _on_granade_timer_timeout():
	can_granade = true



