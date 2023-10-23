extends Spatial

<<<<<<< HEAD
export var liquid = ""
=======
var substance = load("res://scripts/substance.res").sub
export(String, "acid", "alkali", "water", "Na", "Li", "K", "Phenolphthalein",
"LiCl", "Na2CO3") var subs
export(bool) var isMetal

>>>>>>> dev
var id = "bottle"


func take():
	# Подбирание предмета
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)

<<<<<<< HEAD
func pour():
	# Налить слой воды
	G.player.in_hand_object.add_liquid(liquid)
=======

func pour():
	
	# Налить слой воды
	if G.player.in_hand_object == null:
		pass
	elif G.player.in_hand_object.has_method("add_substance"):
		G.player.in_hand_object.add_substance(substance[subs])
	elif (isMetal):
		if G.player.in_hand_object.has_method("add_metal"):
			G.player.in_hand_object.add_metal(substance[subs])
	elif G.player.in_hand_object.has_method("add_liquid"):
		G.player.in_hand_object.add_liquid(substance[subs])
	

func _ready():
	# При создании получаем кол-во слоев
	if (isMetal):
		$metal.visible = true

	$Label3D.text = subs


func hide():
	if isMetal:
		isMetal = false
		$metal.visible = isMetal
	else:
		isMetal = true
		$metal.visible = isMetal


func update_name():
	$Label3D.text = subs
>>>>>>> dev
