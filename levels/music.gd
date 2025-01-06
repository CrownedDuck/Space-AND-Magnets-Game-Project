extends AudioStreamPlayer

var Off = false

func _physics_process(delta):
	if G.MusicOn == false and Off == false:
		Off = true
		for i in range(30):
			volume_db -= 1
			await get_tree().create_timer(0.01).timeout
		playing = false

