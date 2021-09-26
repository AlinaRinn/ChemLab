extends Node

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

func to(scene):
	get_tree().change_scene("res://scenes/"+scene+".tscn")

func load_level():
	root_level = load("res://levels/level_"+str(level)+"/level.tscn").instance()
	root_game.get_node('level').add_child(root_level)

func load_notes():
	active_note = load("res://levels/level_"+str(level)+"/notebooks/notebook_"+str(note)+".tscn").instance()
	root_game.get_node('notebook').add_child(active_note)

func blank_notes():
	root_game.get_node('notebook').remove_child(active_note)

