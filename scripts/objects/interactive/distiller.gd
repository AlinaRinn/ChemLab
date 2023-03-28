extends Spatial


var active = false


func press():
	# Открыть закрыть вентель
	if !active:
		$valve/valve_rotate/AnimationPlayer.play("rotate")
		active = true
	else:
		$valve/valve_rotate/AnimationPlayer.play_backwards("rotate")
		active = false
