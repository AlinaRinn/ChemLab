extends Spatial

var substance = load("res://scripts/substance.res").sub
export(String, "acid", "alkali", "water") var liquid
export(bool) var isMetal

var id = "bottle"

func take():
	# Подбирание предмета
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)

func pour():
	# Налить слой воды
	
	if G.player.in_hand_object.has_method("add_substance"):
		G.player.in_hand_object.add_substance(substance[liquid])
	elif (isMetal):
		if G.player.in_hand_object.has_method("add_metal"):
			G.player.in_hand_object.add_metal(substance[liquid])
	else:
		if G.player.in_hand_object.has_method("add_liquid"):
			G.player.in_hand_object.add_liquid(substance[liquid])


func _ready():
	# При создании получаем кол-во слоев
	if (!isMetal):
		$metal.visible = false
