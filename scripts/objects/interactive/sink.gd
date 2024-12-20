extends Spatial


var substance = load("res://scripts/substance.res").sub
var water = {"name": "Вода", "color": Color.blue}


func pour():
	# Налить слой воды
	if G.player.in_hand_object == null:
		pass
	elif G.player.in_hand_object.has_method("add_substance"):
		G.player.in_hand_object.add_substance(substance.water)
		$Pour.play("pour")
	elif G.player.in_hand_object.has_method("add_liquid"):
		G.player.in_hand_object.add_liquid(substance.water)
		$Pour.play("pour")

func drain():
	# Удалить слой воды
	if G.player.in_hand_object == null:
		pass
	elif G.player.in_hand_object.has_method("remove_substance"):
		G.player.in_hand_object.remove_substance()
		$Drain.play("drain")
	elif G.player.in_hand_object.has_method("remove_liquid"):
		G.player.in_hand_object.remove_liquid()
		$Drain.play("drain")
