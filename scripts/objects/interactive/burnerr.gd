extends StaticBody


var active = false


func burn():
	# Отвечает за анимацию горения
	if !active:
		$anim.play("burn")
		active = true
	else:
		$anim.play_backwards("burn")
		active = false


func fire():
	# Зачем это надо не понимаю
	# горит и без этого
	if !$temp.temp_active:
		$temp.temp_active = true
	else:
		$temp.temp_active = false
