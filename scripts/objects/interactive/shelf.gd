extends MeshInstance


var active = false


func open():
	# Открыть или закрыть шкаф 
	if !active:
		active = true
		$AnimationPlayer.play("open")
	else:
		active = false
		$AnimationPlayer.play_backwards("open")
