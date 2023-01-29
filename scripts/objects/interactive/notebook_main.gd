extends Spatial

export var note_number = ""
export var note_other = ""

func _ready():
	$target.target_other = note_other
