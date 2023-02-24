extends StaticBody

var opened = false

func drug():
	if !opened:
		$anim.play("drug")
		opened = true
	else:
		$anim.play_backwards("drug")
		opened = false
