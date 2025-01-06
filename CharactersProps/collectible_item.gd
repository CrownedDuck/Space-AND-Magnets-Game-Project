extends Area2D

@export var Item: String = "Phone"

func _ready():
	$Container/Item.play(Item)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		G.Collectibles[Item] = true
		print(G.Collectibles)
		$AnimationPlayer.play("PickUp")
		await $AnimationPlayer.animation_finished
		queue_free()
