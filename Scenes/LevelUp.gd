extends Node3D


func _level_up():
	$AnimationPlayer.play("FinalDoor")



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
