extends Area3D




func _on_timer_timeout() -> void:
	
	if $MeshInstance3D.visible:
		$CollisionShape3D.set_deferred("disabled",true)
		$MeshInstance3D.visible = false
	else:
		$CollisionShape3D.set_deferred("disabled",false)
		$MeshInstance3D.visible = true



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body._kill_player()
