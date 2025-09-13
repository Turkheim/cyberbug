extends Area3D

@onready var bomb_timer: Timer = $BombTimer 
const BLAST_AREA = preload("res://Scenes/blast_area.tscn")
const TIMER_RESPAWN = preload("res://Scenes/timer_respawn.tscn")

@export var does_respawn = true

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player") or body.is_in_group("Box"):
		$CapacitorOn.visible = true
		$CapacitorOff.visible = false
		var animation_player: AnimationPlayer = $AnimationPlayer
		animation_player.play("Blink")
		bomb_timer.start()

func _on_bomb_timer_timeout() -> void:

	if BLAST_AREA:
		var new_blast : Area3D = BLAST_AREA.instantiate()
		if new_blast:
			new_blast.set_as_top_level(true)
			add_child(new_blast)
			new_blast.transform = self.global_transform
			var new_parent = self.get_parent()
			new_blast.reparent(new_parent)
			if does_respawn:
				if TIMER_RESPAWN:
					
					var new_timer : Node3D = TIMER_RESPAWN.instantiate()
					if new_timer:
						new_timer.set_as_top_level(true)
						add_child(new_timer)
						new_timer.transform = self.global_transform
						var new_parent_timer = self.get_parent()
						new_timer.reparent(new_parent_timer)
						
	queue_free()
