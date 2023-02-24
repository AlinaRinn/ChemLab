extends Area

# штуки которые помогают взаимодействовать
# как работают не понятно
# возможно костыль

func _on_Area_body_entered(_body):
	$'../../'.action_object = _body


func _on_Area_body_exited(_body):
	$'../../'.action_object = null
