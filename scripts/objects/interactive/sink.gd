extends Spatial


func pour():
	G.player.in_hand_object.add_water("water")

func drain():
	G.player.in_hand_object.remove_water()
