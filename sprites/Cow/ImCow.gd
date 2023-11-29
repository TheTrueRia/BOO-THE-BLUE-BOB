extends CharacterBody2D

# get a reference to the sprite at the beginning (instead of using _ready())
@onready var animated_sprite = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	move_and_slide()

func _process(_delta):
	animated_sprite.play("default")
