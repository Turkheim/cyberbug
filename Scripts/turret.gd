extends StaticBody3D

@export var rotation_speed = 200

const LASER = preload("res://Scenes/laser.tscn")
@onready var timer_laser: Timer = $TimerLaser

var light_visible = true

signal turret_killed

func _process(delta):
	rotate(Vector3.UP,deg_to_rad(rotation_speed) * delta)


func _on_area_3d_body_entered(body: Node3D) -> void:
	_kill_turret()
	
func _fire_laser():
	if LASER:
		$Laser.play()
		var new_laser: Area3D = LASER.instantiate()
		if new_laser:
			new_laser.set_as_top_level(true)
			add_child(new_laser)
			new_laser.transform = $SpawnPoint.global_transform


func _on_timer_laser_timeout() -> void:
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
