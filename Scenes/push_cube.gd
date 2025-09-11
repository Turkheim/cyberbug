extends RigidBody3D

#func _process(delta: float) -> void:
	#var collision_count = get_slide_collision_count()
	#for i in range(collision_count):
		#var collision = get_slide_collision(i)
		#var collider = collision.get_collider()
		#var collision_normal = collision.normal
		#print("Collision with ", collider.name, " with normal: ", collision_normal)
#
		## You can use the normal to determine the collision direction
		#if collision_normal.dot(Vector3.UP) > 0.5: # Example: Checking if the collision is from above
			#print("Hit from above!")
		#elif collision_normal.dot(Vector3.DOWN) > 0.5: # Example: Checking if the collision is from below
			#print("Hit from below!")
		#elif collision_normal.dot(Vector3.FORWARD) > 0.5: # Example: Checking if the collision is from the front
			#print("Hit from the front!")
		## Add more directional checks as needed
