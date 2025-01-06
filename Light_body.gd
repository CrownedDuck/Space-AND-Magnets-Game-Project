extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if $Ray.is_colliding() == true:
		if $Ray.get_collider().is_in_group("Player"):
			velocity += (global_position - $Ray.get_collider().global_position).normalized() * 5
	else:
		if velocity.length() > 1:
			velocity.x = lerp(velocity.x,0.0,0.1)
	
	move_and_slide()
