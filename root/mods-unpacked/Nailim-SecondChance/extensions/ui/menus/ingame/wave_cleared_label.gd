extends "res://ui/menus/ingame/wave_cleared_label.gd"


func start(_is_last_wave:bool = false, _is_run_lost:bool = false, _is_run_won:bool = false)->void :
	
	if RunData.did_use_second_chance:
		text = tr("SECOND_CHANCE") + " (" + str(RunData.second_chance_use_count) + ")"
		add_font_override("font", font_end_run)
		
		# speed up text animation, so it is visible longer
		$Timer.wait_time = 0.05
	
	.start(false, false, false)
