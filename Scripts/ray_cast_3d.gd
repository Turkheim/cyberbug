extends RayCast3D

@onready var beam: MeshInstance3D = $Beam

func _process(delta: float) -> void:
	var contact_point
	
	force_raycast_update()
	
	if is_colliding():
		var body
		body = get_collider()
		
		if body.is_in_group("Player"):
			body._kill_player()

		contact_point = to_local(get_collision_point())
		beam.mesh.height = contact_point.y
		beam.position.y = contact_point.y/2
