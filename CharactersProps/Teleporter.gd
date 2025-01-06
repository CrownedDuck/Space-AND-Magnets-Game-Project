extends Area2D

@export var Target:StringName

signal TELEPORT

@export var LevelTransition:Node


func _on_body_entered(body):
	if body.is_in_group("Player"):
		TELEPORT.emit()
		LevelTransition.Change_From()
		await get_tree().create_timer(1).timeout
		call_deferred("change_scene", Target)


func change_scene(scene_path: String):
	if get_tree().change_scene_to_file(scene_path) != OK:
		print("An unexpected error occurred when trying to switch scene")
