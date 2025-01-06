extends PathFollow2D

@export var FollowMarker:Node2D

@onready var bone_mod = preload("res://CharactersProps/player_magnet.tres")

var velocity:float

var POLARITY = "NEUTRAL"

func _ready():
	var mod_stack = $Bones/Skeleton2D.get_modification_stack()
	var skl_mod = mod_stack.get_modification(0)
	skl_mod.target_nodepath = skl_mod.target_nodepath
	skl_mod.tip_nodepath = skl_mod.tip_nodepath #for SkeletonModification2DCCDIK
	
	_change_Polarity("NEUTRAL")

func _physics_process(delta):
	
	
	$IKNodes.look_at(get_global_mouse_position())
	$IKNodes/Marker2D.global_position = FollowMarker.global_position
	FollowMarker.get_parent().global_position = lerp(FollowMarker.get_parent().global_position,global_position,0.1)
	if Input.is_action_pressed("magnet_move_L"):
		if abs(velocity) < 4:
			velocity -= 0.1
			#$AudioStreamPlayer2D.play()
			#$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1)
	elif Input.is_action_pressed("magnet_move_R"):
		if abs(velocity) < 4:
			velocity += 0.1
			#$AudioStreamPlayer2D.play()
			#$AudioStreamPlayer2D.pitch_scale = randf_range(0.8,1)
	else:
		velocity = lerp(velocity,0.0,0.1)
		#$AudioStreamPlayer2D.stop()
	
	progress += velocity
	
	if $Parts/Handle/PlayerChecker.is_colliding() == true:
		if $Parts/Handle/PlayerChecker.get_collider().is_in_group("Player"):
			$Parts/Handle/PlayerChecker.get_collider().global_position.x = $Parts/Handle.global_position.x
	

func _change_Polarity(Polarity):
	POLARITY = Polarity
	for i in $Parts/Handle/Magnet.get_groups():
		$Parts/Handle/Magnet.remove_from_group(i)
	$Parts/Handle/Magnet.add_to_group(POLARITY)
	$Parts/Root/AnimatedSprite2D.play(POLARITY)
	if POLARITY == "NEGATIVE":
		$Parts/Handle/Magnet/GPUParticles2D.texture = preload("res://Assets/Minus.png")
		$Parts/Handle/Magnet/GPUParticles2D.emitting = true
	elif POLARITY == "POSITIVE":
		$Parts/Handle/Magnet/GPUParticles2D.texture = preload("res://Assets/Plus.png")
		$Parts/Handle/Magnet/GPUParticles2D.emitting = true
	else:
		$Parts/Handle/Magnet/GPUParticles2D.emitting = false

