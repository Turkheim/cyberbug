extends Node3D

@export var turrets = 2

signal level_up


	
func _on_turret_killed() -> void:
	print(turrets)
	$TurretDead.play()
	turrets = turrets - 1
	if turrets <= 0:
		level_up.emit()


func _player_killed() -> void:

	$DeadTimer.start()

func _on_dead_timer_timeout() -> void:
	$LoseMenu._lose_menu()
