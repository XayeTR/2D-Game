extends CharacterBody2D

signal health_depleted

var health = 100.0

func _ready() -> void:
	add_to_group("Player")

func _physics_process(delta: float) -> void:
	if Global.got_killed == false:
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
	if health <= 0.0:
		Global.got_killed = true
		health_depleted.emit()

func take_damage_from_shooting_mob():
	health -= 20
	%ProgressBar.value = health
	
func take_damage_from_metatron_mob(travelled_distance):
	var damage = 0
	if travelled_distance <= 1800:
		damage = 10
		if travelled_distance <= 1200:
			damage = 20
			if travelled_distance <= 600:
				damage = 40
	health -= damage
	%ProgressBar.value = health
