extends ColorRect

@export var level = 1

func _unpause():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _win_menu():
	visible = true
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$SongWin.play()
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_next_level_button_pressed() -> void:
	_unpause()
	if level == 1:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_02.tscn")
	elif level == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_03.tscn")
	elif level == 3:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_04.tscn")
	elif level == 4:
			get_tree().change_scene_to_file("res://Scenes/Levels/level_05.tscn")
	elif level == 5:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_06.tscn")
	elif level == 6:
		get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
