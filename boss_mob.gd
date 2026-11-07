extends CharacterBody2D

var health = 10
@onready var player = get_node("/root/Game/Player")



func _ready():
	%BossKing.play_walk()



func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 250
	move_and_slide()



func take_damage():
	health -= 1
	%BossKing.play_hurt()
	%HitSound.play()
	
	if health == 0:
		queue_free()
		
		Global.killed_mob_count += 1
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()
		get_parent().add_child(smoke)
		smoke.global_position = global_position
