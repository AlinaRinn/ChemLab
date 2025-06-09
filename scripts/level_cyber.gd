extends Spatial

func _ready():
	$wall_door/electroshelf/auto/Node_0/StaticBody.connect("active1", $floor/table2/pc, "on_off")
	$floor/table2/pc.connect("pc_on", $floor/table2/pc/monic2, "view")
