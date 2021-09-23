extends StaticBody

var active = false

func show_notes():
	var note_id = get_parent().note_number
	G.note = note_id
	if !active:
		active = true
		G.load_notes()
	else:
		active = false
		G.blank_notes()
