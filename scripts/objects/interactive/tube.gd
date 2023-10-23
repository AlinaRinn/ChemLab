extends Spatial

<<<<<<< HEAD
onready var el = $CollisionShape/MeshInstance

var MAX_AMOUNT_LIQUID = 4

var elements_tube = null
var name_liquid = []
var amount_liquid = 0
var opened = false
var id = "tube"

export var level_1 = ""
export var level_2 = ""
export var level_3 = ""
export var level_4 = ""
export var level_5 = ""


func change_color(liq):
	var layer = elements_tube[amount_liquid].get_children()[0]
	var material = layer.get_surface_material(0).duplicate()
	
	match liq:
		"не кислота":
			material.albedo_color = Color.olive
		"металллллл":
			material.albedo_color = Color.silver
		"кислота":
			material.albedo_color = Color.orange
		"вода":
			material.albedo_color = Color.blue
			
	layer.set_surface_material(0, material)


func add_liquid(liq):
	# Добавляем слой жидкости
	elements_tube[amount_liquid].show()
	name_liquid[amount_liquid] = liq
	change_color(liq
	)
	amount_liquid = amount_liquid if amount_liquid == MAX_AMOUNT_LIQUID \
		else amount_liquid + 1

func remove_liquid():
	# Удаляем слой
	elements_tube[amount_liquid].hide()
	name_liquid[amount_liquid] = ""
	amount_liquid = amount_liquid if amount_liquid == 0 else amount_liquid - 1
=======
onready var el = $MeshInstance/liquid

var MAX_AMOUNT_SUBSTANCE = 4

var elements = null
var name_substance = []
var amount_substance = 0
var opened = false
var id = "tube"


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
>>>>>>> dev


func take():
	# Подбирание
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)


<<<<<<< HEAD
func _physics_process(_delta):
	if level_1:
		$CollisionShape/MeshInstance/element_1.visible = true
	if level_2:
		$CollisionShape/MeshInstance/element_2.visible = true
	if level_3:
		$CollisionShape/MeshInstance/element_3.visible = true
	if level_4:
		$CollisionShape/MeshInstance/element_4.visible = true
	if level_5:
		$CollisionShape/MeshInstance/element_5.visible = true


func _ready():
	# При создании получаем кол-во слоев
	elements_tube = el.get_children()
	for i in range(MAX_AMOUNT_LIQUID + 1):
		name_liquid.append("")

func get_info():
	var sting = " "
	for i in range(name_liquid.size() - 1, -1, -1): 
		sting += str(i + 1) + ") " + name_liquid[i] + "\n"
	return sting
=======
func _ready():
	# При создании получаем кол-во слоев
	elements = el.get_children()
	for i in range(MAX_AMOUNT_SUBSTANCE + 1):
		name_substance.append("")


func get_info():
	# Информация о содежимом в интерфейс
	var sting = ""
	for i in range(name_substance.size() - 1, -1, -1): 
		sting += name_substance[i] + "\n"
	return sting


func reaction():
	if name_substance == ["Магний+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Магний+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Магния"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.material = material
		
	if name_substance == ["Барий+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Барий+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Бария"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.material = material
		
	if name_substance == ["Стронций+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Стронций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Стронция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.material = material
		
	if name_substance == ["Кальций+", "Карбонат натрия", "", "", ""] or name_substance == ["Карбонат натрия", "Кальций+", "", "", ""]:
		$MeshInstance/sediment/sediment.visible = true
		$MeshInstance/liquid/element_2.visible = false
		name_substance[0] = "Карбонат Кальция"
		name_substance[1] = "Натрий"
		var layer = $MeshInstance/liquid/element_1/liq
		var material = layer.get_surface_material(0).duplicate()
		material.albedo_color = Color(0.752941, 0.752941, 0.752941, 0.7)
		layer.set_surface_material(0, material)
		$MeshInstance/liquid/element_1/Sphere.material = material
>>>>>>> dev
