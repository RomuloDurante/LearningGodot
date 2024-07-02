extends CharacterBody2D

signal laser(pos, dir)

var player_nearby: bool = false
var can_laser:bool = true
var can_damage:bool = true
var rigth_gun_use:bool = true
var health:int = 30

func hit():
	if can_damage:
		can_damage = false
		$Timers/invunerable.start()
		$Sprite2D.material.set_shader_parameter("progress", 1.0);
		health -= 10
	if health <= 0:
		queue_free()

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_position)
		if can_laser:
			var marker_node = $LaserSpawnPositions.get_child(rigth_gun_use)
			rigth_gun_use = !rigth_gun_use
			var pos: Vector2 = marker_node.global_position
			var dir: Vector2 = (Globals.player_position - position).normalized()
			laser.emit(pos,dir)
			can_laser = false
			$Timers/LaserCoolDown.start()

			
func _on_attack_area_body_entered(_body):
	player_nearby = true


func _on_attack_area_body_exited(_body):
	player_nearby = false


func _on_laser_cool_down_timeout():
	can_laser = true

func _on_invunerable_timeout():
	can_damage = true
	$Sprite2D.material.set_shader_parameter("progress", 0);
