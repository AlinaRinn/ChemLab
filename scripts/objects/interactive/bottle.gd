extends Spatial


func take():
	G.player.get_to_hand("res://objects/interactive/bottle.tscn")
	queue_free()
