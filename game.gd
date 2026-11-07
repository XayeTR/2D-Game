extends Node2D
const MAX_SHOOTING_MOBS = 5
const MAX_MOBS = 50
const MAX_BOSS_KINGS = 2
const MAX_METATRON = 2
var mob_count = 0
var shooting_mob_count = 0
var boss_king_count = 0
var metatron_count = 0
func spawn_mob():
	if mob_count >= MAX_MOBS:
		return
	
	var new_mob = preload("res://mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)
	mob_count += 1
	new_mob.tree_exited.connect(_on_mob_tree_exited)

func spawn_shooting_mob():
	if shooting_mob_count >= MAX_SHOOTING_MOBS:
		return
	
	var new_shooting_mob = preload("res://shooting_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_shooting_mob.global_position = %PathFollow2D.global_position
	add_child(new_shooting_mob)
	shooting_mob_count += 1
	new_shooting_mob.tree_exited.connect(_on_shooting_mob_tree_exited)

func spawn_boss_king():
	if boss_king_count >= MAX_BOSS_KINGS:
		return
	
	var new_boss_king = preload("res://boss_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_boss_king.global_position = %PathFollow2D.global_position
	add_child(new_boss_king)
	shooting_mob_count += 1
	new_boss_king.tree_exited.connect(_on_shooting_mob_tree_exited)

func spawn_metatron():
	if metatron_count >= MAX_METATRON:
		return
	
	var new_megatron = preload("res://metatron_mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_megatron.global_position = %PathFollow2D.global_position
	add_child(new_megatron)
	metatron_count += 1
	new_megatron.tree_exited.connect(_on_metatron_mob_tree_exited)

func _on_mob_tree_exited():
	mob_count -= 1
func _on_shooting_mob_tree_exited():
	shooting_mob_count -= 1
func _on_boss_king_tree_exited():
	boss_king_count -= 1
func _on_metatron_mob_tree_exited():
	metatron_count -= 1

func spawn_tree():
	var new_tree = preload("res://pine_tree.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_tree.global_position = %PathFollow2D.global_position
	add_child(new_tree)


func _on_player_health_depleted() -> void:
	%GameOverScreen.visible = true
	await get_tree().create_timer(3.0).timeout
	get_tree().paused = true


func _on_timer_timeout() -> void:
	spawn_mob()


func _on_timer_2_timeout() -> void:
	spawn_tree()


func _on_timer_3_timeout() -> void:
	spawn_shooting_mob()


func _on_timer_4_timeout() -> void:
	spawn_boss_king()


func _on_timer_5_timeout() -> void:
	spawn_metatron()
