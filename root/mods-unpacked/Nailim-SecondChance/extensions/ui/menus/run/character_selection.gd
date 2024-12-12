extends "res://ui/menus/run/character_selection.gd"


var _secondchance_button:CheckButton


func _ready()->void:
	var _endlessbutton_parent = _endless_button.get_parent()
	_secondchance_button = _endless_button.duplicate(0)
	
	var _err = _secondchance_button.connect("toggled", self, "_on_SecondChanceButton_toggled")
	
	_secondchance_button.text = "SECOND_CHANCE_BUTTON"
	
	if not ProgressData.settings.has('second_chance_mode_toggled'):
		# Something is wrong - disable
		ProgressData.settings.second_chance_mode_toggled = false
	
	_secondchance_button.pressed = ProgressData.settings.second_chance_mode_toggled
	RunData.has_second_chance = ProgressData.settings.second_chance_mode_toggled
	
	_endlessbutton_parent.add_child(_secondchance_button)


func _on_SecondChanceButton_toggled(button_pressed:bool)->void :
	RunData.has_second_chance = button_pressed
	ProgressData.settings.second_chance_mode_toggled = button_pressed
