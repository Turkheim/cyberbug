extends Node3D

signal _win_menu

func _level_up():
	$AnimationPlayer.play("FinalDoor")
	$LevelUp.play()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		_win_menu.emit()
