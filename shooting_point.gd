extends Marker2D
@onready var player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	look_at(player.global_position)

func shoot():
	const PINK_SLIME_BULLET = preload("res://pink_slime_bullet.tscn")
	var new_bullet = PINK_SLIME_BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)
	%PinkSlime.play_shoot()

func _on_timer_timeout() -> void:
	shoot()
