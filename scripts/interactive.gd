extends Area

export var label = ''
export var left_click_action = ''
export var left_click_label = ''
export var right_click_action = ''
export var right_click_label = ''


func _ready():
	$MeshInstance.hide()


func action():
	var prt = get_parent()
	
	if left_click_action:
		if prt.has_method(left_click_action):
			prt.call(left_click_action)
		else:
			print(left_click_action+' не существует')

