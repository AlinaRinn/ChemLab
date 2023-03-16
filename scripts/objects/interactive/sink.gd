extends Spatial


func pour():
	# Налить слой воды
	G.player.in_hand_object.add_liquid("water")

func drain():
	# Удалить слой воды
	G.player.in_hand_object.remove_liquid()
