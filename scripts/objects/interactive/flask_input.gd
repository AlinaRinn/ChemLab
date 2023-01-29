extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var first_init = true
var flask = []

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


func get_flask():
	G.player.get_to_hand("res://objects/complite/interactive/flask.tscn")
	queue_free()


func flask_change_name():
	$flaskk/CollisionShape/probirka/target.target_name = flask
	for i in flask:
		var name = "\n."
		#print(flask[i])
		$flaskk/CollisionShape/probirka/target.target_name += name

func _physics_process(_delta):
	if level_1:
		$flaskk/CollisionShape/probirka/element_1.visible = true
	if level_2:
		$flaskk/CollisionShape/probirka/element_2.visible = true
	if level_3:
		$flaskk/CollisionShape/probirka/element_3.visible = true
	if level_4:
		$flaskk/CollisionShape/probirka/element_4.visible = true
	if level_5:
		$flaskk/CollisionShape/probirka/element_5.visible = true


# Called when the node enters the scene tree for the first time.
func _ready():
	flask_init()
	
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
