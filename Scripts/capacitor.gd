extends Area3D

@onready var bomb_timer: Timer = $BombTimer 
const BLAST_AREA = preload("res://Scenes/blast_area.tscn")

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
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

			queue_free()
	#queue_free()
