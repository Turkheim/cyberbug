extends ColorRect


@export var next_scene: String = "res://Scenes/Levels/level_01.tscn"

func _unpause():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _win_menu():
	visible = true
	get_tree().paused = true
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$SongWin.play()
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_next_level_button_pressed() -> void:
	_unpause()

	get_tree().change_scene_to_file(next_scene)
