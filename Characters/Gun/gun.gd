extends Area2D

var rotation_speed: float = 36.0

func _physics_process(delta):
	pass
	#look_at(get_global_mouse_position())
		
func shoot():
	const BULLET = preload("res://Characters/Bullet/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)

func _process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
   # Get the global mouse position
	var mouse_position = get_global_mouse_position()
	
	# Calculate the direction vector from the object to the mouse position
	var direction = (mouse_position - global_position).normalized()
	
	# Calculate the target angle
	var target_angle = direction.angle()
	
	# Interpolate the current rotation towards the target angle
	rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
