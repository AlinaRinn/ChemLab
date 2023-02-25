extends Area

export var label = ''
export var on_action = ''
export var on_act_label = ''


func _ready():
	pass
	#$MeshInstance.hide()


func action():
	var prt = get_parent()
	
	if on_action:
		if prt.has_method(on_action):
			prt.call(on_action)
		else:
			print(on_action+' не существует')

