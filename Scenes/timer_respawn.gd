extends Node3D

var SPAWN_INSTANCE = load("res://Scenes/capacitor.tscn")


func _ready() -> void:
	SPAWN_INSTANCE.can_instantiate()

func _on_timer_timeout() -> void:
	
	if SPAWN_INSTANCE:
		
		var new_spawn_instance : Area3D = SPAWN_INSTANCE.instantiate()
		if new_spawn_instance:
			new_spawn_instance.set_as_top_level(true)
			add_child(new_spawn_instance)
			new_spawn_instance.transform = self.global_transform
			var new_parent = self.get_parent()
			new_spawn_instance.reparent(new_parent)
			
	queue_free()
