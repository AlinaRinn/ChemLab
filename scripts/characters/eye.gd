extends RayCast

var object = null

func _physics_process(_delta):
	var n = get_collider()
	# Вывод названия предмета при наведении
	if !n:
		G.target_object = null
		object = null
	if n != object:
		object = n
		G.target_object = n
