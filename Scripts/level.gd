extends Node3D

@export var turrets = 3

signal level_up

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_turret_turret_killed() -> void:
	print(turrets)
	turrets = turrets - 1
	if turrets <= 0:
		level_up.emit()
