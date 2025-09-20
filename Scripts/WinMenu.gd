extends ColorRect

const LEVELS = preload("uid://erybpn5qg1mq")
@export var next_scene  = 1

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

	get_tree().change_scene_to_file(LEVELS.level_list[next_scene])
