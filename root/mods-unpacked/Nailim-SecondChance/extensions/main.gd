extends "res://main.gd"


const SECONDCHANCE_LOG = "Nailim-SecondChance"


func _ready()->void :
	RunData.did_use_second_chance = false
	#._ready()


func _on_player_died(_p_player:Player)->void :
	_player_life_bar.hide()
	
	if true:
		if RunData.current_wave <= 20:
			ModLoaderUtils.log_info("SecondChance Activated", SECONDCHANCE_LOG)
			
			RunData.did_use_second_chance = true
			
			if RunData.current_wave > 1:
				RunData.current_wave -= 2
			else:
				RunData.current_wave = 0
			
			_wave_timer.stop()
			_on_WaveTimer_timeout()
		else:
			._on_player_died(_p_player)
