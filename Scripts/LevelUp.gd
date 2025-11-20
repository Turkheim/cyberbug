extends Node3D

signal _win_menu

func _level_up():
	$AnimationPlayer.play("FinalDoor")
	$LevelUp.play()
	$LevelUp2/LevelUpLight.visible = false
	$LevelUp2/LevelUpLightgreen.visible = true
	
#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("NextLevel"):
			#_win_menu.emit()

	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		_win_menu.emit()
