extends CharacterBody2D
class_name BooJump

var speed = 100
var collectible = preload("res://Collectibles.gd")
@onready var animated_sprite = $AnimatedSprite2D
@onready var T_area = $"../ThieftArea"
@onready var door = $"../DoorArea"
var array_pos :  Array[Vector2]
var previous_position : Vector2
var voleur_taken = false

func _ready():
	array_pos.resize(24)
	array_pos.fill(global_position)
	previous_position=array_pos[0]


func _process(_delta):
	if (!Dmanager.is_dialog_active):
		velocity = Vector2()
		if(global_position!= previous_position):
			for i in range (array_pos.size()-1,0,-1):
				array_pos[i]=array_pos[i-1]
			array_pos[0]= global_position
			previous_position=array_pos[0]

		if Input.is_action_pressed("ui_right"):
			velocity.x += 1
			animated_sprite.play("booJumpRight")
		elif Input.is_action_pressed("ui_left"):
			velocity.x -= 1
			animated_sprite.play("booJumpLeft")
		elif Input.is_action_pressed("ui_up"):
			velocity.y -= 1
			animated_sprite.play("booJumpBack")
		elif Input.is_action_pressed("ui_down"):
			velocity.y += 1
			animated_sprite.play("booJumpFace")
		else:
			animated_sprite.stop()

		velocity = velocity.normalized()*speed
		move_and_slide()
		if(T_area.hasBeenPlayed and !door.is_open):
			voleur_taken = true
			
func _on_gem_body_entered(body):
	collectible.incrementGem()
	

