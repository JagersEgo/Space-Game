extends Area2D

var travelled_distance = 0
const DAMAGE = 30


func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1500
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	travelled_distance +=  SPEED * delta
	
	if travelled_distance > RANGE:
		queue_free()


func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(DAMAGE)
