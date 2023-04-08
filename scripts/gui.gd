extends Control

func _ready():
	G.label_name = $ItemInfo/TargetName/label
	G.label_bindings = $ItemInfo/TargetBindings/label
	G.label_compounds = $target_compounds
	G.label_compounds2 = $target_compounds2

func set_target_name(name, _other):
	$ItemInfo/TargetName/label.text = name
	$ItemInfo/TargetBindings/label.text = ''
	$target_compounds.text = ''
	$target_compounds2.text = ''

func _physics_process(_delta):
	if !G.target_object:
		set_target_name('', '')
