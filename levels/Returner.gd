extends Area2D

@export var TriggerTarget:Node

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print(body.name)
		body.global_position = $Destination.global_position
		if TriggerTarget != null:
			TriggerTarget.trigger(false)

