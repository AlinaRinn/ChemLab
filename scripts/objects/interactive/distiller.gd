extends Spatial


var active = false


func press():
	if !active:
		$valve/valve_rotate/AnimationPlayer.play("rotate")
		$valve/liquid.liquid_active = true
		active = true
	else:
		$valve/valve_rotate/AnimationPlayer.play_backwards("rotate")
		$valve/liquid.liquid_active = false
		active = false
