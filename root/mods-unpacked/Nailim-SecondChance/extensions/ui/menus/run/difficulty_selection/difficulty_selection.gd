extends "res://ui/menus/run/difficulty_selection/difficulty_selection.gd"


var _secondchance_button:CheckButton


func _ready()->void:

	var _endlessbutton_parent = _endless_button.get_parent()
	_secondchance_button = _endless_button.duplicate()
	
	var signals = _secondchance_button.get_signal_list();
	for cur_signal in signals:
		if cur_signal.name == "toggled" || cur_signal.name == "pressed":
			var conns = _secondchance_button.get_signal_connection_list(cur_signal.name);
			for cur_conn in conns:
				_secondchance_button.disconnect(cur_conn.signal, cur_conn.target, cur_conn.method)
	
	var _err = _secondchance_button.connect("toggled", self, "_on_SecondChanceButton_toggled")
	_secondchance_button.text = "SECOND_CHANCE"
	
	_secondchance_button.pressed = false
	
	_endlessbutton_parent.add_child(_secondchance_button)


func _on_SecondChanceButton_toggled(button_pressed:bool)->void :
	RunData.has_second_chance = button_pressed
