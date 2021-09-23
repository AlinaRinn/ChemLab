extends Area


export var area_temp = ''
export var area_id = ''

export var temp_active = false


func action():
	if area_id:
		G.temp_pack[area_id] = {
			'temp' : area_temp
		}

func _physics_process(delta):
	if temp_active:
		#$mesh.visible = true
		$target.target_name = str(area_temp)
	else:
		#$mesh.visible = false
		$target.target_name = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
