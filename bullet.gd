extends Area2D

var travelled_distance = 0

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	
	const IMPACT = preload("res://pistol/impact/impact.tscn")
	var impact = IMPACT.instantiate()
	get_parent().add_child(impact)
	impact.global_position = self.global_position
	if body.has_method("take_damage"):
		body.take_damage()
