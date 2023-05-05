extends Spatial


var id = "tube_spiral"
export var e = ""
var h = true
func take():
	# Подбирание
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)
		
func hide():
	if h:
		h = false
		$spiral.visible = h
	else:
		h = true
		$spiral.visible = h
