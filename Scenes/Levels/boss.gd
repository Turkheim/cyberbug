extends CharacterBody3D

@export var speed = 5
@export var gravity = 9.8
@export var health = 100
@export var state = "Idle"
@onready var nav: NavigationAgent3D = $NavigationAgent3D
#@onready var knight: Node3D = $Knight
@onready var player_character: CharacterBody3D = $"../PlayerCharacter"
@onready var explotion: GPUParticles3D = $Explotion

signal turret_killed

func _ready() -> void:
	state = "Idle"
func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta 
	nav.target_position = player_character.global_transform.origin
	#elif state == "idle":
		#velocity = Vector3.ZERO
		#
	#elif state == "pursue":
		#velocity.y = 0
		#var next_location = nav.get_next_path_position()
		#var current_location = global_transform.origin
		#var new_velocity = (next_location - current_location). normalized() * speed
	#
		#velocity = velocity.move_toward(new_velocity,0.25)
#
	#elif state == "attack":
		#velocity = Vector3.ZERO
		#look_at(transform.origin + velocity * Vector3(1,0,1), Vector3.UP)
	if state == "idle":
		velocity = Vector3.ZERO
		
	elif state == "escape":
		velocity.y = 0
		var next_location = nav.get_next_path_position()

		var current_location = global_transform.origin
		var new_velocity = (next_location - current_location). normalized() * speed
		velocity = velocity.move_toward(new_velocity,delta * 5)
	
	move_and_slide()
	
	
	#
func _kill_turret():
	
	if !explotion.emitting:
		explotion.emitting = true
	explotion.amount = explotion.amount*2
	
	health = health - 25
	if health <= 0:
		turret_killed.emit()
		queue_free()
#
#func _on_aggro_body_entered(body: Node3D) -> void:
	#if body.is_in_group("player"):
		#state = "pursue"
		##$Knight/AnimationPlayer.play("Walkcycle")
#
#func _on_disengage_body_exited(body: Node3D) -> void:
	#if body.is_in_group("player"):
		#state = "idle"
		##$Knight/AnimationPlayer.play("Idle")
#
#func _on_attack_body_entered(body: Node3D) -> void:
	#if body.is_in_group("player"):
		#state = "attack"
		##$Knight/AnimationPlayer.play("Attack")
#
#
#func _on_attack_body_exited(body: Node3D) -> void:
	#if body.is_in_group("player"):
		#state = "pursue"
		##$Knight/AnimationPlayer.play("Walkcycle")
#
##func _print_something():
	#health = health - 10
	#if health <= 0:
		#queue_free()


func _on_aggro_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		state = "escape"
		#$Knight/AnimationPlayer.play("Walkcycle")


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		body._kill_player()
