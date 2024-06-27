extends Spatial

onready var el = $MeshInstance/liquid

var MAX_AMOUNT_SUBSTANCE = 4
var reaction = false
var elements = null
var name_substance = []
var amount_substance = 0
var opened = false
var id = "tube"
var delay_timer: Timer

func get_reaction():
	return reaction

func change_color(color):
	# Меняем цвет
	var layer = elements[amount_substance].get_children()[0]
	var material = layer.get_surface_material(0).duplicate()
	material.albedo_color = color
	material.refraction_enabled = true
	layer.set_surface_material(0, material)
	if amount_substance == 0:
		$MeshInstance/liquid/element_1/Sphere.material = material

func add_substance(sub):
	# Добавляем слой жидкости
	elements[amount_substance].show()
	name_substance[amount_substance] = sub["name"]
	
	change_color(sub["color"])
	
	amount_substance = amount_substance if amount_substance == MAX_AMOUNT_SUBSTANCE else amount_substance + 1

func remove_substance():
	# Удаляем слой
	for i in range(0, MAX_AMOUNT_SUBSTANCE+1, 1):
		elements[i].hide()
		name_substance[i] = ""
	#elements[amount_substance].hide()
	#name_substance[amount_substance] = ""
	#amount_substance = amount_substance if amount_substance == 0 else amount_substance - 1
	amount_substance = 0


func take():
	# Подбирание
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)


func _ready():
	# При создании получаем кол-во слоев
	elements = el.get_children()
	for i in range(MAX_AMOUNT_SUBSTANCE + 1):
		name_substance.append("")
	# Инициализируем таймер
	delay_timer = Timer.new()
	delay_timer.wait_time = 2.0  # Задаем время ожидания в секундах
	delay_timer.one_shot = true  # Таймер будет работать один раз
	el.add_child(delay_timer)  # Добавляем таймер как дочерний узел


func get_info():
	# Информация о содежимом в интерфейс
	var sting = ""
	for i in range(name_substance.size() - 1, -1, -1): 
		sting += name_substance[i] + "\n"
	return sting


func reaction():
	if name_substance == ["Магний+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Магний+", "", "", ""]:
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Магния"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		$MeshInstance/liquid/element_1/bubble.visible = true
		delay_timer.start()
		yield(delay_timer, "timeout")
		$MeshInstance/liquid/element_1/bubble.visible = false
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.007, 0.0225, 0.007)
		reaction = true
		
	if name_substance == ["Барий+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Барий+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.027, 0.07, 0.027)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Бария"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Стронций+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Стронций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Стронция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Кальций+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Кальций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.0135, 0.035, 0.0135)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Кальция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Кальций+", "Сульфат натрия", "", "", ""] or name_substance == ["Сульфат натрия", "Кальций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.007, 0.0225, 0.007)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Сульфат Кальция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Барий+", "Сульфат натрия", "", "", ""] or name_substance == ["Сульфат натрия", "Барий+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Сульфат Бария"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Стронций+", "Сульфат натрия", "", "", ""] or name_substance == ["Сульфат натрия", "Стронций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.0135, 0.035, 0.0135)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Сульфат Стронция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
		
	if name_substance == ["Кальций+", "Хромат калия", "", "", ""] or name_substance == ["Хромат калия", "Кальций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.007, 0.0225, 0.007)
		var sediment = $MeshInstance/sediment/sediment/sediment
		var material2 = sediment.get_surface_material(0).duplicate()
		material2.albedo_color = Color(Color.yellow)
		sediment.set_surface_material(0, material2)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Хромат Кальция"
		name_substance[1] = "Калий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true

	if name_substance == ["Стронций+", "Хромат калия", "", "", ""] or name_substance == ["Хромат калия", "Стронций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/sediment/sediment.scale = Vector3(0.0135, 0.035, 0.0135)
		var sediment = $MeshInstance/sediment/sediment/sediment
		var material2 = sediment.get_surface_material(0).duplicate()
		material2.albedo_color = Color(Color.yellow)
		sediment.set_surface_material(0, material2)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Хромат Стронция"
		name_substance[1] = "Калий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true

	if name_substance == ["Барий+", "Хромат калия", "", "", ""] or name_substance == ["Хромат калия", "Барий+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		var sediment = $MeshInstance/sediment/sediment/sediment
		var material2 = sediment.get_surface_material(0).duplicate()
		material2.albedo_color = Color(Color.yellow)
		sediment.set_surface_material(0, material2)
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Хромат Бария"
		name_substance[1] = "Калий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.refraction_enabled = false
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.visible = false
		reaction = true
