extends Node2D

var follow = false


func _physics_process(delta):
	if follow == true:
		global_position = get_global_mouse_position()
	else:
		position = lerp(position, Vector2(0,80), 0.1)

func _on_button_button_down():
	follow = true



func _on_button_button_up():
	follow = false
