extends Control



func _on_left_button_button_down() -> void:
	Input.action_press("ui_left")

func _on_left_button_button_up() -> void:
	Input.action_release("ui_left")

func _on_right_button_button_down() -> void:
	Input.action_press("ui_right")

func _on_right_button_button_up() -> void:
	Input.action_release("ui_right")
