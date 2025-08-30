extends Control


func _on_turret_turret_killed() -> void:
	queue_free()
