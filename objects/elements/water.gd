extends Spatial

var isLiq = true

func change():
	if isLiq:
		$sed.visible = isLiq
		isLiq = false
		$liq.visible = isLiq
	else:
		$sed.visible = isLiq
		isLiq = true
		$liq.visible = isLiq
