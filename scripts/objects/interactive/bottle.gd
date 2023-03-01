extends Spatial


func take():
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)
