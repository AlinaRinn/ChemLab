extends Spatial
var substance = load("res://scripts/substance.res").sub
var water = {"name": "Вода", "color": Color.blue}
func pour():
	# Налить слой воды
	G.player.in_hand_object.add_substance(substance.water)

func drain():
	# Удалить слой воды
	G.player.in_hand_object.remove_substance()
