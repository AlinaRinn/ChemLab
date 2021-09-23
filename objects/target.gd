extends Area


export var target_name = ''
export var target_id = ''

export var target_other = ''

export var delete_parent = true
export var parent_func = ''


func action():
	if target_id:
		G.pack[target_id] = {
			'name' : target_name,
			'other' : target_other
		}
	
	if parent_func:
		get_parent().call(parent_func)
		
	if delete_parent:
		get_parent().queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
