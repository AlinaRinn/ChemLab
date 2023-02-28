extends MeshInstance

var isOpen = false

func open():
	if !isOpen:
		isOpen = true
		$AnimationPlayer.play("open")
	elif isOpen:
		isOpen = false
		$AnimationPlayer.play_backwards("open")
