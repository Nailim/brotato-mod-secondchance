extends "res://singletons/run_data.gd"


var has_second_chance = false
var did_use_second_chance = false
var second_chance_use_count = 0


func reset(restart:bool = false)->void :
	
	if not restart:
		has_second_chance = false
	
	did_use_second_chance = false
	second_chance_use_count = 0
	
	.reset(restart)

func get_state(
		reset:bool = false,
		shop_items:Array = [],
		reroll_price:int = 0,
		last_reroll_price:int = 0,
		initial_free_rerolls:int = 0,
		free_rerolls:int = 0
	)->Dictionary:
	
	if reset:
		return {
			"has_run_state":false
		}
	
	return {
		"has_run_state":true, 
		"enemy_scaling":current_run_accessibility_settings.duplicate(), 
		"nb_of_waves":nb_of_waves, 
		"current_zone":current_zone, 
		"current_level":current_level, 
		"current_xp":current_xp, 
		"max_weapons":max_weapons, 
		"current_wave":current_wave, 
		"current_difficulty":current_difficulty, 
		"gold":gold, 
		"bonus_gold":bonus_gold, 
		"elites_spawn":elites_spawn, 
		"shop_effects_checked":shop_effects_checked, 
		
		"weapons":weapons.duplicate(), 
		"items":items.duplicate(), 
		"effects":effects.duplicate(), 
		"challenges_completed_this_run":challenges_completed_this_run, 
		"current_character":current_character, 
		"starting_weapon":starting_weapon, 
		"active_set_effects":active_set_effects.duplicate(), 
		"unique_effects":unique_effects.duplicate(), 
		"additional_weapon_effects":additional_weapon_effects.duplicate(), 
		"tier_iv_weapon_effects":tier_iv_weapon_effects.duplicate(), 
		"tier_i_weapon_effects":tier_i_weapon_effects.duplicate(), 
		"locked_shop_items":locked_shop_items, 
		"current_background":current_background, 
		"appearances_displayed":appearances_displayed.duplicate(), 
		
		"active_sets":active_sets.duplicate(), 
		"difficulty_unlocked":difficulty_unlocked, 
		"max_endless_wave_record_beaten":max_endless_wave_record_beaten, 
		"is_endless_run":is_endless_run, 
		"chal_hoarder_value":chal_hoarder_value, 
		"chal_hoarder_completed":chal_hoarder_completed, 
		"chal_recycling_value":chal_recycling_value, 
		"chal_recycling_completed":chal_recycling_completed, 
		"chal_recycling_current":chal_recycling_current, 
		"chal_hungry_value":chal_hungry_value, 
		"chal_hungry_completed":chal_hungry_completed, 
		"consumables_picked_up_this_run":consumables_picked_up_this_run, 
		
		"shop_items":shop_items, 
		"reroll_price":reroll_price, 
		"last_reroll_price":last_reroll_price, 
		"initial_free_rerolls":initial_free_rerolls, 
		"free_rerolls":free_rerolls, 
		"tracked_item_effects":tracked_item_effects,
		
		"has_second_chance":has_second_chance,
		"did_use_second_chance":did_use_second_chance,
		"second_chance_use_count":second_chance_use_count
	}

func resume_from_state(state:Dictionary)->void :
	
	if state.has("has_second_chance"):has_second_chance = state.has_second_chance
	if state.has("did_use_second_chance"):did_use_second_chance = state.did_use_second_chance
	if state.has("second_chance_use_count"):second_chance_use_count = state.second_chance_use_count
	
	.resume_from_state(state)
