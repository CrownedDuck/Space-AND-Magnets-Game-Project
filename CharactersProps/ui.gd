extends CanvasLayer


func _on_restart_button_pressed():
	get_parent()._restart()
	$"Restart Button".disabled = true

func disable_restart():
	$"Restart Button".disabled = true
