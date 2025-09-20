extends ColorRect
#const CURRENT_LEVEL = preload("uid://crhjo7ccsigol")

const LEVELS = preload("uid://erybpn5qg1mq")

func _unpause():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _ready() -> void:
	visible = true
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	#ResourceSaver.save(CURRENT_LEVEL,"user://CurrentLevel.tres")
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	_unpause()
	get_tree().change_scene_to_file(LEVELS.level_list[0])
