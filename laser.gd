extends Area3D

@export var speed = 5

func _process(delta):
	translate_object_local(Vector3.FORWARD * delta * speed) 



func _on_body_entered(body: Node3D) -> void:
	
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
		#body.queue_free()
	
	queue_free()
