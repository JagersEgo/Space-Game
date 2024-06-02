extends CharacterBody2D

@onready var player = get_tree().get_nodes_in_group("player")[0]

func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 300.00
	move_and_slide()
	look_at(player.global_position)

var HEALTH = 120

func take_damage(damage):
	HEALTH += -damage
	if HEALTH <= 0:
		queue_free()
