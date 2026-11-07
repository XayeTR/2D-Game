extends Camera2D


func _on_player_health_depleted() -> void:
	%AnimationPlayer.play("death")
