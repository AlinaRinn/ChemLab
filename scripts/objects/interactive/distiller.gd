extends Spatial


var active = false
var substance = load("res://scripts/substance.res").sub
var water = {"name": "Вода", "color": Color.blue}


func press():
	# Открыть закрыть вентель
	if !active:
		$valve/valve_rotate/AnimationPlayer.play("rotate")
		active = true
	else:
		$valve/valve_rotate/AnimationPlayer.play_backwards("rotate")
		active = false


func pour():
	# Налить слой воды
	if G.player.in_hand_object == null:
		pass
	elif G.player.in_hand_object.has_method("add_substance"):
		G.player.in_hand_object.add_substance(substance.water)
	elif G.player.in_hand_object.has_method("add_liquid"):
		G.player.in_hand_object.add_liquid(substance.water)


func drain():
	# Удалить слой воды
	if G.player.in_hand_object == null:
		pass
	elif G.player.in_hand_object.has_method("remove_substance"):
		G.player.in_hand_object.remove_substance()
	elif G.player.in_hand_object.has_method("remove_liquid"):
		G.player.in_hand_object.remove_liquid()
