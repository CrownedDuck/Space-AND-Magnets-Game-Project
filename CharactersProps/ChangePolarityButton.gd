extends Area2D

@export var POLARITY:String = "NEUTRAL"
@export var MAGNET:Node
#@export var ROOT:Node

# POLARITY or TRIGGER button
@export var ButtonType: String = "POLARITY"
@export var TriggerTarget:Node

func _ready():
	if ButtonType == "POLARITY":
		$Polarity.play(POLARITY)
	else:
		$Polarity.hide()

func _on_body_entered(body):
	if ButtonType == "POLARITY":
		if body.is_in_group("Player") or body.is_in_group("PRESSURE"):
			$click.pitch_scale = randf_range(1,1.2)
			$click.play()
			MAGNET._change_Polarity(POLARITY)
			#ROOT.MAGNET._change_Polarity(POLARITY)
			$ButtonStatus.play("Pressed")
	elif ButtonType == "TRIGGER":
		if body.is_in_group("Player") or body.is_in_group("PRESSURE"):
			$click.pitch_scale = randf_range(1,1.2)
			$click.play()
			TriggerTarget.trigger(true)
			$ButtonStatus.play("Pressed")

func _on_body_exited(body):
	if ButtonType == "POLARITY":
		if body.is_in_group("Player") or body.is_in_group("PRESSURE"):
			$click.pitch_scale = randf_range(0.8,0.99)
			$click.play()
			MAGNET._change_Polarity("NEUTRAL")
			#ROOT.MAGNET._change_Polarity("NEUTRAL")
			$ButtonStatus.play("Normal")
	elif ButtonType == "TRIGGER":
		if body.is_in_group("Player") or body.is_in_group("PRESSURE"):
			$click.pitch_scale = randf_range(0.8,0.99)
			$click.play()
			TriggerTarget.trigger(false)
			$ButtonStatus.play("Normal")
