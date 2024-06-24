extends RigidBody2D

@export var speed:int = 1000
var direction: Vector2 = Vector2.UP

func _process(delta):
	# when laser is instatiate is moving automaticaly
	position += direction * speed * delta
