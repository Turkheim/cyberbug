extends ColorRect

const LEVELS = preload("uid://erybpn5qg1mq")
func _unpause():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _lose_menu():
	visible = true
	get_tree().paused = true
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$SongLose.play()
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_reload_button_pressed() -> void:
	_unpause()
	get_tree().reload_current_scene()


func _on_levels_pressed():
	_unpause()
	get_tree().change_scene_to_file(LEVELS.level_list[0])
