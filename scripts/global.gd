extends Node

# SCENES
var root_level
var root_game

# OBJECTS
var player
var game
var handler
var pack = {}
var target_object = null
var temp_pack = {}
var temp_object = null

# DATA
var level
var briefing
var load_item
var label_name 
var label_bindings 
var label_compounds 
var label_compounds2
var level_check_1_text
var level_check_2_text
var level_check_3_text
var level_check_4_text
var level_check_5_text
var level_check_finish_text

# SETTINGS
var keybind
var sensitivity = 0.005
var Resolitions: Dictionary = {"3840x2160":Vector2(3840, 2160),
								"2560x1440":Vector2(2560, 1440),
								"1920x1200":Vector2(1920, 1200),
								"1920x1080":Vector2(1920, 1080),
								"1680x1050":Vector2(1680, 1050),
								"1536x864":Vector2(1536, 864),
								"1440x900":Vector2(1440, 900),
								"1366x768":Vector2(1366, 768), 
								"1280x720":Vector2(1280, 720),
								"1024x768":Vector2(1024, 768),
								"800x600":Vector2(800, 600)}

# SIGNALS
signal paused
signal escape
signal light(state)
signal tasks(state)
signal waterflow(active, level)
signal heatflow(level)
signal power(config)
var exchanger_full = false
signal level_check_1
signal level_check_2
signal level_check_3
signal level_check_4
signal level_check_5
signal level_check_finish

# GAME ACTIONS
# Пауза
func pause(p=true):
	get_tree().paused = p
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED if p else Input.MOUSE_MODE_VISIBLE)

# Меняет сцену
func to(scene):
	print(get_tree().change_scene("res://scenes/main/"+scene+".tscn"))

# Меняет уровень - вставляет в путь значение переменной G.level (которая меняется через кнопки меню), после чего вставляет в узел level корневой сцены
func load_level():
	root_level = load("res://scenes/levels/level_"+str(level)+"/level.tscn").instance()
	root_game.get_node('level').add_child(root_level) #.remove_child(active_note)
