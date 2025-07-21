extends StaticBody3D
@onready var collision_shape_3d: CollisionShape3D = $CollisionShape3D
@onready var door_on: MeshInstance3D = $DoorOn
@onready var door_off: MeshInstance3D = $DoorOff





func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		door_on.visible = false
		#print(door_on.visible)
		door_off.visible = true
		collision_shape_3d.queue_free()
