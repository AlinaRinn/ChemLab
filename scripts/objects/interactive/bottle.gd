extends Spatial


var id = "bottle"


func take():
	# Подбирание предмета
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)
