extends Spatial

onready var el = $CollisionShape/tube/liquid

var MAX_AMOUNT_SUBSTANCE = 4

var elements = null
var name_substance = []
var amount_substance = 0
var opened = false
var id = "tube"

export(bool) var isSpiral
export var level_1 = ""
export var level_2 = ""
export var level_3 = ""
export var level_4 = ""
export var level_5 = ""


func change_color(color):
	# Меняем цвет
	var layer = elements[amount_substance].get_children()[0]
	var material = layer.get_surface_material(0).duplicate()
	material.albedo_color = color
	layer.set_surface_material(0, material)


func add_substance(sub):
	# Добавляем слой жидкости
	elements[amount_substance].show()
	name_substance[amount_substance] = sub["name"]
	
	change_color(sub["color"])
	
	amount_substance = amount_substance if amount_substance == MAX_AMOUNT_SUBSTANCE \
		else amount_substance + 1


func remove_substance():
	# Удаляем слой
	elements[amount_substance].hide()
	name_substance[amount_substance] = ""
	amount_substance = amount_substance if amount_substance == 0 else amount_substance - 1


func take():
	# Подбирание
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)


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
	elements = el.get_children()
	for i in range(MAX_AMOUNT_SUBSTANCE + 1):
		name_substance.append("")

	if !isSpiral:
		$CollisionShape/tube/spiral.visible = false
		$CollisionShape/tube/sediment/element_1.visible = false
		$CollisionShape/tube/sediment/element_2.visible = false


func get_info():
	# Информация о содежимом в интерфейс
	var sting = ""
	for i in range(name_substance.size() - 1, -1, -1): 
		sting += name_substance[i] + "\n"
	return sting
