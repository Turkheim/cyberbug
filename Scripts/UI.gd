extends Control

var bus_idx = AudioServer.get_bus_index("Master")
var is_muted = false

@onready var ui_rotate_left: Sprite2D = $UiRotateLeft
@onready var ui_rotate_right: Sprite2D = $UiRotateRight
@onready var stopwatch_label = $StopwatchLabel

var stopwatch : Stopwatch

func _ready():
	stopwatch = $Stopwatch
func _process(delta):
	update_stopwatch_label()
	
func update_stopwatch_label():
	stopwatch_label.text = stopwatch.time_to_string()


func _on_left_button_button_down() -> void:
	Input.action_press("SteerLeft")

func _on_left_button_button_up() -> void:
	Input.action_release("SteerLeft")
	if ui_rotate_left.visible:
		ui_rotate_left.visible = false
	else:
		pass
	
	
func _on_right_button_button_down() -> void:
	Input.action_press("SteerRight")

func _on_right_button_button_up() -> void:
	Input.action_release("SteerRight")
	if ui_rotate_right.visible:
		ui_rotate_right.visible = false
	else:
		pass


func _on_mute_pressed() -> void:
	if !is_muted :
		AudioServer.set_bus_mute(bus_idx, true) # or false
		is_muted = true
	else:
		AudioServer.set_bus_mute(bus_idx, false) # or false
		is_muted = false



func _on_settings_pressed() -> void:
	Pause_menu.instance._pause()


#func _on_next_button_down():
#
	#var win_menu = get_node("../WinMenu")
	#if win_menu:
		#win_menu._win_menu()
		
		
		
		
