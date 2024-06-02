extends CharacterBody2D

var health = 100
var rotation_speed: float = 8.0
const DAMAGE_RATE = 20

func _ready():
	add_to_group("player")

func _physics_process(delta):
	var direction = Input.get_vector("move left", "move right", "move up", "move down").normalized()
	velocity = direction * 600
	
	var target_angle = direction.angle()
		
	if direction != Vector2.ZERO:
		#rotation = direction.angle()
		rotation = lerp_angle(rotation, target_angle, rotation_speed * delta)
		
	%GunPivot.rotation = -rotation
	
	move_and_slide()
	
	var overlapping_mobs = %"Hurt Box".get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		take_damage(DAMAGE_RATE * overlapping_mobs.size() * delta)
		
func take_damage(amount):
	health -= amount
	%ProgressBar.value = health
	if health <= 0:
		pass

