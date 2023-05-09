extends Spatial


var active = false
var isSpiral = false

func burn():
	# Вкл и выкл анимации горения
	if !active:
		$AnimationPlayer.play("burn")
		active = true
	else:
		$AnimationPlayer.play_backwards("burn")
		active = false


func _ready():
	if !isSpiral:
		$spiral.visible = false


func spiral():
	if !isSpiral:
		G.player.in_hand_object.hide()
		isSpiral = true
		$spiral.visible = isSpiral
		if G.player.in_hand_object.subs == "K":
			$CPUParticles.color_ramp = load("res://assets/gradient/K.tres")
		if G.player.in_hand_object.subs == "Na":
			$CPUParticles.color_ramp = load("res://assets/gradient/Na.tres")
		if G.player.in_hand_object.subs == "Li":
			$CPUParticles.color_ramp = load("res://assets/gradient/Li.tres")
		if G.player.in_hand_object.subs == "Ca":
			$CPUParticles.color_ramp = load("res://assets/gradient/Ca.tres")
		if G.player.in_hand_object.subs == "Ba":
			$CPUParticles.color_ramp = load("res://assets/gradient/Ba.tres")
		if G.player.in_hand_object.subs == "Sr":
			$CPUParticles.color_ramp = load("res://assets/gradient/Sr.tres")
	else:
		G.player.in_hand_object.hide()
		isSpiral = false
		$spiral.visible = isSpiral
		$CPUParticles.color_ramp = load("res://assets/gradient/burner.tres")
