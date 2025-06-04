extends Spatial

export(bool) var flow
var finished
var audiopos = 0.0

func _ready():
	G.connect("waterflow", self, "waterflow")
	
func waterflow(active):
	if active and !finished:
		$AnimationPlayer.play("Filling")
		$AudioStreamPlayer3D.play(audiopos)
	else:
		$AnimationPlayer.stop(false)
		audiopos = $AudioStreamPlayer3D.get_playback_position()
		$AudioStreamPlayer3D.stop()

func finished():
	finished = true
