extends Control

func _ready() -> void:
	visible = false

func _process(delta: float) -> void:
	if Global.pause_menu_visible == false:
		Global.settings_menu_visible = false
	
	if Global.settings_menu_visible == true:
		visible = true
	else:
		visible = false


func _on_back_button_pressed() -> void:
	Global.settings_menu_visible = false
