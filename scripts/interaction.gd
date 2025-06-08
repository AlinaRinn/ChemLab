extends Area

export var label = ''
export var need = ''
export var need_label = ''
export var left_click_action = ''
export var left_hold_action = ''
export var left_click_label = ''
export var right_click_action = ''
export var right_hold_action = ''
export var right_click_label = ''
export var test_click_action = ''
export var highlighting = false
var lmb_hold = false
var rmb_hold = false
var prt


var see = false

func _ready():
	$MeshInstance.hide()


func _process(_delta):
	if highlighting:
		var node = get_parent().get_children()[0]
		var material = node.get_surface_material(0).duplicate()
		if see:
			material.emission_energy = 0.5
			node.set_surface_material(0, material)
		else:
			material.emission_energy = 0.0
			node.set_surface_material(0, material)
		see = false
		
	if lmb_hold:
		prt.call(left_hold_action)
		
	if Input.is_action_just_released("ui_lmb"):
		lmb_hold = false
		
	if rmb_hold:
		prt.call(right_hold_action)
		
	if Input.is_action_just_released("ui_rmb"):
		rmb_hold = false

func binding(prt):
	# Взаимодействиие с объектами
	# Проверяем есть ли команда на ЛКМ и ПКМ
	# Если есть делаем, иначе пишем лог в консоль	
	if test_click_action && Input.is_action_pressed("ui_reaction"):
		if prt.has_method(test_click_action):
			prt.call(test_click_action)
	
	if left_click_action && Input.is_action_pressed("ui_lmb"):
		if prt.has_method(left_click_action):
			prt.call(left_click_action)
		else:
			print(left_click_action+' не существует')
			
	if left_hold_action && Input.is_action_just_pressed("ui_lmb"):
		if prt.has_method(left_hold_action):
			lmb_hold = true
		else:
			print(left_hold_action+' не существует')
	
	if right_click_action && Input.is_action_pressed("ui_rmb"):
		if prt.has_method(right_click_action):
			prt.call(right_click_action)
		else:
			print(right_click_action+' не существует')
			
	if right_hold_action && Input.is_action_just_pressed("ui_rmb"):
		if prt.has_method(right_hold_action):
			rmb_hold = true
		else:
			print(right_hold_action+' не существует')
	
func action():
	# Если для взаимодействия нужен другой предмет, и он у нас есть, делаем
	# Иначе ничего не делаем
	# Если для взаимодействия ничего не надо, просто делаем
	prt = get_parent()
	
	if need:
		if G.player.in_hand_object_id == need:
			binding(prt)
	else:
		 binding(prt)
