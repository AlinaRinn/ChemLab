extends Spatial

func _ready():
	$wall_door/electroshelf/auto/Node_0/StaticBody.connect("active1", $floor/table2/pc, "on_off")
