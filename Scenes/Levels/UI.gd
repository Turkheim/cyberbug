extends Control

var bus_idx = AudioServer.get_bus_index("Master")
var is_muted = false

func _on_left_button_button_down() -> void:
	Input.action_press("ui_left")

func _on_left_button_button_up() -> void:
	Input.action_release("ui_left")

func _on_right_button_button_down() -> void:
	Input.action_press("ui_right")

func _on_right_button_button_up() -> void:
	Input.action_release("ui_right")


func _on_mute_pressed() -> void:
	if !is_muted :
		AudioServer.set_bus_mute(bus_idx, true) # or false
		is_muted = true
	else:
		AudioServer.set_bus_mute(bus_idx, false) # or false
		is_muted = false

#
#func _on_settings_button_down() -> void:
	#Pause_menu.instance._pause()
	#print("arggg")

func _on_settings_pressed() -> void:
	Pause_menu.instance._pause()
	print("arggg")
