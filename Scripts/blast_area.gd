extends Area3D


func _ready() -> void:
	$GPUParticles3D.restart()
	$AnimationPlayer.play("BlastGrow")
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
	elif body.is_in_group("Enemy"):
		body.queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("Enemy"):
		area.queue_free()
