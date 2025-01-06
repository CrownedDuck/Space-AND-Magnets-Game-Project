extends CanvasLayer

func _ready():
	show()

func Change_From():
	$AnimationPlayer.play("SwitchFrom")

func Change_To():
	$AnimationPlayer.play("SwitchTo")

func Hide():
	$AnimationPlayer.play("Hide")
