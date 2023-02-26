
extends Control

func _ready():
	G.label_1 = $target_name
	G.label_2 = $target_other
	


func set_target_name(name, _other):
	$target_name.text = name
	$target_other.text = ''


func _physics_process(_delta):
	if !G.target_object:
		set_target_name('', '')
