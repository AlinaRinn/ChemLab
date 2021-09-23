extends Area

func _on_Area_body_entered(body):
	$'../../'.action_object = body


func _on_Area_body_exited(body):
	$'../../'.action_object = null
