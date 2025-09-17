extends CharacterBody3D

@onready var moth: MeshInstance3D = $SK_Moth2/SK_Moth/Skeleton3D/Moth

const SPEED = 5.0
const JUMP_VELOCITY = 4.5
#@onready var collision: CollisionShape3D = $CollisionShape3D
@export var FORWARD_SPEED = 5.0
@export var BACK_SPEED = 1.0
@export var TURN_SPEED = 0.1
var Vec3Z = Vector3.ZERO
signal player_killed
var can_walk = true

@export var push_strength = .8


func _physics_process(delta):
	#
	## Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		##Animacion de salto
		##animation_player.play("Jump")
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	##print(input_dir.length())
	###cambia la orientacion del mesh
	#if input_dir.length() > 0:	
		#collision.rotation.y = lerp_angle(collision.rotation.y,- input_dir.angle() + PI/2,delta * 15)
	##else:
	#var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	#if direction:
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
	if can_walk:
		var forwardVector = -Vector3.FORWARD.rotated(Vector3.UP, rotation.y)
		velocity = -forwardVector * FORWARD_SPEED
		if Input.is_action_pressed("SteerLeft"):
			rotation.z += Vec3Z.y - TURN_SPEED
			rotation.z = clamp(rotation.x, -50, 90)
			rotation.y += Vec3Z.y + TURN_SPEED 
		if Input.is_action_pressed("SteerRight"):
			rotation.z += Vec3Z.y + TURN_SPEED
			rotation.z = clamp(rotation.x, -50, 90)
			rotation.y += Vec3Z.y - TURN_SPEED 
	move_and_slide()
	
	var collision_count = get_slide_collision_count()
	for i in range(collision_count):
		var collision = get_slide_collision(i)
		var collider = collision.get_collider()
		var collision_normal = collision.get_normal()

		if collider is RigidBody3D:
				# You can use the normal to determine the collision direction
			if collision_normal.dot(Vector3.BACK) > 0.5: # Example: Checking if the collision is from above

				var push_force = Vector3.BACK * -1 * push_strength # Push away from player
				collider.apply_central_impulse(push_force)
			elif collision_normal.dot(Vector3.LEFT) > 0.5: # Example: Checking if the collision is from below

				var push_force = Vector3.LEFT * -1 * push_strength # Push away from player
				collider.apply_central_impulse(push_force)
			elif collision_normal.dot(Vector3.RIGHT) > 0.5: # Example: Checking if the collision is from below

				var push_force = Vector3.RIGHT * -1 * push_strength # Push away from player
				collider.apply_central_impulse(push_force)
			elif collision_normal.dot(Vector3.FORWARD) > 0.5: # Example: Checking if the collision is from the front

				var push_force = Vector3.FORWARD* -1 * push_strength # Push away from player
				collider.apply_central_impulse(push_force)
			# Add more directional checks as needed
		
		#if collider is RigidBody3D:
			## Apply a push force to the RigidBody
			#var push_force = collision.get_normal() * -1 * push_strength # Push away from player
			#collider.apply_central_impulse(push_force)
			#
func _kill_player():

	$CollisionShape3D.set_deferred("disabled",true)
	$Footsteps.stop()
	$PlayerDead.play()
	can_walk = false
	velocity = Vector3.ZERO
	player_killed.emit()
	$SK_Moth2.visible = false
	$Moth2.visible = true
	$Moth2/Death.play("Death")
