extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 3600
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage") and body.is_in_group("Player"):
		body.take_damage()
		
