extends Node2D

func _ready():
	pass
	
func spawn_mob():
	var new_mob = preload("res://Characters/Mobs/Mob A/mob.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout():
	spawn_mob()
