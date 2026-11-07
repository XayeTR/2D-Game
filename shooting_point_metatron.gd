extends Marker2D
@onready var player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	look_at(player.global_position)

func shoot():
	await get_tree().create_timer(1.0).timeout
	const METATRON_WAVE = preload("res://metatron_wave.tscn")
	var new_bullet = METATRON_WAVE.instantiate()
	new_bullet.global_position = %ShootingPointMetatron.global_position
	new_bullet.global_rotation = %ShootingPointMetatron.global_rotation
	%ShootingPointMetatron.add_child(new_bullet)
	%WaveSound.play()
	

func _on_timer_timeout() -> void:
	shoot()
	%Metatron.play_shoot()
