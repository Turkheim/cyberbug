extends StaticBody3D

func _process(delta):
	rotate(Vector3.UP,deg_to_rad(1))


func _on_area_3d_body_entered(body: Node3D) -> void:
	queue_free()
