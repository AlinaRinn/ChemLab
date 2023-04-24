extends Control

func _ready():
	G.label_name = $ItemInfo/TargetName/label
	G.label_bindings = $ItemInfo/TargetBindings/label
	G.label_compounds = $ItemContent/ContentHand/label
	G.label_compounds2 = $ItemContent/ContentOutside/label
	
func set_target_name(name, _other):
	$ItemInfo/TargetName/label.text = name
	$ItemInfo/TargetBindings/label.text = ''
	$ItemContent/ContentHand/label.text = ''
	$ItemContent/ContentOutside/label.text = ''
		
func _physics_process(_delta):
	if $ItemContent/ContentHand/label.get_text() != "":
		$ItemContent/ContentHand/title.show()
	else:
		$ItemContent/ContentHand/title.hide()
		
	if !G.target_object:
		set_target_name('', '')

