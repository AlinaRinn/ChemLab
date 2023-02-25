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
	
	if left_click_action && Input.is_action_pressed("ui_lmb"):
		if prt.has_method(left_click_action):
			prt.call(left_click_action)
		else:
			print(left_click_action+' не существует')
			
	if right_click_action && Input.is_action_pressed("ui_rmb"):
		if prt.has_method(right_click_action):
			prt.call(right_click_action)
		else:
			print(right_click_action+' не существует')