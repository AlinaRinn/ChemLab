extends Area


export var liquid = ''
export var liquid_id = ''

export var liquid_active = false


func action():
	if liquid_id:
		G.temp_pack[liquid_id] = {
			'temp' : liquid
		}

func _physics_process(_delta):
	if liquid_active:
		#$mesh.visible = true
		$target.target_name = str(liquid)
	else:
		#$mesh.visible = false
		$target.target_name = ''

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
