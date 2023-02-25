extends Spatial

var active = false

func press():
	if !active:
		$checker/check_rotate/anim.play("rotate")
		active = true
		$checker/liquid.liquid_active = true
	else:
		$checker/check_rotate/anim.play_backwards("rotate")
		active = false
		$checker/liquid.liquid_active = false
