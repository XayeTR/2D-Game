extends Label

func _process(delta: float) -> void:
	text = "Killed Mobs: " + str(Global.killed_mob_count)
