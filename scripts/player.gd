extends KinematicBody

onready var rc = $head/eye
onready var anim = $AnimationPlayer
onready var hand = $head/player_hand
onready var hand1 = $head/hand
var substance = load("res://scripts/substance.res").sub
const GRAVITY = 0.4
const SPEED = 6
const SPEED_RUN = 12
const SPEED_JUMP = 10
var SPEED_TURN
var vel = Vector3()
var state = "stay"
var task_state = true
var picked_object
var pull_power = 4
var in_hand_object = null
var in_hand_object_id = null
var cast = null

func _ready():
	# Прячет курсор при загрузке на уровень
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	SPEED_TURN = G.sensitivity


func _input(e):
	# Обрабатываем движение мышкой
	if e is InputEventMouseMotion:
		rotation.y -= e.relative.x * SPEED_TURN
		$head.rotation.x = clamp($head.rotation.x-e.relative.y* SPEED_TURN,-1.3, 1.2)
	
	# Обрабатываем нажатия мышкой
	if e is InputEventMouse:
		if e.is_pressed():
			action()


func _physics_process(_delta):
	get_input()
	vel = move_and_slide(vel, Vector3.UP)
	get_object()
	get_info_object()
	
	if picked_object != null:
		var a = picked_object.global_transform.origin
		var b = hand1.global_transform.origin
		picked_object.set_linear_velocity((b-a)*pull_power)


func get_input():
	var dir = Vector3()
	var speed = SPEED
	
	# Выход в меню
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		G.emit_signal("paused")
		get_tree().paused = true
		
	# Обработка кнопок движения
	if Input.is_action_pressed("ui_left"):
		dir.x = -1
	if Input.is_action_pressed("ui_right"):
		dir.x = 1
	if Input.is_action_pressed("ui_up"):
		dir.z = -1
	if Input.is_action_pressed("ui_down"):
		dir.z = 1
	
	# Зум камеры
	if Input.is_action_just_pressed("ui_zoom"):
		if state == "stay":
			$ZoomPlayer.play("zoomStand")
		else: 
			$ZoomPlayer.play("zoomSit")
#$head/ClippedCamera.transform.origin.z = -2
		
	if Input.is_action_just_released("ui_zoom"):
		if state == "stay":
			$ZoomPlayer.play_backwards("zoomStand")
		else: 
			$ZoomPlayer.play_backwards("zoomSit")

	# Видимость задач
	if Input.is_action_just_pressed("ui_tasks") and task_state:
		G.emit_signal("tasks", 0)
		task_state = false
	elif Input.is_action_just_pressed("ui_tasks") and !task_state:
		G.emit_signal("tasks", 1)
		task_state = true
	
	# Дроп предмета в руке
	if Input.is_action_just_pressed("ui_drop"):
		drop()
	
	# Обработка кнопки прыжка
	if Input.is_action_just_pressed("ui_select") && is_on_floor():
		vel.y = SPEED_JUMP 
	
	# Обработка кнопки приседания 
	if Input.is_action_pressed("ui_ctrl"):
		if state == "stay":
			anim.play("sit")
			state = "sit"
	elif state == "sit":
		state = "stay"
		anim.play_backwards("sit")
	
	# и бега
	elif Input.is_action_pressed("ui_shift"):
		anim.play("run")
		speed = SPEED_RUN
	elif anim.is_playing():
		anim.stop()
		anim.seek(0, true)
		
	# Вращение
	if dir:
		dir = dir.rotated(Vector3.UP, rotation.y) * speed 
		
	# Позволяет передвигать предметы
	if Input.is_action_just_pressed("ui_move"):
		if picked_object == null:
			var collider = cast.get_owner() if cast else null 
			if collider != null and collider is RigidBody:
				picked_object = collider
				picked_object.axis_lock_angular_x = true
				picked_object.axis_lock_angular_y = true
				picked_object.axis_lock_angular_z = true
		elif picked_object != null:
			picked_object.axis_lock_angular_x = false
			picked_object.axis_lock_angular_y = false
			picked_object.axis_lock_angular_z = false
			picked_object = null

	# Позволяет вращать предметы
	if Input.is_action_pressed("ui_rotate") and picked_object != null:
		picked_object.axis_lock_angular_x = false
		picked_object.angular_velocity.x = 4
	elif picked_object != null:
		picked_object.axis_lock_angular_x = true

	# Взаимодействие с блокнотами
		#if G.active_note:
			#G.blank_notes()
			#G.active_note = null
			
	# Движение
	vel.y -= GRAVITY 
	vel.x = dir.x
	vel.z = dir.z	


func action():
	# Для взаимодействия с объектами
	if cast:
		cast.action()


func drop():
	# Проверяем есть ли предмет в руке
	if !in_hand_object:
			return
			
	# Удаляем предмет из рук, и добавляем его на сцену
	var drop_obj = in_hand_object
	hand.remove_child(in_hand_object)
	drop_obj.translation = G.player.get_node('head/drop').global_transform.origin
	drop_obj.angular_velocity = Vector3(0, 0, 0)
	drop_obj.linear_velocity = Vector3(-transform.basis[2][0], transform.basis[1][0], -transform.basis[0][0]) * 3 + (G.player.vel / 2)
	in_hand_object = null
	in_hand_object_id = null
	drop_obj.sleeping = false
	G.root_level.add_child(drop_obj)


func get_object():
	# Пускает луч для определенния предмета
	if rc.is_colliding():
		cast = rc.get_collider()
		if !('label' in cast):
			cast = null
	else:
		cast = null


func get_info_object():
	# Выводим инфо о слоях пробирке в руке
	if in_hand_object != null && in_hand_object.has_method("get_info"):
		G.label_compounds.text += in_hand_object.get_info()
	
	if cast:
		var owner = cast.get_owner()
		
		if cast.get("highlighting"):
			cast.see = true
		
		# Название предмета на который навелись
		G.label_name.text = cast.label
		var liquid_obj = owner.get("subs")
		if liquid_obj != "" && liquid_obj:
			G.label_name.text += ' "' + substance[liquid_obj]["name"] + '"'
		
		# Содержимое пробирки на которую навелись
		if owner.has_method("get_info"):
			G.label_compounds2.text += owner.get_info()
		
		# Пишет какой предмет нужен для взаимодействия
		if cast.need_label != "":
			G.label_bindings.text += "Взаимодействует с " + cast.need_label + "\n"
			
		# Пишет кнопки взаимодействия
		else:
			if cast.left_click_label != "":
				G.label_bindings.text += "ЛКМ - " + cast.left_click_label + "\n"
			if cast.right_click_label != "":
				G.label_bindings.text += "ПКМ - " + cast.right_click_label + "\n"


func get_to_hand(object):
	$head/pincet.visible = false
	$head/pipette.visible = false
	# Если в руках что то есть, и это тот же предмет, меняем местами
	# Иначе, что в руках выкидываем, и берем новый
	var swap_obj = null
	if in_hand_object:
		if in_hand_object_id == object.id:
			swap_obj = in_hand_object
			swap_obj.translation = object.translation
			hand.remove_child(in_hand_object)
		else:
			drop()
	
	# Удаляет obj из старой сцены, скидывает положение и поворот
	# Добавляет в руки новый obj
	object.get_parent().remove_child(object)
	object.translation = Vector3(0, 0, 0)
	object.rotation = Vector3(0, 0, 0)
	hand.add_child(object)
	in_hand_object = object
	in_hand_object_id = object.id
	
	if object.get("isMetal") != null:
		if (in_hand_object.isMetal):
			$head/pincet.visible = true
		else:
			$head/pipette.visible = true
		
	return swap_obj
