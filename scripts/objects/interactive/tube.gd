extends Spatial

onready var el = $StaticBody/CollisionShape/MeshInstance

var elements_tube = null
var opened = false
var id_obj = "tube"
var amount_liquid = 0

export var level_1 = ""
export var level_2 = ""
export var level_3 = ""
export var level_4 = ""
export var level_5 = ""


func add_water():
	elements_tube[amount_liquid].show()
	amount_liquid = amount_liquid if amount_liquid == 4 else amount_liquid + 1


func remove_water():
	elements_tube[amount_liquid].hide()
	amount_liquid = amount_liquid if amount_liquid == 0 else amount_liquid - 1


func take():
	var parent = get_parent()
	var object = G.player.get_to_hand(self)
	if object:
		parent.add_child(object)
	
	
func drug():
	if !opened:
		$AnimationPlayer.play("drug")
		opened = true
	else:
		$AnimationPlayer.play_backwards("drug")
		opened = false


func _physics_process(_delta):
	if level_1:
		$StaticBody/CollisionShape/MeshInstance/element_1.visible = true
	if level_2:
		$StaticBody/CollisionShape/MeshInstance/element_2.visible = true
	if level_3:
		$StaticBody/CollisionShape/MeshInstance/element_3.visible = true
	if level_4:
		$StaticBody/CollisionShape/MeshInstance/element_4.visible = true
	if level_5:
		$StaticBody/CollisionShape/MeshInstance/element_5.visible = true


func _ready():
	elements_tube = el.get_children()
