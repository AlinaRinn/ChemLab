extends Spatial


func take():
	get_parent().remove_child(self)	
	self.translation = Vector3(0, 0, 0)
	G.player.get_to_hand(self)
