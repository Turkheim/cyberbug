extends StaticBody3D





func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		$AnimationPlayer.play("doordown")
		$Door.play()
