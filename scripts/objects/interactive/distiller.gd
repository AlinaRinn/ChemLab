extends Spatial


var active = false


func press():
	if !active:
		$valve/valve_rotate/AnimationPlayer.play("rotate")
		active = true
	else:
		$valve/valve_rotate/AnimationPlayer.play_backwards("rotate")
		active = false
