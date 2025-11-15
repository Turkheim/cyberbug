class_name Pause_menu 

extends ColorRect

var bus_idx = AudioServer.get_bus_index("Master")
var is_muted = false

const LEVELS = preload("uid://erybpn5qg1mq")
static var instance: Pause_menu

func _init() -> void:
	instance = self

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Menu"):
	#if event .is_action_pressed("ui_cancel"):
		_pausing()

func _unpause():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	visible = false
	$Control/SongMenu.stop()
	
func _pause():
	visible = true
	get_tree().paused = true
	#Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$Control/SongMenu.play()
func _on_restart_button_pressed() -> void:
	_unpause()
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()



func _on_resume_button_pressed() -> void:
	_unpause()
	
func _pausing():
	print ("pausing")
	if visible :
		_unpause()
		print("sacando pausa")
	else:
		_pause()
		print("poniendo pausa")


func _on_levels_pressed():
	_unpause()
	get_tree().change_scene_to_file(LEVELS.level_list[0])


func _on_mute_pressed():
	if !is_muted :
		AudioServer.set_bus_mute(bus_idx, true) # or false
		is_muted = true
	else:
		AudioServer.set_bus_mute(bus_idx, false) # or false
		is_muted = false
