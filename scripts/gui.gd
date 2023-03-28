
extends Control


func _ready():
	G.label_name = $target_name
	G.label_bindings = $target_bindings
	G.label_compounds = $target_compounds
	G.label_compounds2 = $target_compounds2

func set_target_name(name, _other):
	$target_name.text = name
	$target_bindings.text = ''
	$target_compounds.text = ''
	$target_compounds2.text = ''

func _physics_process(_delta):
	if !G.target_object:
		set_target_name('', '')
