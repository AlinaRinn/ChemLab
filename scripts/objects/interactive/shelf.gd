extends MeshInstance


var active = false


func open():
	if !active:
		active = true
		$AnimationPlayer.play("open")
	else:
		active = false
		$AnimationPlayer.play_backwards("open")
