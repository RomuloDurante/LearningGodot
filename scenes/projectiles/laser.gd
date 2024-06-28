extends Area2D


@export var speed:int = 1000
var direction: Vector2 = Vector2.UP

func _ready():
	$SelfDestruct.start()

func _process(delta):
	# when laser is instatiate is moving automaticaly
	position += direction * speed * delta

func _on_body_entered(body):
	queue_free()

	if "hit" in body:
		body.hit()
		
func _on_self_destruct_timeout():
	queue_free()
