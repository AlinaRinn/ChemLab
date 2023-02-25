extends Spatial


var active = false


func burn():
	# Отвечает за анимацию горения
	if !active:
		$AnimationPlayer.play("burn")
		active = true
	else:
		$AnimationPlayer.play_backwards("burn")
		active = false
