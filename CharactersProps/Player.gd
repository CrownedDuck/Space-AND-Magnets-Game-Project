extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

signal DEATH

var canMove = true

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if canMove == true:
		if Input.is_action_pressed("player_move_Up") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			_change_anim("Jump",null)
	
		var direction = Input.get_axis("player_move_L", "player_move_R")
		if direction:
			velocity.x = direction * SPEED
			if velocity.x < 0:
				if is_on_floor():
					_change_anim("Move",true)
				else:
					_change_anim("Jump",true)
			elif velocity.x > 0:
				if is_on_floor():
					_change_anim("Move",false)
				else:
					_change_anim("Jump",false)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if is_on_floor():
				_change_anim("Idle",null)
			else:
				_change_anim("Jump",null)
			
	move_and_slide()

func _change_anim(anim,flip_h):
	if $AnimatedSprite2D.animation != anim:
		$AnimatedSprite2D.play(anim)
	if flip_h != null:
		$AnimatedSprite2D.flip_h = flip_h

func die():
	canMove = false
	_change_anim("Dead",null)
	$Death.pitch_scale = randf_range(0.8,1.2)
	$Death.play()
	$CollisionShape2D.set_deferred("disabled",true)
	velocity.y = JUMP_VELOCITY
	await get_tree().create_timer(1).timeout
	DEATH.emit()
