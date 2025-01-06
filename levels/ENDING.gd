extends Node2D

signal RESTART

func _ready():
	G.MusicOn = false
	$LevelTransition.Change_To()
	for i in range(40):
		$AudioStreamPlayer.volume_db += 1
		await get_tree().create_timer(0.01).timeout
func _restart():
	RESTART.emit()
	$LevelTransition.Change_From()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()

