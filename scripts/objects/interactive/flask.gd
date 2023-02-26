extends Spatial


var first_init = true
var flask = []
var opened = false

export var level_1 = ""
export var level_2 = ""
export var level_3 = ""
export var level_4 = ""
export var level_5 = ""


func flask_init():
	flask.clear()
	flask.append(level_1)
	flask.append(level_2)
	flask.append(level_3)
	flask.append(level_4)
	flask.append(level_5)
	print(flask)
	#flask_change_name()


func take():
	get_parent().remove_child(self)	
	self.translation = Vector3(0, 0, 0)
	G.player.get_to_hand(self)
	
func drug():
	if !opened:
		$AnimationPlayer.play("drug")
		opened = true
	else:
		$AnimationPlayer.play_backwards("drug")
		opened = false


func flask_change_name():
	$StaticBody/CollisionShape/MeshInstance/target.target_name = flask
	for i in flask:
		var name = "\n."
		#print(flask[i])
		$StaticBody/CollisionShape/MeshInstance/target.target_name += name


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
	flask_init()
