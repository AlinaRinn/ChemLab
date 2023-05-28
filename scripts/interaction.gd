extends Area

export var label = ''
export var need = ''
export var need_label = ''
export var left_click_action = ''
export var left_click_label = ''
export var right_click_action = ''
export var right_click_label = ''
export var test_click_action = ''

func _ready():
	$MeshInstance.hide()

func binding(prt):
	# Взаимодействиие с объектами
	# Проверяем есть ли команда на ЛКМ и ПКМ
	# Если есть делаем, иначе пишем лог в консоль	
	if test_click_action && Input.is_action_pressed("ui_reaction"):
		if prt.has_method(test_click_action):
			prt.call(test_click_action)
			G.emit_signal("level_check_finish")
	
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
	
func action():
	# Если для взаимодействия нужен другой предмет, и он у нас есть, делаем
	# Иначе ничего не делаем
	# Если для взаимодействия ничего не надо, просто делаем
	var prt = get_parent()
	
	if need:
		if G.player.in_hand_object_id == need:
			binding(prt)
	else:
		 binding(prt)
