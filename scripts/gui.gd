extends Control

func _ready():
	G.label_name = $ItemInfo/TargetName/label
	G.label_bindings = $ItemInfo/TargetBindings/label
	G.label_compounds = $ItemContent/ContentHand/label
	G.label_compounds2 = $ItemContent/ContentOutside/label
	if G.level_check_1_text != null:
		$LevelProgress/Check1/CheckBox/Label.text = G.level_check_1_text
		$LevelProgress/Check1/CheckBox.visible = true
		G.connect("level_check_1", self, "check", [1])

	if G.level_check_2_text != null:
		$LevelProgress/Check2/CheckBox/Label.text = G.level_check_2_text
		$LevelProgress/Check2/CheckBox.visible = true
		G.connect("level_check_2", self, "check", [2])
		
	if G.level_check_3_text != null:
		$LevelProgress/Check3/CheckBox/Label.text = G.level_check_3_text
		$LevelProgress/Check3/CheckBox.visible = true
		G.connect("level_check_3", self, "check", [3])
		
	if G.level_check_4_text != null:
		$LevelProgress/Check4/CheckBox/Label.text = G.level_check_4_text
		$LevelProgress/Check4/CheckBox.visible = true
		G.connect("level_check_4", self, "check", [4])
		
	if G.level_check_5_text != null:
		$LevelProgress/Check5/CheckBox/Label.text = G.level_check_5_text
		$LevelProgress/Check5/CheckBox.visible = true
		G.connect("level_check_5", self, "check", [5])
		
	if G.level_check_finish_text != null:
		$LevelProgress/Check5051/CheckBox/Label.text = G.level_check_finish_text
		$LevelProgress/Check5051/CheckBox.visible = true
		G.connect("level_check_finish", self, "check", [5051])
		
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

func check(number):
	get_node("LevelProgress/Check"+str(number)+"/CheckBox").pressed = true
