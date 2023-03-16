extends Node

signal lightOn
signal lightOff
signal paused

var level = 1

var root_level
var root_game

var active_note = null
var note = 1

var pack = {}
var target_object = null

var temp_pack = {}
var temp_object = null

var player

var game
var label_name =''
var label_bindings =''
var label_compounds =''
var label_compounds2 =''

func pause(p=true):
	get_tree().paused = p
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if p else Input.MOUSE_MODE_VISIBLE)


func to(scene):
	get_tree().change_scene("res://scenes/main/"+scene+".tscn")

# Вставляет в путь к уровню значение переменной level, которая меняется через функции кнопок меню 
func load_level():
	root_level = load("res://scenes/levels/level_"+str(level)+"/level.tscn").instance()
	root_game.get_node('level').add_child(root_level)

# Тож самое для книжек, меняется при нажатии на нее
func load_notes():
	active_note = load("res://scenes/levels/level_"+str(level)+"/notebooks/notebook_"+str(note)+".tscn").instance()
	root_game.get_node('notebook').add_child(active_note)


func blank_notes():
	root_game.get_node('notebook').remove_child(active_note)
