extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var burnded = false
export var burn_other = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	$burnerr/target.target_other = burn_other
	if burnded:
		$burnerr.burn()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
