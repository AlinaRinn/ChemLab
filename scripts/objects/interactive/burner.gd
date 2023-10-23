extends Spatial


var active = false
<<<<<<< HEAD

=======
var isSpiral = false
>>>>>>> dev

func burn():
	# Вкл и выкл анимации горения
	if !active:
		$AnimationPlayer.play("burn")
		active = true
	else:
		$AnimationPlayer.play_backwards("burn")
		active = false
<<<<<<< HEAD
=======


func _ready():
	if !isSpiral:
		$spiral.visible = false


func spiral():
	if !isSpiral:
		G.player.in_hand_object.hide()
		isSpiral = true
		$spiral.visible = isSpiral
		if G.player.in_hand_object.subs == "K":
			$fire.process_material = load("res://assets/gradient/part_K.tres")
		if G.player.in_hand_object.subs == "Na":
			$fire.process_material = load("res://assets/gradient/part_Na.tres")
		if G.player.in_hand_object.subs == "Li":
			$fire.process_material = load("res://assets/gradient/part_Li.tres")
		if G.player.in_hand_object.subs == "Ca":
			$fire.process_material = load("res://assets/gradient/part_Ca.tres")
		if G.player.in_hand_object.subs == "Ba":
			$fire.process_material = load("res://assets/gradient/part_Ba.tres")
		if G.player.in_hand_object.subs == "Sr":
			$fire.process_material = load("res://assets/gradient/part_Sr.tres")
	else:
		G.player.in_hand_object.hide()
		isSpiral = false
		$spiral.visible = isSpiral
		$fire.process_material = load("res://assets/gradient/part_burter.tres")
>>>>>>> dev
