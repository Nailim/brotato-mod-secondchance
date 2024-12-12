extends "res://singletons/run_data.gd"


var has_second_chance = false
var did_use_second_chance = false
var second_chance_use_count = 0


func get_state()->Dictionary:
	var state = .get_state()
	
	state.has_second_chance = has_second_chance
	state.did_use_second_chance = did_use_second_chance
	state.second_chance_use_count = second_chance_use_count
	
	return state


func resume_from_state(state:Dictionary)->void :
	
	if state.has("has_second_chance"): has_second_chance = state.has_second_chance
	if state.has("did_use_second_chance"): did_use_second_chance = state.did_use_second_chance
	if state.has("second_chance_use_count"): second_chance_use_count = state.second_chance_use_count
	
	.resume_from_state(state)
