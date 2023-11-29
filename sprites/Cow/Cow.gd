extends CharacterBody2D

class_name Cow

# get a reference to the sprite at the beginning (instead of using _ready())
@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 50.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = -1

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if velocity.x == 0:
		direction = -direction
		
	velocity.x = direction * SPEED

	move_and_slide()

func _process(_delta):
	if direction == 1:
		# run to right
		animated_sprite.flip_h = false
		animated_sprite.play("walk")
	elif direction == -1:
		# run to the left
		animated_sprite.flip_h = true
		animated_sprite.play("walk")
	else:
		animated_sprite.play("default")
