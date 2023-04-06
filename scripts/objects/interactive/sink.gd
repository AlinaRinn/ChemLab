extends Spatial
var substance = load("res://scripts/substance.res").sub
var water = {"name": "Вода", "color": Color.blue}
func pour():
	# Налить слой воды
	G.player.in_hand_object.add_liquid(substance.water)

func drain():
	# Удалить слой воды
	G.player.in_hand_object.remove_liquid()
