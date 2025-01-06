extends Area2D





func _on_body_entered(body):
	if body.is_in_group("Player"):
		for i in G.Collectibles:
			if G.Collectibles[i] == false:
				body.global_position = $Marker2D.global_position
				$ItemCollection2.show()
