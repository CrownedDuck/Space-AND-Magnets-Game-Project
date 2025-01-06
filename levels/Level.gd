extends Node2D

signal RESTART

var PlayerMagnet = preload("res://CharactersProps/player_magnet.tscn")
var MAGNET

func _ready():
	#var o = PlayerMagnet.instantiate()
	#MAGNET = o
	#$Path2D.add_child(o)
	$LevelTransition.Change_To()
	await get_tree().create_timer(30).timeout
	$TIP.show()
func _restart():
	RESTART.emit()
	$LevelTransition.Change_From()
	await get_tree().create_timer(2).timeout
	get_tree().reload_current_scene()

