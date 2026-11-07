extends CharacterBody2D

signal health_depleted

var health = 100.0

func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right", "move_up","move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity.length() > 0.0:
		%HappyBoo.play_walk_animation()
	else:
		%HappyBoo.play_idle_animation()

	const DAMAGE_RATE = 5.0
	var overlapping_mob = %HitBox.get_overlapping_bodies()
	if overlapping_mob.size() > 0:
		health -= DAMAGE_RATE * overlapping_mob.size() * delta
		%ProgressBar.value = health
	var overlapping_bullet = %HitBox.get_overlapping_areas()
	if health <= 0.0:
		Global.got_killed = true
		health_depleted.emit()

func take_damage():
	health -= 20
	%ProgressBar.value = health
