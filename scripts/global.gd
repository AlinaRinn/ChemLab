extends Node

signal lightOn
signal lightOff
signal paused
signal hide_tasks
signal show_tasks
signal escape
signal level_check_1
signal level_check_2
signal level_check_3
signal level_check_4
signal level_check_5
signal level_check_finish

# scenes
var root_level
var root_game

# objects
var player
var game
var handler
var pack = {}
var target_object = null
var temp_pack = {}
var temp_object = null

# data
var level 
var note
var briefing
var load_item
var level_check_1_text
var level_check_2_text
var level_check_3_text
var level_check_4_text
var level_check_5_text
var level_check_finish_text
var active_note = null
var label_name 
var label_bindings 
var label_compounds 
var label_compounds2

# settings
var sensitivity = 0.005
var screenState = true

func pause(p=true):
	get_tree().paused = p
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if p else Input.MOUSE_MODE_VISIBLE)

# Меняет сцену
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
