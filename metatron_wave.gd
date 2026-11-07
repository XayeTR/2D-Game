extends Area2D

var travelled_distance = 0

func _ready() -> void:
	%AnimationPlayer.play("shot")

func _physics_process(delta: float) -> void:
	const SPEED = 1000
	const RANGE = 1800
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damage_from_metatron_mob") and body.is_in_group("Player"):
		body.take_damage_from_metatron_mob(travelled_distance)
