extends StaticBody

var active = false

func distiller_active():
	if !active:
		$check_rotate/anim.play("rotate")
		$target.target_name = "Выключить дистиллятор"
		active = true
	else:
		$check_rotate/anim.play_backwards("rotate")
		$target.target_name = "Включить дистиллятор"
		active = false

func liquid():
	if !$liquid.liquid_active:
		$liquid.liquid_active = true
	else:
		$liquid.liquid_active = false
