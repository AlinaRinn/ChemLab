extends Spatial

var substance = load("res://scripts/substance.res").sub
export(String, "acid", "alkali", "water") var liquid

var id = "bottle"

func take():
	# Подбирание предмета
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)

func pour():
	# Налить слой воды
	G.player.in_hand_object.add_liquid(substance[liquid])
