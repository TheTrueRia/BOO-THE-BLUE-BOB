extends CharacterBody2D
class_name booCombat

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite = $AnimatedSprite2D
var game_over = false

var damage_mode = false
var health = 10
var damage_per_second = 5

var coins = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("ui_select"):  # jump by space 
		animated_sprite.play("BooSautDroite")
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_right"):
		animated_sprite.play("BooDroite")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if damage_mode: 
		health -= damage_per_second*delta 
		print("Damage taken: ", health)
		
		# player dies, pause the game
		if(health < 0):
			health = 0
			$"../GameOver".show()
			print("GAME OVER !")

func _on_timer_timeout():
	game_over = true
	
	
func _on_coin_body_entered(body):
	coins += 1
	print("coins: "+str(coins))
	
	# game/level over when all coins are picked
	if(coins == 3):
		print("GAME FINISHED") 
		$"../GameFinished".show()
	
func _on_trap_body_entered(body):
	# activate damage mode when the player is on the trap area
	damage_mode = true
	
	if body.is_in_group("trap"):
		health -= 4
		

func _on_trap_body_exited(body):
	# no longer in damage mode
	damage_mode = false



