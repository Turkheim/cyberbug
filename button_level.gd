extends TextureButton
var CURRENT_LEVEL = preload("uid://crhjo7ccsigol")

const LEVELS = preload("uid://erybpn5qg1mq")

@export var level = 0

func _ready():
	
	if ResourceLoader.exists("user://CurrentLevel.tres"):
		CURRENT_LEVEL = ResourceLoader.load("user://CurrentLevel.tres")
	if level <= CURRENT_LEVEL.current_level:
		pass
	else:
		disabled = true


func _on_button_down():
	get_tree().change_scene_to_file(LEVELS.level_list[level])
