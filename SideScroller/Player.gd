extends CharacterBody2D


#jump speed should be negative because we jump upward
@export var jump_speed = -1800.0

# Get the gravity from the project settings. This gravity value is also used
# by any RigidBodies in the project.
var gravity = 4200


func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta

	# Jump up! is_on_floor() is used to avoid jumping mid-air
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_speed

	move_and_slide()
