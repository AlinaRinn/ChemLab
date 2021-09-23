extends StaticBody

var active = false

func burn():
	if !active:
		$anim.play("burn")
		active = true
	else:
		$anim.play_backwards("burn")
		active = false


func fire():
	if !$temp.temp_active:
		$temp.temp_active = true
	else:
		$temp.temp_active = false
