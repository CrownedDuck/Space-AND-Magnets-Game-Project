extends PathFollow2D

func _ready():
	progress_ratio = randf_range(0,1)
	$AnimatedSprite2D.play(str(randi_range(0,7)))
func _physics_process(delta):
	progress_ratio -= 0.0005
