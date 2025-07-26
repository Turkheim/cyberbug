extends ColorRect


func _unpause():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _lose_menu():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$SongLose.play()
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_reload_button_pressed() -> void:
	_unpause()
	get_tree().reload_current_scene()
