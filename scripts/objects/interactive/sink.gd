extends Spatial


func pour():
	# Налить слой воды
	G.player.in_hand_object.add_liquid("вода")

func drain():
	# Удалить слой воды
	G.player.in_hand_object.remove_liquid()
