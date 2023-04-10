extends "res://ui/menus/ingame/wave_cleared_label.gd"


func start(_is_last_wave:bool = false, _is_run_lost:bool = false, _is_run_won:bool = false)->void :
	
	if RunData.did_use_second_chance:
		text = "SECOND_CHANCE"
		add_font_override("font", font_end_run)
	
	.start(false, false, false)
