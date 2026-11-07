extends Area2D


func _physics_process(delta: float) -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() > 0:
		var target_enemy = enemies_in_range.front()
		look_at(target_enemy.global_position)


func shoot():
	if Global.got_killed == true:
		return
	if Global.got_killed == false:
		const BULLET = preload ("res://bullet.tscn")
		const MUZZLE_FLASH = preload("res://pistol/muzzle_flash/muzzle_flash.tscn")
		var new_bullet = BULLET.instantiate()
		var muzzle_flash = MUZZLE_FLASH.instantiate()
		new_bullet.global_position = %ShootingPoint.global_position
		new_bullet.global_rotation = %ShootingPoint.global_rotation
		%ShootingPoint.add_child(new_bullet)
		%ShootingPoint.add_child(muzzle_flash)
		%ShootSound.play()


func _on_timer_timeout() -> void:
	var enemies_in_range = get_overlapping_bodies()
	if enemies_in_range.size() != 0:
		shoot()
