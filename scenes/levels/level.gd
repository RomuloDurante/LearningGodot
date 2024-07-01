extends Node2D
class_name LevelParent

#-> load scenes
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var item_scene: PackedScene = preload("res://scenes/itens/item.tscn")

func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("open_item", _on_container_opened)
	
func _on_container_opened(pos, dir):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = dir
	
	$Items.call_deferred("add_child", item)
	
	
func _on_player_laser_is_shooting(pos, dir):
	var laser  = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(dir.angle()) + 90
	laser.direction = dir
	$Projectiles.add_child(laser)
	$UI.update_laser_text()
	
func _on_player_grenade_is_fire(pos,player_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = player_direction * grenade.speed
	$UI.update_greande_text()
	$Projectiles.add_child(grenade)	

func _on_house_player_entered():
	
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom", Vector2(1,1), 1)

func _on_house_player_leave():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom", Vector2(0.6,0.6), 1)

func _on_player_update_stats():
	$UI.update_laser_text()
	$UI.update_greande_text()
	
