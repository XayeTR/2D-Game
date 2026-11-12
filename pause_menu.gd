extends Control

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		Global.game_paused = not Global.game_paused

func _process(delta: float) -> void:
	if Global.game_paused == true:
		get_tree().paused = true
		visible = true
	else:
		get_tree().paused = false
		visible = false
