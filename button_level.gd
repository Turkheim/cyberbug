extends TextureButton

const LEVELS = preload("uid://erybpn5qg1mq")

@export var level = 0
func _on_button_down():
	get_tree().change_scene_to_file(LEVELS.level_list[level])
