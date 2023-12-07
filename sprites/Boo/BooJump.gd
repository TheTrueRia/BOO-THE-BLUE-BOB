extends CharacterBody2D
class_name BooJump
var speed = 100
var gem = 3
@onready var animated_sprite = $AnimatedSprite2D

func _process(_delta):
	velocity = Vector2()

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

func _on_gem_body_entered(body):
	gem -= 1
	
