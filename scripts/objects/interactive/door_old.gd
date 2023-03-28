extends Spatial


func exit():
	# Выход в меню
	G.to('main_menu')
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
