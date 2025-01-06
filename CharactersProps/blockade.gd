extends StaticBody2D

@export var Reversed:bool = false

func _ready():
	if Reversed == false:
		Close()
	else:
		Open()

func trigger(state):
	if state == true:
		if Reversed == false:
			Open()
		else:
			Close()
	elif state == false:
		if Reversed == false:
			Close()
		else:
			Open()

func Open():
	$CollisionShape2D.set_deferred("disabled",true)
	$Node2D.hide()

func Close():
	$CollisionShape2D.set_deferred("disabled",false)
	$Node2D.show()
