extends Spatial


export var burnded = false
export var burn_other = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$burnerr/target.target_other = burn_other
	if burnded:
		$burnerr.burn()
