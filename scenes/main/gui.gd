extends Control

func set_target_name(name, _other):
	$target_name.text = name
	$target_other.text = ''

func _physics_process(_delta):
	if !G.target_object:
		set_target_name('', '')
	elif G.target_object && 'target_name' in G.target_object:
		set_target_name(G.target_object.target_name, 
		G.target_object.target_other)