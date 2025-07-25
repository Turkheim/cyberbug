extends ColorRect

func _unpause():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _pause():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_restart_button_pressed() -> void:
	_unpause()
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()



func _on_resume_button_pressed() -> void:
	_unpause()
