extends Button

func _pressed():
	OS.set_window_fullscreen(false)
	OS.window_size = Vector2(2560,1440)
