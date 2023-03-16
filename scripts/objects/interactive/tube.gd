extends Spatial

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


func add_water(liq):
	elements_tube[amount_liquid].show()
	name_liquid[amount_liquid] = liq
	amount_liquid = amount_liquid if amount_liquid == MAX_AMOUNT_LIQUID \
		else amount_liquid + 1


func remove_water():
	print(name_liquid)
	elements_tube[amount_liquid].hide()
	name_liquid[amount_liquid] = ""
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
	elements_tube = el.get_children()
	for i in range(MAX_AMOUNT_LIQUID + 1):
		name_liquid.append("")
