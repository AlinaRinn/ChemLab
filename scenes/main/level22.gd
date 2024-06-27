extends Button

func _pressed():
	G.level = 2
	G.to('cut_scene_practicum')
	G.briefing = "Используемые реактивы и оборудование\n* кристаллы тетрабората натрия;\n* вода;\n* раствор фенолфталеина;\n* чашка Петри;\n\nХод работы \nНалить в пустую чашку Петри немного воды. Добавить в чашку Петри несколько кристаллов тетрабората натрия. 3.	В чашку Петри с полученным раствором добавить 2-3 капли фенолфталеина. Проследить за реакцией."
	G.load_item = '22'
	G.level_check_1_text = "Добавить воду в чашку Петри"
	G.level_check_2_text = "Добавить кристаллы тетрабората натрия в чашку Петри"
	G.level_check_3_text = "Добавить фенолфталеин в чашку Петри"
	G.level_check_4_text = null
	G.level_check_5_text = null
	G.level_check_finish_text = "Наблюдать протекание реакций"
