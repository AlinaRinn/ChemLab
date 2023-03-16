extends Spatial


var active = false


func burn():
	# Вкл и выкл анимации горения
	if !active:
		$AnimationPlayer.play("burn")
		active = true
	else:
		$AnimationPlayer.play_backwards("burn")
		active = false
