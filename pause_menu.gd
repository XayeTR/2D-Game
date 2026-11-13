extends Control

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Global.pause_menu_visible = not Global.pause_menu_visible
		if Global.pause_menu_visible == true:
			get_tree().paused = true
			visible = true
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			get_tree().paused = false
			visible = false
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_continue_button_pressed() -> void:
	get_tree().paused = false
	visible = false
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
