extends Camera2D

var signal_emitted = false

func _on_player_health_depleted() -> void:
	if signal_emitted == false:
		%AnimationPlayer.play("death")
		await get_tree().create_timer(3.0).timeout
		signal_emitted = true
	if signal_emitted == true:
		get_tree().paused = true
