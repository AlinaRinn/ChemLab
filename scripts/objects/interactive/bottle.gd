extends Spatial

func take():
	$StaticBody/CollisionShape.disabled = 1
	
	G.player.get_to_hand("res://objects/interactive/bottle.tscn")
	queue_free()
