extends CharacterBody2D

#->SIGNALS
signal laser_is_shooting(position, direciton)
signal grenade_is_fire(position, direction)
signal update_stats

@export var  max_speed = 500
var speed:int  = max_speed
var can_laser:bool = true
var can_granade:bool = true

func _process(_delta):
	#move
	var direction = Input.get_vector("left","right","up","down")
	move_and_slide()
	velocity = direction * speed
	
	#rotate player
	look_at(get_global_mouse_position())
	
	#laser shooting
	var dir = (get_global_mouse_position() - position).normalized()
	if Input.is_action_just_pressed("primary action") and can_laser and Globals.laser_ammount > 0:
		#dimiuir munição
		Globals.laser_ammount -= 1
		
		#emit particles
		$GPUParticles2D.emitting = true
		#pickup a random positiom from marker 2d
		var laser_markers = $LaserStartPositions.get_children()
		var selected_random_laser = laser_markers[randi() % laser_markers.size()]

		
		#emit the position
		laser_is_shooting.emit(selected_random_laser.global_position, dir)
		
		can_laser = false
		$LaserTimer.start()
		
	#launch granade
	if Input.is_action_just_pressed("secondary action") and can_granade and Globals.grenade_ammount > 0:
		#dimiuir munição
		Globals.grenade_ammount -= 1
		
		var pos = $LaserStartPositions.get_children()[0].global_position
		grenade_is_fire.emit(pos, dir)
		can_granade = false
		$GranadeTimer.start()

func _on_laser_timer_timeout():
	can_laser = true

func _on_granade_timer_timeout():
	can_granade = true


func add_item(type: String) -> void:
	if type == "laser":
		Globals.laser_ammount += 5
	if type == "grenade":
		Globals.grenade_ammount += 1
	update_stats.emit()


