extends Node3D
@onready var platform: Node3D = $platform

@export var platform_direction = Vector3.FORWARD
@export var movement_distance = 5
@export var speed = 0.5
var new_position = Vector3.ZERO
var go_back = false
var target = true
func _ready() -> void:

	_move_platform()
	
func _move_platform():

	var tween = create_tween()
	tween.tween_property(platform,"position",movement_distance * platform_direction, movement_distance * speed)
	tween.tween_interval(1.0)
	tween.tween_property(platform,"position",Vector3.ZERO, movement_distance * speed)
	tween.tween_interval(1.0)
	tween.finished.connect(_move_platform)
