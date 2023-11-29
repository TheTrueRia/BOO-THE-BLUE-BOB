extends CharacterBody2D

class_name Chiken

const SPEED = 200.0
const JUMP_VELOCITY = -550.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var eggs = 6		# start with 5 coins
var nests = 4
var health = 100
var score = 0
var points_per_egg = 20

# get a reference to the sprite at the beginning (instead of using _ready())
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()

func _process(_delta):
	if Input.is_action_pressed("ui_right"):
		# run to right
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	elif Input.is_action_pressed("ui_left"):
		# run to the left
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	else:
		animated_sprite.play("default")
	

func _on_oeuf_body_entered(body):
	score += points_per_egg
	eggs -= 1
	print("Picked an egg!")
	
	# game/level over when all coins are picked
	if(eggs == 0):
		print("All eggs picked, well done!") 

func _on_nid_body_entered(body):
	if health < 100 :
		health += points_per_egg
	nests -= 1
	print("Picked an nest!")



func _on_zone_degat_body_entered(body):
	health -= 20
	velocity.y = -200
