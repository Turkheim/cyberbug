extends ColorRect
var CURRENT_LEVEL = preload("uid://crhjo7ccsigol")

const LEVELS = preload("uid://erybpn5qg1mq")
@onready var stopwatch_label = $Control/StopwatchLabel
@onready var level = $Control/Level

var this_level = 0

var stopwatch : Stopwatch

func _ready():
	
	stopwatch = get_tree().get_first_node_in_group("Stopwatch")
	
	this_level = LEVELS.level_list.find($"..".scene_file_path)
	if ResourceLoader.exists("user://CurrentLevel.tres"):
		CURRENT_LEVEL = ResourceLoader.load("user://CurrentLevel.tres")
	else:
		#CURRENT_LEVEL.current_level = this_level
		ResourceSaver.save(CURRENT_LEVEL,"user://CurrentLevel.tres")
func _unpause():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	
	
func _win_menu():
	visible = true
	get_tree().paused = true
	level.text = "lvl" + str(this_level)
	stopwatch_label.text = stopwatch.time_to_string()
	
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	$SongWin.play()
func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_next_level_button_pressed() -> void:
	_unpause()
	#print()
	#print(CURRENT_LEVEL.current_level)
	if CURRENT_LEVEL.current_level <= this_level:
		CURRENT_LEVEL.current_level = this_level +1
		print("saving " , CURRENT_LEVEL.current_level)
		ResourceSaver.save(CURRENT_LEVEL,"user://CurrentLevel.tres")
		

	get_tree().change_scene_to_file(LEVELS.level_list[this_level+1])
