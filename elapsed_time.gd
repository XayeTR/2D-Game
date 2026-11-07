extends Label
var elapsed_time = 0
func _process(delta: float) -> void:
	if Global.time_is_flowing:
		if Global.time_is_flowing == false:
			return
		elapsed_time += delta
		text = "Time: " + str(int(elapsed_time))
