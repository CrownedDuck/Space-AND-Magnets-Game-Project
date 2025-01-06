extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$LevelTransition.Hide()
	
	await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("One")
	await get_tree().create_timer(3).timeout
	for i in range(5):
		$One.get_node("Label" + str(i)).show()
		await get_tree().create_timer(2).timeout


func _on_returner_body_entered(body):
	if body.is_in_group("Player"):
		print(body.name)
		body.global_position = $Returner/Destination.global_position
