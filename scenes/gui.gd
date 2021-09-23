extends Control

func set_target_name(name, other):
	$target_name.text = name
	$target_other.text = other

func _physics_process(delta):
	if !G.target_object:
		set_target_name('', '')
	elif G.target_object && 'target_name' in G.target_object:
		set_target_name(G.target_object.target_name, 
		G.target_object.target_other)
