extends "res://main.gd"


const SECONDCHANCE_LOG = "Nailim-SecondChance"


func _ready()->void :
	RunData.did_use_second_chance = false
	#._ready()


func _on_player_died(_p_player:Player)->void :
	_player_life_bar.hide()
	
	if RunData.has_second_chance && RunData.current_wave <= 20:
			ModLoaderLog.info("SecondChance Activated", SECONDCHANCE_LOG)
			
			RunData.did_use_second_chance = true
			RunData.second_chance_use_count += 1
			
			if RunData.current_wave > 1:
				RunData.current_wave -= 2
			else:
				RunData.current_wave = 0
			
			_wave_timer.stop()
			_on_WaveTimer_timeout()
	else:
			._on_player_died(_p_player)
