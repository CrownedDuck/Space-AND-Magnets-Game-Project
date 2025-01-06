extends CharacterBody2D

var State = "NEGATIVE"

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.die()

func _physics_process(delta):
	if $Ray.is_colliding() == true:
		if check_Polarity_Between($Ray.get_collider(0).get_groups(),State) == true:
			velocity += ($Ray.get_collider(0).global_position - global_position).normalized() * 10
		elif check_Polarity_Between($Ray.get_collider(0).get_groups(),State) == false:
			velocity += (global_position - $Ray.get_collider(0).global_position).normalized() * 50
		else:
			if is_on_floor() == false:
				velocity.y += 5
			else:
				velocity.x = lerp(velocity.x,0.0,0.1)
	if is_on_floor() == false:
			velocity.y += 5
	else:
		velocity.x = lerp(velocity.x,0.0,0.1)
	
	move_and_slide()

func change_State(state):
	for i in get_groups():
		remove_from_group(i)
	add_to_group(state)
	add_to_group("PRESSURE")
	State = state
	$AnimatedSprite2D.animation = State

func check_Polarity_Between(Pole1,Pole2):
	#True is attract, false is repel, null is nothing
	if Pole1.has(Pole2) and Pole1.has("NEUTRAL") == false:
		print(Pole1)
		return false
	elif Pole1.has(Pole2) == false and Pole1.has("NEUTRAL") == false and Pole2 != "NEUTRAL":
		return true
	elif Pole1.has("NEUTRAL") == true or Pole2 == "NEUTRAL":
		return null
