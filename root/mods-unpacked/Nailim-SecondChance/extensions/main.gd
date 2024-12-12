extends "res://main.gd"


const SECONDCHANCE_LOG = "Nailim-SecondChance"

var SCMainEventListener = null


func _ready()->void :
	RunData.did_use_second_chance = false
	
	SCMainEventListener = get_node_or_null("/root/ModLoader/Nailim-SecondChance/SCMainEventListener")
	if not SCMainEventListener:
		ModLoaderLog.info("Problem with settings - disabling mod", SECONDCHANCE_LOG)

		RunData.has_second_chance = false
		ProgressData.settings.second_chance_mode_toggled = false
	
	#._ready()


func _on_player_died(p_player: Player, _args: Entity.DieArgs)->void :
	
	var player_ui: PlayerUIElements = _players_ui[p_player.player_index]
	player_ui.player_life_bar.hide()
	if RunData.is_coop_run:
		player_ui.life_bar.set_value(100)
		player_ui.life_bar.progress_color = Color.white
		player_ui.life_bar.hide_with_flash()
	
	p_player.highlight.hide()
	
	var all_players_dead: = true
	
	for player in _players:
		if not player.dead:
			all_players_dead = false
			break
	
	if not all_players_dead:
		return 
	
	if RunData.has_second_chance:
		var _max_wave = 20
		
		if SCMainEventListener:
			if SCMainEventListener.get_settings().has("SC_MAX_WAVE"):
				_max_wave = int(SCMainEventListener.get_settings().get("SC_MAX_WAVE"))
			
		if RunData.current_wave <= _max_wave:
			RunData.did_use_second_chance = true
			RunData.second_chance_use_count += 1
		
			if RunData.current_wave > 1:
				RunData.current_wave -= 2
			else:
				RunData.current_wave = 0
			
			_is_run_lost = false
			_is_run_won = false
			
			clean_up_room(false, _is_run_lost, _is_run_won)
			
			_end_wave_timer.wait_time = 3
			_wave_timer.stop()
			_wave_timer.tick_timer.stop()
			
			_end_wave_timer.start()
			
			TempStats.reset()
			ProgressData.reset_and_save_new_run_state()
			ChallengeService.complete_challenge("chal_rookie")


	if not RunData.did_use_second_chance:
		._on_player_died(p_player, _args)
