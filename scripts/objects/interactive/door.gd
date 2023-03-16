extends MeshInstance


var active = false


func open():
	# Открыт или закрыть дверь
	if !active:
		active = true
		$AnimationPlayer.play("open")
	else:
		active = false
		$AnimationPlayer.play_backwards("open")
