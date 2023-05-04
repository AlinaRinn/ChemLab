extends Spatial


var active = false
export(bool) var isSpiral

func burn():
	if isSpiral:
		$CPUParticles.color_ramp = load("res://assets/gradient/1.tres")

	
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
