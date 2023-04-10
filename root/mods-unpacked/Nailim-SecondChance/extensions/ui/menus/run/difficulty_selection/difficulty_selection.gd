extends "res://ui/menus/run/difficulty_selection/difficulty_selection.gd"


var _secondchance_button:BaseButton


func _ready()->void:

	var _endlessbutton_parent = _endless_button.get_parent()
	_secondchance_button = _endless_button.duplicate()
	
	var _err = _secondchance_button.connect("pressed", self, "_on_SecondChanceButton_toggled")
	_secondchance_button.text = "SECOND_CHANCE"
	
	_endlessbutton_parent.add_child(_secondchance_button)


func _on_SecondChanceButton_toggled(button_pressed:bool)->void :
	RunData.has_second_chance = button_pressed
	ProgressData.settings.second_chance_mode_toggled = button_pressed
