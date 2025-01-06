extends Node2D

signal RESTART

func _restart():
	RESTART.emit()
	$LevelTransition.Change_From()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()


func _ready():
	$LevelTransition.Change_To()
