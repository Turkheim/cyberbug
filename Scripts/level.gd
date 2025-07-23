extends Node3D

@export var turrets = 3

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_turret_tree_exited() -> void:
	turrets = turrets - 1
	if turrets <= 0:
		get_tree().reload_current_scene()
