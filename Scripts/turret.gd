extends StaticBody3D

@export var rotation_speed = 200

const LASER = preload("res://Scenes/laser.tscn")
@onready var timer_laser: Timer = $TimerLaser

var rotation_target = 0

var light_visible = true

signal turret_killed

#func _process(delta):
	#rotate(Vector3.UP,deg_to_rad(rotation_speed) * delta)

func _rotate_turret():
	get_tree().create_tween().tween_property(self,"rotation:y", rotation_target, 0.3)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		_kill_turret()
	
func _fire_laser():
	if LASER:
		$Laser.pitch_scale = randf_range(0.5,1.5)
		$Laser.play()
		var new_laser: Area3D = LASER.instantiate()
		if new_laser:
			new_laser.set_as_top_level(true)
			add_child(new_laser)
			new_laser.transform = $SpawnPoint.global_transform


func _on_timer_laser_timeout() -> void:
	rotation_target = rotation_target + deg_to_rad(45)
	_rotate_turret()
	_fire_laser()
	timer_laser.start()


func _on_timer_light_timeout() -> void:
	if light_visible:
		light_visible = false
		$ButtonLight.visible = false
	else:
		light_visible = true
		$ButtonLight.visible = true
func _kill_turret():
	turret_killed.emit()
	queue_free()
